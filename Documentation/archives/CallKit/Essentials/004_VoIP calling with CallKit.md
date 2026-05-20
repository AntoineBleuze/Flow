# 004_VoIP calling with CallKit.pdf

## Page 1

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


## Page 2

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


