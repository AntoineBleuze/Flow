# 000_CTCellularPlanStatus.pdf

## Page 1

CTCellularPlanStatus checks if the Integrated Circuit Card Identifier (ICCID) on a device is
associated with a given token. Use the setUPIVerificationCodeSendCompletion(_:)
method to configure the instance of a view for Unified Payments Interface (UPI) device validation
This process generates your token, which you can use to help determine if there are any changes
to the underlying ICCID.
After you generate a token, use getTokenWithCompletion(_:) to retrieve the token
associated with your app. Your app has 30 seconds to call getTokenWithCompletion before
the system invalidates the token. If called in time, the framework sends and stores a token
associated with your app. The token is mapped to the ICCID associated with the original
MFMessageComposeViewController instance.
Use checkValidity(ofToken:completionHandler:) to check the status of the token. If
the ICCID is present and turned-on, checkValidityOfToken returns YES.
For more information on configuring an instance for UPI device validation, see set
UPIVerificationCodeSendCompletion(_:).
Important
To use this class you need the com.apple.developer.upi-device-validation
entitlement. For more information, see com.apple.developer.upi-device-
validation.
Overview
Core Telephony / CTCellularPlanStatus
Class
CTCellularPlanStatus
An object used for retrieving and checking the validity of a token.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 2

class func getTokenWithCompletion((String?, (any Error)?) -> Void)
A method you use to retrieve and store the token.
class func checkValidity(ofToken: String, completionHandler: (Bool, (an
Error)?) -> Void)
Checks for a valid ICCID associated with the token.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Get and store a token
Check the validity of the ICCID associated with the token
Relationships
Inherits From
Conforms To


