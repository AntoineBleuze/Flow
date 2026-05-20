# MDM Protocol.pdf

## Page 1

Managing MDM Connections
Establish or remove a connection between a device and an MDM server.
Simplifying MDM Server Administration for iOS Devices
Create a service configuration entry point to your MDM server to access to frequently used
information.
Managing Certificates for MDM Servers and Devices
Ensure secure MDM connectivity with valid certificates.
Deploying MDM Enrollment Profiles
Choose the technique to deploy MDM enrollment profiles for your organization.
Installing Profiles on Devices
Optimize deployment of profiles and provisioning profiles.
Setting Up Push Notifications for Your MDM Customers
Create and sign a certificate signing request (CSR) to enable push notifications.
Validating a Managed Device Attestation
Verify an attestation that a managed device returns by performing the required steps.
Topics
Essentials
Certificates and Profiles
Identity Management
Device Management / Implementing Device Management
Implementing Device Management
Set up an MDM server and send commands to managed devices.


## Page 2

Managing MDM Devices and Users in macOS
Manage devices and users as separate entities in macOS.
Enabling Network and Mobile User Logins
Manage network users on macOS devices bound to an Open Directory server, and mobile
users on shared iPads.
Managing Passcodes
Ensure data security by managing device passcodes and compliance with policies.
Dealing with Inactive MDM Devices and Invalid Push Tokens
Handle when devices become unmanageable due to inactivity or invalid push tokens.
Returning a managed device to service
Use a device management service to return managed devices to service quickly after use.
Sending MDM Commands to a Device
Execute commands on a device and receive responses that contain the results of each
operation.
Handling NotNow Status Responses
Handle when a device won’t execute a command and instead returns a NotNow status.
Commands and Queries
Manage the configuration and behavior of your devices.
Check-in
Authenticate devices and maintain push tokens with these commands.
Account-driven enrollment
Devices and Users
Commands
See Also
MDM Protocol


## Page 3

Authenticate devices using a user identity-focused workflow.
Migrating managed devices
Migrate managed devices from one device management service to another.


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

Migrate managed devices from one device management service to another.


## Page 12

The MDM check-in protocol validates a deviceʼs eligibility for MDM enrollment and informs the
server that a deviceʼs push token has been updated.
When the MDM payload is installed, the device initiates communication with the check-in server.
The device validates the TLS certificate of the server, then uses the identity specified in its MDM
payload as the client authentication certificate for the connection.
If a check-in server URL is provided in the MDM payload, the check-in protocol communicates wit
that check-in server. If no check-in server URL is provided, the main MDM server URL is used
instead.
Authenticate
Authenticates a user during MDM payload installation.
User Authenticate
Authenticates a user with a two-step authentication protocol.
Check Out
Responds to the removal of the MDM enrollment profile from a device.
Get Token
Overview
Topics
Commands
Device Management / Check-in
API Collection
Check-in
Authenticate devices and maintain push tokens with these commands.


## Page 13

Gets a token from the server.
Token Update
Updates the token for a device on the server.
Get Bootstrap Token
Gets the bootstrap token from the server.
Set Bootstrap Token
Sends the bootstrap token to the server.
Return To Service
Gets the return-to-service configuration from the server.
Declarative Management
Sends declarative management requests to the server.
Get Server Supported Declarations
Get a list of the declarations available on the server.
Get the Device Status
The request for getting the status of a device.
Get the Device Token
The request for sending the device token details.
Implementing Device Management
Set up an MDM server and send commands to managed devices.
Commands and Queries
Manage the configuration and behavior of your devices.
Account-driven enrollment
Authenticate devices using a user identity-focused workflow.
Declarative Management
See Also
MDM Protocol


## Page 14

Migrating managed devices
Migrate managed devices from one device management service to another.


## Page 15

Onboarding users with account sign-in
Implement user-initiated, identity-focused authentication flows.
Enrolling with Platform Single Sign-on
Authenticate users during device enrollment using Platform Single Sign-on.
object EnrollmentSSODocument
Enrollment SSO streamlines the MDM enrollment process, reduces sign-ins, and improves
security.
Discover Authentication Servers
Get a list of available authentication servers.
Implementing Device Management
Set up an MDM server and send commands to managed devices.
Topics
Sign-in methods
Objects
See Also
MDM Protocol
Device Management / Account-driven enrollment
API Collection
Account-driven enrollment
Authenticate devices using a user identity-focused workflow.


## Page 16

Commands and Queries
Manage the configuration and behavior of your devices.
Check-in
Authenticate devices and maintain push tokens with these commands.
Migrating managed devices
Migrate managed devices from one device management service to another.


## Page 17

Apple School Manager and Apple Business Manager support device management migration to
transfer management of a device from one service, the original, to another, the destination, using
simple and reliable process.
Some reasons for migrating include: replacing one service product with a different one, creating a
separate pool of managed devices for testing a new version of a service, or incorporating devices
from another organization, for example, as the result of an acquisition.
Migration typically involves either erasing a device and enrolling it with the destination service, or
manually unenrolling and then reenrolling with the destination service. These operations require
significant organization support to guide users through the process, and are disruptive, taking
significant time to complete.
The Apple School Manager and Apple Business Manager migration process simplifies and improv
the experience for admins, support personnel, and users. An overview of the order of operations f
this process is as follows:
1. An admin reassigns a managed device from the original device management service to the
destination service in Apple School Manager or Apple Business Manager.
2. The admin sets a deadline for enforcing the migration on the device.
3. The destination service detects a new device in its device assignment list and assigns an
Automated Device Enrollment Profile to the device.
4. Apple School Manager or Apple Business Manager updates the Profile assigned to the devic
to include the migration deadline, and sends a push notification to the device to have it fetch th
new profile.
5. When it receives the new Profile, the device detects the need for migration and prompts the
user with a notification that shows the required deadline, and gives them an option to start
migration immediately or postpone it.
Overview
Device Management / Migrating managed devices
Article
Migrating managed devices
Migrate managed devices from one device management service to another.


## Page 18

6. If the user postpones migration, the device repeats the notification daily or more frequently
close to the deadline. If the user keeps postponing the migration, the device forces migration
when it reaches the deadline.
7. When the user triggers migration, or when the device reaches the deadline, it starts the
migration flow, and displays progress as it unenrolls from the original service and reenrolls with
the destination service.
8. When migration is complete, the device is ready to use and the destination service manages it.
The requirements for Apple School Manager and Apple Business Manager migration are:
The device needs to have iOS 26 or later, or macOS 26 or later.
The admin needs to assign the device to Apple School Manager or Apple Business Manager.
The device needs to use Automated Device Enrollment.
An iOS device can migrate only if the device management service specified by Automated
Device Enrollment still manages it. If the device unenrolls and then reenrolls in the same or a
different service, it can’t use the migration flow.
A macOS device can migrate if any device management service manages it, including when it
unenrolls from the original Automated Device Enrollment service and reenrolls with the same o
different service, provided the new enrollment is a profile-driven device enrollment.
The original device management service doesn’t need to take any special actions when migration
occurs. Apple School Manager or Apple Business Manager removes the device from the original
service’s device assignment list, which the original service detects when it next synchronizes that
list. When migration starts, the original service receives a Check Out request from the device,
indicating unenrollment of the device.
Note
The device sends the Check Out request on a best-effort basis, and the device management
service may not always receive it. The service needs to handle previously enrolled devices that
no longer respond to requests.
Handle migration in the original device management
service
Handle migration in the destination device
management service


## Page 19

Apple School Manager or Apple Business Manager adds the migrating device to the device
assignment list for the destination device management service. It includes a mdm_migration
_deadline field in the device record, indicating the timestamp of the migration deadline, and th
tells the destination service that the next enrollment from the device is due to a migration.
Important
The device management service needs to set the X-Server-Protocol-Version header to
version 8 or later in the Apple School Manager or Apple Business Manager HTTP request, to
ensure device records include the mdm_migration_deadline field.
When the destination device management service detects a migrating device, it assigns a
Profile to the device using the Assign a Profile request. Apple School Manager or Apple
Business Manager then updates the corresponding device with the new Profile, starting the
migration flow.
The destination device management service also needs to set the await_device_configured
key to true in the device’s Profile. This allows the destination service to preserve Activation
Lock and managed apps before the device is available again to the user.
Note
The admin can cancel the migration before it starts, reverting the device to the original device
management service, and cancelling migration prompts on the device.
Activation Lock is a feature of iCloud and Automated Device Enrollment that makes it harder for
anyone to use or resell a lost or stolen device. Device management services can set Activation Lo
by using the Apple School Manager or Apple Business Manager Activation Lock a Device
request. Users can also set their own Activation Lock via iCloud if allowed by the service.
For device migration, the following rules apply for Activation Lock:
If the original service has a lock on the device before migration, the migration process always
removes that lock and invalidates any bypass codes.
The destination service can opt to lock the device during migration, or leave it unlocked.
If migration fails, Apple School Manager or Apple Business Manager removes any prior lock and
invalidates any bypass codes, and then applies a lock on the device that only the admin can
unlock.
Preserve Activation Lock


## Page 20

If the destination device management service wants to apply Activation Lock during migration,
before migration starts, it assigns an Profile with the await_device_configured key with 
value of true to the device, to ensure the device enters the await configuration state during
migration. Then, after the device enrolls and enters the await configuration state, it sends a
Activation Lock a Device request to Apple School Manager or Apple Business Manager to
lock the device, before it sends the Device Configured command to allow the device to
proceed.
During migration, a device management service can preserve managed apps on iOS devices.
Normally, devices remove managed apps and their local data when unenrolling from a service,
which happens when the device starts migrating. If the admin wants users to have the same set o
managed apps after migration as they had before migration, then preserving apps during migratio
ensures no data loss and a quicker migration because the device doesn’t need to download
previously installed managed apps.
The app preservation behavior works for apps installed using MDM commands such as Install
Application, or declarative management using AppManaged declarations. To support this, the
following occurs:
1. Before migration starts, the destination device management service assigns a Profile with th
await_device_configured key with a value of true to the device, to ensure the device
enters the await configuration state during migration.
2. When migration starts, the device stores the list of currently managed apps before unenrolling
from the original service. Then, when the device unenrolls, it ensures the system doesn’t delete
the previously managed apps.
3. After the device enrolls and enters the await configuration state, before sending the Device
Configured command, the destination service installs MDM or declarative management apps
it wants preserved. The device won’t download these apps again. It also installs any other apps
profiles, or declarations needed for setup. The device downloads any new apps, but the
download and install operations happen in the background, allowing the migration to continue.
4. When migration completes, the device compares the new set of managed apps with the
preserved list from the original service, and removes any apps in the preserved list that weren’t
reinstalled by the destination service.
Note
The destination device management service needs to ensure each preserved App Store app
has a valid App Store license assigned to it in Apple School Manager or Apple Business
Manager.
Preserve managed apps


## Page 21

MacOS devices can have multiple user accounts. When a device management service manages a
device, if it includes the value com.apple.mdm.per-user-connections in the Server
Capabilities key in its MDM profile payload, then it can also manage a single user account on
the device. That applies to local and network user accounts on the device. The following rules
apply when migrating macOS devices:
If there’s a managed local user prior to migration, the device can start migration only when that
user is signed in, with either the user triggering migration themselves or the device triggering
migration when it reaches the deadline. After migration, if the destination service supports
managing users, then it manages the same local user that was managed before.
If there’s a managed local user, but they aren’t signed in, the device notifies other signed-in
users about the migration, but they can’t trigger migration themselves, and the device can’t
trigger migration when it reaches the deadline. Instead, the device advises the nonmanaged us
that the managed local user needs to sign in to start migration.
If there’s no managed local user prior to migration, the device allows any user to trigger
migration or proceed with migration when it reaches the deadline. After migration, if the
destination service supports managing users, then it manages the user that was signed in at th
time of migration.
If the original device management service sets a FileVault Full Disk Encryption recovery key by
installing a com.apple.security.FDERecoveryKeyEscrow profile payload, that key remain
on the device after migration until the destination service sends its own com.apple.security
.FDERecoveryKeyEscrow profile payload. If this happens, the device creates a new recovery
key. To achieve optimal security, the destination service needs to install the com.apple
.security.FDERecoveryKeyEscrow profile payload during the await configuration state.
Note
The destination device management service needs to support the bootstrap token
management feature in order to create a new recovery key.
Handle multiple users when migrating macOS
devices
Ensure the FileVault recovery key resets
See Also
MDM Protocol


## Page 22

Implementing Device Management
Set up an MDM server and send commands to managed devices.
Commands and Queries
Manage the configuration and behavior of your devices.
Check-in
Authenticate devices and maintain push tokens with these commands.
Account-driven enrollment
Authenticate devices using a user identity-focused workflow.


