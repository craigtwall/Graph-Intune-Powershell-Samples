# Craig Wall
# Using a script based on a blog post by Darren J. Robinson:
# https://blog.darrenjrobinson.com/interactive-authentication-to-microsoft-graph-using-msal-with-powershell-and-delegated-permissions/
# 
# Uses MSAL.PS to generate the token:
# https://github.com/AzureAD/MSAL.PS
#
# For delegated access to graph, you need:
#    1) ClientID of the "Microsoft Graph Powershell" App. 
#       This is standardized and is in the code below
#    2) TenantID
#    3) Permission scopes to give the app access to
# 
# The token is granted and passed back into $myAccessToken
# The value of the token in that variable is then passed to Connect-MgGraph to login. 

# Install-Module MSAL.PS
Import-Module MSAL.PS

$resource = "https://graph.microsoft.com" # Microsoft Graph
$scope = "openid" # Delegated User Impersonation
$clientID = "14d82eec-204b-4c2f-b7e8-296a70dab67e" # Azure PowerShell
$tenantID = "00000000-0000-0000-0000-000000001234" # AAD Tenant Name
$myUPN = "craigtwall_dev@walldev.onmicrosoft.com" # User UPN, Optional, will pre-fill username on the login prompt

$myAccessToken = Get-MsalToken -ClientId $clientID `
        -TenantId $tenantID `
        -Scopes "$($resource)/$($scope)" `
        -LoginHint $myUPN 

Connect-MgGraph -AccessToken $myAccessToken.AccessToken

# Verify the permissions and other info about the Graph Session
# Get-MgContext