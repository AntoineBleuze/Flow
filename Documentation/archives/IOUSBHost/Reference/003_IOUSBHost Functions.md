# 003_IOUSBHost Functions.pdf

## Page 1

func IOUSBGetEndpointBurstSize(UInt32, UnsafePointer<IOUSBEndpoint
Descriptor>!, UnsafePointer<IOUSBSuperSpeedEndpointCompanionDescriptor
>!, UnsafePointer<IOUSBSuperSpeedPlusIsochronousEndpointCompanion
Descriptor>!) -> UInt32
func IOUSBGetEndpointMult(UInt32, UnsafePointer<IOUSBEndpointDescriptor
>!, UnsafePointer<IOUSBSuperSpeedEndpointCompanionDescriptor>!, Unsafe
Pointer<IOUSBSuperSpeedPlusIsochronousEndpointCompanionDescriptor>!) ->
UInt8
func IOUSBGetEndpointSynchronizationType(UnsafePointer<IOUSBEndpoint
Descriptor>!) -> UInt8
func IOUSBGetEndpointUsageType(UnsafePointer<IOUSBEndpointDescriptor>!)
-> UInt8
func IOUSBGetPlatformCapabilityDescriptor(UnsafePointer<
IOUSBBOSDescriptor>!) -> UnsafePointer<IOUSBPlatformCapabilityDescripto
>!
func IOUSBGetPlatformCapabilityDescriptorWithUUID(UnsafePointer<
IOUSBBOSDescriptor>!, UnsafeMutablePointer<UInt8>!) -> UnsafePointer<
IOUSBPlatformCapabilityDescriptor>!
func IOUSBGetSuperSpeedPlusDeviceCapabilityDescriptor(UnsafePointer<
IOUSBBOSDescriptor>!) -> UnsafePointer<IOUSBDeviceCapabilitySuperSpeed
PlusUSB>!
func IOUSBHostCIControllerStateToString(IOUSBHostCIControllerState) ->
UnsafePointer<CChar>!
Topics
Functions
IOUSBHost / IOUSBHost Functions
API Collection
IOUSBHost Functions


## Page 2

func IOUSBHostCIDeviceSpeedToString(IOUSBHostCIDeviceSpeed) -> Unsafe
Pointer<CChar>!
func IOUSBHostCIDeviceStateToString(IOUSBHostCIDeviceState) -> Unsafe
Pointer<CChar>!
func IOUSBHostCIEndpointStateToString(IOUSBHostCIEndpointState) ->
UnsafePointer<CChar>!
func IOUSBHostCIExceptionTypeToString(IOUSBHostCIExceptionType) ->
UnsafePointer<CChar>!
func IOUSBHostCILinkStateEnabled(IOUSBHostCILinkState) -> Bool
func IOUSBHostCILinkStateToString(IOUSBHostCILinkState) -> UnsafePointe
<CChar>!
func IOUSBHostCIMessageStatusFromIOReturn(IOReturn) -> IOUSBHost
CIMessageStatus
func IOUSBHostCIMessageStatusToIOReturn(IOUSBHostCIMessageStatus) ->
IOReturn
func IOUSBHostCIMessageStatusToString(IOUSBHostCIMessageStatus) ->
UnsafePointer<CChar>!
func IOUSBHostCIMessageTypeToString(IOUSBHostCIMessageType) -> Unsafe
Pointer<CChar>!
func IOUSBHostCIPortStateToString(IOUSBHostCIPortState) -> UnsafePointe
<CChar>!
IOUSBHost Structures
IOUSBHost Enumerations
IOUSBHost Constants
IOUSBHost Data Types
See Also
Reference


