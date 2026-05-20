# Call information.pdf

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


## Page 4

You can retrieve a list of active calls on an CXCallObserver object using the calls property.
You can also provide an object conforming to the CXCallObserverDelegate protocol as the c
observer delegate using the setDelegate(_:queue:) method to respond to any active call
changes.
VoIP apps typically interact with the CXCallObserver object returned by the callObserver
property of a CXCallController instance. However, any app can create a new CXCall
Observer object to be notified of any calls activity on the system.
func setDelegate((any CXCallObserverDelegate)?, queue: dispatch_queue_t
?)
Sets a call observer delegate, specifying an optional queue on which to execute delegate
methods.
Overview
Topics
Setting a Delegate
CallKit / CXCallObserver
Class
CXCallObserver
A programmatic interface for an object that manages a list of active calls and
observes call changes.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 5

var calls: [CXCall]
Returns the active calls of the telephony provider.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CXCall
A telephony call.
protocol CXCallObserverDelegate
A collection of methods the system calls when a call changes state.
class CXHandle
A way to reach a call recipient, such as a phone number or email address.
Accessing Calls
Relationships
Inherits From
Conforms To
See Also
Call information


## Page 6

func callObserver(CXCallObserver, callChanged: CXCall)
Called when a call is changed.
Required
NSObjectProtocol
Topics
Responding to Changes in Call State
Relationships
Inherits From
See Also
Call information
CallKit / CXCallObserverDelegate
Protocol
CXCallObserverDelegate
A collection of methods the system calls when a call changes state.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

class CXCall
A telephony call.
class CXCallObserver
A programmatic interface for an object that manages a list of active calls and observes call
changes.
class CXHandle
A way to reach a call recipient, such as a phone number or email address.


## Page 8

Making and receiving VoIP calls
When the telephony provider receives an incoming call or the user starts an outgoing call, the oth
caller is identified by a CXHandle object. For a caller identified by a phone number, the handle
type is CXHandle.HandleType.phoneNumber and the value is a sequence of digits. For a call
identified by an email address, the handle type is CXHandle.HandleType.emailAddress and
the value is an email address. For a caller identified in any other way, the handle type is CXHandl
.HandleType.generic and the value typically follows some domain-specific format, such as a
username, numeric ID, or URL.
init(type: CXHandle.HandleType, value: String)
Initializes a new handle of a given type with the specified value.
Mentioned in
Overview
Topics
Creating New Handles
CallKit / CXHandle
Class
CXHandle
A way to reach a call recipient, such as a phone number or email address.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 9

var type: CXHandle.HandleType
The type of the handle.
var value: String
The value of the handle.
enum HandleType
The possible types of handles.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Accessing Handle Attributes
Constants
Relationships
Inherits From
Conforms To
See Also
Call information


## Page 10

class CXCall
A telephony call.
class CXCallObserver
A programmatic interface for an object that manages a list of active calls and observes call
changes.
protocol CXCallObserverDelegate
A collection of methods the system calls when a call changes state.


