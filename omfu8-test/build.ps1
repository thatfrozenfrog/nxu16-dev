# Set the path
$path = "E:\LAPIS\LEXIDE\Bin;E:\LAPIS\LEXIDE\BuildTools\Ver.20231124\Bin;E:\LAPIS\LEXIDE\Utilities\Bin;E:\LAPIS\LEXIDE\BuildTools\Ver.20231124\Lib\U16;$env:PATH"
$env:PATH = $path

# Find all C/C++ files and ASM files
$cFiles = Get-ChildItem -Recurse -Filter *.c | ForEach-Object { $_.FullName }
$cppFiles = Get-ChildItem -Recurse -Filter *.cpp | ForEach-Object { $_.FullName }
$asmFiles = Get-ChildItem -Recurse -Filter *.asm | ForEach-Object { $_.FullName }

& clang-u16.exe -S ($cppFiles) -v -I. -Ilibc -lapisomf -type=ML620906 -emit-llvm
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Compiling ASM files..."

# Compile ASM files
foreach ($file in $asmFiles) {
    & rasu8 $file /G /SD
}
Write-Host "Compiling LL files..."
# Find all generated llvm files
$llFiles = Get-ChildItem -Recurse -Filter *.ll | ForEach-Object { $_.FullName }
foreach ($file in $llFiles) {
    & llc-u16 -lapisomf -type=ML620906  $file
    Write-Host $file
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

# Find all generated S files
$sFiles = Get-ChildItem -Recurse -Filter *.s | ForEach-Object { $_.FullName }
foreach ($file in $sFiles) {
    & rasu8 $file /G /SD
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

exit 0

# Link
& lld-u16 --print-gc-sections -S -L"E:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Lib/U16/" -T startup.ld -o program.elf -Map program.map $objFiles -l"PL99U16LWF.a" -l"longu8.a" -l"doubleu8.a"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert ELF file to HEX file
& llvm-objcopy.exe --output-target=ihex program.elf program.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert HEX file to BIN file
& ./hex2bin.exe program.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Copy BIN file to the specified directory
# Copy-Item -Force program.bin "E:\Users\15874\source\repos\CasioEmuX\x64\PatchableRelease\models\Cosine\Cosine.bin"
Copy-Item -Force program.bin "D:\CasioEmuMsvc\CasioEmuMsvc\models\nxu16-dev-test\rom.bin"

$sFiles = Get-ChildItem -Recurse -Filter *.s | ForEach-Object { $_.FullName }
$elfFiles = Get-ChildItem -Recurse -Filter *.elf | ForEach-Object { $_.FullName }
$hexFiles = Get-ChildItem -Recurse -Filter *.hex | ForEach-Object { $_.FullName }
$binFiles = Get-ChildItem -Recurse -Filter *.bin | ForEach-Object { $_.FullName }
$mapFiles = Get-ChildItem -Recurse -Filter *.map | ForEach-Object { $_.FullName }
# Delete temporary object files
Remove-Item -Force $objFiles
Remove-Item -Force $sFiles
Remove-Item -Force $elfFiles
Remove-Item -Force $hexFiles
Remove-Item -Force $binFiles
Remove-Item -Force $mapFiles
# Switch to the specified directory and run CasioEmuMsvc.exe
& "cmd.exe" /c cd D:\CasioEmuMsvc\CasioEmuMsvc `&`& CasioEmuMsvc.exe models\nxu16-dev-test