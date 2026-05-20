# 000_CMIOExtensionStream.pdf

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


