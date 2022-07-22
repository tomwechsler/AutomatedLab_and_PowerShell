#Show available OS
Get-LabAvailableOperatingSystem -Path H:\LabSources

#New Lab Definition
New-LabDefinition -Name Lab0 -DefaultVirtualizationEngine HyperV

#Virtual Switch
Add-LabVirtualNetworkDefinition -Name Lab0
Add-LabVirtualNetworkDefinition -Name 'Default Switch' -HyperVProperties @{ SwitchType = 'External'; AdapterName = 'vEthernet (Default Switch)' }

#Lab Machine Definition
Add-LabMachineDefinition -Name DC1 -Memory 4GB -OperatingSystem 'Windows Server 2022 Datacenter Evaluation (Desktop Experience)' -Roles RootDC -Network Lab0 -DomainName tech.pri

#Lab VM Adapter settings
$netAdapter = @()
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch Lab0
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'Default Switch' -UseDhcp

#Lab Machine Definition
Add-LabMachineDefinition -Name Router1 -Memory 4GB -OperatingSystem 'Windows Server 2022 Datacenter Evaluation (Desktop Experience)' -Roles Routing -NetworkAdapter $netAdapter -DomainName tech.pri
Add-LabMachineDefinition -Name Client1 -Memory 4GB -Network Lab0 -OperatingSystem 'Windows 10 Enterprise Evaluation' -DomainName tech.pri

#Install Lab
Install-Lab

#We didn't specify a password, the default is: Somepass1

#Deployment Summary
Show-LabDeploymentSummary -Detailed

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Lab0