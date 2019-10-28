$ok = 0;
$warning = 1;
$critical = 2;
$criticalValue = 50
$directory = "C:\Users\username\Downloads"
$files = (Get-ChildItem $directory -recurse -file | Measure-Object | %{$_.Count})

if ($files -ge $criticalValue){
write-host "Critical: $files  files exists"
exit $critical
}
if ($files -le $criticalValue){
write-host "OK: $files files exists"
exit $ok
}
