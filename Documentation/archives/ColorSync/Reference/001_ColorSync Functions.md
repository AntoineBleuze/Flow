# 001_ColorSync Functions.pdf

## Page 1

func ColorSyncAPIVersion() -> UInt32
func ColorSyncCreateCodeFragment(CFArray!, CFDictionary!) -> Unmanaged<
CFTypeRef>!
func ColorSyncIterateInstalledProfilesWithOptions(ColorSyncProfile
IterateCallback?, UnsafeMutablePointer<UInt32>?, UnsafeMutableRawPointe
?, CFDictionary?, UnsafeMutablePointer<Unmanaged<CFError>?>?)
func ColorSyncProfileIsHLGBased(ColorSyncProfile!) -> Bool
func ColorSyncProfileIsMatrixBased(ColorSyncProfile!) -> Bool
func ColorSyncProfileIsPQBased(ColorSyncProfile!) -> Bool
func ColorSyncProfileIsWideGamut(ColorSyncProfile!) -> Bool
func ColorSyncTransformGetProfileSequence(ColorSyncTransform!) ->
Unmanaged<CFArray>?
func CGDisplayCreateUUIDFromDisplayID(UInt32) -> Unmanaged<CFUUID>!
func CGDisplayGetDisplayIDFromUUID(CFUUID!) -> UInt32
func ColorSyncCMMCopyCMMIdentifier(ColorSyncCMM!) -> Unmanaged<CFString
>?
Topics
Functions
Additional functions
ColorSync / ColorSync Functions
API Collection
ColorSync Functions


## Page 2

func ColorSyncCMMCopyLocalizedName(ColorSyncCMM!) -> Unmanaged<CFString
>?
func ColorSyncCMMCreate(CFBundle!) -> Unmanaged<ColorSyncCMM>?
func ColorSyncCMMGetBundle(ColorSyncCMM!) -> Unmanaged<CFBundle>?
func ColorSyncCMMGetTypeID() -> CFTypeID
func ColorSyncDeviceCopyDeviceInfo(CFString!, CFUUID!) -> Unmanaged<
CFDictionary>?
func ColorSyncDeviceSetCustomProfiles(CFString!, CFUUID!, CFDictionary!
-> Bool
func ColorSyncIterateDeviceProfiles(ColorSyncDeviceProfileIterate
Callback!, UnsafeMutableRawPointer?)
func ColorSyncIterateInstalledCMMs(ColorSyncCMMIterateCallback!, Unsafe
MutableRawPointer?)
func ColorSyncIterateInstalledProfiles(ColorSyncProfileIterateCallback?
UnsafeMutablePointer<UInt32>?, UnsafeMutableRawPointer?, UnsafeMutable
Pointer<Unmanaged<CFError>?>?)
func ColorSyncProfileContainsTag(ColorSyncProfile!, CFString!) -> Bool
func ColorSyncProfileCopyData(ColorSyncProfile!, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Unmanaged<CFData>!
func ColorSyncProfileCopyDescriptionString(ColorSyncProfile!) ->
Unmanaged<CFString>?
func ColorSyncProfileCopyHeader(ColorSyncProfile!) -> Unmanaged<CFData>
func ColorSyncProfileCopyTag(ColorSyncProfile!, CFString!) -> Unmanaged
CFData>?
func ColorSyncProfileCopyTagSignatures(ColorSyncProfile!) -> Unmanaged<
CFArray>?
func ColorSyncProfileCreate(CFData!, UnsafeMutablePointer<Unmanaged<
CFError>?>?) -> Unmanaged<ColorSyncProfile>?
func ColorSyncProfileCreateDeviceProfile(CFString!, CFUUID!, CFTypeRef!
-> Unmanaged<ColorSyncProfile>?
func ColorSyncProfileCreateDisplayTransferTablesFromVCGT(ColorSync
Profile!, UnsafeMutablePointer<Int>!) -> Unmanaged<CFData>?


## Page 3

func ColorSyncProfileCreateLink(CFArray!, CFDictionary?) -> Unmanaged<
ColorSyncProfile>?
func ColorSyncProfileCreateMutable() -> Unmanaged<ColorSyncMutable
Profile>?
func ColorSyncProfileCreateMutableCopy(ColorSyncProfile!) -> Unmanaged<
ColorSyncMutableProfile>?
func ColorSyncProfileCreateWithDisplayID(UInt32) -> Unmanaged<ColorSync
Profile>?
func ColorSyncProfileCreateWithName(CFString!) -> Unmanaged<ColorSync
Profile>?
func ColorSyncProfileCreateWithURL(CFURL!, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Unmanaged<ColorSyncProfile>?
func ColorSyncProfileEstimateGamma(ColorSyncProfile!, UnsafeMutable
Pointer<Unmanaged<CFError>?>?) -> Float
func ColorSyncProfileEstimateGammaWithDisplayID(Int32, UnsafeMutable
Pointer<Unmanaged<CFError>?>?) -> Float
func ColorSyncProfileGetDisplayTransferFormulaFromVCGT(ColorSyncProfile
!, UnsafeMutablePointer<Float>!, UnsafeMutablePointer<Float>!, Unsafe
MutablePointer<Float>!, UnsafeMutablePointer<Float>!, UnsafeMutable
Pointer<Float>!, UnsafeMutablePointer<Float>!, UnsafeMutablePointer<
Float>!, UnsafeMutablePointer<Float>!, UnsafeMutablePointer<Float>!) ->
Bool
func ColorSyncProfileGetMD5(ColorSyncProfile!) -> ColorSyncMD5
func ColorSyncProfileGetTypeID() -> CFTypeID
func ColorSyncProfileGetURL(ColorSyncProfile!, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Unmanaged<CFURL>!
func ColorSyncProfileInstall(ColorSyncProfile!, CFString!, CFString!,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Bool
func ColorSyncProfileRemoveTag(ColorSyncMutableProfile!, CFString!)
func ColorSyncProfileSetHeader(ColorSyncMutableProfile!, CFData!)
func ColorSyncProfileSetTag(ColorSyncMutableProfile!, CFString!, CFData
!)
func ColorSyncProfileUninstall(ColorSyncProfile!, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Bool


## Page 4

func ColorSyncProfileVerify(ColorSyncProfile!, UnsafeMutablePointer<
Unmanaged<CFError>?>?, UnsafeMutablePointer<Unmanaged<CFError>?>?) ->
Bool
func ColorSyncRegisterDevice(CFString!, CFUUID!, CFDictionary!) -> Bool
func ColorSyncTransformConvert(ColorSyncTransform!, Int, Int, Unsafe
MutableRawPointer!, ColorSyncDataDepth, ColorSyncDataLayout, Int, Unsaf
RawPointer!, ColorSyncDataDepth, ColorSyncDataLayout, Int, CFDictionary
?) -> Bool
func ColorSyncTransformCopyProperty(ColorSyncTransform!, CFTypeRef!,
CFDictionary?) -> Unmanaged<CFTypeRef>?
func ColorSyncTransformCreate(CFArray?, CFDictionary?) -> Unmanaged<
ColorSyncTransform>?
func ColorSyncTransformGetTypeID() -> CFTypeID
func ColorSyncTransformSetProperty(ColorSyncTransform!, CFTypeRef!,
CFTypeRef?)
func ColorSyncUnregisterDevice(CFString!, CFUUID!) -> Bool
ColorSync Constants
See Also
Reference


