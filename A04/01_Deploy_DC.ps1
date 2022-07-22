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
    'Add-LabMachineDefinition:EnableWindowsFirewall'= $false
    'Add-LabMachineDefinition:OperatingSystem'= 'Windows Server 2022 Datacenter Evaluation (Desktop Experience)'
    'Add-LabMachineDefinition:Memory'= 4GB
    'Add-LabMachineDefinition:MinMemory'= 2GB
    'Add-LabMachineDefinition:MaxMemory'= 4GB
    'Add-LabMachineDefinition:Processors'= 1
}

#Lab Machine Definition
Add-LabMachineDefinition -Name "DC01" -IpAddress 192.168.123.1 -DomainName $domain -Roles RootDC

#Install Lab
Install-Lab

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Show Labs
Get-Lab -List