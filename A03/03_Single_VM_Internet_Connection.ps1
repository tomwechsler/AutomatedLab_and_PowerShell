#Show available OS
Get-LabAvailableOperatingSystem -Path C:\LabSources

#Install Lab and VM
New-LabDefinition -Name Win10 -DefaultVirtualizationEngine HyperV

#Virtual Switch
Add-LabVirtualNetworkDefinition -Name 'vSwitch01' -HyperVProperties @{ SwitchType = 'External'; AdapterName = 'vEthernet (vSwitch01)' }

#Lab VM Adapter settings
$netAdapter = @()
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'vSwitch01' -UseDhcp

#Lab Machine Definition
Add-LabMachineDefinition -Name Client1 -Memory 4GB -OperatingSystem 'Windows 10 Enterprise Evaluation' -NetworkAdapter $netAdapter

#Install Lab
Install-Lab

#We didn't specify a password, the default is: Somepass1

#Remove Lab
Remove-Lab -Path C:\ProgramData\AutomatedLab\Labs\Win10