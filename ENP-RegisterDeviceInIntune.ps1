Set-ExecutionPolicy -ExecutionPolicy bypass -Force

#Install NuGet package
Install-Packageprovider -Name NuGet -MinimumVersion 2.8.5.201 -force

#Find the script in the Powershell Repository
$Script = Find-Script -Name Get-WindowsAutoPilotInfo

#Perform a check if the script is available
if ($Script.name -eq "Get-WindowsAutoPilotInfo"){
    write-host ""
    write-host "The script to upload this machine's hardware ID has been found and can be used."
} 
else {
    write-host ""
    throw "The script to upload this machine's hardware ID has not been found. The script will exit."
}

#Install the script onto the system
Install-Script -Name $Script.name -force

#Register the device in Intune
Get-WindowsAutoPilotInfo.ps1 -Online

#Generalize the computer

