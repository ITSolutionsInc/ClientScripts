#Get the IE Autodect information
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
$regName = "AutoDetect"

# Get the current value of the registry key
$currentValue = Get-ItemProperty -Path $regPath -Name $regName | Select-Object -ExpandProperty $regName

# Check if the current value is 0
if ($currentValue -eq 0) {
    # Set the registry value to 1
    Set-ItemProperty -Path $regPath -Name $regName -Value 1
    Write-Output "AutoDetect was set to 0. It has been updated to 1."
} else {
    Write-Output "AutoDetect is already set to 1 or another value. No changes made."
}
