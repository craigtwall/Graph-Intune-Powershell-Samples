# Graph-Intune-PowerShell-Samples
Connecting to Intune Using MSAL, and Graph Examples.

ADAL-based authentication is scheduled to end around the end of 2022. Most of the Intune documentation has not been fully written for MSAL-based authentication. 

This repo will show some of the work done as I've learned to get around the new Graph. 

## Tools Used 

* [Microsoft PowerShell SDK](https://docs.microsoft.com/en-us/powershell/scripting/developer/windows-powershell?view=powershell-7.2)
* [MSAL.PS](https://github.com/AzureAD/MSAL.PS), to practice generating my own Access Token.
* [Microsoft Graph](https://github.com/microsoftgraph/microsoft-graph-docs)

## MSAL Authentication

### Get-TokenDelegated-MSALPS.ps1
Grab an Access Token for Microsoft Graph, using MSAL.PS, and pass that token to Microsoft Graph to login.

## PowerShell Scripts

Useful, uncategorized scripts. 

### Get-IntuneEnrollingUser.ps1

PS Script to identify the user who registered the device to Intune. Useful if a script is needed to limit logins to the user who enrolled it.

## Proactive Remediation Scripts

PowerShell scripts I've used for proactive remediations.

### Get-DeviceLocalAdmins.ps1

A Proactive Remediation script used to output a string of local admins to the Intune UI.