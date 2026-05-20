# Deprecated.pdf

## Page 1

Deprecated
Deprecated with no replacement
var allowsVOIP: Bool
Indicates if the carrier allows making VoIP calls on its network.
var carrierName: String?
The name of the user’s home cellular service provider.
var isoCountryCode: String?
The ISO country code for the user’s cellular service provider.
var mobileCountryCode: String?
The mobile country code (MCC) for the user’s cellular service provider.
var mobileNetworkCode: String?
Topics
Getting Information About the Cellular Service Provider
Core Telephony / CTCarrier Deprecated
Class
CTCarrier Deprecated
Information about the user’s cellular service provider, such as its unique identifier
and whether it allows VoIP calls on its network.
iOS 4.0–16.0 Deprecated
iPadOS 4.0–16.0 Deprecated
Mac Catalyst 13.1–16.0 Deprecated


## Page 2

The mobile network code for the user’s cellular service provider.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CTCall
An object used to identify a cellular call and determine its state.
Deprecated
class CTCallCenter
An object that provides a list of current cellular calls, and provides the ability to respond to
state changes for calls.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Deprecated


## Page 3

Deprecated
Getting call information in Core Telephony is no longer supported. Use CallKit instead.
var callID: String
A unique identifier for the cellular call.
var callState: String
The state of the cellular call.
Cellular Call States
States of cellular calls; one of dialing, incoming, connected, or disconnected.
Topics
Obtaining Information About a Cellular Call
Getting Cellular Call State
Core Telephony / CTCall Deprecated
Class
CTCall Deprecated
An object used to identify a cellular call and determine its state.
iOS 4.0–10.0 Deprecated
iPadOS 4.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CTCarrier
Information about the user’s cellular service provider, such as its unique identifier and wheth
it allows VoIP calls on its network.
Deprecated
class CTCallCenter
An object that provides a list of current cellular calls, and provides the ability to respond to
state changes for calls.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Deprecated


## Page 5

Deprecated
Getting call information in Core Telephony is no longer supported. Use CallKit instead.
var callEventHandler: ((CTCall) -> Void)?
A closure dispatched when a call changes state.
var currentCalls: Set<CTCall>?
An array representing the cellular calls in progress.
NSObject
Topics
Responding to Cellular Call Events
Relationships
Inherits From
Core Telephony / CTCallCenter Deprecated
Class
CTCallCenter Deprecated
An object that provides a list of current cellular calls, and provides the ability to
respond to state changes for calls.
iOS 4.0–10.0 Deprecated
iPadOS 4.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated


## Page 6

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CTCarrier
Information about the user’s cellular service provider, such as its unique identifier and wheth
it allows VoIP calls on its network.
Deprecated
class CTCall
An object used to identify a cellular call and determine its state.
Deprecated
Conforms To
See Also
Deprecated


