# 002_CXAnswerCallAction.pdf

## Page 1

CXAnswerCallAction is a concrete subclass of CXCallAction.
When an incoming call is allowed by the system and approved by the user, the provider sends
provider(_:perform:) to its delegate. The provider’s delegate calls the fulfill() method
to indicate that the action was successfully performed. To indicate that the call connected at a tim
other than the current time, you can instead call the fulfill(withDateConnected:).
func fulfill(withDateConnected: Date)
Reports the successful execution of the action at the specified time.
Overview
Topics
Completing Actions
Relationships
Inherits From
CallKit / CXAnswerCallAction
Class
CXAnswerCallAction
An encapsulation of the act of answering an incoming call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

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
Responding to VoIP Notifications from PushKit
Receive incoming Voice-over-IP (VoIP) push notifications and use them to display the system
call interface to the user.
class CXCallUpdate
An encapsulation of new and changed information about a call.
Conforms To
See Also
Incoming calls


