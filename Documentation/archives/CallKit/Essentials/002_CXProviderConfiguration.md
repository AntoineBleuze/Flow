# 002_CXProviderConfiguration.pdf

## Page 1

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


## Page 2

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


## Page 3

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


