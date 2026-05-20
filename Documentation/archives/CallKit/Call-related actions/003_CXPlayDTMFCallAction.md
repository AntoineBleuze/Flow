# 003_CXPlayDTMFCallAction.pdf

## Page 1

CXPlayDTMFCallAction is a concrete subclass of CXCallAction. Whenever digits are
transmitted during a call, whether from a user interacting with a number pad or following a hard o
soft pause, the provider sends provider(_:perform:) to its delegate. The provider’s delegat
calls the fulfill() method to indicate that the action was successfully performed.
The provider sends provider(_:perform:) for successive actions only after the current actio
is fulfilled. When interacting with the number pad, each entered digit constitutes its own action.
Digits following a hard or soft pause, however, are passed to provider(_:perform:) as a sing
string of digits. For example, if a user taps the 4 button on the number pad, followed by the 2
button, the delegate is sent provider(_:perform:) for the digit 4 and waits for the action to 
fulfilled; after the action is fulfilled, the delegate is sent provider(_:perform:) for the digit 2
CallKit automatically plays the corresponding DTMF frequencies for any digits transmitted over a
call. The app is responsible for managing the timing and handling of digits as part of fulfilling the
action.
Overview
Topics
Creating New Actions
CallKit / CXPlayDTMFCallAction
Class
CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF)
sequence.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

init(call: UUID, digits: String, type: CXPlayDTMFCallAction.ActionType)
Initializes a new action for a call identified by a given UUID, as well as a specified type and
sequence of digits.
init?(coder: NSCoder)
Creates a new action to play dual-tone multifrequency (DTMF) tones with data in an
unarchiver.
var digits: String
The digits tapped by the user into the in-call keypad or included in the dial string.
var type: CXPlayDTMFCallAction.ActionType
The type of the call action.
enum ActionType
The types of events that generate dial tones.
CXCallAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Accessing Action Information
Constants
Relationships
Inherits From
Conforms To


## Page 3

NSSecureCoding
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
class CXSetTranslatingCallAction
An encapsulation of the act of translating a call.
See Also
Call-related actions


