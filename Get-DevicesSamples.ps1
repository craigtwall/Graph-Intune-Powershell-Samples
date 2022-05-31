# List of Cmdlets for Microsoft.Graph.DeviceManagement:
# https://docs.microsoft.com/en-us/powershell/module/microsoft.graph.devicemanagement/?view=graph-powershell-1.0

# Get a List of Intune devices with select properties
# Filtering Works Differently in Graph! Props to this post for a solution: 
# https://theposhwolf.com/howtos/Get-MgUser-Invalid-Filter-Clause/
Get-MgDeviceManagementManagedDevice -Filter "devicename eq 'CLIENT01'"
Get-MgDeviceManagementManagedDevice | select -Property DeviceName, Model, OperatingSystem, SerialNumber

# Retrieve a count of devices that have a certain detected app installed. 
# Scant documentation on this. Can't seem to filter it based on Properties
Get-MgDeviceManagementDetectedApp | select -Property DisplayName, DeviceCount 

Get-MgDeviceManagementDeviceConfiguration