# Get the network adapter name
$adapterName = "Wi-Fi 2"

# Disable the network adapter
Write-Host "Disabling $adapterName ..."
Disable-NetAdapter -Name $adapterName -Confirm:$false

# # Wait for 1 seconds
# Write-Host "Waiting for 1 second ..."
# Start-Sleep -Seconds 1

# Enable the network adapter
Write-Host "Enabling $adapterName ..."
Enable-NetAdapter -Name "Wi-Fi 2" -Confirm:$false

Write-Host "Done!"
