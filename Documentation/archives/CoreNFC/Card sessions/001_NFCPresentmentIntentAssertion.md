# 001_NFCPresentmentIntentAssertion.pdf

## Page 1

Acquire an instance of this class to prevent the system default contactless app from launching in
response to a user gesture or NFC reader RF field. You do this when the person using your app
expresses an active intent to perform an NFC transaction, like choosing a credential such as a
payment card or transit pass. You can only acquire a NFCPresentmentIntentAssertion whe
your app is in the foreground state.
The presentment intent assertion expires if any of the following occur:
The presentment intent assertion object deinitializes.
Your app goes into the background.
15 seconds elapse.
After the presentment intent assertion expires, you must wait through a 15-second cool-down
period before you can acquire a new instance.
Overview
Topics
Acquiring a presentment intention instance
Core NFC / NFCPresentmentIntentAssertion
Class
NFCPresentmentIntentAssertion
An object that signals your app’s intention to make exclusive use of the device’s
contactless features.
iOS 17.4+
iPadOS 17.4+


## Page 2

static func acquire() async throws -> NFCPresentmentIntentAssertion
Acquire a presentment intent assertion instance from the system.
var isValid: Bool
A Boolean property that indicates whether the presentment intent assertion instance is still
valid.
enum Error
An error type that indicates problems with the presentment intent assertion.
Sendable, SendableMetatype
class CardSession
An ISO 7816 card emulation session.
Testing presentment intention validity
Relationships
Conforms To
See Also
Card sessions


