# 002_IOBluetoothUtilities_h.pdf

## Page 1

<stdio.h>
<stdlib.h>
<string.h>
<sysexits.h>
<sys/errno.h>
<unistd.h>
<IOBluetooth/Bluetooth.h>
<IOKit/IOReturn.h>
<IOBluetooth/IOBluetoothUserLib.h>
func IOBluetoothFindNumberOfRegistryEntriesOfClassName(UnsafePointer<
CChar>!) -> Int
The number of registry entries with a device classname.
func IOBluetoothGetUniqueFileNameAndPath(String!, String!) -> String!
func IOBluetoothIsFileAppleDesignatedPIMData(String!) -> Bool
Included Headers
Topics
Miscellaneous
IOBluetooth / IOBluetoothUtilities.h
API Collection
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.


## Page 2

Apple designated PIM data is classified as: .vcard, .vcal, .vcf, .vnote, .vmsg, .vcs
func IOBluetoothNSStringFromDeviceAddress(UnsafePointer<BluetoothDevice
Address>!) -> String!
Convenience routine to take a device address structure and create an NSString.
func IOBluetoothNSStringToDeviceAddress(String!, UnsafeMutablePointer<
BluetoothDeviceAddress>!) -> IOReturn
Convenience routine to take an NSString and turn it into a BluetoothDeviceAddress structure
func IOBluetoothNumberOfAvailableHIDDevices() -> Int
Returns total number of HID devices on the system (Bluetooth + USB)
func IOBluetoothNumberOfKeyboardHIDDevices() -> Int
Returns number of keyboard HID devices on the system (Bluetooth + USB)
func IOBluetoothNumberOfPointingHIDDevices() -> Int
Returns number of “pointing” HID devices on the system (Bluetooth + USB)
func IOBluetoothNumberOfTabletHIDDevices() -> Int
Returns number of “Tablet” HID devices on the system (Bluetooth + USB)
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
See Also
Reference


## Page 3

IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


