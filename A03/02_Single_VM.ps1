#Show available OS
Get-LabAvailableOperatingSystem -Path H:\LabSources

#New Lab Definition
New-LabDefinition -Name Win10 -DefaultVirtualizationEngine HyperV

#Lab Machine Definition
Add-LabMachineDefinition -Name Client1 -Memory 1GB -OperatingSystem 'Windows 10 Enterprise Evaluation'

#Install Lab
Install-Lab

#We didn't specify a password, the default is: Somepass1

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Win10