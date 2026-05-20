# Accessory discovery.pdf

## Page 1

Discovering and configuring accessories
The event handler you register with the session’s activate(on:eventHandler:) method
receives objects of this type from the session. Each event identifies the type of event and which
accessory (if any) is involved.
var accessory: ASAccessory?
The accessory involved in the event, if any.
class ASAccessory
An accessory discovered by the accessory session.
var eventType: ASAccessoryEventType
Mentioned in
Overview
Topics
Inspecting the event
AccessorySetupKit / ASAccessoryEvent
Class
ASAccessoryEvent
Properties of an event encountered during accessory discovery.
iOS 18.0+
iPadOS 18.0+


## Page 2

The type of event, such as accessory addition or removal, or picker presentation or removal.
enum ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
var error: (any Error)?
The error associated with the event, if any.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
enum ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
class ASDiscoveryDescriptor
Handling errors
Relationships
Inherits From
Conforms To
See Also
Accessory discovery


## Page 3

Descriptive traits used to discover accessories.


## Page 4

init?(rawValue: Int)
case accessoryAdded
The session added an accessory.
case accessoryChanged
The properties of an accessory changed.
case accessoryRemoved
The session removed an accessory.
case activated
The discovery session activated.
case invalidated
Topics
Creating an event type instance
Accessory events
Life cycle events
AccessorySetupKit / ASAccessoryEventType
Enumeration
ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
iOS 18.0+
iPadOS 18.0+
Mac Catalyst


## Page 5

The discovery session invalidated.
case accessoryDiscovered
The session discovered an accessory.
case pickerDidPresent
The discovery session picker appeared.
case pickerDidDismiss
The discovery session picker dismissed.
case pickerSetupBridging
The discovery session picker started bridging with an accessory.
case pickerSetupPairing
The discovery session picker started pairing with a Bluetooth accessory.
case pickerSetupFailed
The discovery session picker setup failed.
case pickerSetupRename
The discovery session picker started renaming an accessory.
case migrationComplete
The migration of an accessory completed.
case unknown
An unknown event occurred.
Discovery events
Picker events
Migration events
Unclassified events
Relationships


## Page 6

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class ASAccessoryEvent
Properties of an event encountered during accessory discovery.
class ASDiscoveryDescriptor
Descriptive traits used to discover accessories.
Conforms To
See Also
Accessory discovery


## Page 7

Discovering and configuring accessories
Use an instance of this type to identify accessories your app can set up, then set it as the
descriptor property of an ASPickerDisplayItem.
Some of the Bluetooth identifier properties work together to filter matching accessories, as
described in the following table.
Use
Filter property
Also requires
Description
Required
bluetoothService
UUID or bluetooth
Company
Identifier
(none)
Provide at least one UUID or
manufacturer ID to filter.
Optional
bluetoothName
Substring
bluetooth
ServiceUUID or
bluetooth
Company
Identifier
Provide a name substring to look for.
Requires setting at least a service
UUID or company ID, which identifies
the service or company using the
name.
Mentioned in
Overview
AccessorySetupKit / ASDiscoveryDescriptor
Class
ASDiscoveryDescriptor
Descriptive traits used to discover accessories.
iOS 18.0+
iPadOS 18.0+


## Page 8

Use
Filter property
Also requires
Description
Optional
bluetooth
ManufacturerData
Blob and bluetooth
ManufacturerData
Mask
bluetooth
Company
Identifier
When using manufacturer data filters
provide both the data and mask.
These properties should have the
same length and be less than or equa
to the size of the advertised payload.
The bluetoothCompany
Identifier identifies the
manufacturer associated with the
data.
Optional
bluetoothService
DataBlob and
bluetoothService
DataMask
bluetooth
ServiceUUID
When using UUID service data filters
provide both the data and mask.
These properties should have the
same length and be less than or equa
to the size of the advertised payload.
The bluetoothServiceUUID
identifies the service associated with
the data.
The descriptor also allows you to set the bluetoothRange of matched accessories; set its value
to ASDiscoveryDescriptor.Range.immediate to limit discovery of Bluetooth accessories 
those within the immediate proximity of the device running your app.
var bluetoothCompanyIdentifier: ASBluetoothCompanyIdentifier
The accessory’s 16-bit Bluetooth Company Identifier.
struct ASBluetoothCompanyIdentifier
The type used to identify a Bluetooth accessory provider.
struct ASBluetoothCompanyIdentifier
The type used to identify a Bluetooth accessory provider.
var bluetoothManufacturerDataBlob: Data?
A byte buffer that matches the accessory’s Bluetooth manufacturer data.
Topics
Specifying Bluetooth properties


## Page 9

var bluetoothManufacturerDataMask: Data?
The accessory’s Bluetooth manufacturer data mask.
var bluetoothServiceDataBlob: Data?
A byte buffer that matches the accessory’s Bluetooth service data.
var bluetoothServiceDataMask: Data?
The accessory’s Bluetooth service data mask.
var bluetoothNameSubstring: String?
The accessory’s over-the-air Bluetooth name substring.
var bluetoothNameSubstringCompareOptions: NSString.CompareOptions
The accessory’s over-the-air Bluetooth name substring compare options.
var bluetoothServiceUUID: CBUUID?
The accessory’s Bluetooth service UUID.
var bluetoothRange: ASDiscoveryDescriptor.Range
A property that tells the session to discover accessories within a specific Bluetooth range.
enum Range
The Bluetooth range in which to discover accessories.
var ssid: String?
The SSID of the accessory’s Wi-Fi network.
var ssidPrefix: String?
The prefix string of SSID of the accessory’s Wi-Fi network.
var supportedOptions: ASAccessory.SupportOptions
Options supported by an accessory.
struct SupportOptions
Options of discoverable accessories.
Specifying Wi-Fi properties
Specifying options
Specifying Wi-Fi Aware properties


## Page 10

var wifiAwareServiceName: String?
The accessory’s Wi-Fi Aware’s service name if available.
var wifiAwareServiceRole: ASDiscoveryDescriptor.WiFiAwareServiceRole
The role of the accessory’s Wi-Fi Aware’s service.
enum WiFiAwareServiceRole
A type that defines the role of an accessory’s Wi-Fi Aware’s service.
var wifiAwareModelNameMatch: ASPropertyCompareString?
The accessory’s Wi-Fi Aware model name and matching options.
var wifiAwareVendorNameMatch: ASPropertyCompareString?
The accessory’s Wi-Fi Aware vendor name and matching options.
class ASPropertyCompareString
A type that specifies how to filter a property against a given string and comparison options.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To
See Also


## Page 11

class ASAccessoryEvent
Properties of an event encountered during accessory discovery.
enum ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
Accessory discovery


