# 002_CTCallCenter.pdf

## Page 1

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


## Page 2

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


