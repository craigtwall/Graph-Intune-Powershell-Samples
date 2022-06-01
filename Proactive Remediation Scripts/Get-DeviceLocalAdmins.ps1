# Craig Wall
# Last Touched: 5/31/22

# Proactive Remediation - Detection Script
# 1) Obtains a list of local Administrators
# 2) For each name in that list, append that name to a string
# 3) Output that string - Will show up on the Intune UI under "Pre-remediation detection output"

# The list had to be converted to a string to display properly as Pre-remediation detection output
# Output will show as "NAME1, NAME2, NAME3,"

try {
    If (Get-LocalGroupMember -Group Administrators)
        {
        $admins = Get-LocalGroupMember -Group Administrators | select-object -Property Name
        [string]$adminList
        
        foreach ($adminUser in $admins)
            {

            $adminList = $adminlist + $adminUser.Name + ", "
            
            }
        
        $adminList 
        exit 0
        }
    }
Catch{
    $errMsg = $_.ExceptionMessage
    write-host $errMsg
    exit 1
}
