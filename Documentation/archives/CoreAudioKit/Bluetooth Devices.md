# Bluetooth Devices.pdf

## Page 1

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
CoreAudioKit / CABTLEMIDIWindowController
Class
CABTLEMIDIWindowController
A window controller that displays nearby Bluetooth-based MIDI peripherals.
macOS 10.11+


## Page 2

class CABTMIDICentralViewController
A view controller that displays nearby Bluetooth-based MIDI peripherals.
class CABTMIDILocalPeripheralViewController
A view controller that advertises an iOS device as a Bluetooth-based MIDI peripheral.
See Also
Bluetooth Devices


## Page 3

To let the user search for nearby MIDI peripherals, create a new CABTMIDICentralView
Controller object and then either present it modally or push it onto a UINavigation
Controller view controller. No other configuration of the object is necessary. Once the user
interface is visible, the iOS device finds nearby peripherals and displays them to the user. If the
user selects a peripheral, it’s automatically paired with this iOS device. The CABTMIDICentral
ViewController object manages its own user interface and is dismissed automatically.
Once connected, the peripheral appears as a MIDI device, just like any other connected MIDI
device. MIDI commands sent to the peripheral are automatically played. For more information, see
Core MIDI.
UITableViewController
Overview
Relationships
Inherits From
Conforms To
CoreAudioKit / CABTMIDICentralViewController
Class
CABTMIDICentralViewController
A view controller that displays nearby Bluetooth-based MIDI peripherals.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
visionOS 1.0+


## Page 4

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIScrollViewDelegate
UIStateRestoring
UITableViewDataSource
UITableViewDelegate
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
class CABTLEMIDIWindowController
A window controller that displays nearby Bluetooth-based MIDI peripherals.
class CABTMIDILocalPeripheralViewController
A view controller that advertises an iOS device as a Bluetooth-based MIDI peripheral.
See Also
Bluetooth Devices


## Page 5

To advertise the iOS device as a Bluetooth MIDI peripheral, create a new CABTMIDILocal
PeripheralViewController object and then either present it modally or push it onto
aUINavigationController view controller. No other configuration of the object is necessary.
Once the user interface is displayed, the iOS device is discoverable by another device looking for
Bluetooth MIDI peripherals, such as an iOS device displaying a CABTMIDICentralView
Controller object. The CABTMIDILocalPeripheralViewController object manages its
own user interface and is dismissed automatically.
Once connected, the peripheral appears as a MIDI device, just like any other connected MIDI
device. MIDI commands sent to the peripheral are automatically played. For more information, see
Core MIDI.
UIViewController
Overview
Relationships
Inherits From
CoreAudioKit / CABTMIDILocalPeripheralViewController
Class
CABTMIDILocalPeripheralViewController
A view controller that advertises an iOS device as a Bluetooth-based MIDI
peripheral.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
visionOS 1.0+


## Page 6

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
class CABTLEMIDIWindowController
A window controller that displays nearby Bluetooth-based MIDI peripherals.
class CABTMIDICentralViewController
A view controller that displays nearby Bluetooth-based MIDI peripherals.
Conforms To
See Also
Bluetooth Devices


