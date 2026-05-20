# Incoming calls.pdf

## Page 1

If your app provides Voice-over-IP (VoIP) phone services, you may use PushKit to handle incomin
calls on user devices. PushKit provides an efficient way to manage calls that doesn’t require your
app to be running to receive calls. When it detects a call for a specific user, your server sends a
push notification to the user’s device with information about that call. Upon receiving the
notification, the device wakes up your app and gives it time to notify the user and connect to your
call service.
For apps built using the iOS 13 SDK or later, PushKit requires you to use CallKit when handling Vo
calls. CallKit ensures that apps providing call-related services on a user’s device work seamlessly
together on the user’s device, and respect features like Do Not Disturb. CallKit also operates the
system’s call-related UIs, including the incoming or outgoing call screens. Use CallKit to present
these interfaces and manage interactions with them.
Important
If you are unable to support CallKit in your app, you cannot use PushKit to handle push
notifications. Instead, configure your app’s push notification support with the User
Notifications framework. If you need to do work in response to an incoming notification—for
example, to decrypt content—use a notification service extension to perform that work. For
more information about handling notifications and implementing a notification service
extension, see User Notifications.
For information about how to configure your app to app to support PushKit, see Supporting PushK
Notifications in Your App.
Overview
PushKit / Responding to VoIP Notifications from PushKit
Article
Responding to VoIP Notifications from
PushKit
Receive incoming Voice-over-IP (VoIP) push notifications and use them to display
the system call interface to the user.


## Page 2

VoIP apps must use CallKit to present the system’s call-related interfaces. You present these
interfaces using a CXProvider object, which manages user interactions for both incoming and
outgoing calls. Create a provider object early in your app’s life cycle and make it available to your
app’s call-related code.
The following code example shows how to create a provider object and assign a custom delegate
to it. Initialize the CXProvider object with a configuration object containing the details about yo
service. Assign one of your app’s custom objects as a delegate, and use that object to respond to
user actions and telephony-related changes.
Each provider object represents a single instance of your app’s phone service and facilitates
interactions with the system. Apps need only one provider object to manage phone calls for the
current user. If your service allows multiple users or multiple accounts per user, you are responsib
for mapping incoming calls to the appropriate user accounts.
Your servers handle most of the call-related work required to connect users. Each time the user
opens your app on a device, create a connection from that app to your server. When the user
initiates a phone call, use that connection to communicate the details of the call back to your
server. Your server must then try to connect the call initiator with the call recipient. If the recipient
app is running and has an active connection with the server, communicate directly with the app
using your existing connection. If the app is not running, generate a push notification to wake up
the app.
Each push notification consists of a device token and a payload with the details of the call. You
bundle this information into an HTTP request, which you then send to Apple Push Notification
service (APNs). PushKit provides the device token that you use as the target address for the user
device at configuration time.
Create a Call Provider Object to Manage Calls in Your App
Generate Push Notifications from Your Server


## Page 3

When configuring the HTTP request for VoIP push notifications, always configure your requests
with the following information:
Set the value of the apns-expiration header field to 0, or to only a few seconds. Doing so
prevents the system from delivering the notification at a much later time.
Include information about the incoming call to the JSON payload. For example, include the
unique call identifier that your server uses to track the call. Your app can use this identifier to
check in with the server later. You might also want to include information about the caller, so th
you can display that information in the incoming call UI.
For information about configuring a custom server to generate push notifications, see Setting up 
remote notification server. For information about how to send push notifications, see Sending
notification requests to APNs.
When one of your users initiates a phone call, your server must connect to your app on the
recipient’s device. If your server doesn’t have an active network connection to the app, you can a
the app to check in by sending it a push notification. Construct the push notification request on
your server and send it to APNs for delivery to the user’s device. For VoIP push notifications, the
system launches or wakes your app and delivers the notification to your app’s PKPushRegistry
object, which calls the pushRegistry(_:didReceiveIncomingPushWith:for:
completion:) method of its delegate. Use that method to display the incoming call UI and to
establish a connection to your VoIP server.
The following code example shows how you might process an incoming VoIP push notification in
your pushRegistry(_:didReceiveIncomingPushWith:for:completion:) method. Aft
extracting the call data from the notification’s payload dictionary, create a CXCallUpdate object
and pass it to the reportNewIncomingCall(with:update:completion:) method of your
app’s CXProvider object. While CallKit processes your request, establish a connection to your
VoIP server in parallel; you can always notify CallKit later if you run into problems. If CallKit handle
the call successfully, the completion block creates some custom data structures to manage that
call within the app.
Respond to VoIP Push Notifications in Your App


## Page 4

If the system allows your call to proceed, the reportNewIncomingCall(with:update:
completion:) method executes its completion block and CallKit displays the incoming call
interface. At that point, use the delegate of your CXProvider object to respond to user
interactions with the interface. For example, use your delegate to respond when the user answers
or ends the call.
Note
If you didn’t put caller information in your notification’s payload, call the reportCall(with:
updated:) method of your app’s provider object to update the calling interface. You can call
that method at any time to update calls. For example, call it after your app fetches updated
caller information from your VoIP server.
For more information about how to handle user interactions with the call interface, see the metho
of CXProviderDelegate.


## Page 5

Many things can go wrong when connecting a VoIP call, and CallKit makes it easy to handle
problems when they occur.
If the person who initiated the call hangs up, use the network connection between your app an
server to notify the app. In your app, call the reportCall(with:endedAt:reason:)
method of its CXProvider object, specifying CXCallEndedReason.remoteEnded as the
reason for the end of the call. If the incoming call interface is onscreen, CallKit updates the
interface to reflect the end of the call, and dismisses the interface.
If the recipient of a call answers before the app establishes a connection to your server, don’t
fulfill the CXAnswerCallAction object sent to the provider(_:perform:) method of yo
delegate immediately. Instead, wait until you establish a connection and then fulfill the object.
While it waits for your app to fulfill the request, the incoming call interface lets the user know
that the call is connecting, but not yet ready.
If your app fails to establish a connection to your server, call the reportCall(with:ended
At:reason:) method with the CXCallEndedReason.failed option. If the incoming call
interface is currently onscreen, the system updates it to indicate a failed call.
After sending the initial push notification, don’t send additional push notifications to cancel the ca
or communicate new details to your app. Instead, communicate with the app directly over the
network connection you established between it and your server. Using an existing network
connection is generally faster than sending a push notification, and if network conditions are poor
APNs may be unable to deliver push notifications to the device anyway.
struct PKPushType
Constants reflecting the push types you want to support.
Respond to Call Hang Ups and Failures
See Also
Push Types


## Page 6

Making and receiving VoIP calls
CXCallUpdate objects are used by the system to communicate changes to calls over time. Not
every property on a CXCallUpdate object must be set each time, as each object includes only
new and changed information. For example, when a call is started, only some properties may be
known and included in the first CXCallUpdate object sent to the system, such as localized
CallerName. Later in the same call, other properties may change; for example, a call may be
upgraded from audio only to audio and video, which would be reflected by a new CXCallUpdate
object with its hasVideo property set to true.
When an incoming call is received, you construct a CXCallUpdate object specifying a
localizedCallerName and pass that to the reportNewIncomingCall(with:update:
completion:) method to notify the telephony provider.
When an active call is updated, you construct a CXCallUpdate object specifying any updated
information and pass that to the reportCall(with:updated:) method. For example, if a use
changes their contact information during a call, you could notify the telephony provider of this
change using a new CXCallUpdate object with the new value set to its remoteHandle propert
Mentioned in
Overview
CallKit / CXCallUpdate
Class
CXCallUpdate
An encapsulation of new and changed information about a call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

var localizedCallerName: String?
The localized name of the caller.
var remoteHandle: CXHandle?
The handle for the remote party (for an incoming call, this is the caller; for an outgoing call,
this is the callee).
var hasVideo: Bool
A Boolean value that indicates whether the call includes video in addition to audio.
var supportsGrouping: Bool
A Boolean value that indicates whether the call can be grouped with other calls.
var supportsUngrouping: Bool
A Boolean value that indicates whether the call can be ungrouped from other calls.
var supportsHolding: Bool
A Boolean value that indicates whether the call can be placed on hold or removed from hold.
var supportsDTMF: Bool
A Boolean value that indicates whether the call can send DTMF (dual tone multifrequency)
tones via hard pause digits or in-call keypad entries.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Accessing Call Update Attributes
Relationships
Inherits From
Conforms To


## Page 8

Equatable
Hashable
NSCopying
NSObjectProtocol
Responding to VoIP Notifications from PushKit
Receive incoming Voice-over-IP (VoIP) push notifications and use them to display the system
call interface to the user.
class CXAnswerCallAction
An encapsulation of the act of answering an incoming call.
See Also
Incoming calls


## Page 9

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


## Page 10

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


