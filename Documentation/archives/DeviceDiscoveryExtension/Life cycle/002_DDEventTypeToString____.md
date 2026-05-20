# 002_DDEventTypeToString____.pdf

## Page 1

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


## Page 2

Identifiers for the types of events that occur in the device discovery life cycle.
typealias DDEventHandler
A function that the extension invokes to signal an event.


