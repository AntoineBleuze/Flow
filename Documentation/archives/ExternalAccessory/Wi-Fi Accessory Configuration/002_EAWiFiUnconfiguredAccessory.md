# 002_EAWiFiUnconfiguredAccessory.pdf

## Page 1

var name: String
The name of the accessory.
var manufacturer: String
The name of the accessory’s manufacturer.
var model: String
The model name of accessory.
var ssid: String
The Wi-Fi SSID of the accessory.
var macAddress: String
The primary MAC address of the accessory.
var properties: EAWiFiUnconfiguredAccessoryProperties
The properties the accessory supports.
struct EAWiFiUnconfiguredAccessoryProperties
Topics
Getting Information About the Accessory
External Accessory / EAWiFiUnconfiguredAccessory
Class
EAWiFiUnconfiguredAccessory
An object that provides information about an unconfigured MFi Wireless
Accessory Configuration accessory.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
tvOS 10.0+
visionOS 1.0+


## Page 2

Options that can be combined using the C bitwise OR operator to represent the properties of
an unconfigured accessory.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Wireless Accessory Configuration Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi accessories.
class EAWiFiUnconfiguredAccessoryBrowser
An object you use to scan for wireless accessories and configure them for use with the user
app.
Relationships
Inherits From
Conforms To
See Also
Wi-Fi Accessory Configuration


