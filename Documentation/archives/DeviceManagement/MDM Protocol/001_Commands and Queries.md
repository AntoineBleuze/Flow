# 001_Commands and Queries.pdf

## Page 1

The Mobile Device Management (MDM) protocol provides a way to tell a device to remotely
execute certain management commands or queries. First, a device registers with the MDM server
Then, the server sends push notifications to the device when there are commands to process on
the device.
When the device receives the notification, it polls the server for the command, processes the
command, and reports the command results to the server. The device then checks for other
commands to process.
Important
Mobile Device Management is for enterprise use only. To use it in your app, the Account Holder
of your app’s development team must request the Mobile Device Management capability. See
Request a Mobile Device Management Capability.
Install Profile
Install a configuration profile on a device.
Profile List
Get a list of installed profiles on a device.
Overview
Topics
Profile Management
Device Management / Commands and Queries
API Collection
Commands and Queries
Manage the configuration and behavior of your devices.


## Page 2

Remove Profile
Remove a previously installed profile from the device.
Install Provisioning Profile
Install a provisioning profile on a device.
Provisioning Profile List
Get a list of installed provisioning profiles on a device.
Remove Provisioning Profile
Remove a previously installed provisioning profile from a device.
Device Information
Get detailed information about a device.
Device Configured
Inform the device that it can allow the user to continue in Setup Assistant.
User Configured
Inform the device that it can continue past Setup Assistant and finish login.
Restrictions
Get a list of restrictions on the device.
Erase Device
Remotely and immediately erase a device.
Device Lock
Remotely and immediately lock a device.
Restart Device
Remotely and immediately restart a device.
Shut Down Device
Remotely and immediately shut down a device.
Device Details
Device State
Managed Apps


## Page 3

Install Application
Install a third-party app on a device.
Install Enterprise Application
Install an enterprise app on a device.
Installed Application List
Get a list of the installed apps on a device.
Managed Application List
Get the status of all managed apps on a device.
Remove Application
Remove an app.
Apply Redemption Code
Complete the installation of an app using a redemption code.
Validate Applications
Force validation of developer and universal provisioning profiles for enterprise apps.
Managed Application Attributes
Query attributes in managed apps on a device.
Managed Application Configuration
Get app configurations from managed apps on a device.
Managed Application Feedback
Get app feedback from a managed app on the device.
Install Media
Install a book on a device.
Managed Media List
Get a list of the managed books on a device.
Remove Media
Remove a previously installed book from a device.
Managed Media
Accounts


## Page 4

Account Configuration
Create and configure a local administrator account on a device.
Invite To Program
Invite a user to join the Volume Purchase Program (VPP).
Clear Passcode
Remove the passcode from a device.
Clear Restrictions Password
Clear the Screen Time password and the restrictions on a device.
Unlock User Account
Unlock a user account that the system locked because of too many failed password attempt
Set Auto Admin Password
Update the local administrator account password.
Set Firmware Password
Change or clear the firmware password on a device.
Verify Firmware Password
Verify the firmware password on a device.
Schedule OS Update Scan
Schedule a background scan for operating-system updates on a device.
Deprecated
Available OS Updates
Get a list of available operating-system updates for a device.
Deprecated
Schedule OS Update
Schedule an update of the operating system on a device.
Deprecated
OS Update Status
Passwords
Updates


## Page 5

Get the status of operating-system updates on a device.
Deprecated
Enable Lost Mode
Enable Lost Mode on a device, which provides a message and phone number on the Lock
Screen.
Device Location
Request the location of a device when in Lost Mode.
Play Lost Mode Sound
Play the Lost Mode sound on a device that’s in Lost Mode.
Disable Lost Mode
Take the device out of Lost Mode.
Set Recovery Lock
Set or clear the Recovery Lock password.
Verify Recovery Lock
Verify the device’s Recovery Lock password.
Content Caching Information
Get the status of the content caches on a device.
Request Mirroring
Prompt the user to share their screen using AirPlay Mirroring.
Stop Mirroring
Stop mirroring the display to another device.
Lost Device
Recovery Lock
Content Caching
AirPlay Mirroring
eSim Management


## Page 6

Refresh Cellular Plans
Query a carrier URL for active eSIM cellular-plan profiles on a device.
Disable Remote Desktop
Disable Remote Desktop on a device.
Enable Remote Desktop
Enable Remote Desktop on a device.
Settings
Configure settings on a device.
LOM Device Request
Send requests to a device using lights-out management (LOM).
LOM Setup Request
Get information from a device to set up lights-out management (LOM).
Security Info
Get security-related information about a device.
Certificate List
Get a list of installed certificates on a device.
Activation Lock Bypass Code
Get the code to bypass Activation Lock on a device.
Clear Activation Lock Bypass Code
Clear the Activation Lock bypass code on a device.
Rotate FileVault Key
Change the FileVault primary password on a device.
Managed Settings
Lights-Out Management
Security
Extensions


## Page 7

Active NSExtensions
Get a list of active extensions for a user on a device.
NSExtension Mappings
Get a list of the installed extensions for a user on a device.
User List
Get a list of users with active accounts on a device.
Log Out User
Force the current user to log out of a device.
Delete User
Delete a user’s account from a device.
Declarative Management
Enable your server to support declarative management or trigger a declarative management
synchronization operation on the device.
Implementing Device Management
Set up an MDM server and send commands to managed devices.
Check-in
Authenticate devices and maintain push tokens with these commands.
Account-driven enrollment
Authenticate devices using a user identity-focused workflow.
Migrating managed devices
User Management
Declarative Management
See Also
MDM Protocol


## Page 8

Migrate managed devices from one device management service to another.


