#Hyper-V Installation on a Server
Install-WindowsFeature -Name Hyper-V -ComputerName <computer_name> -IncludeManagementTools -Restart

#Hyper-V Installation on a Windows 10/11
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#MSI-Download:
https://automatedlab.org/en/latest/Wiki/Basic/install/

#Install AL with PowerShell
Install-PackageProvider Nuget -Force
Install-Module -Name AutomatedLab -RequiredVersion 5.43.0

#Set the LabSourcesFolder
New-LabSourcesFolder -Drive C