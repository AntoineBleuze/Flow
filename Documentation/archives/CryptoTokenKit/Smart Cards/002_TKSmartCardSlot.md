# 002_TKSmartCardSlot.pdf

## Page 1

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


## Page 2

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


## Page 3

Using Cryptographic Assets Stored on a Smart Card
Access certificates, keys, and identities stored on a smart card as if they were part of the
keychain.
class TKSmartCardSlotManager
An interface to all available smart card reader slots.
class TKSmartCard
A representation of a smart card.
See Also
Smart Cards


