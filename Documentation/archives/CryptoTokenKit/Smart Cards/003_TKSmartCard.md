# 003_TKSmartCard.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5



