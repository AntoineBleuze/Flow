# 004_NFCReaderSession.pdf

## Page 1

You do not create instances of this class. Instead, you create and use an instance of
NFCNDEFReaderSession or NFCTagReaderSession. Only one reader session of any type ca
be active in the system at a time. The system puts additional sessions in a queue and processes
them in FIFO order.
class var readingAvailable: Bool
A Boolean value that determines whether the device supports NFC tag reading.
var delegate: AnyObject?
The delegate of the reader session.
var sessionQueue: dispatch_queue_t
Overview
Topics
Determining Tag Reading Capability
Working with a Session
Core NFC / NFCReaderSession
Class
NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

The queue on which the reader session delegate callbacks and completion block handlers ar
dispatched.
NSObject
NFCNDEFReaderSession, NFCTagReaderSession, NFCVASReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
Relationships
Inherits From
Inherited By
Conforms To
See Also
Reader sessions


## Page 3

A reader session for processing Value Added Service (VAS) tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


