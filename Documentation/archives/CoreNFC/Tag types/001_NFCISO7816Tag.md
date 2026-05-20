# 001_NFCISO7816Tag.pdf

## Page 1

The NFCTagReaderSessionDelegate receives an object that conforms to the
NFCISO7816Tag protocol when the NFCTagReaderSession detects an ISO 7816-compatible
tag. For the delegate to receive the tag object, your app must include:
The Near Field Communication Tag Reader Session Formats Entitlement.
A list of supported application identifiers in the ISO7816 application identifiers for
NFC Tag Reader Session_ _information property list key.
When the session discovers a compatible ISO 7816 tag, the session performs a SELECT comman
for each application identifier provided in ISO7816 application identifiers for NFC
Tag Reader Session. The SELECT command searches for the identifiers in the order in which
they appear in the array. The session calls the tagReaderSession:didDetectTags: delegat
method after the first successful SELECT command. The initialSelectedAID property of the
found tag contains the selected identifier.
For the reader session to read and write data to the tag, it must be available to the reader session
Use the isAvailable property to check the tag’s availability.
Overview
Topics
Specifying Application Identifiers
Core NFC / NFCISO7816Tag
Protocol
NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 2

ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
var initialSelectedAID: String
A hexadecimal string of the application identifier for the tag selected by the reader session
when discovering new tags.
Required
var identifier: Data
The unique hardware identifier of the tag.
Required
var historicalBytes: Data?
The historical bytes extracted from the Type A Answer To Select response.
Required
var applicationData: Data?
The application data bytes extracted from the Type B Answer To Request response.
Required
var proprietaryApplicationDataCoding: Bool
A Boolean value that indicates whether the application data follows proprietary data coding.
Required
func sendCommand(apdu: NFCISO7816APDU, resultHandler: (Result<
NFCISO7816ResponseAPDU, any Error>) -> Void)
Sends an application protocol data unit (APDU) to the tag and receives a response APDU.
func sendCommand(apdu: NFCISO7816APDU, completionHandler: (Data, UInt8,
UInt8, (any Error)?) -> Void)
Sends an application protocol data unit (APDU) to the tag and receives a response APDU.
Required Default implementation provided.
class NFCISO7816APDU
An object representing an ISO 7816 application protocol data unit (APDU).
struct NFCISO7816ResponseAPDU
Getting Tag Information
Sending a Command


## Page 3

An object containing the response from the tag.
NFCNDEFTag
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
protocol NFCMiFareTag
An interface for interacting with a MIFARE® tag.
protocol NFCNDEFTag
An interface for interacting with an NDEF tag.
enum NFCTag
An object that represents an NFC tag object.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.
Relationships
Inherits From
See Also
Tag types


## Page 4



