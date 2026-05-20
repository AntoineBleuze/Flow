# Reference.pdf

## Page 1

<IOKit/bluetooth/BluetoothAssignedNumbers.h>
<CoreFoundation/CFBase.h>
<IOBluetooth/BluetoothAssignedNumbers.h>
<IOKit/IOTypes.h>
<libkern/OSByteOrder.h>
See the Overview section above for header-level documentation.
BluetoothHCIUSBDeviceMatchingConstants
Bluetooth USB device matching constants
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
Included Headers
Topics
Constants
See Also
Reference
IOBluetooth / Bluetooth.h User-Space
Bluetooth.h User-Space
Bluetooth wireless technology


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 9

Contains generic OBEX constants, structs, and C API used for all OBEX communication over any
transport. For specific transport API, see that transport’s C API. For example, if you wanted to kno
more about the Bluetooth OBEX implementation, see OBEXBluetooth.h.
The file also contains API that will assist in the construction and deconstruction of OBEX headers 
and from raw bytes, as well as the creation of vCards and vEvents.
<stdio.h>
<stdint.h>
<CoreServices/CoreServices.h>
<IOBluetooth/IOBluetoothUserLib.h>
func OBEXAddApplicationParameterHeader(UnsafeRawPointer!, UInt32,
CFMutableDictionary!) -> OBEXError
Add bytes representing an application parameter to a dictionary of OBEX headers.
Overview
Included Headers
Topics
Miscellaneous
IOBluetooth / OBEX.h
API Collection
OBEX.h
Public OBEX technology interfaces.


## Page 10

func OBEXAddAuthorizationChallengeHeader(UnsafeRawPointer!, UInt32,
CFMutableDictionary!) -> OBEXError
Add an authorization challenge header to a dictionary of OBEXheaders.
func OBEXAddAuthorizationResponseHeader(UnsafeRawPointer!, UInt32,
CFMutableDictionary!) -> OBEXError
Add an authorization Response header to a dictionary of OBEXheaders.
func OBEXAddBodyHeader(UnsafeRawPointer!, UInt32, Bool, CFMutable
Dictionary!) -> OBEXError
Add bytes of data to a dictionary of OBEXheaders.
func OBEXAddByteSequenceHeader(UnsafeRawPointer!, UInt32, CFMutable
Dictionary!) -> OBEXError
Add a byte sequence header to a dictionary of OBEXheaders.
func OBEXAddConnectionIDHeader(UnsafeRawPointer!, UInt32, CFMutable
Dictionary!) -> OBEXError
Add bytes representing a connection ID to a dictionary of OBEX headers.
func OBEXAddCountHeader(UInt32, CFMutableDictionary!) -> OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddDescriptionHeader(CFString!, CFMutableDictionary!) ->
OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddHTTPHeader(UnsafeRawPointer!, UInt32, CFMutableDictionary!)
-> OBEXError
Add bytes of data to a dictionary of OBEXheaders.
func OBEXAddLengthHeader(UInt32, CFMutableDictionary!) -> OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddNameHeader(CFString!, CFMutableDictionary!) -> OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddObjectClassHeader(UnsafeRawPointer!, UInt32, CFMutable
Dictionary!) -> OBEXError
Add an object class header to a dictionary of OBEXheaders.
func OBEXAddTargetHeader(UnsafeRawPointer!, UInt32, CFMutableDictionary
!) -> OBEXError


## Page 11

Add bytes of data to a dictionary of OBEXheaders.
func OBEXAddTime4ByteHeader(UInt32, CFMutableDictionary!) -> OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddTimeISOHeader(UnsafeRawPointer!, UInt32, CFMutableDictionar
!) -> OBEXError
Add bytes to a dictionary of OBEXheaders.
func OBEXAddTypeHeader(CFString!, CFMutableDictionary!) -> OBEXError
Add a CFStringRef to a dictionary of OBEXheaders.
func OBEXAddUserDefinedHeader(UnsafeRawPointer!, UInt32, CFMutable
Dictionary!) -> OBEXError
Add a user-defined custom header to a dictionary of OBEXheaders.
func OBEXAddWhoHeader(UnsafeRawPointer!, UInt32, CFMutableDictionary!) 
> OBEXError
Add bytes of data to a dictionary of OBEXheaders.
func OBEXGetHeaders(UnsafeRawPointer!, Int) -> CFDictionary!
Take a data blob and looks for OBEX headers.
func OBEXHeadersToBytes(CFDictionary!) -> Unmanaged<CFMutableData>!
Converts a dictionary of headers to a data pointer, from which you can extract as bytes and
pass to the OBEX command/response functions.
See the Overview for header-level documentation.
struct OBEXSessionEvent
struct OBEXAbortCommandData
Part of the OBEXSessionEvent structure.
struct OBEXAbortCommandResponseData
Part of the OBEXSessionEvent structure.
struct OBEXConnectCommandData
Part of the OBEXSessionEvent structure.
struct OBEXConnectCommandResponseData
Part of the OBEXSessionEvent structure.
Data Types


## Page 12

struct OBEXDisconnectCommandData
Part of the OBEXSessionEvent structure.
struct OBEXDisconnectCommandResponseData
Part of the OBEXSessionEvent structure.
struct OBEXErrorData
Part of the OBEXSessionEvent structure.
struct OBEXGetCommandData
Part of the OBEXSessionEvent structure.
struct OBEXGetCommandResponseData
Part of the OBEXSessionEvent structure.
struct OBEXPutCommandData
Part of the OBEXSessionEvent structure.
struct OBEXPutCommandResponseData
Part of the OBEXSessionEvent structure.
struct OBEXSetPathCommandData
Part of the OBEXSessionEvent structure.
struct OBEXSetPathCommandResponseData
Part of the OBEXSessionEvent structure.
See the Overview for header-level documentation.
struct OBEXConnectFlagValues
Flags for Connect command.
typealias OBEXError
Codes for OBEX errors. If the return value was not in the following range, then it is most likely
resulting from kernel code/IOKit, and you should consult IOReturn.h for those codes.
struct OBEXHeaderIdentifiers
Identifiers for OBEX Headers.
struct OBEXNonceFlagValues
Flags for Nonce command during digest challenge.
Constants


## Page 13

struct OBEXOpCodeCommandValues
Operation OpCode values for commands.
struct OBEXOpCodeResponseValues
Response opCode values.
struct OBEXOpCodeSessionValues
Operation OpCode values for sessions. From the OBEX 1.3 specification.
struct OBEXPutFlagValues
struct OBEXRealmValues
Values for Realm during digest response.
struct OBEXSessionEventTypes
Type identifiers for OBEX sessions.
struct OBEXSessionParameterTags
Tags for SessionParameters.
struct OBEXVersions
The available/supported OBEX versions.
OBEX Convenience Macros
Convenience Macros for working with OBEX Header Identifiers.
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
Macros
See Also
Reference


## Page 14

OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 15

See the Overview section above for header-level documentation.
<IOBluetooth/OBEX.h>
<IOBluetooth/IOBluetoothUserLib.h>
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Overview
Overview
Included Headers
See Also
Reference
IOBluetooth / OBEXBluetooth.h
API Collection
OBEXBluetooth.h
Object Exchange over Bluetooth.


## Page 16

Public OBEX technology interfaces.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 17

<Foundation/Foundation.h>
<IOBluetooth/OBEX.h>
<IOBluetooth/objc/IOBluetoothOBEXSession.h>
See the Overview section above for header-level documentation.
Global Variables
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
Included Headers
Topics
Constants
See Also
Reference
IOBluetooth / OBEXFileTransferServices.h
OBEXFileTransferServices.h


## Page 18

OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 19

struct BluetoothAFHHostChannelClassification
struct BluetoothAFHResults
struct BluetoothAMPCommandRejectReason
struct BluetoothAMPCreatePhysicalLinkResponseStatus
struct BluetoothAMPDisconnectPhysicalLinkResponseStatus
struct BluetoothAMPDiscoverResponseControllerStatus
struct BluetoothAMPGetAssocResponseStatus
struct BluetoothAMPGetInfoResponseStatus
struct BluetoothAMPManagerCode
struct BluetoothAuthenticationRequirementsValues
struct BluetoothCompanyIdentifers
struct BluetoothDeviceAddress
struct BluetoothEnhancedSynchronousConnectionInfo
struct BluetoothEventFilterCondition
struct BluetoothFeatureBits
struct BluetoothHCIAFHChannelAssessmentModes
struct BluetoothHCIAcceptSynchronousConnectionRequestParams
Topics
Structures
IOBluetooth / IOBluetooth Structures
API Collection
IOBluetooth Structures


## Page 20

struct BluetoothHCIAuthentionEnableModes
struct BluetoothHCIAutomaticFlushTimeoutInfo
struct BluetoothHCIBufferSize
struct BluetoothHCIConnectionModes
struct BluetoothHCICurrentInquiryAccessCodes
struct BluetoothHCICurrentInquiryAccessCodesForWrite
struct BluetoothHCIDeleteStoredLinkKeyFlags
struct BluetoothHCIEncryptionModes
struct BluetoothHCIEnhancedAcceptSynchronousConnectionRequestParams
struct BluetoothHCIEnhancedSetupSynchronousConnectionParams
struct BluetoothHCIEventAuthenticationCompleteResults
struct BluetoothHCIEventChangeConnectionLinkKeyCompleteResults
struct BluetoothHCIEventConnectionCompleteResults
struct BluetoothHCIEventConnectionPacketTypeResults
struct BluetoothHCIEventConnectionRequestResults
struct BluetoothHCIEventDataBufferOverflowResults
struct BluetoothHCIEventDisconnectionCompleteResults
struct BluetoothHCIEventEncryptionChangeResults
struct BluetoothHCIEventEncryptionKeyRefreshCompleteResults
struct BluetoothHCIEventFlowSpecificationData
struct BluetoothHCIEventFlushOccurredResults
struct BluetoothHCIEventHardwareErrorResults
struct BluetoothHCIEventLEConnectionCompleteResults
struct BluetoothHCIEventLEConnectionUpdateCompleteResults
struct BluetoothHCIEventLELongTermKeyRequestResults
struct BluetoothHCIEventLEMetaResults
struct BluetoothHCIEventLEReadRemoteUsedFeaturesCompleteResults
struct BluetoothHCIEventLinkKeyNotificationResults


## Page 21

struct BluetoothHCIEventMasterLinkKeyCompleteResults
struct BluetoothHCIEventMaxSlotsChangeResults
struct BluetoothHCIEventModeChangeResults
struct BluetoothHCIEventPageScanModeChangeResults
struct BluetoothHCIEventPageScanRepetitionModeChangeResults
struct BluetoothHCIEventQoSSetupCompleteResults
struct BluetoothHCIEventQoSViolationResults
struct BluetoothHCIEventReadClockOffsetResults
struct BluetoothHCIEventReadExtendedFeaturesResults
struct BluetoothHCIEventReadRemoteExtendedFeaturesResults
struct BluetoothHCIEventReadRemoteSupportedFeaturesResults
struct BluetoothHCIEventReadRemoteVersionInfoResults
struct BluetoothHCIEventReadSupportedFeaturesResults
struct BluetoothHCIEventRemoteNameRequestResults
struct BluetoothHCIEventReturnLinkKeysResults
struct BluetoothHCIEventRoleChangeResults
struct BluetoothHCIEventSimplePairingCompleteResults
struct BluetoothHCIEventSniffSubratingResults
struct BluetoothHCIEventSynchronousConnectionChangedResults
struct BluetoothHCIEventSynchronousConnectionCompleteResults
struct BluetoothHCIEventVendorSpecificResults
struct BluetoothHCIExtendedFeaturesInfo
struct BluetoothHCIExtendedInquiryResponse
struct BluetoothHCIExtendedInquiryResponseDataTypes
struct BluetoothHCIExtendedInquiryResult
struct BluetoothHCIFECRequiredValues
struct BluetoothHCIFailedContactInfo
struct BluetoothHCIGeneralFlowControlStates


## Page 22

struct BluetoothHCIHoldModeActivityStates
struct BluetoothHCIInquiryAccessCode
struct BluetoothHCIInquiryModes
struct BluetoothHCIInquiryResult
struct BluetoothHCIInquiryResults
struct BluetoothHCIInquiryScanTypes
struct BluetoothHCIInquiryWithRSSIResult
struct BluetoothHCIInquiryWithRSSIResults
struct BluetoothHCILEBufferSize
struct BluetoothHCILinkPolicySettingsInfo
struct BluetoothHCILinkPolicySettingsValues
struct BluetoothHCILinkQualityInfo
struct BluetoothHCILinkSupervisionTimeout
struct BluetoothHCIPageScanEnableStates
struct BluetoothHCIPageScanModes
struct BluetoothHCIPageScanPeriodModes
struct BluetoothHCIPageScanTypes
struct BluetoothHCIPowerState
struct BluetoothHCIQualityOfServiceSetupParams
struct BluetoothHCIRSSIInfo
struct BluetoothHCIReadExtendedInquiryResponseResults
struct BluetoothHCIReadLMPHandleResults
struct BluetoothHCIReadLocalOOBDataResults
struct BluetoothHCIReadStoredLinkKeysFlags
struct BluetoothHCIRequestCallbackInfo
struct BluetoothHCIRetransmissionEffortTypes
struct BluetoothHCIRoleInfo
struct BluetoothHCIRoles


## Page 23

struct BluetoothHCISCOFlowControlStates
struct BluetoothHCIScanActivity
struct BluetoothHCISetupSynchronousConnectionParams
struct BluetoothHCISimplePairingModes
struct BluetoothHCISimplePairingOOBData
struct BluetoothHCIStoredLinkKeysInfo
struct BluetoothHCISupportedCommands
struct BluetoothHCISupportedFeatures
struct BluetoothHCITimeoutValues
struct BluetoothHCITransmitPowerLevelInfo
struct BluetoothHCITransmitReadPowerLevelTypes
struct BluetoothHCIVersionInfo
struct BluetoothHCIVersions
struct BluetoothIOCapabilities
struct BluetoothIOCapabilityResponse
struct BluetoothIRK
struct BluetoothKey
struct BluetoothKeypressNotification
struct BluetoothKeypressNotificationTypes
struct BluetoothL2CAPCommandCode
struct BluetoothL2CAPCommandRejectReason
struct BluetoothL2CAPConfigurationOption
struct BluetoothL2CAPConfigurationResult
struct BluetoothL2CAPConfigurationRetransmissionAndFlowControlFlags
struct BluetoothL2CAPConnectionResult
struct BluetoothL2CAPConnectionStatus
struct BluetoothL2CAPInformationExtendedFeaturesMask
struct BluetoothL2CAPInformationResult


## Page 24

struct BluetoothL2CAPInformationType
struct BluetoothL2CAPQoSType
struct BluetoothL2CAPQualityOfServiceOptions
struct BluetoothL2CAPRetransmissionAndFlowControlOptions
struct BluetoothL2CAPSegmentationAndReassembly
struct BluetoothL2CAPSupervisoryFuctionType
struct BluetoothLEAddressType
struct BluetoothLEAdvertisingType
struct BluetoothLEConnectionInterval
struct BluetoothLEFeatureBits
struct BluetoothLEScan
struct BluetoothLEScanDuplicateFilter
struct BluetoothLEScanFilter
struct BluetoothLEScanType
struct BluetoothLESecurityManagerCommandCode
struct BluetoothLESecurityManagerIOCapability
struct BluetoothLESecurityManagerKeyDistributionFormat
struct BluetoothLESecurityManagerKeypressNotificationType
struct BluetoothLESecurityManagerOOBData
struct BluetoothLESecurityManagerPairingFailedReasonCode
struct BluetoothLESecurityManagerUserInputCapability
struct BluetoothLESecurityManagerUserOutputCapability
struct BluetoothLMPVersions
struct BluetoothLinkTypes
struct BluetoothOOBDataPresenceValues
struct BluetoothPINCode
struct BluetoothRFCOMMLineStatus
struct BluetoothRFCOMMParityType


## Page 25

struct BluetoothReadClockInfo
struct BluetoothRemoteHostSupportedFeaturesNotification
struct BluetoothSetEventMask
struct BluetoothSimplePairingDebugModes
struct BluetoothSynchronousConnectionInfo
struct BluetoothTransportInfo
struct BluetoothTransportTypes
struct BluetoothUserConfirmationRequest
struct BluetoothUserPasskeyNotification
struct FTSFileType
struct IOBluetoothDeviceSearchAttributes
Structure used to search for particular devices.
struct IOBluetoothDeviceSearchOptionsBits
struct IOBluetoothDeviceSearchTypesBits
Bits to determine what Bluetooth devices to search for
struct IOBluetoothL2CAPChannelDataBlock
struct IOBluetoothL2CAPChannelEvent
struct IOBluetoothL2CAPChannelEventType
struct IOBluetoothUserNotificationChannelDirection
struct OBEXConnectFlagValues
Flags for Connect command.
struct OBEXErrorCodes
struct OBEXHeaderIdentifiers
Identifiers for OBEX Headers.
struct OBEXNonceFlagValues
Flags for Nonce command during digest challenge.
struct OBEXOpCodeCommandValues
Operation OpCode values for commands.


## Page 26

struct OBEXOpCodeResponseValues
Response opCode values.
struct OBEXOpCodeSessionValues
Operation OpCode values for sessions. From the OBEX 1.3 specification.
struct OBEXPutFlagValues
struct OBEXRealmValues
Values for Realm during digest response.
struct OBEXSessionEventTypes
Type identifiers for OBEX sessions.
struct OBEXSessionParameterTags
Tags for SessionParameters.
struct OBEXTransportEvent
struct OBEXTransportEventTypes
struct OBEXVersions
The available/supported OBEX versions.
struct ProtocolParameters
struct SDPAttributeDeviceIdentificationRecord
struct SDPAttributeIdentifierCodes
struct SDPServiceClasses
struct BluetoothHCIEncryptionKeySizeInfo
struct BluetoothHCIEventLEEnhancedConnectionCompleteResults
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
See Also
Reference


## Page 27

Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 28

struct BluetoothAMPCommandRejectReason
struct BluetoothAMPCreatePhysicalLinkResponseStatus
struct BluetoothAMPDisconnectPhysicalLinkResponseStatus
struct BluetoothAMPDiscoverResponseControllerStatus
struct BluetoothAMPGetAssocResponseStatus
struct BluetoothAMPGetInfoResponseStatus
struct BluetoothAMPManagerCode
struct BluetoothHCIPowerState
struct BluetoothL2CAPCommandCode
struct BluetoothL2CAPCommandRejectReason
struct BluetoothL2CAPConfigurationOption
struct BluetoothL2CAPConfigurationResult
struct BluetoothL2CAPConfigurationRetransmissionAndFlowControlFlags
struct BluetoothL2CAPConnectionResult
struct BluetoothL2CAPConnectionStatus
struct BluetoothL2CAPInformationExtendedFeaturesMask
struct BluetoothL2CAPInformationResult
Topics
Enumerations
IOBluetooth / IOBluetooth Enumerations
API Collection
IOBluetooth Enumerations


## Page 29

struct BluetoothL2CAPInformationType
struct BluetoothL2CAPQoSType
struct BluetoothL2CAPSegmentationAndReassembly
struct BluetoothL2CAPSupervisoryFuctionType
struct BluetoothLEAddressType
struct BluetoothLEAdvertisingType
struct BluetoothLEConnectionInterval
struct BluetoothLEScan
struct BluetoothLEScanDuplicateFilter
struct BluetoothLEScanFilter
struct BluetoothLEScanType
struct BluetoothLESecurityManagerCommandCode
struct BluetoothLESecurityManagerIOCapability
struct BluetoothLESecurityManagerKeypressNotificationType
struct BluetoothLESecurityManagerOOBData
struct BluetoothLESecurityManagerPairingFailedReasonCode
struct BluetoothLESecurityManagerUserInputCapability
struct BluetoothLESecurityManagerUserOutputCapability
struct BluetoothRFCOMMLineStatus
struct BluetoothRFCOMMParityType
enum IOBluetoothHandsFreeAudioGatewayFeatures
enum IOBluetoothHandsFreeCallHoldModes
enum IOBluetoothHandsFreeCodecID
enum IOBluetoothHandsFreeDeviceFeatures
enum IOBluetoothHandsFreePDUMessageStatus
enum IOBluetoothHandsFreeSMSSupport
struct IOBluetoothL2CAPChannelEventType
enum IOBluetoothSMSMode


## Page 30

struct IOBluetoothUserNotificationChannelDirection
Bluetooth logical channel constants
BluetoothVoiceSettingInputSampleSize constants
BluetoothEncryptionEnable constants
BluetoothL2CAPConfigurationOption constants
BluetoothL2CAPTCIEventID constants
BluetoothL2CAPPacketHeaderSize constants
BluetoothGAPAppearance constants
BluetoothLETX constants
BluetoothKeyFlag constants
BluetoothHCILoopbackMode constants
BluetoothSDPDataElementType constants
BluetoothLEMaxTX constants
BluetoothVoiceSettingInputCoding constants
BluetoothHCIEventMask constants
BluetoothDeviceNameMaxLength constants
BluetoothVoiceSettingPCMBitPositionMask constants
BluetoothHCIErrorPowerIsOFF constants
BluetoothHCI packet size constants
BluetoothVoiceSettingAirCodingFormat constants
BluetoothKeyType constants
BluetoothL2CAP constants
BluetoothL2CAPFlushTimeout constants
BluetoothHCI event constants
BluetoothSDPPDUID constants
BluetoothLESecurityManager constants
BluetoothSynchronousConnectionPacketType constants
BluetoothHCI command constants


## Page 31

BluetoothHCIErroneousDataReporting constants
BluetoothL2CAPTCICommand constants
BluetoothSDPErrorCode constants
BluetoothConnectionHandleNone constants
BluetoothVoiceSettingInputDataFormat constants
BluetoothPacketType constants
BluetoothAirMode constants
BluetoothL2CAPPSM constants
BluetoothDeviceClassMinor constants
BluetoothServiceClassMajor constants
BluetoothL2CAPChannel constants
BluetoothDeviceClassMajor constants
BluetoothHCIUSBDeviceMatchingConstants
Bluetooth USB device matching constants
MaximumNumberOfInquiryAccessCodes constants
BluetoothL2CAPInfoTypeMaxConnectionlessMTUSize constants
BluetoothHCIError constants
BluetoothPageScanMode constants
BluetoothSDPUUID16 constants
BluetoothPageScanPeriodMode constants
Bluetooth role switch constants
Bluetooth access inquiry constants
BluetoothPageScanRepetitionMode constants
See Also
Reference


## Page 32

Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Constants
IOBluetooth Functions
IOBluetooth Data Types


## Page 33

var kFTSProgressPrecentageKey: Unmanaged<CFString>!
var kOBEXHeaderIDKeyAppParameters: Unmanaged<CFString>!
var kOBEXHeaderIDKeyAuthorizationChallenge: Unmanaged<CFString>!
var kOBEXHeaderIDKeyAuthorizationResponse: Unmanaged<CFString>!
var kOBEXHeaderIDKeyBody: Unmanaged<CFString>!
var kOBEXHeaderIDKeyByteSequence: Unmanaged<CFString>!
var kOBEXHeaderIDKeyConnectionID: Unmanaged<CFString>!
var kOBEXHeaderIDKeyCount: Unmanaged<CFString>!
var kOBEXHeaderIDKeyDescription: Unmanaged<CFString>!
var kOBEXHeaderIDKeyEndOfBody: Unmanaged<CFString>!
var kOBEXHeaderIDKeyHTTP: Unmanaged<CFString>!
var kOBEXHeaderIDKeyLength: Unmanaged<CFString>!
var kOBEXHeaderIDKeyName: Unmanaged<CFString>!
var kOBEXHeaderIDKeyObjectClass: Unmanaged<CFString>!
var kOBEXHeaderIDKeyTarget: Unmanaged<CFString>!
var kOBEXHeaderIDKeyTime4Byte: Unmanaged<CFString>!
var kOBEXHeaderIDKeyTimeISO: Unmanaged<CFString>!
Topics
Constants
IOBluetooth / IOBluetooth Constants
API Collection
IOBluetooth Constants


## Page 34

var kOBEXHeaderIDKeyType: Unmanaged<CFString>!
var kOBEXHeaderIDKeyUnknown1ByteQuantity: Unmanaged<CFString>!
var kOBEXHeaderIDKeyUnknown4ByteQuantity: Unmanaged<CFString>!
var kOBEXHeaderIDKeyUnknownByteSequence: Unmanaged<CFString>!
var kOBEXHeaderIDKeyUnknownUnicodeText: Unmanaged<CFString>!
var kOBEXHeaderIDKeyUserDefined: Unmanaged<CFString>!
var kOBEXHeaderIDKeyWho: Unmanaged<CFString>!
var kBluetoothHCIEventMaskAll64Bit: UInt64
var kBluetoothHCIEventMaskDefault64Bit: Int64
var kBluetoothHCIEventMaskEncryptionChangeEvent: Int64
var kBluetoothHCIEventMaskEncryptionKeyRefreshCompleteEvent: Int64
var kBluetoothHCIEventMaskEnhancedFlushCompleteEvent: Int64
var kBluetoothHCIEventMaskExtendedInquiryResultEvent: Int64
var kBluetoothHCIEventMaskFlowSpecificationCompleteEvent: Int64
var kBluetoothHCIEventMaskIOCapabilityRequestEvent: Int64
var kBluetoothHCIEventMaskIOCapabilityRequestReplyEvent: Int64
var kBluetoothHCIEventMaskInquiryResultWithRSSIEvent: Int64
var kBluetoothHCIEventMaskKeypressNotificationEvent: Int64
var kBluetoothHCIEventMaskLEDefault64Bit: Int64
var kBluetoothHCIEventMaskLEMetaEvent: Int64
var kBluetoothHCIEventMaskLinkSupervisionTimeoutChangedEvent: Int64
var kBluetoothHCIEventMaskReadRemoteExtendedFeaturesCompleteEvent: Int6
var kBluetoothHCIEventMaskRemoteHostSupportedFeaturesNotificationEvent:
Int64
var kBluetoothHCIEventMaskRemoteOOBDataRequestEvent: Int64
var kBluetoothHCIEventMaskSimplePairingCompleteEvent: Int64
var kBluetoothHCIEventMaskSniffSubratingEvent: Int64
var kBluetoothHCIEventMaskSynchronousConnectionChangedEvent: Int64


## Page 35

var kBluetoothHCIEventMaskSynchronousConnectionCompleteEvent: Int64
var kBluetoothHCIEventMaskUserConfirmationRequestEvent: Int64
var kBluetoothHCIEventMaskUserPasskeyNotificationEvent: Int64
var kBluetoothHCIEventMaskUserPasskeyRequestEvent: Int64
var kBluetoothHCIEvnetMaskEnhancedFlushCompleteEvent: Int64
var kBluetoothHCIEvnetMaskLinkSupervisionTimeoutChangedEvent: Int64
var kBluetoothHCIInquiryResultsMaxResults: Int32
var kBluetoothLESMPMaxEncryptionKeySize: Int32
var kBluetoothLESMPMinEncryptionKeySize: Int32
var kBluetoothLESMPTimeout: Int32
var kBluetoothTargetDoesNotRespondToCallbackExceptionName: String
var kCharsetStringISO88591: String
var kCharsetStringUTF8: String
var kEncodingString8Bit: String
var kEncodingStringBase64: String
var kEncodingStringQuotedPrintable: String
var kIOBluetoothDeviceInquiryInfoChangedNotification: String
var kIOBluetoothDeviceNameChangedNotification: String
var kIOBluetoothDeviceNotificationNameConnected: String
var kIOBluetoothDeviceNotificationNameDisconnected: String
var kIOBluetoothDeviceServicesChangedNotification: String
var kIOBluetoothL2CAPChannelDesiredOutgoingMTU: String
var kIOBluetoothL2CAPChannelMaxAllowedIncomingMTU: String
var kIOBluetoothObjectIDNULL: IOBluetoothObjectID
var kInfoStringMaxLength: Int32
var kMaxChannelIDPerSide: Int32
var kBluetoothRoleBecomeCentral: Int
var kBluetoothRoleBecomeMaster: Int
Deprecated


## Page 36

var kBluetoothRoleRemainPeripheral: Int
var kBluetoothRoleRemainSlave: Int
Deprecated
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Functions
IOBluetooth Data Types
See Also
Reference


## Page 37

func IOBluetoothNSStringFromDeviceAddressColon(UnsafePointer<Bluetooth
DeviceAddress>!) -> String!
func IOBluetoothPackDataList(UnsafeMutableRawPointer!, UnsafePointer<
CChar>!, CVaListPointer) -> Int
func IOBluetoothUnpackDataList(Int, UnsafeRawPointer!, UnsafePointer<
CChar>!, CVaListPointer) -> Int
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
Topics
Functions
See Also
Reference
IOBluetooth / IOBluetooth Functions
API Collection
IOBluetooth Functions


## Page 38

OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Data Types


## Page 39

typealias BluetoothAFHMode
typealias BluetoothAirMode
typealias BluetoothAllowRoleSwitch
typealias BluetoothAuthenticationRequirements
struct BluetoothAuthenticationRequirementsValues
typealias BluetoothClassOfDevice
typealias BluetoothClockOffset
struct BluetoothCompanyIdentifers
typealias BluetoothConnectionHandle
typealias BluetoothDeviceClassMajor
typealias BluetoothDeviceClassMinor
typealias BluetoothDeviceName
typealias BluetoothEncryptionEnable
struct BluetoothFeatureBits
typealias BluetoothHCIACLDataByteCount
typealias BluetoothHCIAFHChannelAssessmentMode
struct BluetoothHCIAFHChannelAssessmentModes
Topics
Data Types
IOBluetooth / IOBluetooth Data Types
API Collection
IOBluetooth Data Types


## Page 40

typealias BluetoothHCIAuthenticationEnable
struct BluetoothHCIAuthentionEnableModes
typealias BluetoothHCIAutomaticFlushTimeout
typealias BluetoothHCICommandOpCode
typealias BluetoothHCICommandOpCodeCommand
typealias BluetoothHCICommandOpCodeGroup
typealias BluetoothHCIConnectionAcceptTimeout
typealias BluetoothHCIConnectionMode
struct BluetoothHCIConnectionModes
typealias BluetoothHCIContentFormat
typealias BluetoothHCICountryCode
typealias BluetoothHCIDataID
typealias BluetoothHCIDeleteStoredLinkKeyFlag
struct BluetoothHCIDeleteStoredLinkKeyFlags
typealias BluetoothHCIEncryptionMode
struct BluetoothHCIEncryptionModes
typealias BluetoothHCIErroneousDataReporting
typealias BluetoothHCIEventCode
typealias BluetoothHCIEventID
typealias BluetoothHCIEventMask
typealias BluetoothHCIEventStatus
typealias BluetoothHCIExtendedInquiryResponseDataType
struct BluetoothHCIExtendedInquiryResponseDataTypes
typealias BluetoothHCIFECRequired
struct BluetoothHCIFECRequiredValues
typealias BluetoothHCIFailedContactCount
typealias BluetoothHCIFlowControlState
struct BluetoothHCIGeneralFlowControlStates


## Page 41

typealias BluetoothHCIHoldModeActivity
struct BluetoothHCIHoldModeActivityStates
typealias BluetoothHCIInputBandwidth
typealias BluetoothHCIInputCodedDataSize
typealias BluetoothHCIInputCodingFormat
typealias BluetoothHCIInputDataPath
typealias BluetoothHCIInputPCMDataFormat
typealias BluetoothHCIInputPCMSamplePayloadMSBPosition
typealias BluetoothHCIInputTransportUnitSize
typealias BluetoothHCIInquiryAccessCodeCount
typealias BluetoothHCIInquiryLength
typealias BluetoothHCIInquiryMode
struct BluetoothHCIInquiryModes
typealias BluetoothHCIInquiryScanType
struct BluetoothHCIInquiryScanTypes
typealias BluetoothHCILESupportedFeatures
typealias BluetoothHCILEUsedFeatures
typealias BluetoothHCILinkPolicySettings
struct BluetoothHCILinkPolicySettingsValues
typealias BluetoothHCILinkQuality
typealias BluetoothHCILoopbackMode
typealias BluetoothHCIMaxLatency
typealias BluetoothHCIModeInterval
typealias BluetoothHCINumBroadcastRetransmissions
typealias BluetoothHCINumLinkKeysDeleted
typealias BluetoothHCINumLinkKeysToWrite
typealias BluetoothHCIOperationID
typealias BluetoothHCIOutputBandwidth


## Page 42

typealias BluetoothHCIOutputCodedDataSize
typealias BluetoothHCIOutputCodingFormat
typealias BluetoothHCIOutputDataPath
typealias BluetoothHCIOutputPCMDataFormat
typealias BluetoothHCIOutputPCMSamplePayloadMSBPosition
typealias BluetoothHCIOutputTransportUnitSize
typealias BluetoothHCIPageNumber
typealias BluetoothHCIPageScanEnableState
struct BluetoothHCIPageScanEnableStates
typealias BluetoothHCIPageScanMode
struct BluetoothHCIPageScanModes
typealias BluetoothHCIPageScanPeriodMode
struct BluetoothHCIPageScanPeriodModes
typealias BluetoothHCIPageScanType
struct BluetoothHCIPageScanTypes
typealias BluetoothHCIPageTimeout
typealias BluetoothHCIParamByteCount
typealias BluetoothHCIParkModeBeaconInterval
typealias BluetoothHCIQoSFlags
typealias BluetoothHCIRSSIValue
typealias BluetoothHCIReadStoredLinkKeysFlag
struct BluetoothHCIReadStoredLinkKeysFlags
typealias BluetoothHCIReceiveBandwidth
typealias BluetoothHCIReceiveCodecFrameSize
typealias BluetoothHCIReceiveCodingFormat
typealias BluetoothHCIRequestID
typealias BluetoothHCIResponseCount
typealias BluetoothHCIRetransmissionEffort


## Page 43

struct BluetoothHCIRetransmissionEffortTypes
typealias BluetoothHCIRole
struct BluetoothHCIRoles
typealias BluetoothHCISCODataByteCount
struct BluetoothHCISCOFlowControlStates
typealias BluetoothHCISignalID
typealias BluetoothHCISimplePairingMode
struct BluetoothHCISimplePairingModes
typealias BluetoothHCISniffAttemptCount
typealias BluetoothHCISniffTimeout
typealias BluetoothHCIStatus
typealias BluetoothHCISupportedIAC
struct BluetoothHCITimeoutValues
typealias BluetoothHCITransmitBandwidth
typealias BluetoothHCITransmitCodecFrameSize
typealias BluetoothHCITransmitCodingFormat
typealias BluetoothHCITransmitPowerLevel
typealias BluetoothHCITransmitPowerLevelType
struct BluetoothHCITransmitReadPowerLevelTypes
typealias BluetoothHCITransportCommandID
typealias BluetoothHCITransportID
typealias BluetoothHCIVendorCommandSelector
struct BluetoothHCIVersions
typealias BluetoothHCIVoiceSetting
struct BluetoothIOCapabilities
typealias BluetoothIOCapability
typealias BluetoothKeyFlag
typealias BluetoothKeyType


## Page 44

typealias BluetoothKeypressNotificationType
struct BluetoothKeypressNotificationTypes
typealias BluetoothL2CAPByteCount
typealias BluetoothL2CAPChannelID
typealias BluetoothL2CAPCommandByteCount
typealias BluetoothL2CAPCommandID
typealias BluetoothL2CAPFlushTimeout
typealias BluetoothL2CAPGroupID
typealias BluetoothL2CAPLinkTimeout
typealias BluetoothL2CAPMTU
typealias BluetoothL2CAPPSM
typealias BluetoothLAP
struct BluetoothLEFeatureBits
struct BluetoothLESecurityManagerKeyDistributionFormat
typealias BluetoothLMPHandle
typealias BluetoothLMPSubversion
typealias BluetoothLMPVersion
struct BluetoothLMPVersions
typealias BluetoothLinkType
struct BluetoothLinkTypes
typealias BluetoothManufacturerName
typealias BluetoothMaxSlots
typealias BluetoothNumericValue
typealias BluetoothOOBDataPresence
struct BluetoothOOBDataPresenceValues
typealias BluetoothPINType
typealias BluetoothPacketType
typealias BluetoothPageScanMode


## Page 45

typealias BluetoothPageScanPeriodMode
typealias BluetoothPageScanRepetitionMode
typealias BluetoothPasskey
typealias BluetoothRFCOMMChannelID
typealias BluetoothRFCOMMMTU
typealias BluetoothReasonCode
typealias BluetoothRole
typealias BluetoothSDPDataElementSizeDescriptor
typealias BluetoothSDPDataElementTypeDescriptor
typealias BluetoothSDPErrorCode
typealias BluetoothSDPPDUID
typealias BluetoothSDPServiceAttributeID
typealias BluetoothSDPServiceRecordHandle
typealias BluetoothSDPTransactionID
typealias BluetoothSDPUUID16
typealias BluetoothSDPUUID32
typealias BluetoothServiceClassMajor
typealias BluetoothSimplePairingDebugMode
struct BluetoothSimplePairingDebugModes
typealias BluetoothTransportInfoPtr
struct BluetoothTransportTypes
struct FTSFileType
struct IOBluetoothDeviceSearchOptionsBits
typealias IOBluetoothDeviceSearchTypes
struct IOBluetoothDeviceSearchTypesBits
Bits to determine what Bluetooth devices to search for
typealias IOBluetoothL2CAPChannelIncomingDataListener
typealias IOBluetoothL2CAPChannelIncomingEventListener


## Page 46

typealias IOBluetoothOBEXSessionOpenConnectionCallback
typealias IOBluetoothObjectID
struct OBEXConnectFlagValues
Flags for Connect command.
typealias OBEXConstants
struct OBEXErrorCodes
typealias OBEXFlags
typealias OBEXHeaderIdentifier
struct OBEXHeaderIdentifiers
Identifiers for OBEX Headers.
typealias OBEXMaxPacketLength
struct OBEXNonceFlagValues
Flags for Nonce command during digest challenge.
typealias OBEXOpCode
struct OBEXOpCodeCommandValues
Operation OpCode values for commands.
struct OBEXOpCodeResponseValues
Response opCode values.
struct OBEXOpCodeSessionValues
Operation OpCode values for sessions. From the OBEX 1.3 specification.
struct OBEXPutFlagValues
struct OBEXRealmValues
Values for Realm during digest response.
typealias OBEXSessionEventCallback
typealias OBEXSessionEventType
struct OBEXSessionEventTypes
Type identifiers for OBEX sessions.
struct OBEXSessionParameterTags
Tags for SessionParameters.


## Page 47

typealias OBEXSessionRef
typealias OBEXTransportEventType
struct OBEXTransportEventTypes
typealias OBEXVersion
struct OBEXVersions
The available/supported OBEX versions.
typealias PrivOBEXSessionDataRef
struct ProtocolParameters
struct SDPAttributeDeviceIdentificationRecord
struct SDPAttributeIdentifierCodes
struct SDPServiceClasses
typealias TransmissionPower
typealias BluetoothHCIEncryptionKeySize
Bluetooth.h User-Space
Bluetooth wireless technology
IOBluetoothUserLib.h
Public Interfaces for Apple’s implementation of Bluetooth technology.
IOBluetoothUtilities.h
See the Overview section above for header-level documentation.
OBEX.h
Public OBEX technology interfaces.
OBEXBluetooth.h
Object Exchange over Bluetooth.
OBEXFileTransferServices.h
See Also
Reference


## Page 48

IOBluetooth Structures
IOBluetooth Enumerations
IOBluetooth Constants
IOBluetooth Functions


