# 002_CMIOExtensionStreamProperties.pdf

## Page 1

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


## Page 2

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


## Page 3

class CMIOExtensionStream
An object that represents a stream of media data.
protocol CMIOExtensionStreamSource
A protocol for objects that act as stream sources.
class CMIOExtensionClient
An object that represents a client of the extension.
Streams


