# 001_CTCellularPlanProvisioningRequest.pdf

## Page 1

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


## Page 2

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


## Page 3



