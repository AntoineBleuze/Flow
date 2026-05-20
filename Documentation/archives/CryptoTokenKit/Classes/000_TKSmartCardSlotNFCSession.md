# 000_TKSmartCardSlotNFCSession.pdf

## Page 1

Lifetime of this session object is tied to the NFC smart card slot lifetime and once the NFC slot
disappears (eg. after a user cancellation, calling end session, or an NFC timeout) the functions wi
start to fail and return TKErrorCodeObjectNotFound error.
var slotName: String?
Smart card slot name of the NFC slot that was created together with this session.
func end()
Ends the NFC slot session and dismisses the system-presented NFC UI (if present).
func update(message: String) throws
Overview
Topics
Instance Properties
Instance Methods
CryptoTokenKit / TKSmartCardSlotNFCSession
Class
TKSmartCardSlotNFCSession
NFC session that’s related to NFC smart card slot which was created.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
visionOS 26.0+


## Page 2

Updates the message of the system-presented NFC UI.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To


