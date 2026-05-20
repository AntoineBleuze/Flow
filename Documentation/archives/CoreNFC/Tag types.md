# Tag types.pdf

## Page 1

Note
This sample code project is associated with WWDC 2020 session 10209:What’s New in Core
NFC and WWDC 2019 session 715: Core NFC Enhancements.
protocol NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
protocol NFCMiFareTag
An interface for interacting with a MIFARE® tag.
Overview
See Also
Tag types
Core NFC / Creating NFC Tags from Your iPhone
Sample Code
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
Download
iOS 14.0+
iPadOS 14.0+
Xcode 12.0+


## Page 2

protocol NFCNDEFTag
An interface for interacting with an NDEF tag.
enum NFCTag
An object that represents an NFC tag object.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6



## Page 7

The NFCTagReaderSessionDelegate receives an object that conforms to the
NFCISO15693Tag protocol when the NFCTagReaderSession detects an ISO 15693-compatib
tag. For the delegate to receive the tag object, your app must include the Near Field
Communication Tag Reader Session Formats Entitlement.
For the reader session to read and write data to the tag, it must be available to the reader session
Use the isAvailable property to check the tag’s availability.
var icManufacturerCode: Int
The IC manufacturer code of the tag.
Required
var icSerialNumber: Data
The IC serial number assigned to the tag by the manufacturer.
Required
Overview
Topics
Getting Tag Information
Core NFC / NFCISO15693Tag
Protocol
NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 8

var identifier: Data
The unique hardware identifier of the tag.
Required
typealias RequestFlag
A set of bit mask options that, when combined, define the request flags to use when sending
a command.
func getSystemInfo(requestFlags: NFCISO15693RequestFlag, completion
Handler: (Int, Int, Int, Int, Int, (any Error)?) -> Void)
Sends the Get System Information command (0x2B command code), as defined in the ISO
15693-3 specification, to the tag.
Required
Deprecated
func readSingleBlock(requestFlags: NFCISO15693RequestFlag, blockNumber:
UInt8, completionHandler: (Data, (any Error)?) -> Void)
Sends a Read Single Block command (0x20 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func writeSingleBlock(requestFlags: NFCISO15693RequestFlag, blockNumber
UInt8, dataBlock: Data, completionHandler: ((any Error)?) -> Void)
Sends the Write Single Block command (0x21 command code), as defined in the ISO 15693-
specification, to the tag.
Required
func lockBlock(requestFlags: NFCISO15693RequestFlag, blockNumber: UInt8
completionHandler: ((any Error)?) -> Void)
Sends the Lock Block command (0x22 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
Selecting Request Flag Options
Getting System Information
Sending Single Block Commands
Sending Multi-block Commands


## Page 9

func readMultipleBlocks(requestFlags: NFCISO15693RequestFlag, blockRang
: NSRange, completionHandler: ([Data], (any Error)?) -> Void)
Sends the Read Multiple Blocks command (0x23 command code), as defined in the ISO
15693-3 specification, to the tag.
Required
func writeMultipleBlocks(requestFlags: NFCISO15693RequestFlag, block
Range: NSRange, dataBlocks: [Data], completionHandler: ((any Error)?) -
Void)
Sends the Write Multiple Blocks command (0x24 command code), as defined in the ISO
15693-3 specification, to the tag.
Required
func getMultipleBlockSecurityStatus(requestFlags: NFCISO15693RequestFla
, blockRange: NSRange, completionHandler: ([NSNumber], (any Error)?) ->
Void)
Sends the Get Multiple Block Security Status command (0x2C command code), as defined i
the ISO 15693-3 specification, to the tag.
Required
func writeAFI(requestFlags: NFCISO15693RequestFlag, afi: UInt8,
completionHandler: ((any Error)?) -> Void)
Sends the Write AFI command (0x27 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func lockAFI(requestFlags: NFCISO15693RequestFlag, completionHandler:
((any Error)?) -> Void)
Sends the Lock AFI command (0x28 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func writeDSFID(requestFlags: NFCISO15693RequestFlag, dsfid: UInt8,
completionHandler: ((any Error)?) -> Void)
Sends the Write DSFID command (0x29 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
Sending Application Family Identifier Commands
Sending Data Storage Format Identifier Commands


## Page 10

func lockDFSID(requestFlags: NFCISO15693RequestFlag, completionHandler:
((any Error)?) -> Void)
Sends the Lock DSFID command (0x2A command code), as defined in the ISO 15693-3
specification, to the tag.
Required
Deprecated
func resetToReady(requestFlags: NFCISO15693RequestFlag, completion
Handler: ((any Error)?) -> Void)
Sends the Reset To Ready command (0x26 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func select(requestFlags: NFCISO15693RequestFlag, completionHandler:
((any Error)?) -> Void)
Sends the Select command (0x25 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func stayQuiet(completionHandler: ((any Error)?) -> Void)
Sends a Stay Quiet command (0x02 command code), as defined in the ISO 15693-3
specification, to the tag.
Required
func customCommand(requestFlags: NFCISO15693RequestFlag, customCommand
Code: Int, customRequestParameters: Data, completionHandler: (Data, (an
Error)?) -> Void)
Sends a custom command (0xA0 to 0xDF command code), as defined in the ISO 15693-3
specification, to the tag.
Required
Sending Reset to Ready Command
Sending Select Command
Sending Stay Quiet Command
Sending Custom Commands
Sending Extended Commands


## Page 11

func extendedReadSingleBlock(requestFlags: NFCISO15693RequestFlag, bloc
Number: Int, completionHandler: (Data, (any Error)?) -> Void)
Sends the Extended Read Single Block command (0x30 command code), as defined in the
NFC Forum Type 5 tag specification, to the tag.
Required
func extendedWriteSingleBlock(requestFlags: NFCISO15693RequestFlag,
blockNumber: Int, dataBlock: Data, completionHandler: ((any Error)?) ->
Void)
Sends the Extended Write Single Block command (0x31 command code), as defined in the
NFC Forum Type 5 tag specification, to the tag.
Required
func extendedLockBlock(requestFlags: NFCISO15693RequestFlag, blockNumbe
: Int, completionHandler: ((any Error)?) -> Void)
Sends the Extended Lock Single Block command (0x32 command code), as defined in the
NFC Forum Type 5 tag specification, to the tag.
Required
func extendedReadMultipleBlocks(requestFlags: NFCISO15693RequestFlag,
blockRange: NSRange, completionHandler: ([Data], (any Error)?) -> Void)
Sends the Extended Read Multiple Block command (0x33 command code), as defined in the
NFC Forum Type 5 tag specification, to the tag.
Required
let NFCISO15693TagResponseErrorKey: String
A user information dictionary key indicating that a tag responded with a command error.
func authenticate(requestFlags: NFCISO15693RequestFlag, cryptoSuite
Identifier: Int, message: Data) async throws -> (NFCISO15693ResponseFla
, Data)
func authenticate(requestFlags: NFCISO15693RequestFlag, cryptoSuite
Identifier: Int, message: Data, resultHandler: (Result<(
NFCISO15693ResponseFlag, Data), any Error>) -> Void)
func challenge(requestFlags: NFCISO15693RequestFlag, cryptoSuite
Identifier: Int, message: Data) async throws
Getting Response Errors
Instance Methods


## Page 12

func challenge(requestFlags: NFCISO15693RequestFlag, cryptoSuite
Identifier: Int, message: Data, completionHandler: ((any Error)?) ->
Void)
func customCommand(requestFlags: NFCISO15693RequestFlag, customCommand
Code: Int, customRequestParameters: Data, resultHandler: (Result<Data,
any Error>) -> Void)
func extendedFastReadMultipleBlocks(requestFlags: NFCISO15693RequestFla
, blockRange: NSRange) async throws -> [Data]
func extendedFastReadMultipleBlocks(requestFlags: NFCISO15693RequestFla
, blockRange: NSRange, resultHandler: (Result<[Data], any Error>) ->
Void)
func extendedGetMultipleBlockSecurityStatus(requestFlags:
NFCISO15693RequestFlag, blockRange: NSRange) async throws ->
NFCISO15693MultipleBlockSecurityStatus
func extendedGetMultipleBlockSecurityStatus(requestFlags:
NFCISO15693RequestFlag, blockRange: NSRange, resultHandler: (Result<
NFCISO15693MultipleBlockSecurityStatus, any Error>) -> Void)
func extendedReadSingleBlock(requestFlags: NFCISO15693RequestFlag, bloc
Number: Int, resultHandler: (Result<Data, any Error>) -> Void)
func extendedWriteMultipleBlocks(requestFlags: NFCISO15693RequestFlag,
blockRange: NSRange, dataBlocks: [Data]) async throws
func extendedWriteMultipleBlocks(requestFlags: NFCISO15693RequestFlag,
blockRange: NSRange, dataBlocks: [Data], completionHandler: ((any Error
)?) -> Void)
func fastReadMultipleBlocks(requestFlags: NFCISO15693RequestFlag, block
Range: NSRange) async throws -> [Data]
func fastReadMultipleBlocks(requestFlags: NFCISO15693RequestFlag, block
Range: NSRange, resultHandler: (Result<[Data], any Error>) -> Void)
func getSystemInfo(requestFlags: NFCISO15693RequestFlag, resultHandler:
(Result<NFCISO15693SystemInfo, any Error>) -> Void)
func keyUpdate(requestFlags: NFCISO15693RequestFlag, keyIdentifier: Int
message: Data) async throws -> (NFCISO15693ResponseFlag, Data)
func keyUpdate(requestFlags: NFCISO15693RequestFlag, keyIdentifier: Int
message: Data, resultHandler: (Result<(NFCISO15693ResponseFlag, Data),
any Error>) -> Void)


## Page 13

func lockDSFID(requestFlags: NFCISO15693RequestFlag, completionHandler:
((any Error)?) -> Void)
Required
func readBuffer(requestFlags: NFCISO15693RequestFlag) async throws -> (
NFCISO15693ResponseFlag, Data)
func readBuffer(requestFlags: NFCISO15693RequestFlag, resultHandler: (
Result<(NFCISO15693ResponseFlag, Data), any Error>) -> Void)
func readMultipleBlock(readConfiguration: NFCISO15693ReadMultipleBlocks
Configuration, completionHandler: (Data, (any Error)?) -> Void)
Required
func readMultipleBlocks(requestFlags: NFCISO15693RequestFlag, blockRang
: NSRange, resultHandler: (Result<[Data], any Error>) -> Void)
func readSingleBlock(requestFlags: NFCISO15693RequestFlag, blockNumber:
UInt8, resultHandler: (Result<Data, any Error>) -> Void)
func sendCustomCommand(commandConfiguration: NFCISO15693CustomCommand
Configuration, completionHandler: (Data, (any Error)?) -> Void)
Required
func sendRequest(requestFlags: Int, commandCode: Int, data: Data?) asyn
 throws -> (NFCISO15693ResponseFlag, Data?)
func sendRequest(requestFlags: Int, commandCode: Int, data: Data?,
resultHandler: (Result<(NFCISO15693ResponseFlag, Data?), any Error>) ->
Void)
func systemInfo(requestFlags: NFCISO15693RequestFlag) async throws ->
NFCISO15693SystemInfo
NFCNDEFTag
NSCoding
NSCopying
NSObjectProtocol
Relationships
Inherits From


## Page 14

NSSecureCoding
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
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
See Also
Tag types


## Page 15

FeliCa is a trademark of Sony Corporation.
ISO18092 system codes for NFC Tag Reader Session
A list of FeliCa system codes that the app supports.
var currentSystemCode: Data
The system code most recently selected by the reader session during a polling sequence.
Required
var currentIDm: Data
The manufacturer identifier for the system currently selected by the reader session.
Required
Overview
Topics
Specifying System Codes
Getting Current Information
Core NFC / NFCFeliCaTag
Protocol
NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 16

func polling(systemCode: Data, requestCode: NFCFeliCaPollingRequestCode
timeSlot: NFCFeliCaPollingTimeSlot, completionHandler: (Data, Data, (an
Error)?) -> Void)
Sends the Polling command as defined by FeliCa card specification to the tag.
Required
typealias PollingRequestCode
Codes that specify the type of the data to request when polling.
Deprecated
typealias PollingTimeSlot
Constants that specify the maximum number of time slots.
Deprecated
func requestService(nodeCodeList: [Data], completionHandler: ([Data],
(any Error)?) -> Void)
Sends the Request Service command, as defined by the FeliCa card specification, to the tag
Required
func requestServiceV2(nodeCodeList: [Data], completionHandler: (Int, In
, NFCFeliCaEncryptionId, [Data], [Data], (any Error)?) -> Void)
Sends the Request Service V2 command, as defined by the FeliCa card specification, to the
tag.
Required
typealias EncryptionId
Encryption identifiers indicating the type of encryption algorithm used in the response of a
Request Service V2 command.
Deprecated
func requestResponse(completionHandler: (Int, (any Error)?) -> Void)
Sends the Request Response command, as defined by the FeliCa card specification, to the
tag.
Required
Polling
Requesting Services
Requesting Responses


## Page 17

func requestSpecificationVersion(completionHandler: (Int, Int, Data,
Data, (any Error)?) -> Void)
Sends the Request Specification Version command, as defined by the FeliCa card
specification, to the tag.
Required
func requestSystemCode(completionHandler: ([Data], (any Error)?) -> Voi
)
Sends the Request System Code command, as defined by the FeliCa card specification, to th
tag.
Required
func resetMode(completionHandler: (Int, Int, (any Error)?) -> Void)
Sends the Reset Mode command, as defined by the FeliCa card specification, to the tag.
Required
func readWithoutEncryption(serviceCodeList: [Data], blockList: [Data],
completionHandler: (Int, Int, [Data], (any Error)?) -> Void)
Sends the Read Without Encryption command, as defined by the FeliCa card specification, t
the tag.
Required
func writeWithoutEncryption(serviceCodeList: [Data], blockList: [Data],
blockData: [Data], completionHandler: (Int, Int, (any Error)?) -> Void)
Sends the Write Without Encryption command, as defined by the FeliCa card specification, t
the tag.
Required
Requesting Specification Versions
Requesting System Codes
Resetting Modes
Reading and Writing Without Encryption
Sending FeliCa Commands


## Page 18

func sendFeliCaCommand(commandPacket: Data, completionHandler: (Data,
(any Error)?) -> Void)
Sends the FeliCa command packet data to the tag.
Required
func polling(systemCode: Data, requestCode: NFCFeliCaPollingRequestCode
timeSlot: NFCFeliCaPollingTimeSlot, resultHandler: (Result<NFCFeliCa
PollingResponse, any Error>) -> Void)
func readWithoutEncryption(serviceCodeList: [Data], blockList: [Data],
resultHandler: (Result<(NFCFeliCaStatusFlag, [Data]), any Error>) ->
Void)
func requestResponse(resultHandler: (Result<Int, any Error>) -> Void)
func requestService(nodeCodeList: [Data], resultHandler: (Result<[Data]
any Error>) -> Void)
func requestServiceV2(nodeCodeList: [Data], resultHandler: (Result<
NFCFeliCaRequsetServiceV2Response, any Error>) -> Void)
func requestSpecificationVersion(resultHandler: (Result<NFCFeliCaReques
SpecificationVersionResponse, any Error>) -> Void)
func requestSystemCode(resultHandler: (Result<[Data], any Error>) ->
Void)
func resetMode(resultHandler: (Result<NFCFeliCaStatusFlag, any Error>) 
> Void)
func sendFeliCaCommand(commandPacket: Data, resultHandler: (Result<Data
any Error>) -> Void)
func writeWithoutEncryption(serviceCodeList: [Data], blockList: [Data],
blockData: [Data], resultHandler: (Result<NFCFeliCaStatusFlag, any Erro
>) -> Void)
NFCNDEFTag
Instance Methods
Relationships
Inherits From


## Page 19

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCMiFareTag
An interface for interacting with a MIFARE® tag.
protocol NFCNDEFTag
An interface for interacting with an NDEF tag.
enum NFCTag
An object that represents an NFC tag object.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.
See Also
Tag types


## Page 20

The NFCTagReaderSessionDelegate receives an object that conforms to the NFCMiFareTa
protocol when the NFCTagReaderSession detects a compatible tag. However, if you include th
application identifier D2760000850101—the identifier for the NDEF application on MIFARE®
DESFire® tags (NFC Forum T4T tag platform)—in the ISO7816 application identifiers
for NFC Tag Reader Session array of your Info.plist file, the reader session sends the
delegate an NFCISO7816Tag object when it finds a tag matching the identifier. To receive the
MIFARE DESFire tag as an NFCMiFareTag object, don’t include D2760000850101 in the array.
For the delegate to receive the tag object, your app must include the Near Field
Communication Tag Reader Session Formats Entitlement.
For the reader session to read and write data to the tag, it must be available to the reader session
Use the isAvailable property to check the tag’s availability.
MIFARE, MIFARE DESFire, MIFARE Ultralight, and MIFARE Plus are registered trademarks of NXP
B.V.
Overview
Topics
Getting Tag Information
Core NFC / NFCMiFareTag
Protocol
NFCMiFareTag
An interface for interacting with a MIFARE® tag.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 21

var mifareFamily: NFCMiFareFamily
The MIFARE product family identifier for the tag.
Required
enum NFCMiFareFamily
Identifiers for the MIFARE product families.
var identifier: Data
The unique hardware identifier of the tag.
Required
var historicalBytes: Data?
The historical bytes extracted from an Answer To Select response.
Required
func sendMiFareCommand(commandPacket: Data, completionHandler: (Data,
(any Error)?) -> Void)
Sends a native MIFARE command to the tag.
Required
func sendMiFareISO7816Command(NFCISO7816APDU, completionHandler: (Data,
UInt8, UInt8, (any Error)?) -> Void)
Sends an ISO 7816 command APDU to the tag and receives a response APDU.
Required Default implementation provided.
func sendMiFareCommand(commandPacket: Data, resultHandler: (Result<Data
any Error>) -> Void)
func sendMiFareISO7816Command(NFCISO7816APDU, resultHandler: (Result<
NFCISO7816ResponseAPDU, any Error>) -> Void)
NFCNDEFTag
Sending Commands
Instance Methods
Relationships
Inherits From


## Page 22

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
protocol NFCNDEFTag
An interface for interacting with an NDEF tag.
enum NFCTag
An object that represents an NFC tag object.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.
See Also
Tag types


## Page 23

var isAvailable: Bool
A Boolean value that determines whether the NDEF tag is available in the current reader
session.
Required
func queryNDEFStatus(completionHandler: (NFCNDEFStatus, Int, (any Error
)?) -> Void)
Asks the reader session for the NDEF support status of the tag.
Required
enum NFCNDEFStatus
Constants that indicate status for an NDEF tag.
func readNDEF(completionHandler: (NFCNDEFMessage?, (any Error)?) -> Voi
)
Retrieves an NDEF message from the tag.
Required
Topics
Getting the Tag Status
Reading the Tag
Core NFC / NFCNDEFTag
Protocol
NFCNDEFTag
An interface for interacting with an NDEF tag.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 24

func writeNDEF(NFCNDEFMessage, completionHandler: ((any Error)?) -> Voi
)
Saves an NDEF message to a writable tag.
Required
func writeLock(completionHandler: ((any Error)?) -> Void)
Changes the NDEF tag status to read-only, preventing future write operations.
Required
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
NFCFeliCaTag
NFCISO15693Tag
NFCISO7816Tag
NFCMiFareTag
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
Writing to the Tag
Relationships
Inherits From
Inherited By
See Also
Tag types


## Page 25

An interface for interacting with an ISO 7816 tag.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
protocol NFCMiFareTag
An interface for interacting with a MIFARE® tag.
enum NFCTag
An object that represents an NFC tag object.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.


## Page 26

When an NFC reader session detects a tag, it returns an NFCTag object. Use this generic object t
determine if the tag is available, and to retrieve an object of a specific tag type.
Listing 1. Getting a MIFARE Ultralight tag from an array of generic tags objects
Overview
Core NFC / NFCTag
Enumeration
NFCTag
An object that represents an NFC tag object.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst


## Page 27

var isAvailable: Bool
A Boolean value that indicates whether a detected tag is available.
case iso15693(any NFCISO15693Tag)
Gets a tag as an ISO 15693 tag object.
case iso7816(any NFCISO7816Tag)
Gets a tag as an ISO 7816 tag object.
case feliCa(any NFCFeliCaTag)
Gets a tag as a FeliCa tag object.
case miFare(any NFCMiFareTag)
Get a tag as a MIFARE tag object.
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
Topics
Getting Information About a Tag
Getting a Specific Tag Type
See Also
Tag types


## Page 28

An interface for interacting with an ISO 7816 tag.
protocol NFCISO15693Tag
An interface for interacting with an ISO 15693 tag.
protocol NFCFeliCaTag
An interface for interacting with a FeliCa™ tag.
protocol NFCMiFareTag
An interface for interacting with a MIFARE® tag.
protocol NFCNDEFTag
An interface for interacting with an NDEF tag.
class NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.


## Page 29

var maximumRetries: Int
The maximum number of retries.
var retryInterval: TimeInterval
The time between retries, in seconds.
NSObject
NFCISO15693CustomCommandConfiguration, 
NFCISO15693ReadMultipleBlocksConfiguration
Topics
Configuring a Tag Command
Relationships
Inherits From
Inherited By
Core NFC / NFCTagCommandConfiguration
Class
NFCTagCommandConfiguration
A set of parameters you use to define the configuration of an NFC tag command.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 30

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Creating NFC Tags from Your iPhone
Save data to tags, and interact with them using native tag protocols.
protocol NFCISO7816Tag
An interface for interacting with an ISO 7816 tag.
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
Conforms To
See Also
Tag types


