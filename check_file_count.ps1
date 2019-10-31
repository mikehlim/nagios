# This plugin will monitor number of files in Downloads folder of the latest logged-in user
# Requirement: NCPA, NRPE, and other Nagios agent to run the script

$ok = 0;
$warning = 1;
$critical = 2;

$warningValue = 9000
$criticalValue = 10000

$username = Get-ChildItem -Path c:\users\ | Where-Object {$_.PSIsContainer} | Sort-Object LastWriteTime -Descending | Select -exp Name |Select-Object -first 1


$directory = "C:\Users\$username\Downloads"
$files = (Get-ChildItem $directory -recurse -file | Measure-Object | %{$_.Count})

if ($files -ge $criticalValue){
write-host "Critical: $files  files exists on C:\\Users\\$username\\Downloads"
exit $critical
}

if ($files -ge $warningValue -lt $chriticalValue){
write-host "Warning: $files files exists on C:\\Users\\$username\\Downloads"
exit $warning
}

if ($files -lt $warningValue){
write-host "OK: $files files exists on C:\\Users\\$username\\Downloads"
exit $ok
}



