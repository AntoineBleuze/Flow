# 002_DriverKit Audio Family.pdf

## Page 1

Key
com.apple.developer.driverkit.family.audio
Type
Boolean
Add this entitlement to the default entitlements file that Xcode creates for your driver project.
com.apple.developer.driverkit.family.block-storage-device
A Boolean value that indicates whether to match the driver against block storage devices tha
use custom drivers.
com.apple.developer.driverkit.family.midi
A Boolean value that indicates whether to match the driver against devices that support MID
com.apple.developer.driverkit.family.networking
Details
Discussion
See Also
DriverKit family entitlements
Bundle Resources / Entitlements / DriverKit Audio Family
Property List Key
DriverKit Audio Family
A Boolean value that indicates whether the device supports audio functionality.
iOS 16.0+
iPadOS 16.0+
macOS 12.0+


## Page 2

A Boolean value that indicates whether to match the driver against devices that communicat
using networking protocols.
com.apple.developer.driverkit.family.scsicontroller
A Boolean value that indicates whether to match the driver against devices with SCSI
controllers.
com.apple.developer.driverkit.family.serial
A Boolean value that indicates whether to match the driver against devices with serial
communication interfaces.
com.apple.developer.driverkit.transport.pci
An array of PCI device descriptors that your custom driver supports.
com.apple.developer.driverkit.transport.usb
An array of dictionaries that identify the USB devices the driver supports.


