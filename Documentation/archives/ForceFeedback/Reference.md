# Reference.pdf

## Page 1

The Force Feedback API allows developers to control Force Feedback devices attached to the
system. It is a distilled version of the Force Feedback functionality found in Microsoft’s DirectInpu
API. Developers familiar with that API should find this API to be similar.
<CoreFoundation/CoreFoundation.h>
<CoreFoundation/CFPlugInCOM.h>
<MacTypes.h>
<IOKit/IOTypes.h>
<ForceFeedback/ForceFeedbackConstants.h>
func FFCreateDevice(io_service_t, UnsafeMutablePointer<FFDeviceObject
Reference?>!) -> HRESULT
Creates a new API device object from an OS object in preparation to use the device for force
feedback.
Overview
Included Headers
Topics
Miscellaneous
Force Feedback / ForceFeedback.h
API Collection
ForceFeedback.h
Public Interfaces to the Force Feedback implementation in macOS.


## Page 2

func FFDeviceCreateEffect(FFDeviceObjectReference!, CFUUID!, Unsafe
MutablePointer<FFEFFECT>!, UnsafeMutablePointer<FFEffectObjectReference
>!) -> HRESULT
Creates and initializes an instance of an effect identified by the effect UUID on the device.
func FFDeviceEscape(FFDeviceObjectReference!, UnsafeMutablePointer<
FFEFFESCAPE>!) -> HRESULT
Sends a hardware-specific command to the device.
func FFDeviceGetForceFeedbackCapabilities(FFDeviceObjectReference!,
UnsafeMutablePointer<FFCAPABILITIES>!) -> HRESULT
Retrieves the device’s force feedback capabilities.
func FFDeviceGetForceFeedbackProperty(FFDeviceObjectReference!,
FFProperty, UnsafeMutableRawPointer!, IOByteCount) -> HRESULT
Gets properties that define the device behavior.
func FFDeviceGetForceFeedbackState(FFDeviceObjectReference!, Unsafe
MutablePointer<FFState>!) -> HRESULT
Retrieves the state of the device’s force feedback system.
func FFDeviceReleaseEffect(FFDeviceObjectReference!, FFEffectObject
Reference!) -> HRESULT
Disposes of an API effect object created with FFDeviceCreateEffect.
func FFDeviceSendForceFeedbackCommand(FFDeviceObjectReference!,
FFCommandFlag) -> HRESULT
Sends a command to the device’s force feedback system.
func FFDeviceSetCooperativeLevel(FFDeviceObjectReference!, UnsafeMutabl
RawPointer!, FFCooperativeLevelFlag) -> HRESULT
Function is unimplemented in version 1.0 of this API
func FFDeviceSetForceFeedbackProperty(FFDeviceObjectReference!,
FFProperty, UnsafeMutableRawPointer!) -> HRESULT
Retrieves the device’s force feedback capabilities.
func FFEffectDownload(FFEffectObjectReference!) -> HRESULT
Places the effect on the device. If the effect is already on the device, the existing effect is
updated to match the values set by the FFEffectSetParameters method.
func FFEffectEscape(FFEffectObjectReference!, UnsafeMutablePointer<
FFEFFESCAPE>!) -> HRESULT


## Page 3

Sends a hardware-specific command to the driver.
func FFEffectGetEffectStatus(FFEffectObjectReference!, UnsafeMutable
Pointer<FFEffectStatusFlag>!) -> HRESULT
Sends a hardware-specific command to the driver.
func FFEffectGetParameters(FFEffectObjectReference!, UnsafeMutable
Pointer<FFEFFECT>!, FFEffectParameterFlag) -> HRESULT
Retrieves information about an effect.
func FFEffectSetParameters(FFEffectObjectReference!, UnsafeMutable
Pointer<FFEFFECT>!, FFEffectParameterFlag) -> HRESULT
Sets the characteristics of an effect.
func FFEffectStart(FFEffectObjectReference!, UInt32, FFEffectStartFlag)
-> HRESULT
Begins playing an effect. If the effect is already playing, it is restarted from the beginning. If
the effect has not been downloaded or has been modified since its last download, it is
downloaded before being started. This default behavior can be suppressed by passing the
FFES_NODOWNLOAD flag.
func FFEffectStop(FFEffectObjectReference!) -> HRESULT
Stops playing an effect.
func FFEffectUnload(FFEffectObjectReference!) -> HRESULT
Removes the effect from the device. If the effect is playing, it is automatically stopped befor
it is unloaded.
func FFIsForceFeedback(io_service_t) -> HRESULT
Used to determine if a particular device provided by HID Manager is a force feedback device
func FFReleaseDevice(FFDeviceObjectReference!) -> HRESULT
Disposes of an API device object created with FFCreateDevice.
struct FFCAPABILITIES
Used by the FFDeviceGetForceFeedbackCapabilities method to retrieve device force-
feedback capabilities.
struct FFCONDITION
A structure containing type-specific information for certain effects.
Data Types


## Page 4

struct FFCONSTANTFORCE
Contains type-specific information for the CONSTANTFORCE effect.
struct FFCUSTOMFORCE
Contains type-specific information for the CUSTOMFORCE effect.
struct FFEFFECT
UsUsed by the FFDeviceCreateEffect method to initialize a new effect object. It is also used
by the FFEffectSetParameters and FFEffectGetParameters functions.
struct FFEFFESCAPE
The FFEFFESCAPE structure passes hardware-specific data directly to the Force Feedback
plugIn.
struct FFENVELOPE
Used by the FFEFFECT structure to specify the optional envelope parameters for an effect.
struct FFPERIODIC
A structure containing type-specific information for certain effects.
struct FFRAMPFORCE
Contains type-specific information for the RAMPFORCE effect.
ForceFeedbackConstants.h
Constants used in the public interfaces to the Force Feedback implementation in macOS.
ForceFeedback Enumerations
ForceFeedback Constants
ForceFeedback Data Types
See Also
Reference


## Page 5

This header file contains the Effect type UUIDs, type definitions used in the API, force feedback
constants and error values used by the API.
See the Overview section above for header-level documentation.
Miscellaneous Defines
typealias FFCapabilitiesEffectSubType
typealias FFCapabilitiesEffectType
typealias FFCommandFlag
typealias FFCooperativeLevelFlag
typealias FFCoordinateSystemFlag
typealias FFEffectParameterFlag
typealias FFEffectStartFlag
typealias FFEffectStatusFlag
typealias FFProperty
Overview
Topics
Constants
Force Feedback / ForceFeedbackConstants.h
API Collection
ForceFeedbackConstants.h
Constants used in the public interfaces to the Force Feedback implementation in
macOS.


## Page 6

typealias FFState
ForceFeedback.h
Public Interfaces to the Force Feedback implementation in macOS.
ForceFeedback Enumerations
ForceFeedback Constants
ForceFeedback Data Types
See Also
Reference


## Page 7

Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
ForceFeedback.h
Public Interfaces to the Force Feedback implementation in macOS.
ForceFeedbackConstants.h
Constants used in the public interfaces to the Force Feedback implementation in macOS.
Topics
Enumerations
See Also
Reference
Force Feedback / ForceFeedback Enumerations
ForceFeedback Enumerations


## Page 8

ForceFeedback Constants
ForceFeedback Data Types


## Page 9

var FFJOFS_RX: Int32
var FFJOFS_RY: Int32
var FFJOFS_RZ: Int32
var FFJOFS_Y: Int32
var FFJOFS_Z: Int32
FFDEVICESTATE
FFJOFS_BUTTON
FFJOFS_BUTTON0
FFJOFS_BUTTON1
FFJOFS_BUTTON10
FFJOFS_BUTTON11
FFJOFS_BUTTON12
FFJOFS_BUTTON13
FFJOFS_BUTTON14
FFJOFS_BUTTON15
Topics
Constants
Macros
Force Feedback / ForceFeedback Constants
API Collection
ForceFeedback Constants


## Page 10

FFJOFS_BUTTON16
FFJOFS_BUTTON17
FFJOFS_BUTTON18
FFJOFS_BUTTON19
FFJOFS_BUTTON2
FFJOFS_BUTTON20
FFJOFS_BUTTON21
FFJOFS_BUTTON22
FFJOFS_BUTTON23
FFJOFS_BUTTON24
FFJOFS_BUTTON25
FFJOFS_BUTTON26
FFJOFS_BUTTON27
FFJOFS_BUTTON28
FFJOFS_BUTTON29
FFJOFS_BUTTON3
FFJOFS_BUTTON30
FFJOFS_BUTTON31
FFJOFS_BUTTON4
FFJOFS_BUTTON5
FFJOFS_BUTTON6
FFJOFS_BUTTON7
FFJOFS_BUTTON8
FFJOFS_BUTTON9
FFJOFS_POV
FFJOFS_SLIDER
IOFORCEFEEDBACKDEVICE_FUNCS_100
PFFDEVICESTATE


## Page 11

kIOForceFeedbackDeviceInterfaceID
kIOForceFeedbackLibTypeID
ForceFeedback.h
Public Interfaces to the Force Feedback implementation in macOS.
ForceFeedbackConstants.h
Constants used in the public interfaces to the Force Feedback implementation in macOS.
ForceFeedback Enumerations
ForceFeedback Data Types
See Also
Reference


## Page 12

typealias DWORD
typealias FFDeviceObjectReference
typealias FFEffectObjectReference
typealias LONG
typealias LPDWORD
typealias LPLONG
typealias PFFCAPABILITIES
typealias PFFCONDITION
typealias PFFCONSTANTFORCE
typealias PFFCUSTOMFORCE
typealias PFFEFFECT
typealias PFFEFFESCAPE
typealias PFFENVELOPE
typealias PFFPERIODIC
typealias PFFRAMPFORCE
Topics
Data Types
Force Feedback / ForceFeedback Data Types
API Collection
ForceFeedback Data Types


## Page 13

ForceFeedback.h
Public Interfaces to the Force Feedback implementation in macOS.
ForceFeedbackConstants.h
Constants used in the public interfaces to the Force Feedback implementation in macOS.
ForceFeedback Enumerations
ForceFeedback Constants
See Also
Reference


