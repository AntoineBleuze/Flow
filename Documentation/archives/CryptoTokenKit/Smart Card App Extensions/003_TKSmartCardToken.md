# 003_TKSmartCardToken.pdf

## Page 1

Authenticating Users with a Cryptographic Token
init(smartCard: TKSmartCard, aid: Data?, instanceID: String, tokenDrive
: TKSmartCardTokenDriver)
Initializes a smart card token with the specified smart card, application identifier, and token
driver.
var aid: Data?
The ISO 7816-4 application identifiers of the Smart Card.
Mentioned in
Topics
Creating Smart Card Tokens
Accessing the Application Identifier
Accessing Smart Cards
CryptoTokenKit / TKSmartCardToken
Class
TKSmartCardToken
A representation of a smart card based cryptographic token.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

class TKSmartCard
A representation of a smart card.
class TKTLVRecord
The base class encapsulating a Tag-Length-Value record.
class TKBERTLVRecord
An object that parses BER-encoded data and produces DER-encoded data for TLV records.
class TKCompactTLVRecord
An object that implements encoding using Compact-TLV encoding according to ISO 7816-4
class TKSimpleTLVRecord
An object that implements encoding using Simple-TLV encoding according to ISO 7816-4.
TKToken
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Working with Tag-Length-Value Records
Relationships
Inherits From
Conforms To
See Also
Smart Card App Extensions


## Page 3

Authenticating Users with a Cryptographic Token
Grant access to user accounts and the keychain by creating a smart card app extension.
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on managed
devices.
class TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
class TKSmartCardTokenSession
A token session that is based on a smart card token.


