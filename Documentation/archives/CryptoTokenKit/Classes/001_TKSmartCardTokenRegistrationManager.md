# 001_TKSmartCardTokenRegistrationManager.pdf

## Page 1

Registered smartcard keeps its itself accessible via Keychain and system will automatically
invoke an NFC slot when a cryptographic operation is required and asks to provide the registered
card.
var registeredSmartCardTokens: [String]
Returns the tokenIDs of all currently registered smart card tokens
func registerSmartCard(tokenID: String, promptMessage: String) throws
Registers a smartcard with a specific token ID.
func unregisterSmartCard(tokenID: String) throws
Unregisters a smartcard for the provided token ID.
Overview
Topics
Instance Properties
Instance Methods
CryptoTokenKit / TKSmartCardTokenRegistrationManager
Class
TKSmartCardTokenRegistrationManager
Provides a centralized management system for registering and unregistering
smartcards using their token IDs.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
visionOS 26.0+


## Page 2

class var `default`: TKSmartCardTokenRegistrationManager
Default instance of registration manager
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Type Properties
Relationships
Inherits From
Conforms To


