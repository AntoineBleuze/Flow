# 005_Preparing your app to be the default calling app.pdf

## Page 1

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


## Page 2

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


## Page 3

class CXProviderConfiguration
An encapsulation of the configuration of a provider object.
Making and receiving VoIP calls
Initiate outgoing calls with VoIP and configure your app to receive incoming calls.
VoIP calling with CallKit
Use the CallKit framework to integrate native VoIP calling.
CallKit updates
Learn about important changes to CallKit.


