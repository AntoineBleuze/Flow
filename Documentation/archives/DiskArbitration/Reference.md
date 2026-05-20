# Reference.pdf

## Page 1

See the Overview section above for header-level documentation.
<CoreFoundation/CoreFoundation.h>
<IOKit/IOKitLib.h>
<DiskArbitration/DASession.h>
func DADiskCopyDescription(DADisk) -> CFDictionary?
Obtains the Disk Arbitration description of the specified disk.
func DADiskCopyIOMedia(DADisk) -> io_service_t
Obtains the I/O Kit media object for the specified disk.
func DADiskCopyWholeDisk(DADisk) -> DADisk?
Obtain the associated whole disk object for the specified disk.
Overview
Overview
Included Headers
Topics
Miscellaneous
Disk Arbitration / DADisk.h
API Collection
DADisk.h


## Page 2

func DADiskCreateFromBSDName(CFAllocator?, DASession, UnsafePointer<
CChar>) -> DADisk?
Creates a new disk object.
func DADiskCreateFromIOMedia(CFAllocator?, DASession, io_service_t) ->
DADisk?
Creates a new disk object.
func DADiskCreateFromVolumePath(CFAllocator?, DASession, CFURL) ->
DADisk?
Creates a new disk object.
func DADiskGetBSDName(DADisk) -> UnsafePointer<CChar>?
Obtains the BSD device name for the specified disk.
func DADiskGetTypeID() -> CFTypeID
Returns the type identifier of all DADisk instances.
class DADisk
Type of a reference to DADisk instances.
DADissenter.h
DASession.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Enumerations
DiskArbitration Constants
DiskArbitration Data Types
Data Types
See Also
Reference


## Page 3

See the Overview section above for header-level documentation.
<mach/error.h>
<CoreFoundation/CoreFoundation.h>
func DADissenterCreate(CFAllocator?, DAReturn, CFString?) -> DADissente
Creates a new dissenter object.
func DADissenterGetStatus(DADissenter) -> DAReturn
Obtains the return code.
func DADissenterGetStatusString(DADissenter) -> CFString?
Obtains the return code string.
Overview
Overview
Included Headers
Topics
Miscellaneous
Data Types
Disk Arbitration / DADissenter.h
API Collection
DADissenter.h


## Page 4

class DADissenter
Type of a reference to DADissenter instances.
DADisk.h
DASession.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Enumerations
DiskArbitration Constants
DiskArbitration Data Types
See Also
Reference


## Page 5

See the Overview section above for header-level documentation.
<CoreFoundation/CoreFoundation.h>
func DASessionCreate(CFAllocator?) -> DASession?
Creates a new session.
func DASessionGetTypeID() -> CFTypeID
Returns the type identifier of all DASession instances.
func DASessionScheduleWithRunLoop(DASession, CFRunLoop, CFString)
Schedules the session on a run loop.
func DASessionSetDispatchQueue(DASession, dispatch_queue_t?)
Schedules the session on a dispatch queue.
func DASessionUnscheduleFromRunLoop(DASession, CFRunLoop, CFString)
Overview
Overview
Included Headers
Topics
Miscellaneous
Disk Arbitration / DASession.h
API Collection
DASession.h


## Page 6

Unschedules the session from a run loop.
See the Overview section above for header-level documentation.
class DASession
Type of a reference to DASession instances.
DADisk.h
DADissenter.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Enumerations
DiskArbitration Constants
DiskArbitration Data Types
Data Types
See Also
Reference


## Page 7

See the Overview section above for header-level documentation.
<CoreFoundation/CoreFoundation.h>
<DiskArbitration/DADisk.h>
<DiskArbitration/DADissenter.h>
<DiskArbitration/DASession.h>
func DADiskClaim(DADisk, DADiskClaimOptions, DADiskClaimReleaseCallback
?, UnsafeMutableRawPointer?, DADiskClaimCallback?, UnsafeMutableRaw
Pointer?)
Claims the specified disk object for exclusive use.
func DADiskEject(DADisk, DADiskEjectOptions, DADiskEjectCallback?,
UnsafeMutableRawPointer?)
Overview
Overview
Included Headers
Topics
Miscellaneous
Disk Arbitration / DiskArbitration.h
API Collection
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.


## Page 8

Ejects the specified disk object.
func DADiskGetOptions(DADisk) -> DADiskOptions
Obtains the options for the specified disk.
func DADiskIsClaimed(DADisk) -> Bool
Reports whether or not the disk is claimed.
func DADiskMount(DADisk, CFURL?, DADiskMountOptions, DADiskMountCallbac
?, UnsafeMutableRawPointer?)
Mounts the volume at the specified disk object.
func DADiskMountWithArguments(DADisk, CFURL?, DADiskMountOptions, DADis
MountCallback?, UnsafeMutableRawPointer?, UnsafeMutablePointer<Unmanage
<CFString>?>?)
Mounts the volume at the specified disk object, with the specified mount options.
func DADiskRename(DADisk, CFString, DADiskRenameOptions, DADiskRename
Callback?, UnsafeMutableRawPointer?)
Renames the volume at the specified disk object.
func DADiskSetOptions(DADisk, DADiskOptions, Bool) -> DAReturn
Sets the options for the specified disk.
func DADiskUnclaim(DADisk)
Unclaims the specified disk object.
func DADiskUnmount(DADisk, DADiskUnmountOptions, DADiskUnmountCallback?
UnsafeMutableRawPointer?)
Unmounts the volume at the specified disk object.
func DARegisterDiskAppearedCallback(DASession, CFDictionary?, DADisk
AppearedCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a disk has appeared.
func DARegisterDiskDescriptionChangedCallback(DASession, CFDictionary?,
CFArray?, DADiskDescriptionChangedCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a disk description has changed.
func DARegisterDiskDisappearedCallback(DASession, CFDictionary?, DADisk
DisappearedCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a disk has disappeared.


## Page 9

func DARegisterDiskEjectApprovalCallback(DASession, CFDictionary?,
DADiskEjectApprovalCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a volume is to be ejected.
func DARegisterDiskMountApprovalCallback(DASession, CFDictionary?,
DADiskMountApprovalCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a volume is to be mounted.
func DARegisterDiskPeekCallback(DASession, CFDictionary?, CFIndex,
DADiskPeekCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a disk has been probed.
func DARegisterDiskUnmountApprovalCallback(DASession, CFDictionary?,
DADiskUnmountApprovalCallback, UnsafeMutableRawPointer?)
Registers a callback function to be called whenever a volume is to be unmounted.
func DAUnregisterCallback(DASession, UnsafeMutableRawPointer, Unsafe
MutableRawPointer?)
Unregisters a registered callback function.
See the Overview section above for header-level documentation.
typealias DADiskAppearedCallback
Type of the callback function used by DARegisterDiskAppearedCallback().
typealias DADiskClaimCallback
Type of the callback function used by DADiskClaim().
typealias DADiskClaimReleaseCallback
Type of the callback function used by DADiskClaim().
typealias DADiskDescriptionChangedCallback
Type of the callback function used by DARegisterDiskDescriptionChangedCallback().
typealias DADiskDisappearedCallback
Type of the callback function used by DARegisterDiskDisappearedCallback().
typealias DADiskEjectApprovalCallback
Type of the callback function used by DARegisterDiskEjectApprovalCallback().
typealias DADiskEjectCallback
Callbacks


## Page 10

Type of the callback function used by DADiskEject().
typealias DADiskMountApprovalCallback
Type of the callback function used by DARegisterDiskMountApprovalCallback().
typealias DADiskMountCallback
Type of the callback function used by DADiskMount().
typealias DADiskPeekCallback
Type of the callback function used by DARegisterDiskPeekCallback().
typealias DADiskRenameCallback
Type of the callback function used by DADiskRename().
typealias DADiskUnmountApprovalCallback
Type of the callback function used by DARegisterDiskUnmountApprovalCallback().
typealias DADiskUnmountCallback
Type of the callback function used by DADiskUnmount().
Global Variables
DADiskClaimOptions
Options for DADiskClaim().
DADiskEjectOptions
Options for DADiskEject().
typealias DADiskMountOptions
Options for DADiskMount().
typealias DADiskRenameOptions
Options for DADiskRename().
typealias DADiskUnmountOptions
Options for DADiskUnmount().
Constants
See Also


## Page 11

DADisk.h
DADissenter.h
DASession.h
DiskArbitration Enumerations
DiskArbitration Constants
DiskArbitration Data Types
Reference


## Page 12

Anonymous
Anonymous
Anonymous
DADisk.h
DADissenter.h
DASession.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Constants
DiskArbitration Data Types
Topics
Enumerations
See Also
Reference
Disk Arbitration / DiskArbitration Enumerations
DiskArbitration Enumerations


## Page 13

let kDADiskDescriptionBusNameKey: CFString
let kDADiskDescriptionBusPathKey: CFString
let kDADiskDescriptionDeviceGUIDKey: CFString
let kDADiskDescriptionDeviceInternalKey: CFString
let kDADiskDescriptionDeviceModelKey: CFString
let kDADiskDescriptionDevicePathKey: CFString
let kDADiskDescriptionDeviceProtocolKey: CFString
let kDADiskDescriptionDeviceRevisionKey: CFString
let kDADiskDescriptionDeviceUnitKey: CFString
let kDADiskDescriptionDeviceVendorKey: CFString
let kDADiskDescriptionMediaBSDMajorKey: CFString
let kDADiskDescriptionMediaBSDMinorKey: CFString
let kDADiskDescriptionMediaBSDNameKey: CFString
let kDADiskDescriptionMediaBSDUnitKey: CFString
let kDADiskDescriptionMediaBlockSizeKey: CFString
let kDADiskDescriptionMediaContentKey: CFString
let kDADiskDescriptionMediaEjectableKey: CFString
Topics
Constants
Disk Arbitration / DiskArbitration Constants
API Collection
DiskArbitration Constants


## Page 14

let kDADiskDescriptionMediaIconKey: CFString
let kDADiskDescriptionMediaKindKey: CFString
let kDADiskDescriptionMediaLeafKey: CFString
let kDADiskDescriptionMediaNameKey: CFString
let kDADiskDescriptionMediaPathKey: CFString
let kDADiskDescriptionMediaRemovableKey: CFString
let kDADiskDescriptionMediaSizeKey: CFString
let kDADiskDescriptionMediaTypeKey: CFString
let kDADiskDescriptionMediaUUIDKey: CFString
let kDADiskDescriptionMediaWholeKey: CFString
let kDADiskDescriptionMediaWritableKey: CFString
let kDADiskDescriptionVolumeKindKey: CFString
let kDADiskDescriptionVolumeMountableKey: CFString
let kDADiskDescriptionVolumeNameKey: CFString
let kDADiskDescriptionVolumeNetworkKey: CFString
let kDADiskDescriptionVolumePathKey: CFString
let kDADiskDescriptionVolumeTypeKey: CFString
let kDADiskDescriptionVolumeUUIDKey: CFString
let kDADiskDescriptionDeviceTDMLockedKey: CFString
let kDADiskDescriptionMediaEncryptedKey: CFString
let kDADiskDescriptionMediaEncryptionDetailKey: CFString
DADisk.h
DADissenter.h
See Also
Reference


## Page 15

DASession.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Enumerations
DiskArbitration Data Types


## Page 16

typealias DADiskClaimOptions
Options for DADiskClaim().
typealias DADiskEjectOptions
Options for DADiskEject().
typealias DADiskMountOptions
Options for DADiskMount().
typealias DADiskOptions
Options for DADiskGetOptions() and DADiskSetOptions().
typealias DADiskRenameOptions
Options for DADiskRename().
typealias DADiskUnmountOptions
Options for DADiskUnmount().
typealias DAReturn
A return code.
Topics
Data Types
See Also
Disk Arbitration / DiskArbitration Data Types
API Collection
DiskArbitration Data Types


## Page 17

DADisk.h
DADissenter.h
DASession.h
DiskArbitration.h
Register for mount/unmount notifications, and block mount/unmount events.
DiskArbitration Enumerations
DiskArbitration Constants
Reference


