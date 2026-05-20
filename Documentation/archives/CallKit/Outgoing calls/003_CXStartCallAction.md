# 003_CXStartCallAction.pdf

## Page 1

Making and receiving VoIP calls
CXStartCallAction is a concrete subclass of CXCallAction. When the user initiates an
outgoing call, the provider sends provider(_:perform:) to its delegate. The provider’s
delegate calls the fulfill() method to indicate that the action was successfully performed. To
indicate that the call started at a time other than the current time, you can instead call the
fulfill(withDateStarted:).
init(call: UUID, handle: CXHandle)
Initializes a new action to start a call with the specified UUID to a recipient with the specified
handle.
init?(coder: NSCoder)
Mentioned in
Overview
Topics
Creating New Actions
CallKit / CXStartCallAction
Class
CXStartCallAction
An encapsulation of the act of initiating an outgoing call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Creates a new action to start a call with data in an unarchiver.
var isVideo: Bool
A Boolean value that indicates whether the call is a video call.
var contactIdentifier: String?
The identifier for the call recipient.
var handle: CXHandle
The handle of the call recipient.
func fulfill(withDateStarted: Date)
Reports the successful execution of the action at the specified time.
CXCallAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Accessing Action Attributes
Completing Actions
Relationships
Inherits From
Conforms To


## Page 3

Sending End-to-End Encrypted VoIP Calls
Initiate VoIP calls when your server can’t determine whether an outgoing notification is a
request for a VoIP call due to metadata encryption.
class CXCallController
A programmatic interface for interacting with and observing calls.
class CXTransaction
An object that contains zero or more action objects for a call controller to perform.
See Also
Outgoing calls


