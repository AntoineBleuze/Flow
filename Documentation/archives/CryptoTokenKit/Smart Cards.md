# Smart Cards.pdf

## Page 1

A token is a storage repository for cryptographic items. When a token is present in the system—
such as when the user physically inserts a smart card into a USB slot—the CryptoTokenKit
framework exposes the token’s items to your app as standard keychain items. It does this by
copying the items to the keychain when the token is inserted, and deleting them from the keychai
when the token is removed.
Because the items appear to your app as standard keychain items, you use Keychain services to
access them. All the usual rules for building a search query and parsing the search results apply.
For an example of storing and retrieving keychain items, see Storing Keys in the Keychain. When
Overview
CryptoTokenKit / Using Cryptographic Assets Stored on a Smart Card
Article
Using Cryptographic Assets Stored on a
Smart Card
Access certificates, keys, and identities stored on a smart card as if they were par
of the keychain.


## Page 2

you work with tokens, the CryptoTokenKit framework handles the storage. You only have to perfor
item retrieval.
When the framework copies an item from a token to the keychain, it records the associated token
identifier, or token ID, as part of the keychain item. If you know the token ID, you can use it to very
precisely filter the keychain search. Do this by including the kSecAttrTokenID key in the query
dictionary. For example, to get a reference to a key that comes from a token with token ID com
.example.piv:0123456789, use the search query:
To identify token IDs that are currently available in the system, use an instance of the TKToken
Watcher class. This object has a tokenIDs property that’s a list of all the token IDs present in t
system. You can read this at any time:
Alternatively, use the setInsertionHandler(_:) method to register for a callback when a
token is inserted into the system. Register to be notified of a particular token’s removal using the
addRemovalHandler(_:forTokenID:) method. You typically use these methods together,
registering for removal at the time the insertion handler is called:
Narrow the Keychain Search with a Token ID
Use a Persistent Reference to Record a Token Item


## Page 3

When you want to keep a record of a token item or pass it to another process, you can get a
persistent reference to the associated keychain item. Do this by setting the kSecReturn
PersistentRef key’s value to true in the keychain search query. For example, the earlier quer
becomes:
However, if you perform any operation with the persistent reference after the token is removed
from the system, Keychain Services returns the errSecItemNotFound status. Handle this by
prompting the user to reinsert the token, after which you can try the operation again.
class TKSmartCardSlotManager
An interface to all available smart card reader slots.
class TKSmartCardSlot
A single smart card reader slot in the system.
class TKSmartCard
A representation of a smart card.
See Also
Smart Cards


## Page 4

Get a list of all known smart card reader slots in the system using the slotNames property, and
access individual slots by name using the getSlot(withName:reply:) method.
Important
The com.apple.security.smartcard entitlement is required in order to use TKSmart
CardSlotManager.
class var `default`: TKSmartCardSlotManager?
The shared singleton Smart Card reader slot manager.
var slotNames: [String]
Overview
Topics
Creating a Card Slot Manager
Accessing Smart Card Slots
CryptoTokenKit / TKSmartCardSlotManager
Class
TKSmartCardSlotManager
An interface to all available smart card reader slots.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 5

A list of identifiers for all the Smart Card reader slots available to the system.
func getSlot(withName: String, reply: (TKSmartCardSlot?) -> Void)
Asynchronously calls a block with a Smart Card reader slot for a specified name.
func slotNamed(String) -> TKSmartCardSlot?
Returns the Smart Card slot with a given name.
func createNFCSlot(message: String?, completion: (TKSmartCardSlot
NFCSession?, (any Error)?) -> Void)
Creates an NFC smart card slot using the device’s hardware and presents a system UI.
func isNFCSupported() -> Bool
Determines whether NFC (Near Field Communication) is supported on this device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Smart Cards


## Page 6

Using Cryptographic Assets Stored on a Smart Card
Access certificates, keys, and identities stored on a smart card as if they were part of the
keychain.
class TKSmartCardSlot
A single smart card reader slot in the system.
class TKSmartCard
A representation of a smart card.


## Page 7

Use the TKSmartCardSlotManager class to manage all the smart card reader slots available to
the system. You can retrieve the names of available smart card reader slots for a system using the
slotNames property of a manager object, and access instances of TKSmartCardSlot using th
getSlot(withName:reply:) method.
func makeSmartCard() -> TKSmartCard?
Creates a new TKSmartCard object representing the currently inserted Smart Card.
var state: TKSmartCardSlot.State
The current state of the Smart Card reader slot.
enum State
All smart card slot states.
Overview
Topics
Instantiating Smart Cards
Getting the Slot State
CryptoTokenKit / TKSmartCardSlot
Class
TKSmartCardSlot
A single smart card reader slot in the system.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 8

var name: String
The name of the Smart Card reader slot.
var maxInputLength: Int
The maximum length of input APDU (Application Protocol Data Unit) that the Smart Card
reader slot is able to transfer to the Smart Card.
var maxOutputLength: Int
The maximum length of output APDU (Application Protocol Data Unit) that the Smart Card
reader slot is able to transfer from the Smart Card.
var atr: TKSmartCardATR?
The ATR (Answer to Reset) of the inserted Smart Card, or nil if no Smart Card is inserted o
the inserted Smart Card is mute.
class TKSmartCardATR
A parsed ATR (Answer To Reset) message from a Smart Card.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting the Slot Configuration
Reading the Answer to Reset
Relationships
Inherits From
Conforms To


## Page 9

Using Cryptographic Assets Stored on a Smart Card
Access certificates, keys, and identities stored on a smart card as if they were part of the
keychain.
class TKSmartCardSlotManager
An interface to all available smart card reader slots.
class TKSmartCard
A representation of a smart card.
See Also
Smart Cards


## Page 10

This class provides an interface for managing sessions with a smart card, transmitting requests,
and facilitating user interaction.
You can create a TKSmartCard object when a smart card is inserted into a slot, by calling the
makeSmartCard() method on the corresponding TKSmartCardSlot object. To start
communicating with the smart card, call the beginSession(reply:) method on the TKSmart
Card object. Once an exclusive session has been established, you transmit data using the
transmit(_:reply:) method. After you’ve finished communicating with a smart card, you cal
the endSession() method.
If the smart card is physically removed from its slot, the session object becomes invalid, and any
further calls to transmit(_:reply:) will return an error. You can use Key-Value Observing on
the isValid property to be notified when a smart card is invalidated, due to being removed from
the slot or another reason.
var slot: TKSmartCardSlot
The slot in which the Smart Card is inserted.
Overview
Topics
Configuring the Smart Card
CryptoTokenKit / TKSmartCard
Class
TKSmartCard
A representation of a smart card.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 11

var isValid: Bool
Whether the Smart Card is valid and accessible from its slot.
var isSensitive: Bool
Whether sessions established for the Smart Card should be considered sensitive. false by
default.
var context: Any?
User-specified information. This property is automatically set to nil if the Smart Card is
removed or another TKSmartCard object begins a session.
var allowedProtocols: TKSmartCardProtocol
The protocols allowed for communication with the Smart Card. any by default.
var currentProtocol: TKSmartCardProtocol
The protocol used for communication with the Smart Card. Returns TKSmartCardProtoco
None if no session is currently established.
struct TKSmartCardProtocol
Smart Card transmission protocols.
func beginSession(reply: (Bool, (any Error)?) -> Void)
Begins a session with the Smart Card.
func transmit(Data, reply: (Data?, (any Error)?) -> Void)
Transmits data in Application Protocol Data Unit (APDU) format to the Smart Card.
func endSession()
Completes any pending transmissions and ends the session to the Smart Card.
func userInteractionForSecurePINVerification(TKSmartCardPINFormat, apdu
Data, pinByteOffset: Int) -> TKSmartCardUserInteractionForSecure
PINVerification?
Creates and returns a new user interaction object for secure PIN verification using the Smart
Card reader facilities.
Setting the Communication Protocol
Communicating with the Smart Card
Managing User Interaction


## Page 12

func userInteractionForSecurePINChange(TKSmartCardPINFormat, apdu: Data
currentPINByteOffset: Int, newPINByteOffset: Int) -> TKSmartCardUser
InteractionForSecurePINChange?
Creates a new user interaction object for secure PIN change using the smart card reader
facilities (typically a HW keypad).
class TKSmartCardPINFormat
The formatting properties for a PIN, such as character encoding and length constraints.
class TKSmartCardUserInteraction
The base class for encapsulating user interaction with a Smart Card reader.
class TKSmartCardUserInteractionForPINOperation
A representation of user interaction for secure PIN operations on a Smart Card reader.
class TKSmartCardUserInteractionForSecurePINChange
A representation of the user interaction for secure PIN change operations on a Smart Card
reader.
class TKSmartCardUserInteractionForSecurePINVerification
A representation of the user interaction for secure PIN change verification on a Smart Card
reader.
var cla: UInt8
The CLA byte used for APDU transmission. 0x00 by default.
var useExtendedLength: Bool
Whether to use extended length APDU.
var useCommandChaining: Bool
Whether to use command chaining of APDU with a data field longer than 255 bytes.
func send(ins: UInt8, p1: UInt8, p2: UInt8, data: Data?, le: Int?, repl
: (Data?, UInt16, (any Error)?) -> Void)
Asynchronously transmits an APDU command to the card, returning the response in a
completion handler.
Configuring APDU Behavior
Transmitting Data


## Page 13

func send(ins: UInt8, p1: UInt8, p2: UInt8, data: Data?, le: Int?)
throws -> (sw: UInt16, response: Data)
Synchronously transmits an APDU command to the card and returns the response.
func withSession<T>(() throws -> T) throws -> T
Synchronously begins a session, executes the given closure, and ends the session.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Using Cryptographic Assets Stored on a Smart Card
Access certificates, keys, and identities stored on a smart card as if they were part of the
keychain.
class TKSmartCardSlotManager
An interface to all available smart card reader slots.
class TKSmartCardSlot
A single smart card reader slot in the system.
Relationships
Inherits From
Conforms To
See Also
Smart Cards


## Page 14



