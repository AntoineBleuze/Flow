# Call-related actions.pdf

## Page 1

Each instance of CXAction is uniquely identified by a uuid, which is generated on initialization.
An action also tracks whether it has been completed or not.
To perform one or more actions, you add them to a new CXTransaction object and pass the
transaction to an instance of CXCallController using the request(_:completion:)
method. After each action is performed by the telephony provider, the provider’s delegate calls
either the fulfill() method, indicating that the action was successfully performed, or the
fail() method, to indicate that an error occurred; both of these methods set the isComplete
property of the action to true.
The CXCallAction subclass is an abstract class that represents an action associated with a
CXCall object. The CallKit framework provides several concrete CXCallAction subclasses to
represent actions such as answering a call and putting a call on hold.
init()
Initializes a new telephony action.
Overview
Topics
Creating an Action
CallKit / CXAction
Class
CXAction
An abstract class that declares a programmatic interface for objects that represen
a telephony action.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

init?(coder: NSCoder)
Creates a new telephony action with data in an unarchiver.
var uuid: UUID
The unique identifier for the action.
var isComplete: Bool
A Boolean value that indicates whether the action has been performed by the provider.
var timeoutDate: Date
The time after which the action cannot be completed.
func fulfill()
Reports the successful execution of the action.
func fail()
Reports the failed execution of the action.
NSObject
CXCallAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Accessing Action Attributes
Completing Actions
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
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


## Page 4

The CallKit framework provides the following concrete CXCallAction subclasses.
CXCallAction subclass
Description
CXAnswerCallAction
Answers an incoming call.
CXStartCallAction
Initiates an outgoing call.
CXEndCallAction
Ends a call.
CXSetHeldCallAction
Places a call on hold or removes a call from hold.
CXSetGroupCallAction
Groups a call with another call or removes a call from a
group.
CXSetMutedCallAction
Mutes or unmutes a call.
CXSetTranslatingCall
Action
Starts or stops call translation.
CXPlayDTMFCallAction
Plays a DTMF (dual tone multifrequency) tone sequence on
a call.
Overview
CallKit / CXCallAction
Class
CXCallAction
A programmatic interface for objects that represent a telephony action associated
with a call object.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 5

To perform one or more actions, you add them to a new CXTransaction object and pass the
transaction to an instance of CXCallController using the request(_:completion:)
method. After each action is performed by the telephony provider, the provider’s delegate calls
either the CXCallAction method, indicating that the action was successfully performed, or the
CXCallAction method, to indicate that an error occurred; both of these methods set the CXCal
Action property of the action to true.
init(call: UUID)
Initializes a new action for a call identified by a given UUID.
init?(coder: NSCoder)
Creates a new action for a call with data in an unarchiver.
var callUUID: UUID
The unique identifier for the call associated with the action.
CXAction
CXAnswerCallAction
CXEndCallAction
CXPlayDTMFCallAction
CXSetGroupCallAction
CXSetHeldCallAction
CXSetMutedCallAction
CXSetTranslatingCallAction
CXStartCallAction
Topics
Creating New Call Actions
Accessing Call Action Attributes
Relationships
Inherits From
Inherited By


## Page 6

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
class CXSetTranslatingCallAction
An encapsulation of the act of translating a call.
Conforms To
See Also
Call-related actions


## Page 7



## Page 8

CXEndCallAction is a concrete subclass of CXCallAction. When the user initiates an
outgoing call, the provider sends provider(_:perform:) to its delegate. The provider’s
delegate calls the fulfill() method to indicate that the action was successfully performed. To
indicate that the call ended at a time other than the current time, you can instead call the
fulfill(withDateEnded:)
func fulfill(withDateEnded: Date)
Reports the successful execution of the action at the specified time.
Overview
Topics
Completing Actions
Relationships
Inherits From
CallKit / CXEndCallAction
Class
CXEndCallAction
An encapsulation of the act of ending a call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 9

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
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
class CXSetTranslatingCallAction
Conforms To
See Also
Call-related actions


## Page 10

An encapsulation of the act of translating a call.


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

CXSetGroupCallAction is a concrete subclass of CXCallAction. When the user or the
system groups a call with another call, the provider sends provider(_:perform:) to its
delegate. The provider’s delegate calls the fulfill() method to indicate that the action was
successfully performed. A group call allows more than two recipients to simultaneously
communicate with one another.
init(call: UUID, callUUIDToGroupWith: UUID?)
Initializes a new action for a call identified by a given UUID, as well as a call to group with
identified by another UUID.
init?(coder: NSCoder)
Creates a new action to group calls with data in an unarchiver.
Overview
Topics
Creating New Actions
Accessing Action Attributes
CallKit / CXSetGroupCallAction
Class
CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 15

var callUUIDToGroupWith: UUID?
The unique identifier of the call to be grouped with the call associated with the receiver.
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
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
Relationships
Inherits From
Conforms To
See Also
Call-related actions


## Page 16

An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
class CXSetTranslatingCallAction
An encapsulation of the act of translating a call.


## Page 17

CXSetHeldCallAction is a concrete subclass of CXCallAction.
When a caller places a call on hold, callers are unable to communicate with one another until the
holding caller removes the call from hold. Placing a call on hold doesn’t end the call.
When the user or the system places a call on hold, the provider sends provider(_:perform:)
to its delegate. The provider’s delegate calls the fulfill() method to indicate that the action
was successfully performed.
init(call: UUID, onHold: Bool)
Initializes a new action for a call identified by a given UUID, as well as whether the call is on
hold.
init?(coder: NSCoder)
Creates a new action to place a call on hold with data in an unarchiver.
Overview
Topics
Creating New Actions
CallKit / CXSetHeldCallAction
Class
CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 18

var isOnHold: Bool
A Boolean value that indicates whether the call is placed on hold.
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
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
Accessing Action Information
Relationships
Inherits From
Conforms To
See Also
Call-related actions


## Page 19

class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
class CXSetTranslatingCallAction
An encapsulation of the act of translating a call.


## Page 20

CXSetMutedCallAction is a concrete subclass of CXCallAction. When the user or the
system mutes a call, the provider sends provider(_:perform:) to its delegate. The provider’
delegate calls the fulfill() method to indicate that the action was successfully performed.
When a caller mutes a call, that caller is unable to communicate with other callers until they unmu
the call. A muted caller still receives communication from other unmuted callers.
convenience init(call: UUID, muted: Bool)
Initializes a new action for a call identified by a given UUID, as well as whether the call is
muted.
init?(coder: NSCoder)
Creates a new action for a call with data in an unarchiver.
Overview
Topics
Creating New Actions
Accessing Action Attributes
CallKit / CXSetMutedCallAction
Class
CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+
watchOS 9.0+


## Page 21

var isMuted: Bool
A Boolean value that indicates whether the call is muted.
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
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
Relationships
Inherits From
Conforms To
See Also
Call-related actions


## Page 22

An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetTranslatingCallAction
An encapsulation of the act of translating a call.


## Page 23

CXSetTranslatingCallAction is a concrete subclass of CXCallAction. When a caller
chooses to translate a conversation, the system provides translated captions, and a translated
transcript of the call and the CXProvider sends the provider(_:perform:) to its delegate.
The provider’s delegate calls the fulfill() method to indicate that the action was successfully
performed.
Important
To avoid interrupting or impeding call translation when a person mutes their audio during a
conversation, don’t deactivate the upstream audio. Instead, mute your app’s audio input using
CXSetMutedCallAction and keep the upstream audio active to allow translated audio to
flow when a person mutes the hardware microphone.
init?(coder: NSCoder)
Creates a new action to start or stop translating a call with the provided data.
Overview
Topics
Creating New Actions
CallKit / CXSetTranslatingCallAction
Class
CXSetTranslatingCallAction
An encapsulation of the act of translating a call.
iOS 26.0+
iPadOS 26.0+


## Page 24

var isTranslating: Bool
A value that indicates whether translation is active for a call.
enum CXTranslationEngine
Values that describe the translation engine that provided a translation.
init(call: UUID, isTranslating: Bool, localLanguage: String, remote
Language: String)
var localLanguage: String
var remoteLanguage: String
func fulfill(using: CXTranslationEngine)
CXCallAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Accessing Action Attributes
Completing Actions
Initializers
Instance Properties
Instance Methods
Relationships
Inherits From
Conforms To


## Page 25

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CXAction
An abstract class that declares a programmatic interface for objects that represent a
telephony action.
class CXCallAction
A programmatic interface for objects that represent a telephony action associated with a cal
object.
class CXEndCallAction
An encapsulation of the act of ending a call.
class CXPlayDTMFCallAction
An encapsulation of the act of playing a dual tone multifrequency (DTMF) sequence.
class CXSetGroupCallAction
An encapsulation of the act of grouping or ungrouping calls.
class CXSetHeldCallAction
An encapsulation of the act of placing a call on hold or removing a call from hold.
class CXSetMutedCallAction
An encapsulation of the act of muting or unmuting a call.
See Also
Call-related actions


