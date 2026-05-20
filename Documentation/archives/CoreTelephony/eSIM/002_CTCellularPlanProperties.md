# 002_CTCellularPlanProperties.pdf

## Page 1

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


## Page 2

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


