# 005_LiveCallerIDLookupExtensionConfiguration.pdf

## Page 1

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


## Page 2

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


