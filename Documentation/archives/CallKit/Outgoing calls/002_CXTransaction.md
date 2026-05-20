# 002_CXTransaction.pdf

## Page 1

Making and receiving VoIP calls
convenience init(action: CXAction)
Initializes a new transaction with the specified action.
init(actions: [CXAction])
Initializes a new transaction with the specified actions.
var uuid: UUID
The unique identifier of the transaction.
var isComplete: Bool
A Boolean value that indicates whether the transaction has been completed.
Mentioned in
Topics
Creating New Transactions
Accessing Transaction Attributes
CallKit / CXTransaction
Class
CXTransaction
An object that contains zero or more action objects for a call controller to perform
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

var actions: [CXAction]
The actions added to a transaction.
func addAction(CXAction)
Adds the specified action to the transaction.
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
Sending End-to-End Encrypted VoIP Calls
Initiate VoIP calls when your server can’t determine whether an outgoing notification is a
request for a VoIP call due to metadata encryption.
class CXCallController
A programmatic interface for interacting with and observing calls.
Adding Actions
Relationships
Inherits From
Conforms To
See Also
Outgoing calls


## Page 3

class CXStartCallAction
An encapsulation of the act of initiating an outgoing call.


