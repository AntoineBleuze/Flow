# 002_Check-in.pdf

## Page 1

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


## Page 2

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


## Page 3

Migrating managed devices
Migrate managed devices from one device management service to another.


