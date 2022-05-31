# Craig Wall
# Updated: 5/31/2022

# Obtain the full username of the account used to enroll the device into Intune
# The Registry location on the client is a sub-folder of the following key: 
#     - Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CloudDomainJoin\JoinInfo\

# There should be only one key inside of JoinInfo, and it's a long, random string of characters. As a result, 
# this script uses Get-ChildItem to grab the UserEmail value of that key. 

$path = "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CloudDomainJoin\JoinInfo\"

If (Test-Path -Path $path)
{
  $output = Get-ChildItem -Path $path | Get-ItemProperty -Name UserEmail | select-object -expandproperty UserEmail 
  Out-String -InputObject $output 

  #UserEmail is in format user@name.edu. Truncate it to the username portion.
  $RegisteredUser = Out-String -InputObject $output.split('@')[0]
}

#Optional Followup - Compare the Registered User to the Currently Logged-in User

# If ($env:username = $RegisteredUser)
#    {
#        Write-output "Names match"
#    }
# else
#    {
#        Write-Output "Logged In User: " $env:username "But Registered User is: " $RegisteredUser
#    }