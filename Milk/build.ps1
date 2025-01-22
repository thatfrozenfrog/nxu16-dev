# Set the path
$path = "C:\LAPIS\LEXIDE\Bin;C:\LAPIS\LEXIDE\BuildTools\Ver.20231124\Bin;C:\LAPIS\LEXIDE\Utilities\Bin;$env:PATH"
$env:PATH = $path

# Find all C/C++ files and ASM files
$cFiles = Get-ChildItem -Recurse -Filter *.c | ForEach-Object { $_.FullName }
$cppFiles = Get-ChildItem -Recurse -Filter *.cpp | ForEach-Object { $_.FullName }
$asmFiles = Get-ChildItem -Recurse -Filter *.asm | ForEach-Object { $_.FullName }

& clang-u16.exe -c ($cppFiles) -v -I. -Ilibc
& clang-u16.exe -c ($cFiles) -v -I. -Ilibc
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& clang-u16.exe -c ($cFiles) -S -v  -I. -Ilibc
& clang-u16.exe -c ($cppFiles) -S -v  -I. -Ilibc
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Compile ASM files
foreach ($file in $asmFiles) {
    & llvm-mc-u16 $file
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

# Find all generated object files
$objFiles = Get-ChildItem -Recurse -Filter *.o | ForEach-Object { $_.FullName }

# Link
& lld-u16 --print-gc-sections -S -L"C:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Lib/U16/" -T startup.ld -o program.elf -Map program.map $objFiles -l"PL99U16LWF.a" -l"longu8.a" -l"doubleu8.a"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert ELF file to HEX file
& llvm-objcopy.exe --output-target=ihex program.elf program.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert HEX file to BIN file
& ./hex2bin.exe program.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Copy BIN file to the specified directory
# Copy-Item -Force program.bin "C:\Users\15874\source\repos\CasioEmuX\x64\PatchableRelease\models\Cosine\Cosine.bin"
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