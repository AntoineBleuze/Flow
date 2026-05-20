# 002_Setting up the HTTP endpoints for Live Caller ID Lookup.pdf

## Page 1

For the Live Caller ID Lookup extension, your client-side app needs your serviceURL so the
system can fetch information from your server. Communication between the system and the serve
uses protocol buffer messages over HTTP. For more information, see Homomorphic Encryption
Protobuf.
Implement your server with the following HTTP endpoints:
/config
/key
/queries
The system calls the configuration endpoint periodically to get information about the use case
configuration and evaluation key status. Set up the following /config endpoint by posting to
/config:
Request
Value
Description
Header
User-
Identifier
A pseudorandom identifier for the user.
Header
Authorization
The value that contains a private access token.
Overview
Get configuration and status
SMS and Call Reporting / Setting up the HTTP endpoints for Live Caller ID Lookup
Article
Setting up the HTTP endpoints for Live
Caller ID Lookup
Connect the on-device system to your server.


## Page 2

Request
Value
Description
Request
body
ConfigRequest
A serialized protocol buffer message.
Response
Config
Response
A serialized protocol buffer message. The Config
Response contains the configs and key_info response
fields.
Response
field
configs
A field that maps from the use case names to the
corresponding configuration.
Response
field
key_info
A list of the KeyStatus objects.
You store the evaluation key on your server. When the system detects a new evaluation key, it use
the /key endpoint to upload it. Set up the following /key endpoint to upload an evaluation key b
posting to /key:
Request
Value
Description
Header
User-Identifier
A pseudorandom identifier for the user.
Header
Authorization
The value that contains a private access token.
Request body
EvaluationKeys
A serialized protocol buffer message.
The system updates your private information retrieval (PIR) request through the /queries
endpoint. Set up the /queries endpoint to evaluate PIR requests.
Request
Value
Description
Header
User-
Identifier
A pseudorandom identifier for the user. This value looks up
the previously stored evaluation key and uses it to evaluate
the PIR request.
Header
Authorization
The value that contains a private access token.
Upload the evaluation key
Update PIR requests


## Page 3

Request
Value
Description
Request
body
Requests
A serialized protocol buffer message.
Response
Responses
A serialized protocol buffer message.
Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
protocol LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
protocol LiveCallerIDLookupExtensionConfiguration
An object that allows the system to query the app extension.
struct LiveCallerIDLookupExtensionContext
The information the system uses for configuration.
enum CallLookupExtensionStatus
Returns a value with the current state of the app extension.
class LiveCallerIDLookupManager
The entry point that provides access to a collection of functions that help manage the state 
the Live Caller ID Lookup app extension.
See Also
Live Caller ID Lookup


