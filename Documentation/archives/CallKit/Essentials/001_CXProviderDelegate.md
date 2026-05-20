# 001_CXProviderDelegate.pdf

## Page 1

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


## Page 2

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


## Page 3

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


