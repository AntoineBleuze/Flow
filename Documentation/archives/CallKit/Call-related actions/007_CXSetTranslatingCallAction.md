# 007_CXSetTranslatingCallAction.pdf

## Page 1

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


## Page 2

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


## Page 3

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


