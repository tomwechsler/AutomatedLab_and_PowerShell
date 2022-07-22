#Show available OS
Get-LabAvailableOperatingSystem -Path H:\LabSources

#New Lab Definition
New-LabDefinition -Name Win10 -DefaultVirtualizationEngine HyperV

#Virtual Switch
Add-LabVirtualNetworkDefinition -Name 'Default Switch' -HyperVProperties @{ SwitchType = 'External'; AdapterName = 'vEthernet (Default Switch)' }

#Lab VM Adapter settings
$netAdapter = @()
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'Default Switch' -UseDhcp

#Lab Machine Definition
Add-LabMachineDefinition -Name Client1 -Memory 4GB -OperatingSystem 'Windows 10 Enterprise Evaluation' -NetworkAdapter $netAdapter

#Install Lab
Install-Lab

#We didn't specify a password, the default is: Somepass1

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Win10