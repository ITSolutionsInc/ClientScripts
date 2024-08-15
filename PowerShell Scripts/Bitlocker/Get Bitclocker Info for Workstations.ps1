#Get the Bitlocker Version
$bitlockerStatus = manage-bde -status
$sections = $bitlockerStatus -split "`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n"
$BitLockerVersion = $sections | Select-String -Pattern "Bitlocker Version:"
$BitLockerVersion = ($BitLockerVersion -split "Bitlocker Version:")[1].Trim()
$BitlockerVersion


#get Bitlocker Encryption Method
$bitlockerStatus = manage-bde -status
$sections = $bitlockerStatus -split "`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n"
$EncryptionMethod = $sections | Select-String -Pattern "Encryption Method:"

$EncryptionMethod = ($EncryptionMethod -split "Encryption Method:")[1].Trim()
$EncryptionMethod

#Get Lock status
$bitlockerStatus = manage-bde -status
$sections = $bitlockerStatus -split "`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n"
$LockStatus       = $sections | Select-String -Pattern "Lock Status:"
$LockStatus = ($LockStatus -split "Lock Status:")[1].Trim()
$LockStatus

#Get Protection Status
$bitlockerStatus = manage-bde -status
$sections = $bitlockerStatus -split "`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n"
$ProtectionStatus = $sections | Select-String -Pattern "Protection Status:"
$ProtectionStatus = ($ProtectionStatus -split "Protection Status:")[1].Trim()
$ProtectionStatus


#Get Sophos Device Encryption Service

$serviceName = "Sophos Device Encryption Service"

# Check if the service is installed
if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    
    Write-Host "Yes Sophos Encryption is Enabled"
} else {
  
    Write-Host "No Sophos Protection"
}


#Get the recovery password. we have to save it to a text file first in order for us to get the details that we need, otherwise powershell script will not be able to pull the line 3
manage-bde -protectors -get c: -t RecoveryPassword >  C:\windows\ltsvc\packages\bitl.txt
$FilePath = "C:\windows\ltsvc\packages\bitl.txt"
$lineNumber = 8
$NP_ID = (Get-Content -Path $FilePath | Select-Object -Index ($lineNumber-1))
$NP_ID


#Get the Numerical Password
$FilePath = "C:\windows\ltsvc\packages\bitl.txt"
$lineNumber = 8
$NP_ID = (Get-Content -Path $FilePath | Select-Object -Index ($lineNumber-1))
$NP_ID

#Get Bitlocker Numerical Password
$FilePath = "C:\windows\ltsvc\packages\bitl.txt"
$lineNumber = 10
$NP_ID = (Get-Content -Path $FilePath | Select-Object -Index ($lineNumber-1))
$NP_ID
