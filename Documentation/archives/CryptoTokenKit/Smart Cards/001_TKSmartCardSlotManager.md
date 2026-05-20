# 001_TKSmartCardSlotManager.pdf

## Page 1

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


## Page 2

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


## Page 3

Using Cryptographic Assets Stored on a Smart Card
Access certificates, keys, and identities stored on a smart card as if they were part of the
keychain.
class TKSmartCardSlot
A single smart card reader slot in the system.
class TKSmartCard
A representation of a smart card.


