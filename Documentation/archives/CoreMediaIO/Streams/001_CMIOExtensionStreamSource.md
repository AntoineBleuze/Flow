# 001_CMIOExtensionStreamSource.pdf

## Page 1

Create a class that adopts this protocol to configure stream properties and manage the stream lif
cycle.
var formats: [CMIOExtensionStreamFormat]
An array of formats that a stream supports.
Required
class CMIOExtensionStreamFormat
An object that describes the format of a media stream.
var availableProperties: Set<CMIOExtensionProperty>
A set of properties available for the stream.
Required
Overview
Topics
Accessing the Source Format
Managing Stream Properties
Core Media I/O / CMIOExtensionStreamSource
Protocol
CMIOExtensionStreamSource
A protocol for objects that act as stream sources.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

func streamProperties(forProperties: Set<CMIOExtensionProperty>) throws
-> CMIOExtensionStreamProperties
Gets the states of specified properties.
Required
func setStreamProperties(CMIOExtensionStreamProperties) throws
Sets the property state of a stream.
Required
func authorizedToStartStream(for: CMIOExtensionClient) -> Bool
Determines whether to authorize an app to use this stream.
Required
func startStream() throws
Starts the stream of media data.
Required
func stopStream() throws
Stops the stream of media data.
Required
NSObjectProtocol
class CMIOExtensionStream
An object that represents a stream of media data.
class CMIOExtensionStreamProperties
Managing a Stream
Relationships
Inherits From
See Also
Streams


## Page 3

An object that describes the properties of an extension stream.
class CMIOExtensionClient
An object that represents a client of the extension.


