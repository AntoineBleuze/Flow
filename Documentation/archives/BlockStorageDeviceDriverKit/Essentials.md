# Essentials.pdf

## Page 1

Type
Boolean
Add this entitlement to every BlockStorageDeviceDriverKit driver you create. You must request th
entitlement from Apple. For information about how to request the entitlement, see System
Extensions and DriverKit.
DriverKit Audio Family
A Boolean value that indicates whether the device supports audio functionality.
Key: com.apple.developer.driverkit.family.audio
com.apple.developer.driverkit.family.midi
A Boolean value that indicates whether to match the driver against devices that support MID
Details
Discussion
See Also
DriverKit family entitlements
Bundle Resources / Entitlements / com.apple.developer.driverkit.family.block-storage-device
Property List Key
com.apple.developer.driverkit.family
.block-storage-device
A Boolean value that indicates whether to match the driver against block storage
devices that use custom drivers.
macOS 12.0+


## Page 2

com.apple.developer.driverkit.family.networking
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


