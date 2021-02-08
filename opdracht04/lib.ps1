$dir = "C:\Users\Dario\Desktop\InstallFiles"
Write-Host ""

## Adobe Reader DC

Write-Host "Starting Adobe Reader DC Installation. Please Wait"

Start-Process -FilePath "$dir\readerdc_nl_a_install.exe" ##-Wait
Start-Sleep -s 300

Get-Process "readerdc_nl_a_install" | Stop-Process -Force
Start-Sleep -s 1
Write-Host "Adobe Reader DC Installation Complete!" -ForeGroundColor Green

## Java

Write-Host ""
Write-Host "Starting Java Installation. Please Wait"

Start-Process -FilePath "$dir\JavaSetup8u241.exe" -ArgumentList "/s" -Wait

Write-Host "Java Installation Complete!" -ForeGroundColor Green

## Libre Office

Write-Host ""
Write-Host "Starting Libre Office Installation. Please Wait!"
Start-Process -FilePath "$dir\LibreOffice_6.4.2_Win_x86.msi" /quiet -Wait
Write-Host "Libre Office has been Installed!" -ForeGroundColor Green

## Closing Window

Write-Host ""
Write-Host "Setup was successful. Closing Window"
Start-Sleep -s 5 
Get-Process "powershell" | Stop-Process -Force

