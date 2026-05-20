# Life cycle.pdf

## Page 1

The extension creates and configures an instance of this class to represent a moment of interest 
the device discovery life cycle. The event’s eventType (DDDeviceEvent.EventType)
describes a particular status.
For example, when the extension discovers a device of interest, it instantiates an instance of this
class with the type DDDeviceEvent.EventType.deviceFound.
Then, the extension provides the discovered device to the system using report(_:) for eventua
display in the route picker view (AVRoutePickerView).
Overview
Topics
Creating a device event
DeviceDiscoveryExtension / DDDeviceEvent
Class
DDDeviceEvent
An object that provides a device or communicates its change in status.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

init(eventType: DDDeviceEvent.EventType, device: DDDevice)
Creates an event object that conveys status for a discovered device of interest.
var eventType: DDDeviceEvent.EventType
A type for the event that describes the discovery status.
enum EventType
Identifiers for the types of events that occur in the device discovery life cycle.
var device: DDDevice
An object that describes a third-party media receiver.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
enum EventType
Identifiers for the types of events that occur in the device discovery life cycle.
Configuring a device event
Relationships
Inherits From
Conforms To
See Also
Life cycle


## Page 3

func DDEventTypeToString(DDDeviceEvent.EventType) -> String
Returns human-readable text for the specified event identifier.
typealias DDEventHandler
A function that the extension invokes to signal an event.


## Page 4

An event (DDEvent) eventType is of this type.
case unknown
A value for uninitialized event types.
case deviceFound
A status that indicates when the extension finds the device of interest.
case deviceLost
A status that indicates when the extension loses a connection to the device of interest.
case deviceChanged
A status that indicates when the device of interest changes configuration.
Overview
Topics
Distinguishing event types
Initializers
DeviceDiscoveryExtension / DDDeviceEvent / DDDeviceEvent.EventType
Enumeration
DDDeviceEvent.EventType
Identifiers for the types of events that occur in the device discovery life cycle.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 5

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class DDDeviceEvent
An object that provides a device or communicates its change in status.
func DDEventTypeToString(DDDeviceEvent.EventType) -> String
Returns human-readable text for the specified event identifier.
typealias DDEventHandler
A function that the extension invokes to signal an event.
Relationships
Conforms To
See Also
Life cycle


## Page 6

inValue
An event identifier to convert to text.
A textual value for the specified event type.
Your extension can use this function for logging.
class DDDeviceEvent
An object that provides a device or communicates its change in status.
enum EventType
Parameters
Return Value
Discussion
See Also
Life cycle
DeviceDiscoveryExtension / DDEventTypeToString(_:)
Function
DDEventTypeToString(_:)
Returns human-readable text for the specified event identifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 7

Identifiers for the types of events that occur in the device discovery life cycle.
typealias DDEventHandler
A function that the extension invokes to signal an event.


## Page 8

inEvent
An event that the extension creates for the event handler.
A device discovery extension implements a closure of this format and calls it after creating
argument events. In the implementation, the extension creates device events (DDEvent) and
passes them to the system by calling report(_:).
For an example event handler, see Appex.swift in Discovering a third-party media-streaming
device.
class DDDeviceEvent
An object that provides a device or communicates its change in status.
enum EventType
Parameters
Discussion
See Also
Life cycle
DeviceDiscoveryExtension / DDEventHandler
Type Alias
DDEventHandler
A function that the extension invokes to signal an event.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 9

Identifiers for the types of events that occur in the device discovery life cycle.
func DDEventTypeToString(DDDeviceEvent.EventType) -> String
Returns human-readable text for the specified event identifier.


