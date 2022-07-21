#Hyper-V Installation on a Server
Install-WindowsFeature -Name Hyper-V -ComputerName "computer_name" -IncludeManagementTools -Restart

#Hyper-V Installation on a Windows 10/11
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#MSI-Download:
https://automatedlab.org/en/latest/Wiki/Basic/install/

#Install AutomatedLab with PowerShell
Install-Module -Name AutomatedLab -AllowClobber -Force

#Set the LabSourcesFolder
New-LabSourcesFolder -Drive H:

#Get the SourcesFolder
Get-LabSourcesLocation