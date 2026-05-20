# 000_NFCNDEFReaderSession.pdf

## Page 1

As with the NFCReaderSession base class, only one NFC NDEF reader session can be active in
the system at a time. If you create an additional session, the system puts it in a queue and
processes it in first-in, first-out (FIFO) order.
init(delegate: any NFCNDEFReaderSessionDelegate, queue: dispatch_queue_
?, invalidateAfterFirstRead: Bool)
Creates and initializes a new NFC NDEF reader session.
protocol NFCNDEFReaderSessionDelegate
A protocol that an object implements to serve as an NDEF reader session delegate.
func connect(to: any NFCNDEFTag, completionHandler: ((any Error)?) ->
Void)
Overview
Topics
Creating a Session
Connecting to a Tag
Core NFC / NFCNDEFReaderSession
Class
NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

Connects the reader session to a tag and activates that tag.
func restartPolling()
Restarts the polling sequence so the reader session can discover new tags.
NFCReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
Restarting the Polling Sequence
Relationships
Inherits From
Conforms To
See Also
Reader sessions


## Page 3

class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


