# 001_DCDevice.pdf

## Page 1

Accessing and modifying per-device data
Use the shared instance of the DCDevice class to generate a token that identifies a device. Call
the generateToken(completionHandler:) method to get the token, and then send it to yo
server:
On your server, combine the token with an authentication key that you obtain from Apple, and use
the result to request access to two per-device binary digits (bits). After authenticating the device
Apple passes the current values of the bits, along with the date they were last modified, to your
server. Your server applies its business logic to this information and communicates the results to
your app. For more information about server-side procedures, see Accessing and modifying per-
device data.
Mentioned in
Overview
DeviceCheck / DCDevice
Class
DCDevice
A representation of a device that provides a unique, authenticated token.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 11.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Note
To use the DCDevice class, your app must have an app ID that you register on the Apple
Developer website.
Apple records the bits for you, and reports the bits back to you, but you’re responsible for keeping
track of what the bits mean. You’re also responsible for determining when to reset the bits for a
given device; for example, when a user sells the device to someone else.
class var current: DCDevice
A representation of the device for which you want to query the two bits of data.
var isSupported: Bool
A Boolean value that indicates whether the device supports the DeviceCheck API.
func generateToken(completionHandler: (Data?, (any Error)?) -> Void)
Generates a token that identifies the current device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting the current device
Determining API support
Getting a device token
Relationships
Inherits From
Conforms To


## Page 3

Equatable
Hashable
NSObjectProtocol
Accessing and modifying per-device data
Use a token from your app to query and modify two per-device binary digits stored on an
Apple server.
See Also
Device identification


