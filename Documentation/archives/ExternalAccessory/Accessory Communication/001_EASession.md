# 001_EASession.pdf

## Page 1

An EASession object creates a communications channel between your app and a connected
hardware accessory. The manufacturer of the device must share the accessory’s supported
protocols with you. When you create your session, specify one of these protocols to initiate
communication with the accessory. After initializing an EASession object, use the provided outp
and input streams to transfer data to and from the accessory using that protocol.
After creating a session object, immediately retrieve and configure the stream objects provided b
the session. Streams send events to their associated delegate to notify it of changes in the stream
status. For example, streams notify the delegate when data is waiting to be read or when more
space is available for writing data. For more information about how to use stream objects, see
Stream Programming Guide.
When sending and receiving data using the provided streams, it is your responsibility to ensure th
data is formatted according to the specified protocol. The EASession class has no knowledge o
specific accessory protocols and doesn’t attempt to format the data in any way before or after
transferring it.
Overview
Topics
Creating the Session Object
External Accessory / EASession
Class
EASession
The object you use to manage communications between your app and a
connected hardware accessory.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 10.0+
visionOS 1.0+


## Page 2

init?(accessory: EAAccessory, forProtocol: String)
Initializes the session for the specified accessory and protocol.
var accessory: EAAccessory?
The accessory attached to the session.
var protocolString: String?
The protocol being used for communication with the accessory.
var inputStream: InputStream?
The stream to use for receiving data from the accessory.
var outputStream: OutputStream?
The stream to use for sending data to the accessory.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting Session Information
Getting the Communication Streams
Relationships
Inherits From
Conforms To
See Also


## Page 3

class EAAccessory
An object that contains information about a single, connected hardware accessory.
Accessory Communication


