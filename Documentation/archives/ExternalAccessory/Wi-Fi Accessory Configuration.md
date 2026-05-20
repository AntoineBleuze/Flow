# Wi-Fi Accessory Configuration.pdf

## Page 1

Key
com.apple.external-accessory.wireless-configuration
Type
Boolean
This key indicates whether your app may configure third-party hardware accessories that use
Apple’s MFi licensed technology to connect to Apple devices.
To add this entitlement to your app, enable the Wireless Accessory Configuration capability in
Xcode.
External Accessory
Details
Discussion
See Also
Related Documentation
Bundle Resources / Entitlements / Wireless Accessory Configuration Entitlement
Property List Key
Wireless Accessory Configuration
Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi
accessories.
iOS 3.0+
iPadOS 3.0+


## Page 2

Communicate with accessories that connect to a device with the Apple Lightning connector,
or with Bluetooth wireless technology.
Access Wi-Fi Information Entitlement
A Boolean value indicating whether your app can access information about the connected W
Fi network.
Key: com.apple.developer.networking.wifi-info
Multipath Entitlement
A Boolean value indicating whether your app may use Multipath protocols to seamlessly
transition between Wi-Fi and cellular networks.
Key: com.apple.developer.networking.multipath
Hotspot Configuration Entitlement
A Boolean value indicating whether your app can use the hotspot manager to configure Wi-F
networks.
Key: com.apple.developer.networking.HotspotConfiguration
HotSpot Helper
An entitlement that permits an app to participate in navigating Wi-Fi network hotspots.
Key: com.apple.developer.networking.HotspotHelper
ISO18092 system codes for NFC Tag Reader Session
A list of FeliCa system codes that the app supports.
Key: com.apple.developer.nfc.readersession.felica.systemcodes
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
Key: com.apple.developer.nfc.readersession.formats
ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
Key: com.apple.developer.nfc.readersession.iso7816.select-identifiers
com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
Wireless interfaces


## Page 3

A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.


## Page 4

The EAWiFiUnconfiguredAccessoryBrowser class gives your app access to the MFi Wirele
Accessory Configuration process. You use a browser object to scan for unconfigured accessories
connect them to the user’s Wi-Fi infrastructure, and configure attributes of the accessories. An
accessory is represented by an instance of EAWiFiUnconfiguredAccessory.
init(delegate: (any EAWiFiUnconfiguredAccessoryBrowserDelegate)?, queue
dispatch_queue_t?)
Creates a browser object that scans for unconfigured accessories.
var delegate: (any EAWiFiUnconfiguredAccessoryBrowserDelegate)?
The object that acts as the delegate of the browser and receives browser events.
Overview
Topics
Creating the Browser Object
Managing Browser Interactions
External Accessory / EAWiFiUnconfiguredAccessoryBrowser
Class
EAWiFiUnconfiguredAccessoryBrowser
An object you use to scan for wireless accessories and configure them for use wit
the user’s app.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
tvOS 10.0+
visionOS 1.0+


## Page 5

protocol EAWiFiUnconfiguredAccessoryBrowserDelegate
A protocol you use to manage the search and configuration processes for an unconfigured
accessory browser.
func configureAccessory(EAWiFiUnconfiguredAccessory, withConfiguration
UIOn: UIViewController)
Begins the configuration process for the specified accessory.
func startSearchingForUnconfiguredAccessories(matching: NSPredicate?)
Starts the search for unconfigured accessories that match the specified predicate.
func stopSearchingForUnconfiguredAccessories()
Stops the search for unconfigured accessories.
var unconfiguredAccessories: Set<EAWiFiUnconfiguredAccessory>
The set of unconfigured accessories that have been discovered.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Finding and Configuring Accessories
Relationships
Inherits From
Conforms To
See Also


## Page 6

Wireless Accessory Configuration Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi accessories.
class EAWiFiUnconfiguredAccessory
An object that provides information about an unconfigured MFi Wireless Accessory
Configuration accessory.
Wi-Fi Accessory Configuration


## Page 7

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


## Page 8

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


