# Outgoing calls.pdf

## Page 1

If your app can send multiple types of end-to-end encrypted (E2EE) data—for example both text
messages and voice over IP (VoIP) calls—send the encrypted content as a remote notification.
Then, on the receiving device, use a notification service extension to decrypt the incoming conten
If the content represents a VoIP call, pass the call information to CallKit by calling the reportNew
IncomingVoIPPushPayload(_:completion:) method. The system launches your app befo
passing the message on to CallKit. CallKit then displays the call to the user. It uses the same
interface as the Phone app, giving your app a more native look and feel. It also responds
appropriately to system-level behaviors such as Do Not Disturb.
Important
Only use this approach when your server can’t determine whether an outgoing notification is a
request for a VoIP call or some other data (such as a text message) due to metadata
encryption. If your server knows that the outgoing content is a VoIP call, send a voIP push
notification instead. For more information, see PushKit.
The workflow for receiving, decrypting, and processing multiple types of E2EE data involves seve
different components working together. To set up these systems:
Request permission to receive remote notifications through the User Notifications framework.
See Asking permission to use notifications.
Register for VoIP calls using PushKit. See Supporting PushKit Notifications in Your App.
Overview
Configure your App to Process Multiple Types of E2EE Data
CallKit / Sending End-to-End Encrypted VoIP Calls
Article
Sending End-to-End Encrypted VoIP Calls
Initiate VoIP calls when your server can’t determine whether an outgoing
notification is a request for a VoIP call due to metadata encryption.


## Page 2

Add a Notification Service Extension target to your app. See Modifying content in newly
delivered notifications.
Add the com.apple.developer.usernotifications.filtering entitlement to the
Notification Service Extension target’s entitlements file. To apply for this entitlement, see
Notification Service Extension Filtering Entitlement Request.
To send an E2EE VoIP message:
1. A user initiates a VoIP call on their app. Their app then sends an encrypted VoIP call request to
your server.
2. Your server sends the encrypted data to the receiver’s device using a regular remote
notification. Be sure to set the apns-push-type header field to alert. For more information
see Sending notification requests to APNs.
3. On the receiver’s device, the notification service extension processes the incoming notification
and decrypts it. If it’s an incoming VoIP call, the extension calls reportNewIncomingVo
IPPushPayload(_:completion:) to initiate the call. It then silences the push notification
(see com.apple.developer.usernotifications.filtering).
4. Finally, the system launches the extension’s containing app and calls the pushRegistry(_:
didReceiveIncomingPushWith:for:completion:) method. From this point, the app
handles the call just like any incoming VoIP call. Specifically, your pushRegistry(_:did
ReceiveIncomingPushWith:for:completion:) implementation must call the report
NewIncomingCall(with:update:completion:) method to report the call. CallKit then
presents the incoming call to the user.
class CXCallController
A programmatic interface for interacting with and observing calls.
class CXTransaction
An object that contains zero or more action objects for a call controller to perform.
class CXStartCallAction
An encapsulation of the act of initiating an outgoing call.
Send the VoIP Request
See Also
Outgoing calls


## Page 3



## Page 4

A CXCallController object interacts with calls by performing actions, which are represented 
instances of CXCallAction subclasses. You can request that one or more actions be performed
in a single CXTransaction object using the request(_:completion:) method. A transactio
may be rejected by the system for one of the reasons listed in the CXErrorCodeRequest
TransactionError.Code enumeration.
Each CXCallController object manages a CXCallObserver object, which can be accessed
using the callObserver property. You can provide an object conforming to the CXCall
ObserverDelegate protocol to the call observer in order to be notified of any changes to active
calls.
convenience init()
Initializes a new call controller with a private, serial queue, which is used for calling completio
blocks.
init(queue: dispatch_queue_t)
Overview
Topics
Creating New Call Controllers
CallKit / CXCallController
Class
CXCallController
A programmatic interface for interacting with and observing calls.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 5

Initializes a new call controller with a specified queue, which is used for calling completion
blocks.
var callObserver: CXCallObserver
Returns an observer for active calls.
func request(CXTransaction, completion: ((any Error)?) -> Void)
Requests that the actions in the specified transaction be asynchronously performed by the
telephony provider.
func requestTransaction(with: CXAction, completion: ((any Error)?) ->
Void)
Requests that the transaction that contains the specified action be asynchronously performe
by the telephony provider.
func requestTransaction(with: [CXAction], completion: ((any Error)?) ->
Void)
Requests that the transaction that contains the specified actions be asynchronously
performed by the telephony provider.
struct CXErrorCodeRequestTransactionError
enum Code
Error codes for the CallKit error domain.
let CXErrorDomainRequestTransaction: String
Domain for errors when requesting a transaction from a call controller.
NSObject
Accessing the Call Observer
Requesting Transactions
Errors
Relationships
Inherits From


## Page 6

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sending End-to-End Encrypted VoIP Calls
Initiate VoIP calls when your server can’t determine whether an outgoing notification is a
request for a VoIP call due to metadata encryption.
class CXTransaction
An object that contains zero or more action objects for a call controller to perform.
class CXStartCallAction
An encapsulation of the act of initiating an outgoing call.
Conforms To
See Also
Outgoing calls


## Page 7

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


## Page 8

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


## Page 9

class CXStartCallAction
An encapsulation of the act of initiating an outgoing call.


## Page 10

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


## Page 11

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


## Page 12

Sending End-to-End Encrypted VoIP Calls
Initiate VoIP calls when your server can’t determine whether an outgoing notification is a
request for a VoIP call due to metadata encryption.
class CXCallController
A programmatic interface for interacting with and observing calls.
class CXTransaction
An object that contains zero or more action objects for a call controller to perform.
See Also
Outgoing calls


