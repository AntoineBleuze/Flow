# 003_DiskArbitration_h.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

DADisk.h
DADissenter.h
DASession.h
DiskArbitration Enumerations
DiskArbitration Constants
DiskArbitration Data Types
Reference


