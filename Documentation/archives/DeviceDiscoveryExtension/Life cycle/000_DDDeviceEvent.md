# 000_DDDeviceEvent.pdf

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


