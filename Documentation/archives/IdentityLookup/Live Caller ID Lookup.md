# Live Caller ID Lookup.pdf

## Page 1

The Live Caller ID Lookup feature allows you to check incoming calls against your server for know
spam numbers while preserving user privacy. When someone’s device receives a phone call, the
system communicates with your back-end server to retrieve caller ID and blocking information, an
then displays that information on the incoming call screen and in the device’s recent calls.
Apple’s implementation of Live Caller ID Lookup upholds user privacy while providing useful
information. It does this by:
Hiding the client’s IP address using Apple’s Oblivious HTTP.
Using anonymous authentication with the Privacy Pass protocol.
Hiding the incoming number by using keyword private information retrieval (KPIR).
Overview
SMS and Call Reporting / Understanding how Live Caller ID Lookup preserves privacy
Article
Understanding how Live Caller ID Lookup
preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address
using anonymous authentication, and hiding the incoming phone number.


## Page 2

Live Caller ID Lookup hides identifiable information using Apple’s Oblivious HTTP.
The Oblivious HTTP routes requests through two relays hosted by different parties. The first relay
removes the client’s IP address from the incoming request and can’t see the destination address. 
third-party provider hosts the second relay. This removes the IP address before it reaches the
server.
Live Caller ID Lookup uses the Privacy Pass protocol, which requires you to authenticate the users
who register with the service without sharing their identity or linking the client’s identity to the
query. First, your on-device app authenticates the client using a temporary ID and receives a long
term token (user token). Then, the app hands this token to the on-device system. From there, the
system runs multiple round protocols with your server, and receives several private tokens that it
can use to make authenticated anonymous queries.
Your server doesn’t learn which user token the system has. Additionally, your on-device, client-sid
app only participates in the initial authentication. The client-side app doesn’t know the private
tokens and query phone numbers because the system controls them. This ensures authentication
while preserving privacy.
Apple’s Oblivious HTTP and Privacy Pass hide the client’s identity from your server. However, they
don’t hide the query itself. Live Caller ID Lookup uses KPIR to hide client queries. KPIR is a
cryptographic protocol that calls the server to fetch data corresponding to a particular keyword
Hide the client’s IP address
Use anonymous authentication
Hide the incoming number


## Page 3

from the hosted database without revealing the keyword to the server. Implementing the Live Call
ID Lookup feature requires the service provider to run a KPIR server on its database and handle al
of the client’s KPIR encrypted queries. For more information, see the Live Caller ID Lookup
example.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
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


## Page 4

With Live Caller ID Lookup, when a device receives an incoming call, the system reaches out to a
third-party service to fetch private information retrieval (PIR) data from your server. You need to
format that data so the system can make the following requests:
A blocking information request
An identity information request
For more information, see the Swift homomorphic encryption library.
The blocking information request is a single byte with two defined values:
0
This value means don’t block the caller.
1
This value means block the caller.
The identity request displays caller information on the device. This information is a serialized
protocol buffer message of type CallIdentity. The following example shows the response
formatting for an identity request:
Overview
Block a caller
Identify caller information
SMS and Call Reporting / Formatting data for blocking and identity information
Article
Formatting data for blocking and identity
information
Set up your PIR payload for call blocking and identity information.


## Page 5

Understanding how Live Caller ID Lookup preserves privacy
See Also
Live Caller ID Lookup


## Page 6

Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

With the Live Caller ID Lookup app extension, you can provide caller ID and call-blocking services
from a server you maintain. The app extension tells the system how to communicate with your
server. When someone’s device receives a phone call, the system communicates with your back-
end server to retrieve caller ID and blocking information, and then displays that information on the
incoming call screen and in the device’s recent phone calls.
Note
The Live Caller ID Lookup app extension requires you to use Apple relay servers to support
making calls to your server endpoints. This requires endpoint validation from Apple. If you’re
interested in using the app extension, submit your request. For more information on the server
side API, see the Live Caller ID Lookup example and the Swift homomorphic encryption library.
To use the Live Caller ID Lookup app extension, you need to add it to your Xcode project by
choosing File > New > Target, selecting its template, and clicking Next.
Overview
Add the app extension to your project
SMS and Call Reporting / Getting up-to-date calling and blocking information for your app
Article
Getting up-to-date calling and blocking
information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and
identity services.


## Page 11

When you add this target to your project, it provides the initial files you need for your app
extension.
After adding the app extension, the system needs configuration data to connect to your server an
authenticate the person using your app. The app extension’s entrypoint is an object that adopts t
LiveCallerIDLookupProtocol. This defines a context parameter where you provide
information for the system about your server and access tokens. The LiveCallerIDLookup
ExtensionContext takes three parameters:
serviceURL — The endpoint for fetching information from your server.
tokenIssuerURL— The URL for the Private Access token issuer.
userTierToken — An HTTP bearer token that authenticates the person using your app.
The system uses Private Information Retrieval (PIR) to fetch a database entry without disclosing t
query to the server. When an incoming call occurs, the PIR process privately checks the number
against your server before revealing relevant caller information to the system.
The system caches the responses for server-side per entry configuration time. This means, if a
second phone call comes in from the same number before the cache expires, the system uses the
Specify your server information


## Page 12

cached values instead of making another PIR request. For more information about setting up your
server endpoints, see Setting up the HTTP endpoints for Live Caller ID Lookup.
After configuring your data and connecting the app extension to the server, you have access to
several functions and variables through the LiveCallerIDLookupManager class. This allows
you to manage the state of the app extension.
The app extension needs to be in an enabled state so the system can communicate with your
server. To check the status of your app extension, use the status(forExtensionWith
Identifier:) function. You can call openSettings() to navigate to Settings, where the use
can enable the app extension.
Manage the app extension
Refresh the data


## Page 13

The system fetches data from the parameters in the LiveCallerIDLookupExtensionContex
structure to communicate with the server. If you need to update the extension context, use the
reset(forExtensionWithIdentifier:) method. This reregisters your app extension so th
system caches the new parameters.
If you communicate to your app through push notifications, or other means, about changes to you
server-side parameters, use the refreshPIRParameters(forExtensionWith
Identifier:) to update your dataset immediately. This function asks the system to refresh
information about the server dataset, such as its size. The system periodically refreshes these
parameters automatically.
Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
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


## Page 14

Getting up-to-date calling and blocking information for your app
var context: LiveCallerIDLookupExtensionContext
Information you use to connect to your server.
Required
AppExtension
Mentioned in
Topics
Setting extension context
Relationships
Inherits From
SMS and Call Reporting / LiveCallerIDLookupProtocol
Protocol
LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+
watchOS 11.0+


## Page 15

Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
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


## Page 16

AppExtensionConfiguration, Sendable, SendableMetatype
Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
Relationships
Inherits From
See Also
Live Caller ID Lookup
SMS and Call Reporting / LiveCallerIDLookupExtensionConfiguration
Protocol
LiveCallerIDLookupExtension
Configuration
An object that allows the system to query the app extension.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+
watchOS 11.0+


## Page 17

Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
protocol LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
struct LiveCallerIDLookupExtensionContext
The information the system uses for configuration.
enum CallLookupExtensionStatus
Returns a value with the current state of the app extension.
class LiveCallerIDLookupManager
The entry point that provides access to a collection of functions that help manage the state 
the Live Caller ID Lookup app extension.


## Page 18

Getting up-to-date calling and blocking information for your app
The extension context allows the system to obtain information from your app.
init(serviceURL: URL, tokenIssuerURL: URL, userTierToken: Data)
Creates the app extension context.
let serviceURL: URL
The endpoint of the service to fetch identity and blocking information.
Mentioned in
Overview
Topics
Initializing the app extension context
Configuring the system
SMS and Call Reporting / LiveCallerIDLookupExtensionContext
Structure
LiveCallerIDLookupExtensionContext
The information the system uses for configuration.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+
watchOS 11.0+


## Page 19

let tokenIssuerURL: URL
The URL of the Privacy Pass token issuer.
let userTierToken: Data
An HTTP bearer token that authenticates the person using your app.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
protocol LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
Relationships
Conforms To
See Also
Live Caller ID Lookup


## Page 20

protocol LiveCallerIDLookupExtensionConfiguration
An object that allows the system to query the app extension.
enum CallLookupExtensionStatus
Returns a value with the current state of the app extension.
class LiveCallerIDLookupManager
The entry point that provides access to a collection of functions that help manage the state 
the Live Caller ID Lookup app extension.


## Page 21

case disabled
The Live Caller ID Lookup app extension is in a disabled state.
case enabled
The Live Caller ID Lookup app extension is in an enabled state.
Copyable, Equatable, Hashable
Topics
Checking the state of the app extension
Relationships
Conforms To
See Also
SMS and Call Reporting / CallLookupExtensionStatus
Enumeration
CallLookupExtensionStatus
Returns a value with the current state of the app extension.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+
watchOS 11.0+


## Page 22

Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
protocol LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
protocol LiveCallerIDLookupExtensionConfiguration
An object that allows the system to query the app extension.
struct LiveCallerIDLookupExtensionContext
The information the system uses for configuration.
class LiveCallerIDLookupManager
The entry point that provides access to a collection of functions that help manage the state 
the Live Caller ID Lookup app extension.
Live Caller ID Lookup


## Page 23

Getting up-to-date calling and blocking information for your app
You can use the provided functions to check whether your app extension is in an enabled state,
open Settings to enable the extension, and manage refreshing your server data.
let extensionPointName: String
The name of the extension point.
func openSettings() async throws
Navigates to Settings so a person can configure the Live Caller ID Lookup app extension.
Mentioned in
Overview
Topics
Checking status and fetching data
SMS and Call Reporting / LiveCallerIDLookupManager
Class
LiveCallerIDLookupManager
The entry point that provides access to a collection of functions that help manage
the state of the Live Caller ID Lookup app extension.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+
watchOS 11.0+


## Page 24

func refreshPIRParameters(forExtensionWithIdentifier: String) async 
throws
Communicates with the system to refetch Private Information Retrieval (PIR) parameters from
the server.
func reset(forExtensionWithIdentifier: String) async throws
Resets the cache associated with the app extension.
func status(forExtensionWithIdentifier: String) -> CallLookupExtension
Status
Queries the system to check the status of the app extension.
static let shared: LiveCallerIDLookupManager
The shared Live Caller ID Lookup manager instance for the app.
func refreshExtensionContext(forExtensionWithIdentifier: String) async 
throws
Understanding how Live Caller ID Lookup preserves privacy
Use Live Caller ID Lookup to protect user privacy by hiding the client’s IP address, using
anonymous authentication, and hiding the incoming phone number.
Formatting data for blocking and identity information
Set up your PIR payload for call blocking and identity information.
Setting up the HTTP endpoints for Live Caller ID Lookup
Connect the on-device system to your server.
Getting up-to-date calling and blocking information for your app
Implement the Live Caller ID Lookup app extension to provide call-blocking and identity
services.
Sharing the instance
Instance Methods
See Also
Live Caller ID Lookup


## Page 25

protocol LiveCallerIDLookupProtocol
Information the system uses to query the app extension for context.
protocol LiveCallerIDLookupExtensionConfiguration
An object that allows the system to query the app extension.
struct LiveCallerIDLookupExtensionContext
The information the system uses for configuration.
enum CallLookupExtensionStatus
Returns a value with the current state of the app extension.


