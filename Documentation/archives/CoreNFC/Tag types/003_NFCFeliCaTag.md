# 003_NFCFeliCaTag.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


