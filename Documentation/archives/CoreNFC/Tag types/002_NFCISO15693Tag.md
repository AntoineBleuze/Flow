# 002_NFCISO15693Tag.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


