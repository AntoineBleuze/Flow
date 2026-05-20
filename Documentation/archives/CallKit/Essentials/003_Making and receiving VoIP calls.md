# 003_Making and receiving VoIP calls.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

Configure your CallKit or LiveCommunicationKit app so people can set it as the default callin
app on their device.
CallKit updates
Learn about important changes to CallKit.


