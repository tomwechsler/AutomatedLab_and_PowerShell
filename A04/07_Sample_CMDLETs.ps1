#List all Labs
Get-Lab -List

#List Infos from a Lab
Get-Lab

#Import Lab - after restart or in other PS session:
Import-Lab TechLab

#Status
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Get-LabVMStatus/
Get-LabVMStatus -ComputerName DC01

#Enable Remoting
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Enable-LabVMRemoting/
Enable-LabVMRemoting -ComputerName DC01 #If necessary
Enter-LabPSSession -ComputerName DC01


#Remove VM
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Remove-LabVM/
Remove-LabVM -Name WS01

#Snapshot
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Get-LabVMSnapshot/
Get-LabVMSnapshot -ComputerName CL01
Checkpoint-LabVM -ComputerName CL01 -SnapshotName "CL01 - (07/25/2021"
Restore-LabVMSnapshot -ComputerName CL01 -SnapshotName "CL01 - (07/25/2021"
Remove-LabVMSnapshot -ComputerName CL01

#Get RDP Files
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Get-LabVMRdpFile/
Get-LabVMRdpFile -UseLocalCredential -All -Path $labSources

#Get UpTime
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Get-LabVMUptime/
Get-LabVMUptime -ComputerName DC01

#Install Windows Feature
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Get-LabWindowsFeature/
Get-LabWindowsFeature CL01 -FeatureName RSAT-AD-Tools

#Start VM
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Start-LabVM/
Start-LabVM DC01

#Stop VM
#https://automatedlab.org/en/latest/AutomatedLab/en-us/Stop-LabVM/
Stop-LabVM DC01