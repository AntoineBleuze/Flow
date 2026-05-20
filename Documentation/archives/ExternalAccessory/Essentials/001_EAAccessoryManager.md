# 001_EAAccessoryManager.pdf

## Page 1

An EAAccessoryManager object coordinates the attached accessories for an iOS-based device
Use the shared accessory manager to retrieve a list of connected accessories, and start and stop
the delivery of connection and disconnection notifications.
Important
iPhone and iPad apps running on Macs with Apple silicon never receive connection
notifications.
class func shared() -> EAAccessoryManager
Returns the shared accessory manager object for the iOS-based device.
Overview
Topics
Getting the Shared Accessory Manager
Managing Connection Status Changes
External Accessory / EAAccessoryManager
Class
EAAccessoryManager
The object you use to identify connected accessories, and begin delivery of
connection and disconnection notifications.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 10.0+
visionOS 1.0+


## Page 2

func registerForLocalNotifications()
Begins the delivery of accessory-related notifications to the current application.
func unregisterForLocalNotifications()
Stops the delivery of accessory-related notifications to the current application.
static let EAAccessoryDidConnect: NSNotification.Name
A notification that the system sends when an accessory becomes connected and available fo
your application to use.
static let EAAccessoryDidDisconnect: NSNotification.Name
A notification that is posted when an accessory is disconnected and no longer available for
your application to use.
let EAAccessoryKey: String
A key that indicates the accessory object whose status changed.
let EAAccessorySelectedKey: String
A key that indicates the accessory object that the user selected.
func showBluetoothAccessoryPicker(withNameFilter: NSPredicate?,
completion: (((any Error)?) -> Void)?)
Displays an alert that allows the user to pair the device with a Bluetooth accessory.
typealias EABluetoothAccessoryPickerCompletion
The completion block for the Bluetooth picker.
struct EABluetoothAccessoryPickerError
Error codes returned by the Bluetooth accessory picker.
enum Code
The error codes that may be passed in an error object for the Bluetooth picker completion
block.
let EABluetoothAccessoryPickerErrorDomain: String
The domain for errors passed to a Bluetooth picker completion block.
var connectedAccessories: [EAAccessory]
Presenting the Bluetooth Picker
Getting the Available Accessories


## Page 3

The accessory objects corresponding to the list of currently connected accessories.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
UISupportedExternalAccessoryProtocols
The protocols that the app uses to communicate with external accessory hardware.
Relationships
Inherits From
Conforms To
See Also
Essentials


