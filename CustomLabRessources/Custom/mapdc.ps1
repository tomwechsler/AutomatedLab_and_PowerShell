#Credentials
[string]$Username = "Administrator"
[string]$Password = "P@ssw0rd"
[securestring]$secPass = ConvertTo-SecureString $Password -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential($Username,$secPass)

#Drive Mapping
New-PSDrive -Name U -PSProvider FileSystem -Root \\DC01\C$ -Credential $Cred -Persist