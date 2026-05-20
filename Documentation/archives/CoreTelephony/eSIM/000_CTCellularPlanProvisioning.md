# 000_CTCellularPlanProvisioning.pdf

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


