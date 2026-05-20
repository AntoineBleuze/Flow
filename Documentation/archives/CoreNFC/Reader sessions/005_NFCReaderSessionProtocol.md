# 005_NFCReaderSessionProtocol.pdf

## Page 1

var isReady: Bool
A Boolean value that indicates whether the reader session is started and ready to use.
Required
var isReady: Bool
A Boolean value that indicates whether the reader session is started and ready to use.
Required
func begin()
Starts the reader session.
Required
func invalidate()
Closes the reader session, which prevents it from being reused.
Required
func invalidate(errorMessage: String)
Topics
Determining Reader Session Readiness
Managing a Reader Session
Core NFC / NFCReaderSessionProtocol
Protocol
NFCReaderSessionProtocol
A general interface for interacting with a reader session.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

Closes the reader session and displays an error message to the user.
Required
var alertMessage: String
A custom description that helps users understand how they can use NFC reader mode in you
app.
Required
func begin()
Starts the reader session.
Required
func invalidate()
Closes the reader session, which prevents it from being reused.
Required
func invalidate(errorMessage: String)
Closes the reader session and displays an error message to the user.
Required
var alertMessage: String
A custom description that helps users understand how they can use NFC reader mode in you
app.
Required
NSObjectProtocol
NFCNDEFReaderSession
NFCPaymentTagReaderSession
NFCReaderSession
NFCTagReaderSession
NFCVASReaderSession
Relationships
Inherits From
Conforming Types


## Page 3

class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
See Also
Reader sessions


