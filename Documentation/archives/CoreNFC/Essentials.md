# Essentials.pdf

## Page 1

This sample code project shows how to use Core NFC in an app to read Near Field Communicatio
(NFC) tags of types 1 through 5 that contains NFC Data Exchange Format (NDEF) data. To use thi
sample, download the project and build it using Xcode. Run the sample app on your iPhone. Tap t
Scan button to start scanning for tags, then hold the phone near an NFC tag.
To read a tag, the sample app creates an NFC NDEF reader session and provides a delegate. The
running reader session polls for NFC tags and calls the delegate when it finds tags that contain
NDEF messages, passing the messages to the delegate. The delegate then stores the messages 
the user can view them later.
Begin building your tag reader by configuring your app to detect NFC tags. Turn on Near Field
Communication Tag Reading under the Capabilities tab for the project’s target (see Add a capabil
to a target). This step:
Adds the NFC tag-reading feature to the App ID.
Adds the Near Field Communication Tag Reader Session Formats Entitlemen
to the entitlements file.
Next, add the NFCReaderUsageDescription key as a string item to the Info.plist file. For
the value, enter a string that describes the reason the app needs access to the device’s NFC
reader. If the app attempts to read a tag without providing this key and string, the app exits.
Overview
Configure the App to Detect NFC Tags
Core NFC / Building an NFC Tag-Reader App
Sample Code
Building an NFC Tag-Reader App
Read NFC tags with NDEF messages in your app.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 11.0+


## Page 2

Create an NFCNDEFReaderSession object by calling the init(delegate:queue:
invalidateAfterFirstRead:) initializer method and passing in:
The reader session delegate object.
The dispatch queue to use when calling methods on the delegate.
The invalidateAfterFirstRead flag to determine whether the reader session reads only 
single tag or multiple tags.
After creating the reader session, give instructions to the user by setting the alertMessage
property. For example, you might tell users, “Hold your iPhone near the item to learn more about i
The system displays this message to the user while the phone is scanning for NFC tags. Finally, ca
begin() to start the reader session. This enables radio-frequency polling on the phone, and the
phone begins scanning for tags.
The sample app starts a reader session when the user taps the Scan button. The app configures
the reader session to invalidate the session after reading the first tag. To read additional tags, the
user taps the Scan button again.
The reader session requires a delegate object that conforms to the NFCNDEFReaderSession
Delegate protocol. Adopting this protocol allows the delegate to receive notifications from the
reader session when it:
Start a Reader Session
Adopt the Reader Session Delegate Protocol


## Page 3

Reads an NDEF message
Becomes invalid due to ending the session or encountering an error
Each time the reader session retrieves a new NDEF message, the session sends the message to
the delegate by calling the readerSession(_:didDetectNDEFs:) method. This is the app’s
opportunity to do something useful with the data. For instance, the sample app stores the messag
so the user can view it later.
When a reader session ends, it calls the delegate method readerSession(_:didInvalidate
WithError:) and passes in an error object that gives the reason for ending the session. Possib
reasons include:
The phone successfully read an NFC tag with a reader session configured to invalidate the
session after reading the first tag. The error code is NFCReaderError.Code.reader
SessionInvalidationErrorFirstNDEFTagRead.
The user canceled the session, or the app called invalidate() to end the session. The erro
code is NFCReaderError.Code.readerSessionInvalidationErrorUserCanceled.
An error occurred during the reader session. See NFCReaderError.Code for the complete li
of error codes.
In the sample app, the delegate displays an alert when the reader session ends for any reason
other than reading the first tag during a single-tag reader session, or the user canceling the
session. Also, you cannot reuse an invalidated reader session, so the sample app sets self
.session to nil.
Read an NDEF Message
Handle an Invalid Reader Session


## Page 4

To write to a tag, the sample app starts a new reader session. This session must be active to write
an NDEF message to the tag, so this time, invalidateAfterFirstRead is set to false,
preventing the session from becoming invalid after reading the tag.
When the reader session detects a tag, it calls the readerSession(_:didDetectNDEFs:)
delegate method. However, because the session doesn’t become invalid after reading the first tag
it’s possible for the session to detect more than one tag. The sample app writes to one tag only, s
it checks that the session detected only one tag. If the session detected more than one, the app
asks the user to remove the tags, and then restarts polling to scan for a new tag.
Write an NDEF Message


## Page 5

After the app confirms that it has only one tag, it connects to the tag and verifies that it’s writable
The app then writes the NDEF message it read earlier to the tag.


## Page 6

To learn how to set up your app to process tags that iOS reads in the background, see Adding
Support for Background Tag Reading.
Adding Support for Background Tag Reading
Allow users to scan NFC tags without an app using background tag reading.
NFCReaderUsageDescription
A message that tells people why the app is requesting access to the device’s NFC hardware
Support Background Tag Reading
See Also
Essentials


## Page 7

On iPhones that support background tag reading, the system scans for and reads NFC data witho
requiring users to scan tags using an app. The system displays a pop-up notification each time it
reads a new tag. After the user taps the notification, the system delivers the tag data to the
appropriate app. If the iPhone is locked, the system prompts the user to unlock the phone before
providing the tag data to the app.
Note
iPhone XS and later support background tag reading.
To avoid unintentional tag reading, the system reads tags in the background only when the user’s
iPhone is in use. Also, be aware there are times when the display is on and background tag readin
is unavailable, such as if:
The device has never been unlocked.
A Core NFC reader session is in progress.
Apple Pay Wallet is in use.
The camera is in use.
Airplane mode is enabled.
Overview
Process Scanned Tags
Core NFC / Adding Support for Background Tag Reading
Article
Adding Support for Background Tag
Reading
Allow users to scan NFC tags without an app using background tag reading.


## Page 8

After the device scans an NFC tag while in background tag reading mode, the system inspects th
tag’s NDEF message for a URI record by looking for an NFCNDEFPayload object with the followin
property values:
typeNameFormat equal to NFCTypeNameFormat.nfcWellKnown
type equal to “U”
If the NDEF message contains more than one URI record, the system uses the first one. The URI
record must contain either a universal link or a supported URL scheme.
For universal links, the system launches (or brings to the foreground) the app associated with the
universal link after the user taps the notification. The system sends the NDEF message to the app
as an NSUserActivity object. If there are no installed apps associated with the universal link, t
system opens the link in Safari.
The system processes NDEF payloads containing a URI for a URL scheme in the same way as
universal links. The system displays a notification after reading the tag. When the user taps the
notification, the system launches the app that supports the URL scheme.
Background tag reading supports the following URL schemes:
URL Scheme
Example
Website URL
(HTTP/HTTPS)
https://www.example.com
Email
mailto:user@example.com
SMS
sms:+14085551212
Telephone
tel:+14085551212
FaceTime
facetime://user@example.com
FaceTime Audio
facetime-audio://user@example.com
Maps
http://maps.apple.com/?
address=Apple%20Park,Cupertino,California
HomeKit Accessory Setup
X-HM://12345
Use Universal Links
Use URL Schemes


## Page 9

For more information on URL schemes, see Apple URL Scheme Reference.
Note
Background tag reading doesn’t support custom URL schemes. Use universal links instead.
Add support for background tag reading to your app by turning on Associated Domains under the
project’s Capabilities tab. This step adds the Associated Domains Entitlement to your
project’s entitlement file and to the app ID. Next, enter the domain for each universal link supporte
by your app.
To handle the NDEF message read from the tag, implement the application(_:continue:
restorationHandler:) method in your app delegate. The system calls this method to deliver
the tag data to your app in an NSUserActivity object. The user activity has an activityTyp
of NSUserActivityTypeBrowsingWeb, and the tag data is available in the ndefMessage
Payload property.
For user activities not generated by background tag reading, ndefMessagePayload returns a
message that contains only one NFCNDEFPayload record. That record has a typeNameFormat
of NFCTypeNameFormat.empty.
Configure Your App
Handle Tag Delivery


## Page 10

Listing 1. Process data from a tag read in the background
Not all devices support background tag reading, so be sure to provide the user the option to read
tags directly from your app. For more information, see Building an NFC Tag-Reader App.
Building an NFC Tag-Reader App
Read NFC tags with NDEF messages in your app.
NFCReaderUsageDescription
See Also
Essentials


## Page 11

A message that tells people why the app is requesting access to the device’s NFC hardware


## Page 12

Name
Privacy - NFC Scan Usage Description
Type
String
Important
You’re required to provide this key if your app uses APIs that access the NFC hardware.
Details
Discussion
Bundle Resources / Information Property List / NFCReaderUsageDescription
Property List Key
NFCReaderUsageDescription
A message that tells people why the app is requesting access to the device’s NFC
hardware.
iOS 11.0+
iPadOS 11.0+


