# Properties.pdf

## Page 1

static let providerName: CMIOExtensionProperty
A property key for the provider name.
static let providerManufacturer: CMIOExtensionProperty
A property key for the provider manufacturer.
static let deviceModel: CMIOExtensionProperty
A property key for the device model.
static let deviceIsSuspended: CMIOExtensionProperty
A property key for a Boolean value that indicates whether the device is in a suspended state
static let deviceTransportType: CMIOExtensionProperty
A property key for the device transport type.
static let deviceLinkedCoreAudioDeviceUID: CMIOExtensionProperty
Topics
Provider Properties
Device Properties
Core Media I/O / CMIOExtensionProperty
Structure
CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams
support.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

A property key for the UID of the linked Core Audio device.
static let deviceCanBeDefaultInputDevice: CMIOExtensionProperty
A property key for a Boolean value that indicates whether the device can be a default input
device.
static let deviceCanBeDefaultOutputDevice: CMIOExtensionProperty
A property key for a Boolean value that indicates whether the device can be a default output
device.
static let streamActiveFormatIndex: CMIOExtensionProperty
A property key for the index of the active stream format.
static let streamFrameDuration: CMIOExtensionProperty
A property key for the frame duration.
static let streamMaxFrameDuration: CMIOExtensionProperty
A property key for the maximum frame duration.
static let streamSinkBufferQueueSize: CMIOExtensionProperty
A property key for the sink buffer queue size.
static let streamSinkBuffersRequiredForStartup: CMIOExtensionProperty
A property key for the number of buffers required for startup.
static let streamSinkBufferUnderrunCount: CMIOExtensionProperty
A property key for the buffer underrun count.
static let streamSinkEndOfData: CMIOExtensionProperty
A property key for a Boolean value that indicates whether the stream has more data.
static let deviceLatency: CMIOExtensionProperty
static let streamLatency: CMIOExtensionProperty
init(rawValue: String)
Creates a property with a raw string value.
Stream Properties
Type Properties


## Page 3

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CMIOExtensionPropertyState
An object that describes the state of a property.
class CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
let CMIOExtensionMachServiceNameKey: String
A key that specifies the mach service name.
Relationships
Conforms To
See Also
Properties


## Page 4

Create a property state object by specifying the type of data it stores, which must be a NSStrin
NSNumber, NSDictionary, NSArray, or NSData. You can optionally specify attributes that
restrict the range of values a property allows.
convenience init(value: ObjectType?)
Creates a property state with a value.
init(value: ObjectType?, attributes: CMIOExtensionPropertyAttributes<
ObjectType>?)
Creates a property state with a value and attributes.
var value: ObjectType?
The value for a property state.
Overview
Topics
Creating a Property State
Inspecting a Property State
Core Media I/O / CMIOExtensionPropertyState
Class
CMIOExtensionPropertyState
An object that describes the state of a property.
Mac Catalyst 15.4+
macOS 12.3+


## Page 5

var attributes: CMIOExtensionPropertyAttributes<ObjectType>?
The attributes for a property state.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
struct CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams support.
class CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
let CMIOExtensionMachServiceNameKey: String
Relationships
Inherits From
Conforms To
See Also
Properties


## Page 6

A key that specifies the mach service name.


## Page 7

Use a property attributes object to describe attributes such as the minimum and maximum values
discrete values, and read-only values.
init(minValue: ObjectType?, maxValue: ObjectType?, validValues: [Object
Type]?, readOnly: Bool)
Creates a property attributes object with the specified configuration.
var isReadOnly: Bool
A Boolean value that indicates whether a property is read-only.
var minValue: ObjectType?
The minimum value a property supports.
Overview
Topics
Creating Property Attributes
Inspecting Attributes
Core Media I/O / CMIOExtensionPropertyAttributes
Class
CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
Mac Catalyst 15.4+
macOS 12.3+


## Page 8

var maxValue: ObjectType?
The maximum value a property supports.
var validValues: [ObjectType]?
An array of discrete values that this property supports.
class var readOnlyPropertyAttribute: CMIOExtensionPropertyAttributes<An
Object>
A class property for a read-only property attribute.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
struct CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams support.
Specifying a Read-Only Attribute
Relationships
Inherits From
Conforms To
See Also
Properties


## Page 9

class CMIOExtensionPropertyState
An object that describes the state of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
let CMIOExtensionMachServiceNameKey: String
A key that specifies the mach service name.


## Page 10

struct CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams support.
class CMIOExtensionPropertyState
An object that describes the state of a property.
class CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
let CMIOExtensionMachServiceNameKey: String
A key that specifies the mach service name.
See Also
Properties
Core Media I/O / CMIOExtensionInfoDictionaryKey
Global Variable
CMIOExtensionInfoDictionaryKey
A key that specifies the extension information dictionary.
Mac Catalyst 15.4+
macOS 12.3+


## Page 11

struct CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams support.
class CMIOExtensionPropertyState
An object that describes the state of a property.
class CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
See Also
Properties
Core Media I/O / CMIOExtensionMachServiceNameKey
Global Variable
CMIOExtensionMachServiceNameKey
A key that specifies the mach service name.
Mac Catalyst 15.4+
macOS 12.3+


