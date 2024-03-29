#Show available OS
Get-LabAvailableOperatingSystem -Path H:\LabSources

#New Lab Definition
New-LabDefinition -Name MyFirstLab -DefaultVirtualizationEngine HyperV
Add-LabMachineDefinition -Name Win10Demo -OperatingSystem 'Windows 10 Enterprise Evaluation'

##We didn't specify a password, the default is: Somepass1

#Install Lab
Install-Lab

#Notification
Send-ALNotification -Activity 'Installing Software' -Message 'Software being installed..' -Provider Toast,Ifttt

#Install Software to TestLab-VM
Install-LabSoftwarePackage -ComputerName Win10Demo -Path $labSources\SoftwarePackages\Notepad++.exe -CommandLine /S

#Copy files to TestLab-VM
Copy-LabFileItem -Path 'H:\LabSources\ToCopy' -ComputerName Win10Demo -DestinationFolderPath C:\Temp

#Show Labs
Get-Lab -List

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\MyFirstLab