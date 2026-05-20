# 000_CardSession.pdf

## Page 1

Use an instance of CardSession to perform ISO 7816-4 protocol communication with an NFC
reader, receiving and responding to Application Protocol Data Units (APDUs) in your app.
CardSession supports host card emulation (HCE) transactions for in-store payments, car keys,
closed-loop transit, corporate badges, hotel keys, merchant loyalty/rewards and event tickets in t
European Economic Area (EEA).
Use a card session to perform card emulation when in the presence of an NFC reader. You do this
by managing the session as follows:
1. Verify that the system is eligible to use CardSession. Check NFCReaderSession.reading
Available and CardSession.isSupported to ensure that the device supports card
sessions with NFC. Also check CardSession.isEligible to verify that the system support
card session use in the current environment. Don’t continue unless all of these values are true
2. Create a card session with init() and begin iterating over events from the session’s event
Stream. Starting the session acquires necessary system resources and posts CardSession
.Event.sessionStarted to the event stream when the app acquires the NFC resource. Aft
this, the session sends the CardSession.Event.readerDetected event when the device
detects the RF field of an NFC reader.
3. Start card emulation by calling startEmulation() when your app is ready to handle APDUs
from the reader. You typically do this after receiving the CardSession.Event.reader
Detected, but you can start emulation regardless of whether a reader is present. After you sta
Overview
Core NFC / CardSession
Class
CardSession
An ISO 7816 card emulation session.
iOS 17.4+
iPadOS 17.4+


## Page 2

emulation, the reader (if present) can communicate with the card, and emulation triggers the
system modal UI to display over the app.
4. At this point, begin receiving and processing APDUs from the event stream. Process the APDU
payload in each event, generate a response, and send it with respond(response:). If you
don’t respond in a timely manner to every event, the reader might treat it as a timeout conditio
and fail with an error.
5. Use the alertMessage property to provide updates to the person using the app as the
communication continues.
6. If the reader disconnects, possibly because of the device moving away from the reader, handle
the event CardSession.Event.readerDeselected.
7. Stop card emulation by calling stopEmulation(status:). This shuts down the RF interface
and cuts off the RF connection with a reader if one exists.
8. Invalidate the session with invalidate(), which cleans up system resources.
The following example shows a simple interaction with a card session. It attempts to acquire both
NFCPresentmentIntentAssertion and a CardSession. If both of these succeed, it uses a
for-await-in loop to process events from the session’s eventStream as it receives them.


## Page 3



## Page 4

Card emulation is valid for up to 60 seconds from the startEmulation() call. Once the sessio
timeout occurs, the eventStream posts the event CardSession.Event.session
Invalidated(reason:) with a reason of CardSession.Error.maxSessionDuration
Reached. At this point, the session becomes invalidated.
Your app must have the following entitlements to use CardSession:
com.apple.developer.nfc.hce
A Boolean value that indicates this app can use card sessions.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
A string array of ISO 7816 identifier strings that your app listens for when receiving the
SELECT command from the reader. These strings can be fully-qualified Application Identifier
(AID) strings, Registered Application Provider Identifier (RID) strings, or prefix strings. Any
prefix strings must be at least as long as the RID.
If your app lacks a required entitlement, init() raises fatalError(_:file:line:). To avoid
this, check the isSupported and isEligible properties before attempting to create a card
session.
Optionally, your app may have the com.apple.developer.nfc.hce.default-
contactless-app entitlement. A value of YES indicates that a person can use the iOS settings
app to set this app as a default NFC contactless app.
For more information and to apply for these entitlements, visit HCE-based contactless transaction
for banking and wallet apps in the European Economic Area.
Important
Use of this entitlement is managed by Apple. It is subject to the terms and conditions agreed
to as part of the application process.
To test HCE-based contactless transactions, you’ll need to test with an iPhone and NFC hardware
CardSession requires the presence of an NFC reader, which isn’t supported in Simulator, to
perform an ISO 7816 card emulation session.
Handling emulation duration
Using entitlements
Testing requirements


## Page 5

To learn more about CardSession requirements, see HCE-based contactless transactions for
banking and wallet apps in the European Economic Area.
init() async throws
Creates a contactless card session.
enum Error
An error type that indicates problems with a card session.
class var isSupported: Bool
A property that indicates whether the current device supports card session functionality.
static var isEligible: Bool
A property that indicates whether the current system supports card session functionality.
func startEmulation() async throws
Start the card emulation and present a modal user interface to the person using the app.
enum Error
An error type that indicates problems with a card session.
func stopEmulation(status: CardSession.EmulationUIStatus) async
Stop card emulation and display a status.
enum EmulationUIStatus
The final status to show in the user interface when ending card emulation.
var isEmulationInProgress: Bool
A Boolean value that indicates whether emulation is currently active.
Topics
Creating a card session
Determining card session availability
Managing card emulation
Handling card events


## Page 6

var eventStream: CardSession.EventStream
An asynchronous sequence of events from the card session.
class EventStream
An asynchronous sequence of events produced by a card session.
enum Event
A type that enumerates events produced by a card session.
var alertMessage: String
A message to show on the alert action sheet after card emulation starts.
func invalidate()
Invalidates the current card emulation session.
com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.
class APDU
An Application Programming Data Unit (APDU) received from the NFC card reader.
Updating the user interface
Ending a card session
Entitlements
Classes
See Also


## Page 7

class NFCPresentmentIntentAssertion
An object that signals your app’s intention to make exclusive use of the device’s contactless
features.
Card sessions


