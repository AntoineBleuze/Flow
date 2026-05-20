# Streams.pdf

## Page 1

Creating a camera extension with Core Media I/O
A stream delivers media samples to or from a CMIOExtensionDevice.
init(localizedName: String, streamID: UUID, direction: CMIOExtension
Stream.Direction, clockType: CMIOExtensionStream.ClockType, source: any
CMIOExtensionStreamSource)
Creates a stream.
init(localizedName: String, streamID: UUID, direction: CMIOExtension
Stream.Direction, customClockConfiguration: CMIOExtensionStreamCustom
ClockConfiguration, source: any CMIOExtensionStreamSource)
Creates a stream that uses a custom clock configuration.
Mentioned in
Overview
Topics
Creating a Stream
Core Media I/O / CMIOExtensionStream
Class
CMIOExtensionStream
An object that represents a stream of media data.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

var localizedName: String
A localized name for the stream.
var streamID: UUID
A universally unique identifier for the stream.
var streamingClients: [CMIOExtensionClient]
An array of clients of the stream.
var source: (any CMIOExtensionStreamSource)?
The source object for the stream.
var direction: CMIOExtensionStream.Direction
The data-flow direction of the stream.
enum Direction
Constants that define the data-flow direction of the stream.
var clockType: CMIOExtensionStream.ClockType
A clock type for the stream.
enum ClockType
Constants that indicate the clock type of a stream.
var customClockConfiguration: CMIOExtensionStreamCustomClock
Configuration?
An optional custom clock configuration for a stream.
class CMIOExtensionStreamCustomClockConfiguration
An object that describes the parameters to create a custom clock on the host side.
Identifying a Stream
Accessing Clients
Inspecting a Stream
Processing Data


## Page 3

func consumeSampleBuffer(from: CMIOExtensionClient, completionHandler: 
CMSampleBuffer?, UInt64, CMIOExtensionStream.DiscontinuityFlags, Bool,
(any Error)?) -> Void)
Consumes a sample buffer from a client.
func send(CMSampleBuffer, discontinuity: CMIOExtensionStream.
DiscontinuityFlags, hostTimeInNanoseconds: UInt64)
Sends a media sample to stream client.
struct DiscontinuityFlags
Constants that specify the types of discontinuities that can occur in a media stream.
func notifyPropertiesChanged([CMIOExtensionProperty : CMIOExtension
PropertyState<AnyObject>])
Notifies clients about stream property changes.
func notifyScheduledOutputChanged(CMIOExtensionScheduledOutput)
Notifies clients when a particular buffer is output.
class CMIOExtensionScheduledOutput
An object that represents scheduled output.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Posting Property Changes
Managing Scheduled Output
Relationships
Inherits From
Conforms To


## Page 4

NSObjectProtocol
protocol CMIOExtensionStreamSource
A protocol for objects that act as stream sources.
class CMIOExtensionStreamProperties
An object that describes the properties of an extension stream.
class CMIOExtensionClient
An object that represents a client of the extension.
See Also
Streams


## Page 5

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


## Page 6

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


## Page 7

An object that describes the properties of an extension stream.
class CMIOExtensionClient
An object that represents a client of the extension.


## Page 8

init(dictionary: [CMIOExtensionProperty : CMIOExtensionPropertyState<An
Object>])
Creates a properties object that provides the specified properties and default states.
var sinkBufferQueueSize: Int?
The buffer queue size.
var sinkBuffersRequiredForStartup: Int?
The number of buffers the stream requires for startup.
var sinkBufferUnderrunCount: Int?
The buffer underrun count.
var sinkEndOfData: Int?
A value that indicates whether the stream has reached its end.
Topics
Creating Stream Properties
Configuring Sink Properties
Configuring Source Properties
Core Media I/O / CMIOExtensionStreamProperties
Class
CMIOExtensionStreamProperties
An object that describes the properties of an extension stream.
Mac Catalyst 15.4+
macOS 12.3+


## Page 9

var activeFormatIndex: Int?
The index of the active format.
var frameDuration: CMTime?
The duration of the frame.
var maxFrameDuration: CMTime?
The maximum duration of a frame.
var propertiesDictionary: [CMIOExtensionProperty : CMIOExtensionPropert
State<AnyObject>]
A dictionary representation of the property state.
func setPropertyState(CMIOExtensionPropertyState<AnyObject>?, for
Property: CMIOExtensionProperty)
Sets the state of the specified property.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Managing Property State
Relationships
Inherits From
Conforms To
See Also


## Page 10

class CMIOExtensionStream
An object that represents a stream of media data.
protocol CMIOExtensionStreamSource
A protocol for objects that act as stream sources.
class CMIOExtensionClient
An object that represents a client of the extension.
Streams


## Page 11

var clientID: UUID
A unique client identifier.
var pid: pid_t
The process identifier of the client.
var signingID: String?
NSObject
Topics
Identifying a Client
Instance Properties
Relationships
Inherits From
Core Media I/O / CMIOExtensionClient
Class
CMIOExtensionClient
An object that represents a client of the extension.
Mac Catalyst 15.4+
macOS 12.3+


## Page 12

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class CMIOExtensionStream
An object that represents a stream of media data.
protocol CMIOExtensionStreamSource
A protocol for objects that act as stream sources.
class CMIOExtensionStreamProperties
An object that describes the properties of an extension stream.
Conforms To
See Also
Streams


