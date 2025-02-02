$objFiles = Get-ChildItem -Recurse -Filter *.o | ForEach-Object { $_.FullName }
$sFiles = Get-ChildItem -Recurse -Filter *.s | ForEach-Object { $_.FullName }
$elfFiles = Get-ChildItem -Recurse -Filter *.elf | ForEach-Object { $_.FullName }
$hexFiles = Get-ChildItem -Recurse -Filter *.hex | ForEach-Object { $_.FullName }
$binFiles = Get-ChildItem -Recurse -Filter *.bin | ForEach-Object { $_.FullName }
$mapFiles = Get-ChildItem -Recurse -Filter *.map | ForEach-Object { $_.FullName }
$prnFiles = Get-ChildItem -Recurse -Filter *.prn | ForEach-Object { $_.FullName }
$dmpFiles = Get-ChildItem -Recurse -Filter *.dmp | ForEach-Object { $_.FullName }
# Delete temporary object files
Remove-Item -Force $objFiles
Remove-Item -Force $sFiles
Remove-Item -Force $elfFiles
Remove-Item -Force $hexFiles
Remove-Item -Force $binFiles
Remove-Item -Force $mapFiles
Remove-Item -Force $prnFiles
Remove-Item -Force $dmpFiles