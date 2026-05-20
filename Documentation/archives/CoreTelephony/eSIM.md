# eSIM.pdf

## Page 1

This class is only available to carrier apps with suitable entitlements.
func supportsCellularPlan() -> Bool
Indicates whether the device supports eSIM and the activation policy allows eSIM installation
var supportsEmbeddedSIM: Bool
A Boolean value that indicates whether the device has hardware eSIM support.
func addPlan(request: CTCellularPlanProvisioningRequest, properties:
CTCellularPlanProperties?, completionHandler: (CTCellularPlan
ProvisioningAddPlanResult) -> Void)
Starts the provisioning process with optional properties for the specified eSIM.
func addPlan(with: CTCellularPlanProvisioningRequest, completionHandler
(CTCellularPlanProvisioningAddPlanResult) -> Void)
Starts the provisioning process for a specified eSIM.
Overview
Topics
Provisioning an eSIM
Core Telephony / CTCellularPlanProvisioning
Class
CTCellularPlanProvisioning
An object you use to download and install a carrier eSIM.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

enum CTCellularPlanProvisioningAddPlanResult
The result from attempting to provision an eSIM.
func update(CTCellularPlanProperties, completionHandler: ((any Error)?)
-> Void)
Updates the capability and region availability for an eSIM.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CTCellularPlanProvisioningRequest
A request specifying an eSIM to download and install.
class CTCellularPlanProperties
An object you use for an eSIM.
enum CTCellularPlanCapability
Updating eSIM information
Relationships
Inherits From
Conforms To
See Also
eSIM


## Page 3

The type of cellular plan available for an eSIM.


## Page 4

You must set the address property for the request to be valid. All other properties are optional.
This class is only available to carrier apps with suitable entitlements.
var address: String
The address of the carrier network’s eSIM server.
var confirmationCode: String?
The provisioning request’s confirmation code, provided by the network operator when
initiating an eSIM download.
var eid: String?
The provisioning request’s eUICC identifier (EID).
var iccid: String?
The provisioning request’s Integrated Circuit Card Identifier (ICCID).
Overview
Topics
Specifying Request Properties
Core Telephony / CTCellularPlanProvisioningRequest
Class
CTCellularPlanProvisioningRequest
A request specifying an eSIM to download and install.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 5

var matchingID: String?
The provisioning request’s matching identifier (MatchingID).
var oid: String?
The provisioning request’s Object Identifier (OID).
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class CTCellularPlanProvisioning
An object you use to download and install a carrier eSIM.
class CTCellularPlanProperties
An object you use for an eSIM.
enum CTCellularPlanCapability
The type of cellular plan available for an eSIM.
Relationships
Inherits From
Conforms To
See Also
eSIM


## Page 6



## Page 7

Use CTCellularPlanProperties to set the capabilities of your eSIMs.
var associatedIccid: String?
The integrated circuit card identifier (ICCID) that identifies a SIM.
var simCapability: CTCellularPlanCapability
The available type of cellular plan that your eSIM supports.
var supportedRegionCodes: [Locale.Region]
The available regions that your eSIM supports.
Overview
Topics
Getting the eSIM properties
Relationships
Core Telephony / CTCellularPlanProperties
Class
CTCellularPlanProperties
An object you use for an eSIM.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 8

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class CTCellularPlanProvisioning
An object you use to download and install a carrier eSIM.
class CTCellularPlanProvisioningRequest
A request specifying an eSIM to download and install.
enum CTCellularPlanCapability
The type of cellular plan available for an eSIM.
Inherits From
Conforms To
See Also
eSIM


## Page 9

init?(rawValue: Int)
Creates a new instance with the specified raw value.
case dataAndVoice
The cellular plan is available for data and voice.
case dataOnly
The cellular plan is available for data only.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Topics
Defining cellular data plans
Relationships
Conforms To
Core Telephony / CTCellularPlanCapability
Enumeration
CTCellularPlanCapability
The type of cellular plan available for an eSIM.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 10.10+


## Page 10

Sendable
SendableMetatype
class CTCellularPlanProvisioning
An object you use to download and install a carrier eSIM.
class CTCellularPlanProvisioningRequest
A request specifying an eSIM to download and install.
class CTCellularPlanProperties
An object you use for an eSIM.
See Also
eSIM


