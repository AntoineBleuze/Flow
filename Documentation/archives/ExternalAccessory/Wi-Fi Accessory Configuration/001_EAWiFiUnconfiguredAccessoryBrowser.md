# 001_EAWiFiUnconfiguredAccessoryBrowser.pdf

## Page 1

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


## Page 2

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


## Page 3

Wireless Accessory Configuration Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi accessories.
class EAWiFiUnconfiguredAccessory
An object that provides information about an unconfigured MFi Wireless Accessory
Configuration accessory.
Wi-Fi Accessory Configuration


