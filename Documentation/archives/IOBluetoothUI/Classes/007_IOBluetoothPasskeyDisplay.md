# 007_IOBluetoothPasskeyDisplay.pdf

## Page 1

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


## Page 2

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


## Page 3

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


