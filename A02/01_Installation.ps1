#Hyper-V Installation
Install-WindowsFeature -Name Hyper-V -ComputerName <computer_name> -IncludeManagementTools -Restart

#MSI-Download:
https://automatedlab.org/en/latest/Wiki/Basic/install/

#Install AL with PowerShell
Install-PackageProvider Nuget -Force
Install-Module -Name AutomatedLab -RequiredVersion 5.43.0

#Set the LabSourcesFolder
New-LabSourcesFolder -Drive C