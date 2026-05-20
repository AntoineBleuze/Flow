# 000_CXCall.pdf

## Page 1

You don’t instantiate CXCall objects directly. Instead, CXCall objects are created by the
telephony provider when an incoming call is received or an outgoing call is initiated.
Each CXCall object is uniquely identified by a uuid. You primarily interact with calls by passing
their unique identifiers to CallKit APIs. For example, to place a call on hold, you create an instance
of CXSetHeldCallAction with init(call:onHold:) passing the uuid of the call and true
create a CXTransaction object containing the action, and then pass the transaction to an
instance of CXCallController using the request(_:completion:) method.
You can use the CXCallObserver managed by a CXCallController to access CXCall
instances for active calls using the calls property, or provide an object conforming to the CXCal
ObserverDelegate protocol to be notified anytime a call is updated.
var uuid: UUID
The unique identifier for the call.
var isOutgoing: Bool
Overview
Topics
Accessing Call Attributes
CallKit / CXCall
Class
CXCall
A telephony call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

A Boolean value that indicates whether the call is outgoing.
var hasConnected: Bool
A Boolean value that indicates whether the call has connected.
var hasEnded: Bool
A Boolean value that indicates whether the call has ended.
var isOnHold: Bool
A Boolean value that indicates whether the call is on hold.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CXCallObserver
A programmatic interface for an object that manages a list of active calls and observes call
changes.
protocol CXCallObserverDelegate
A collection of methods the system calls when a call changes state.
Relationships
Inherits From
Conforms To
See Also
Call information


## Page 3

class CXHandle
A way to reach a call recipient, such as a phone number or email address.


