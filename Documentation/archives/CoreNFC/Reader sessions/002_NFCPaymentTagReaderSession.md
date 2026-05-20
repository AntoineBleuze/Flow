# 002_NFCPaymentTagReaderSession.pdf

## Page 1

This subclass of NFCTagReaderSession adds support for payment tags, when someone uses
your app in certain regions. To support payment tags in your app, intialize this class with a NFCTa
ReaderSessionDelegate. The delegate receives an object that conforms to the
NFCISO7816Tag protocol when the NFCTagReaderSession detects an ISO 7816-compatible
tag. For the delegate to receive the tag object, your app must include:
The Near Field Communication Tag Reader Session Formats Entitlement
A list of supported application identifiers in the ISO7816 application identifiers for
NFC Tag Reader Session information property list key
When the session discovers an ISO 7816-compatible tag, the session performs a SELECT
command for each application identifier provided in ISO7816 application identifiers
for NFC Tag Reader Session. The SELECT command searches for the identifiers in the
order in which they appear in the array. The session calls the tagReaderSession:didDetect
Tags: delegate method after the first successful SELECT command. The initialSelectedAI
property of the found tag contains the selected identifier.
The tag must be available to the reader session, so it can read and write data to the tag. Use the i
Available property to check the tag’s availability. To connect to an available tag, call the
superclass’s connect(to:completionHandler:) method.
The system only supports one active NFCReaderSession at a time. The system queues and
processes subsequently opened sessions in first-in-first-out order.
Overview
Core NFC / NFCPaymentTagReaderSession
Class
NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 2

Important
The system supports use of NFCPaymentTagReaderSession only within the European
Union (EU). People using your app must have an account registered in the EU, and their device
must be located within the EU. These registration and device location requirements also apply
to developing and testing apps that use this API. If the device isn’t currently eligible to use
NFCPaymentTagReaderSession, the NFCPaymentTagReaderSession.reading
Available property is false.
convenience init(delegate: any NFCTagReaderSessionDelegate, queue:
DispatchQueue?)
Creates a new session instance for processing NFC payment tags.
protocol NFCTagReaderSessionDelegate
A protocol that an object implements to receive callbacks sent from an NFC tag reader
session.
NFCTagReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
Topics
Creating a tag reader session
Relationships
Inherits From
Conforms To


## Page 3

class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
See Also
Reader sessions


