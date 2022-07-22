#General
$LabName = "TestLab"

#Network
New-LabDefinition -Name $LabName -DefaultVirtualizationEngine HyperV
Add-LabVirtualNetworkDefinition -Name $LabName -AddressSpace 192.168.123.0/24

#Install Lab
Install-Lab

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#List all Labs
Get-Lab -List

#Remove the Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\TestLab