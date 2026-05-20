# 001_IOBluetoothUserLib_h.pdf

## Page 1

There is an accompanying header to this, “Bluetooth.h”, which contains all technology-specific
typedefs and information. This header relies heavily on it.
<IOKit/IOKitLib.h>
<CoreFoundation/CFMachPort.h>
<IOBluetooth/Bluetooth.h>
<Foundation/Foundation.h>
func IOBluetoothIgnoreHIDDevice(IOBluetoothDeviceRef!)
Hints that the macOS Bluetooth software should ignore a HID device that connects up.
func IOBluetoothL2CAPChannelRegisterForChannelCloseNotification(
IOBluetoothL2CAPChannelRef!, IOBluetoothUserNotificationCallback!,
UnsafeMutableRawPointer!) -> Unmanaged<IOBluetoothUserNotificationRef>!
Allows a client to register for a channel close notification.
Overview
Included Headers
Topics
Miscellaneous
IOBluetooth / IOBluetoothUserLib.h
API Collection
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.


## Page 2

func IOBluetoothRemoveIgnoredHIDDevice(IOBluetoothDeviceRef!)
The counterpart to the above IOBluetoothIgnoreHIDDevice() API.
func IOBluetoothUserNotificationUnregister(IOBluetoothUserNotification
Ref!)
Unregisters the target notification.
See the Overview for header-level documentation.
typealias IOBluetoothUserNotificationCallback
Callback function definition for user notifications.
See the Overview for header-level documentation.
typealias IOBluetoothDeviceSearchOptions
struct IOBluetoothDeviceSearchAttributes
Structure used to search for particular devices.
struct IOBluetoothDeviceSearchDeviceAttributes
Structure used to search for particular devices.
See the Overview for header-level documentation.
struct IOBluetoothDeviceSearchDeviceAttributes
Structure used to search for particular devices.
struct IOBluetoothDeviceSearchTypesBits
Bits to determine what Bluetooth devices to search for
Callbacks
Data Types
Constants
See Also
Reference


## Page 3

Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


