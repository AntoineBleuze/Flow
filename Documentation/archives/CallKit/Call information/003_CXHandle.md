# 003_CXHandle.pdf

## Page 1

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


## Page 2

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


## Page 3

class CXCall
A telephony call.
class CXCallObserver
A programmatic interface for an object that manages a list of active calls and observes call
changes.
protocol CXCallObserverDelegate
A collection of methods the system calls when a call changes state.


