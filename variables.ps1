# $variable1="hello";

# $variable3="hello";

# $variable2.GetType();
# $PSVersionTable
# create folder with command
# New-Item -Path 'c:\powershell\Test Folder' -ItemType Directory
# New-Item -Path 'C:\c# Demo\powershellTutorials\Test File.ps1' -ItemType File
# Remove-Item 'C:\c# Demo\powershellTutorials\Test File.txt' -Recurse

# Test-Path "C:\c# Demo\powershellTutorials\Test File.txt"
# Get-Date
# Get-Content "C:\c# Demo\powershellTutorials\Test File.ps1"

# get-content "C:\c# Demo\powershellTutorials\Test File.ps1" | measure-object -character -line -word
# Get-ChildItem "C:\c# Demo\powershellTutorials\Test File.ps1" | Measure-Object
# $list = "one","two","two","three","four","five"

# $list | sort | get-unique
# $A = Get-ChildItem "C:\c# Demo\powershellTutorials\Test File.ps1" 

# Format-List -InputObject $A

# Get-Process | Select-Object -Property ProcessName, Id, WS -Last 50
# "a","b","c","a","a","a" | Select-Object -Unique
# Invoke-Item "C:\c# Demo\powershellTutorials\Test File.ps1"
# Get-history
# get-culture
# $location= Get-Location
# $location | Get-Member

# 1000,2000,3000 |ForEach-Object -Process {$_/1000}
# "Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object {$_.Split(".")}
# $choice = Read-Host "Please put your choice"
# $choice

# Get-Process | Where-Object {$_.ProcessName -Match "^e.*"}
# Write-Warning  "Test Warning"
# Write-Host (12,4,6,8,10,12) -Separator ", => " -ForegroundColor DarkGreen -BackgroundColor red

$array = @("item1", "item2", "item3")
 
for($i = 0; $i -lt $array.length; $i++){ $array[$i] }