#Show available OS
Get-LabAvailableOperatingSystem -Path G:\LabSources

#New Lab Definition
New-LabDefinition -Name Lab1 -DefaultVirtualizationEngine HyperV

#Lab Machine Definition
Add-LabMachineDefinition -Name DC1 -Memory 4GB -OperatingSystem 'Windows Server 2022 Datacenter Evaluation (Desktop Experience)' -Roles RootDC -DomainName tech.pri
Add-LabMachineDefinition -Name Client1 -Memory 4GB -OperatingSystem 'Windows 10 Enterprise Evaluation' -DomainName tech.pri

#Install Lab
Install-Lab

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Lab1