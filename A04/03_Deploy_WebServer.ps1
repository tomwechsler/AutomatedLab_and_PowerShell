#General
$LabName = "TechLab"
$domain = 'tech.pri'
$adminAcc = 'Administrator'
$adminPass = 'P@ssw0rd'

#New Lab Definition
New-LabDefinition -Name $LabName -DefaultVirtualizationEngine HyperV

#Virtual Switch
Add-LabVirtualNetworkDefinition -Name $LabName -AddressSpace 192.168.123.0/24

#Domain definition with the domain admin account
Add-LabDomainDefinition -Name $domain -AdminUser $adminAcc -AdminPassword $adminPass
Set-LabInstallationCredential -Username $adminAcc -Password $adminPass

#Basic Parameters
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:Network' = $LabName
    'Add-LabMachineDefinition:ToolsPath'= "$labSources\Tools"
    'Add-LabMachineDefinition:IsDomainJoined'= $true
    'Add-LabMachineDefinition:DomainName'= $domain
    'Add-LabMachineDefinition:EnableWindowsFirewall'= $false
    'Add-LabMachineDefinition:OperatingSystem'= 'Windows Server 2022 Datacenter Evaluation (Desktop Experience)'
    'Add-LabMachineDefinition:Memory'= 4GB
    'Add-LabMachineDefinition:MinMemory'= 2GB
    'Add-LabMachineDefinition:MaxMemory'= 4GB
    'Add-LabMachineDefinition:Processors'= 1
}

#Lab Machine Definition
Add-LabMachineDefinition -Name "DC01" -IpAddress 192.168.123.1 -DomainName $domain -Roles RootDC -SkipDeployment

#CA Role Definition
$role = Get-LabMachineRoleDefinition -Role CaRoot @{
    CACommonName = "MyLabRootCA1"
    KeyLength = "2048"
    ValidityPeriod = "Weeks"
    ValidityPeriodUnits = "4"
}

#Lab Machine Definition
Add-LabMachineDefinition -Name "CA01" -IpAddress 192.168.123.12 -Roles $role -SkipDeployment

#Lab Machine Definition
Add-LabMachineDefinition -Name "WS01" -IpAddress 192.168.123.13 -Roles WebServer

#Install Lab
Install-Lab

#Copy Files
Copy-LabFileItem -Path 'H:\LabSources\CopyFiles' -ComputerName "WS01" -DestinationFolderPath C:\

#Run Scripts
Invoke-LabCommand -ComputerName "WS01" -ScriptBlock {Invoke-Expression "&'C:\CopyFiles\DeployWebsite.ps1'"}

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Show Labs
Get-Lab -List

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\TechLab