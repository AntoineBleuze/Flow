# 004_IOBluetoothObjectPushUIController.pdf

## Page 1

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


## Page 2

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


## Page 3

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


