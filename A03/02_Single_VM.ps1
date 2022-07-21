#Show available OS
Get-LabAvailableOperatingSystem -Path C:\LabSources

#Install Lab and VM
New-LabDefinition -Name Win10 -DefaultVirtualizationEngine HyperV

#Lab Machine Definition
Add-LabMachineDefinition -Name Client1 -Memory 1GB -OperatingSystem 'Windows 10 Enterprise Evaluation'

#Install Lab
Install-Lab

#We didn't specify a password, the default is: Somepass1

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Win10