#1) In the Registry, go to HKEY_CURRENT_USER\software\microsoft\Windows\currentversion\explorer. Locate the Advanced key, and set its DontPrettyPath property to 1.

Get-PSProvider
Get-Command -Verb set -Noun Location
Get-Help Set-Location -Examples
Get-Help Set-Location -Online
Set-Location -path "HKCU:"
Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Get-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Get-Help Set-ItemProperty -Online
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DontPrettyPath -Value 1

#2) Create a new directory called C:\Demo.

Get-Command -Verb new -Noun Item
Get-Help New-Item -Online
Set-Location c:\
New-Item -Path "c:\" -Name "DEMO" -ItemType "directory"

#3) Create a zero-length file named C:\Demo\Test.txt

New-Item -path C:\DEMO -Name "TEST.txt" -ItemType "File"

#4) Try to change the content of the Test.txt file.

Get-Command -Noun content -Verb add
Get-Help Add-Content -online
Add-Content -Path C:\DEMO\TEST.txt -Value "GOOD MORNING"
Get-ItemProperty -Path C:\DEMO\TEST.txt | FL *

#5) Display Value of %temp%

Get-Childitem -path env:\TEMP
