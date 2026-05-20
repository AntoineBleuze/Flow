# 000_Building an NFC Tag-Reader App.pdf

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


