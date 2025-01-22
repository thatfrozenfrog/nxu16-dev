# Set the path
$path = "E:\LAPIS\LEXIDE\Bin;E:\LAPIS\LEXIDE\BuildTools\Ver.20231124\Bin;E:\LAPIS\LEXIDE\Utilities\Bin;$env:PATH"
$env:PATH = $path

# Find all C/C++ files and ASM files
$cFiles = Get-ChildItem -Recurse -Filter *.c | ForEach-Object { $_.FullName }
$cppFiles = Get-ChildItem -Recurse -Filter *.cpp | ForEach-Object { $_.FullName }
$asmFiles = Get-ChildItem -Recurse -Filter *.asm | ForEach-Object { $_.FullName }

& clang-u16.exe -c ($cFiles + $cppFiles) -O3 -v
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Compile ASM files
foreach ($file in $asmFiles) {
    & llvm-mc-u16 $file
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

# Find all generated object files
$objFiles = Get-ChildItem -Recurse -Filter *.o | ForEach-Object { $_.FullName }

# Link
& lld-u16 --print-gc-sections -S -L"E:/LAPIS/LEXIDE/BuildTools/Ver.20231124/Lib/U16/" -T startup.ld -o rom.elf -Map rom.map $objFiles -l"PL99U16LWF.a" -l"longu8.a" -l"doubleu8.a"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert ELF file to HEX file
& llvm-objcopy.exe --output-target=ihex rom.elf rom.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Convert HEX file to BIN file
& ./hex2bin.exe rom.hex
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Copy the BIN file to the specified directory
# Copy-Item -Force program.bin "E:\Users\15874\source\repos\CasioEmuX\x64\PatchableRelease\models\Cosine\Cosine.bin"

# Define file paths
$programPath = "rom.bin"
#$fontPath = "font.bin"
#$indexPath = "index.bin"
$outputPath = "C:\Users\Admin\Pictures\Emulators\NewestMSVC\models\CWXCube\"

<#
# Create a new empty file of size 0x60000
$size = 0x60000
$emptyFile = New-Object byte[] $size

# Read the contents of program.bin
$programBytes = [System.IO.File]::ReadAllBytes($programPath)
$programBytes.CopyTo($emptyFile, 0)

# Read the contents of font.bin and index.bin
$fontBytes = [System.IO.File]::ReadAllBytes($fontPath)
$indexBytes = [System.IO.File]::ReadAllBytes($indexPath)

# Write font.bin to output.bin at offset 0x10000
$fontOffset = 0x10000
$fontBytes.CopyTo($emptyFile, 0x10000)

# Write index.bin to output.bin at offset 0x50000
$indexOffset = 0x50000
$indexBytes.CopyTo($emptyFile, 0x50000)
[System.IO.File]::WriteAllBytes($outputPath, $emptyFile)
#>

#[System.IO.File]::WriteAllBytes($outputPath, $programPath)
Copy $programPath $outputPath
Write-Host "Operation complete, output file is: $outputPath"

# Delete temporary object files
Remove-Item -Force $objFiles

# Change to the specified directory and run CasioEmuMsvc.exe
[System.Environment]::CurrentDirectory = "C:\Users\Admin\Pictures\Emulators\NewestMSVC\models\CWXCube\"
& "C:\Users\Admin\Pictures\Emulators\NewestMSVC\CasioEmuMsvc.exe" @("C:\Users\Admin\Pictures\Emulators\NewestMSVC\models\CWXCube\")
#Start-Process -FilePath "C:\Users\Admin\Pictures\Emulators\NewestMSVC\CasioEmuMsvc.exe" -ArgumentList "models\CWXCube\"
