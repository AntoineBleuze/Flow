# Classes.pdf

## Page 1

NSImageCell
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSCoding
NSCopying
NSObjectProtocol
NSUserInterfaceItemIdentification
Relationships
Inherits From
Conforms To
See Also
IOBluetooth UI / IOBluetoothAccessibilityIgnoredImageCell
Class
IOBluetoothAccessibilityIgnoredImageCe
macOS 10.2+


## Page 2

class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef
Classes


## Page 3

NSTextFieldCell
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSCoding
NSCopying
NSObjectProtocol
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To
IOBluetooth UI / IOBluetoothAccessibilityIgnoredTextFieldCell
Class
IOBluetoothAccessibilityIgnoredTextField
Cell
macOS 10.2+


## Page 4

class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef
See Also
Classes


## Page 5

Implementation of a window controller to return a NSArray of selected bluetooth devices. This cla
will handle connecting to the Bluetooth Daemon for the purposes of searches, and displaying the
results. This controller will return a NSArray of IOBluetoothDevice objects to the user.
func addAllowedUUID(IOBluetoothSDPUUID!)
Adds a UUID to the list of UUIDs that are used to validate the user’s selection.
func addAllowedUUIDArray([Any]!)
Adds an array of UUIDs to the list of UUIDs that are used to validate the user’s selection.
func beginSheetModal(for: NSWindow!, modalDelegate: Any!, didEnd:
Selector!, contextInfo: UnsafeMutableRawPointer!) -> IOReturn
Runs the device selector panel as a sheet on the target window.
Overview
Topics
Instance Methods
IOBluetooth UI / IOBluetoothDeviceSelectorController
Class
IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other
bluetooth devices.
macOS 10.2+


## Page 6

func clearAllowedUUIDs()
Resets the controller back to the default state where it will accept any device the user select
func getCancel() -> String!
Returns the title of the default/cancel button in the device selector panel.
func getDescriptionText() -> String!
Returns the description text that appears in the device selector panel.
func getHeader() -> String!
Returns the header text that appears in the device selector panel.
func getOptions() -> IOBluetoothServiceBrowserControllerOptions
Returns the option bits that control the panel’s behavior.
func getPrompt() -> String!
Returns the title of the default/select button in the device selector panel.
func getResults() -> [Any]!
Returns the result of the user’s selection.
func getSearchAttributes() -> UnsafePointer<IOBluetoothDeviceSearch
Attributes>!
Returns the search attributes that control the panel’s search/inquiry behavior.
func getTitle() -> String!
Returns the title of the device selector panel.
func runModal() -> Int32
Runs the device selector panel in a modal session to allow the user to select a Bluetooth
device.
func setCancel(String!)
Sets the title of the default/cancel button in the device selector panel.
func setDescriptionText(String!)
Sets the description text that appears in the device selector panel.
func setHeader(String!)
Sets the header text that appears in the device selector panel.
func setOptions(IOBluetoothServiceBrowserControllerOptions)
Sets the option bits that control the panel’s behavior.


## Page 7

func setPrompt(String!)
Sets the title of the default/select button in the device selector panel.
func setSearchAttributes(UnsafePointer<IOBluetoothDeviceSearchAttribute
>!)
Sets the search attributes that control the panel’s search/inquiry behavior.
func setTitle(String!)
Sets the title of the panel when not run as a sheet.
class func deviceSelector() -> IOBluetoothDeviceSelectorController!
NSWindowController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Sendable
SendableMetatype
Type Methods
Relationships
Inherits From
Conforms To
See Also


## Page 8

class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef
Classes


## Page 9

Equatable, Hashable
class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
Relationships
Conforms To
See Also
Classes
IOBluetooth UI / IOBluetoothDeviceSelectorControllerRef
Class
IOBluetoothDeviceSelectorControllerRef
macOS 10.2+


## Page 10

A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef


## Page 11

init!(objectPushWith: IOBluetoothDevice!, withFiles: [Any]!, delegate:
Any!)
Creates and returns a new IOBluetoothObjectPush object
func beginSheetModal(for: NSWindow!, modalDelegate: Any!, didEnd:
Selector!, contextInfo: UnsafeMutableRawPointer!) -> IOReturn
Runs the transfer UI as a sheet on the target window.
func getDevice() -> IOBluetoothDevice!
Gets the object representing the remote target device in the transfer.
func getTitle() -> String!
Returns the title of the transfer panel.
func isTransferInProgress() -> Bool
Topics
Initializers
Instance Methods
IOBluetooth UI / IOBluetoothObjectPushUIController
Class
IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
macOS 10.2+


## Page 12

Gets state of the transfer
func runModal()
Runs the transfer UI panel in a modal session
func runPanel()
Runs the transfer UI as a panel with no modal session
func setIconImage(NSImage!)
Manually sets the icon used in the panel.
func setTitle(String!)
Sets the title of the panel when not run as a sheet.
func stop()
Stops the transfer UI
NSWindowController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To


## Page 13

class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef
See Also
Classes


## Page 14

Implementation of a window controller to handle pairing with a bluetooth device. This class will
handle connecting to the Bluetooth Daemon for the purposes of searches, and displaying the
results. When necessary this class will display a sheet asking the user for a PIN code. This window
will not return anything to the caller if it is canceled or if pairing occurs.
func addAllowedUUID(IOBluetoothSDPUUID!)
Adds a UUID to the list of UUIDs that are used to validate the user’s selection.
func addAllowedUUIDArray([Any]!)
Adds an array of UUIDs to the list of UUIDs that are used to validate the user’s selection.
func clearAllowedUUIDs()
Resets the controller back to the default state where it will accept any device the user select
Overview
Topics
Instance Methods
IOBluetooth UI / IOBluetoothPairingController
Class
IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other
bluetooth devices.
macOS 10.2+


## Page 15

func getDescriptionText() -> String!
Returns the description text that appears in the device selector panel.
func getOptions() -> IOBluetoothServiceBrowserControllerOptions
Returns the option bits that control the panel’s behavior.
func getPrompt() -> String!
Returns the title of the default/select button in the device selector panel.
func getResults() -> [Any]!
Returns an NSArray of the devices that were paired.
func getSearchAttributes() -> UnsafePointer<IOBluetoothDeviceSearch
Attributes>!
Returns the search attributes that control the panel’s search/inquiry behavior.
func getTitle() -> String!
Returns the title of the device selector panel.
func runModal() -> Int32
Runs the pairing panel in a modal session to allow the user to select a Bluetooth device.
func setDescriptionText(String!)
Sets the description text that appears in the device selector panel.
func setOptions(IOBluetoothServiceBrowserControllerOptions)
Sets the option bits that control the panel’s behavior.
func setPrompt(String!)
Sets the title of the default/select button in the device selector panel.
func setSearchAttributes(UnsafePointer<IOBluetoothDeviceSearchAttribute
>!)
Sets the search attributes that control the panel’s search/inquiry behavior.
func setTitle(String!)
Sets the title of the panel when not run as a sheet.
Relationships


## Page 16

NSWindowController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Sendable
SendableMetatype
class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
Inherits From
Conforms To
See Also
Classes


## Page 17

class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef


## Page 18

Equatable, Hashable
class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
Relationships
Conforms To
See Also
Classes
IOBluetooth UI / IOBluetoothPairingControllerRef
Class
IOBluetoothPairingControllerRef
macOS 10.2+


## Page 19

class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef


## Page 20

var backgroundImageConstraint: NSLayoutConstraint!
var centeredView: NSView!
var isIncomingRequest: Bool
var passkey: String!
var returnHighlightImage: NSImage!
var returnImage: NSImage!
var usePasskeyNotificaitons: Bool
func advancePasskeyIndicator()
func resetPasskeyIndicator()
func retreatPasskeyIndicator()
func setPasskey(String!, for: IOBluetoothDevice!, usingSSP: Bool)
Topics
Instance Properties
Instance Methods
IOBluetooth UI / IOBluetoothPasskeyDisplay
Class
IOBluetoothPasskeyDisplay
macOS 10.2+


## Page 21

class func sharedDisplayView() -> IOBluetoothPasskeyDisplay!
NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
class IOBluetoothAccessibilityIgnoredImageCell
Type Methods
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 22

class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.
class IOBluetoothServiceBrowserControllerRef


## Page 23

This NSWindowController subclass will bring up a generic Bluetooth search and SDP browsing
window allowing the user to find devices within range, perform SDP queries on a particular device
and select a SDP service to connect to. The client application can provide NSArrays of valid servi
UUIDs to allow, and an NSArray of valid device types to allow. The device type filter is not yet
implemented.
init!(IOBluetoothServiceBrowserControllerOptions)
Allocator work Bluetooth Service Browser window controller.
func addAllowedUUID(IOBluetoothSDPUUID!)
Adds a UUID to the list of UUIDs that are used to validate the user’s selection.
Overview
Topics
Initializers
Instance Methods
IOBluetooth UI / IOBluetoothServiceBrowserController
Class
IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform
SDP queries on bluetooth devices within range.
macOS 10.2+


## Page 24

func addAllowedUUIDArray([Any]!)
Adds an array of UUIDs to the list of UUIDs that are used to validate the user’s selection.
func beginSheetModal(for: NSWindow!, modalDelegate: Any!, didEnd:
Selector!, contextInfo: UnsafeMutableRawPointer!) -> IOReturn
Runs the service browser panel as a sheet on the target window.
func clearAllowedUUIDs()
Resets the controller back to the default state where it will accept any device the user select
func getDescriptionText() -> String!
Returns the description text that appears in the device selector panel.
func getOptions() -> IOBluetoothServiceBrowserControllerOptions
Returns the option bits that control the panel’s behavior.
func getPrompt() -> String!
Returns the title of the default/select button in the device selector panel.
func getRef() -> Unmanaged<IOBluetoothServiceBrowserControllerRef>!
Returns an IOBluetoothServiceBrowserControllerRef representation of the target
IOBluetoothServiceBrowserController object.
func getResults() -> [Any]!
Returns the result of the user’s selection.
func getSearchAttributes() -> UnsafePointer<IOBluetoothDeviceSearch
Attributes>!
Returns the search attributes that control the panel’s search/inquiry behavior.
func getTitle() -> String!
Returns the title of the device selector panel.
func runModal() -> Int32
Runs the service browser panel in a modal session to allow the user to select a service on a
Bluetooth device.
func setDescriptionText(String!)
Sets the description text that appears in the device selector panel.
func setOptions(IOBluetoothServiceBrowserControllerOptions)
Modify the options for the window controller.


## Page 25

func setPrompt(String!)
Sets the title of the default/select button in the device selector panel.
func setSearchAttributes(UnsafePointer<IOBluetoothDeviceSearchAttribute
>!)
Sets the search attributes that control the panel’s search/inquiry behavior.
func setTitle(String!)
Sets the title of the panel when not run as a sheet.
class func withServiceBrowserControllerRef(IOBluetoothServiceBrowser
ControllerRef!) -> IOBluetoothServiceBrowserController!
Method call to convert an IOBluetoothServiceBrowserControllerRef into an
IOBluetoothServiceBrowserController *.
NSWindowController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Sendable
SendableMetatype
Type Methods
Relationships
Inherits From
Conforms To


## Page 26

class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserControllerRef
See Also
Classes


## Page 27

Equatable, Hashable
class IOBluetoothAccessibilityIgnoredImageCell
class IOBluetoothAccessibilityIgnoredTextFieldCell
class IOBluetoothDeviceSelectorController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothDeviceSelectorControllerRef
class IOBluetoothObjectPushUIController
An NSWindowController subclass that supports the creation of an
IOBluetoothObjectPushUIController object.
Relationships
Conforms To
See Also
Classes
IOBluetooth UI / IOBluetoothServiceBrowserControllerRef
Class
IOBluetoothServiceBrowserControllerRef
macOS 10.2+


## Page 28

class IOBluetoothPairingController
A NSWindowController subclass to display a window to initiate pairing to other bluetooth
devices.
class IOBluetoothPairingControllerRef
class IOBluetoothPasskeyDisplay
class IOBluetoothServiceBrowserController
A NSWindowController subclass to display a window to search for and perform SDP queries
on bluetooth devices within range.


