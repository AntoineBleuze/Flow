# 001_DDDeviceEvent_EventType.pdf

## Page 1

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


## Page 2

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


