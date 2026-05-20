# Essentials.pdf

## Page 1

Making and receiving VoIP calls
A CXProvider object is responsible for reporting out-of-band notifications that occur to the
system. A VoIP app should create only one instance of CXProvider and store it for use globally. 
CXProvider object is initialized with a CXProviderConfiguration object to specify the
behavior and capabilities of calls. Each provider can specify an object conforming to the
CXProviderDelegate protocol to respond to events, such as the call starting, the call being pu
on hold, or the provider’s audio session being activated.
CXProvider is not intended for subclassing.
Mentioned in
Overview
Subclassing Notes
Topics
Creating New Providers
CallKit / CXProvider
Class
CXProvider
An object that represents a telephony provider.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

init(configuration: CXProviderConfiguration)
Initializes a new provider with the specified configuration.
func setDelegate((any CXProviderDelegate)?, queue: dispatch_queue_t?)
Sets a provider delegate, specifying an optional queue on which to execute delegate method
var configuration: CXProviderConfiguration
The configuration of the provider.
var pendingTransactions: [CXTransaction]
Incomplete transactions.
func pendingCallActions(of: AnyClass, withCall: UUID) -> [CXCallAction]
Returns all call actions in any pending transactions of the specified class for the specified ca
identifier that are incomplete.
func reportNewIncomingCall(with: UUID, update: CXCallUpdate, completion
((any Error)?) -> Void)
Reports a new incoming call with the specified unique identifier to the provider.
class func reportNewIncomingVoIPPushPayload([AnyHashable : Any],
completion: (((any Error)?) -> Void)?)
Reports a new incoming call after your notification service extension decrypts a VoIP call
request.
com.apple.developer.usernotifications.filtering
Enable receiving notifications without displaying the notification to the user.
func reportOutgoingCall(with: UUID, startedConnectingAt: Date?)
Reports to the provider that an outgoing call with the specified unique identifier started
connecting at a particular time.
func reportOutgoingCall(with: UUID, connectedAt: Date?)
Setting the Delegate
Accessing Provider Attributes
Accessing Pending Transaction and Call Actions
Reporting Calls


## Page 3

Reports to the provider that an outgoing call with the specified unique identifier finished
connecting at a particular time.
func reportCall(with: UUID, updated: CXCallUpdate)
Reports to the provider that an active call updated its information.
func reportCall(with: UUID, endedAt: Date?, reason: CXCallEndedReason)
Reports to the provider that a call with the specified identifier ended at a given date for a
particular reason.
func invalidate()
Invalidates the provider and completes all active calls with an error.
enum CXCallEndedReason
The reason that a call ended.
struct CXError
Error codes for the CallKit errors.
enum Code
Error codes for the CallKit errors.
struct CXErrorCodeIncomingCallError
Codes for errors that occur during incoming calls.
enum Code
Codes for errors that occur during incoming calls.
struct CXErrorCodeNotificationServiceExtensionError
Errors that can occur when reporting new, incoming VoIP calls.
let CXErrorDomain: String
The domain for CallKit errors.
let CXErrorDomainIncomingCall: String
The domain for errors that occur during incoming calls.
Invalidating a Provider
Handling Errors


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CXProviderDelegate
A collection of methods that a telephony provider object calls.
class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
Preparing your app to be the default calling app
Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 5

Learn about important changes to CallKit.


## Page 6

The CXProviderDelegate protocol defines a set of methods that are called by an object that
represents a telephony provider it begins or resets, requests a transaction, performs an action, or
an audio session changes its activation state.
func providerDidBegin(CXProvider)
Called when the provider begins.
func providerDidReset(CXProvider)
Called when the provider is reset.
Required
func provider(CXProvider, execute: CXTransaction) -> Bool
Called when a transaction is executed by a call controller.
Overview
Topics
Handling Provider Events
Determining the Execution of Transactions
CallKit / CXProviderDelegate
Protocol
CXProviderDelegate
A collection of methods that a telephony provider object calls.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

func provider(CXProvider, perform: CXStartCallAction)
Called when the provider performs the specified start call action.
func provider(CXProvider, perform: CXAnswerCallAction)
Called when the provider performs the specified answer call action.
func provider(CXProvider, perform: CXEndCallAction)
Called when the provider performs the specified end call action.
func provider(CXProvider, perform: CXSetHeldCallAction)
Called when the provider performs the specified set held call action.
func provider(CXProvider, perform: CXSetMutedCallAction)
Called when the provider performs the specified set muted call action.
func provider(CXProvider, perform: CXSetGroupCallAction)
Called when the provider performs the specified set group call action.
func provider(CXProvider, perform: CXPlayDTMFCallAction)
Called when the provider performs the specified play DTMF (dual tone multifrequency) call
action.
func provider(CXProvider, perform: CXSetTranslatingCallAction)
Called when the provider performs the specified set translation action.
func provider(CXProvider, timedOutPerforming: CXAction)
Called when the provider performs the specified action times out.
func provider(CXProvider, didActivate: AVAudioSession)
Called when the provider’s audio session is activated.
func provider(CXProvider, didDeactivate: AVAudioSession)
Called when the provider’s audio session is deactivated.
Handling Call Actions
Handling Changes to Audio Session Activation State
Relationships


## Page 8

NSObjectProtocol
class CXProvider
An object that represents a telephony provider.
class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
Preparing your app to be the default calling app
Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Learn about important changes to CallKit.
Inherits From
See Also
Essentials


## Page 9

A CXProviderConfiguration object controls the native call UI for incoming and outgoing cal
including a localized name for the provider, the ringtone to play for incoming calls, and the icon to
display during calls. A provider configuration can also set the maximum number of call groups and
the number of calls in a single call group, determine whether to use emails and phone numbers as
handles, and specify whether to support video.
init()
Creates the configuration of a provider object.
convenience init(localizedName: String)
Initializes a configuration with the specified localized name.
Deprecated
Overview
Topics
Creating New Configurations
Configuring Native Call UI
CallKit / CXProviderConfiguration
Class
CXProviderConfiguration
An encapsulation of the configuration of a provider object.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
macOS 11.0+
visionOS 1.0+
watchOS 9.0+


## Page 10

var localizedName: String?
The localized name of the provider.
Deprecated
var ringtoneSound: String?
The name of the sound resource in the app bundle to be used for the provider ringtone.
var iconTemplateImageData: Data?
The PNG data for the icon image to be displayed for the provider.
var maximumCallGroups: Int
The maximum number of call groups.
var maximumCallsPerCallGroup: Int
The maximum number of calls per call group.
var supportedHandleTypes: Set<CXHandle.HandleType>
The supported handle types.
var supportsVideo: Bool
A Boolean value that indicates whether the provider supports video in addition to audio.
var includesCallsInRecents: Bool
A Boolean value that indicates whether the provider includes a call in the system’s Recents li
after the call ends.
var supportsAudioTranslation: Bool
NSObject
Configuring Call Capabilities
Instance Properties
Relationships
Inherits From


## Page 11

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class CXProvider
An object that represents a telephony provider.
protocol CXProviderDelegate
A collection of methods that a telephony provider object calls.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
Preparing your app to be the default calling app
Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Learn about important changes to CallKit.
Conforms To
See Also
Essentials


## Page 12

You can handle outgoing calls in your app by providing information about the recipient and initiati
the call. To receive incoming calls, you can configure your app to respond to an external VoIP
notification.
Initiate an outgoing call with a VoIP app in any of the following ways:
Perform an interaction within the app.
Open a link with a supported custom URL scheme.
Begin a VoIP call using Siri.
For more information about registering and handling URLs, see Defining a custom URL scheme fo
your app. For more information about initiating a call using Siri, see the INStartCallIntent
Handling protocol.
To make an outgoing call, request a CXStartCallAction object. The action consists of a UUID
to uniquely identify the call and a CXHandle object to specify the recipient, as shown in the
following example from the VoIP calling with CallKit sample code project:
Overview
Make outgoing calls
CallKit / Making and receiving VoIP calls
Article
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.


## Page 13

The CXHandle object specifies metadata for the outgoing call. In the example above, it uses an
email address. The system on the receiving device uses this metadata to display caller informatio
in the CallKit interface by looking for a matching contact in the recipient’s Contacts app. If the
system finds a match, the CallKit interface uses the matching contact data to display the name an
a photo as a poster or contact icon. If the recipient’s system can’t find a matching contact in the
Contacts app and you provide a Call Directory app extension, it uses the extension to identify the
caller and display rich contact information in the CallKit interface. For more information about
creating a Call Directory app extension, see Identifying and blocking calls.
After you request to start a VoIP call using a CXTransaction, you need to wait for confirmation
from the system to actually start the call. After you requested a call as shown in the example abov
the system calls your provider delegate’s provider(_:perform:) method to let you know that
accepted the CXTransaction you created and that you can start your VoIP session. In your
implementation of the provider(_:perform:) callback method, configure an AVAudio
Session and call the fulfill() method on the action object when it finishes, as shown in the
following code snippet from the VoIP calling with CallKit sample code project:


## Page 14

To configure your app to receive incoming calls, first create a CXProvider object and store it for
global access. An app reports an incoming call to the provider in response to an external
notification, such as a VoIP push notification from PushKit, with the pushRegistry(_:did
ReceiveIncomingPushWith:for:completion:) and pushRegistry(_:didReceive
IncomingPushWith:for:completion:) callbacks.
Note
For more information about VoIP push notifications and PushKit, see Supporting PushKit
Notifications in Your App.
Using the information from the external notification in the callback, the app creates a UUID and a
CXCallUpdate object to uniquely identify the call and the caller. Then it passes them both to the
provider using the reportNewIncomingCall(with:update:completion:) method to
report the incoming call.
Receive incoming calls


## Page 15

After the call connects, the system calls the provider(_:perform:) method of the provider
delegate. In your implementation, the delegate is responsible for configuring an AVAudioSessio
to initiate the audio for a call and calling fulfill() on the action when it finishes.
class CXProvider
An object that represents a telephony provider.
protocol CXProviderDelegate
A collection of methods that a telephony provider object calls.
class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
Preparing your app to be the default calling app
See Also
Essentials


## Page 16

Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Learn about important changes to CallKit.


## Page 17

Note
This sample code project is associated with WWDC16 session 230: Enhancing VoIP Apps with
CallKit.
This sample code project must be run on a physical device.
Before you run the sample code project in Xcode, check to be sure your device has iOS 13 or late
or iPadOS 13 or later installed.
class CXProvider
An object that represents a telephony provider.
Overview
Configure the Sample Code Project
See Also
Essentials
CallKit / VoIP calling with CallKit
Sample Code
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
Download
iOS 13.0+
iPadOS 13.0+
watchOS 9.0+
Xcode 14.0+


## Page 18

protocol CXProviderDelegate
A collection of methods that a telephony provider object calls.
class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
Preparing your app to be the default calling app
Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Learn about important changes to CallKit.


## Page 19

In iOS and iPadOS 18.2 and later, a person may select an app other than the Phone app or
FaceTime to handle calls. A calling app handles tel: URLs the system sends to it. For example,
when someone selects your app as the default calling app, tapping on a telephone number in a
contact card initiates an attempt to place the call using your app.
If your app places phone calls and you wish to optionally become the default calling app, there are
several steps you need to take.
Add the com.apple.developer.calling-app entitlement to the .entitlements file in yo
app’s Xcode project. For instructions on how to add this entitlement, see Default Calling
App.
If starting a VoIP conversation fails, you may wish to have the conversation fall back to the system
to handle it. While optional, providing a fallback gives people another opportunity to have the
conversation. When you let the conversation fall back to the system, it handles the conversation a
a cellular network conversation. To provide a fallback, adopt the telephony: URL scheme as the
fallback handler for the scene(_:continue:) delegate callback. For example:
Overview
Add the Default Calling App entitlement to your project
Apply the fallback URL scheme in your app
CallKit / Preparing your app to be the default calling app
Article
Preparing your app to be the default calling
app
Configure your CallKit or LiveCommunicationKit app so people can set it as the
default calling app on their device.


## Page 20

Note
Only use the telephony: URL scheme as a fallback behavior in response to a person’s
explicit action in your app, such as clicking a call button after your app presents the proposed
number to call.
For more information on VoIP calling related intents, see INStartCallIntent.
To submit your app to App Store Connect, your app needs to meet the following criteria:
The com.apple.developer.calling-app entitlement is in its .entitlements file, and
it’s set to a value of true.
The Info.plist file has the UIBackgroundModes property array and contains an entry wit
the string voip.
Your app links to either the CallKit or LiveCommunicationKit frameworks.
Tip
To add a voip entry in the Info.plist file’s UIBackgroundModes property array, select
the “App provides Voice over IP services” option from the dropdown menu.
class CXProvider
An object that represents a telephony provider.
protocol CXProviderDelegate
A collection of methods that a telephony provider object calls.
Prepare your app for submission to App Store Connect
See Also
Essentials


## Page 21

class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
CallKit updates
Learn about important changes to CallKit.


## Page 22

Browse notable changes in CallKit.
Configure a call to include an option to use the system’s translation capabilities with a CXSet
TranslatingCallAction.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
Overview
June 2025
See Also
Technology updates
Updates / CallKit updates
Article
CallKit updates
Learn about important changes to CallKit.


## Page 23

App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


