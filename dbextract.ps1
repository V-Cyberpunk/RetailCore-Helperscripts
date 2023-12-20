$tc = Read-Host "TC Commit angeben"

Expand-Archive -Force '*PreCompiledCore.zip' '.'
cd $PSScriptRoot\PreCompiledCore\Data\MySQL\bin
Start-Process -FilePath "cmd.exe" -ArgumentList "/c mysqld.exe --defaults-file=my.ini --console"
Start-Sleep -s 5
Start-Process -FilePath "cmd.exe" -ArgumentList "/c mysqldump.exe -u root -padmin hotfixes > hotfixes.sql" -Wait
Start-Process -FilePath "cmd.exe" -ArgumentList "/c mysqldump.exe -u root -padmin world > world.sql" -Wait
Start-Process -FilePath "cmd.exe" -ArgumentList "/c mysqldump.exe -u root -padmin --no-data --no-create-info --no-create-db --no-set-names --skip-comments --skip-dump-date --skip-opt --triggers characters > characters_trigger.sql" -Wait
move hotfixes.sql $PSScriptRoot\
move world.sql $PSScriptRoot\
move characters_trigger.sql $PSScriptRoot\
taskkill /F /IM mysqld.exe
cd $PSScriptRoot
Remove-Item -Path $PSScriptRoot\PreCompiledCore -Recurse -Force
Remove-Item -Path $PSScriptRoot\*PreCompiledCore.zip

$date = Get-Date -Format "yyyy-MM-dd"

$compress = @{
  Path = "hotfixes.sql", "world.sql", "characters_trigger.sql"
  CompressionLevel = "Optimal"
  DestinationPath = "RetailCoreDB_" + $date + "_tc-" + $tc
}
Compress-Archive @compress