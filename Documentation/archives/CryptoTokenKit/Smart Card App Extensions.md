# Smart Card App Extensions.pdf

## Page 1

A typical use of hardware-based cryptographic tokens is two-factor authentication. This kind of
authentication enhances security by making users establish their identity in two ways: with
something they have (like a token that’s a USB-based smart card) and with something they know 
password that unlocks the token). A misplaced token is useless without the password. A
compromised password provides no access without the physical token.
In macOS, you can write an app extension that enables the system to authenticate users
possessing a token. A driver you supply allows the system to establish the presence of the token 
the system and confirm that the user has a password or PIN that unlocks the token.
Before writing the app extension, make sure the token you’re trying to support meets certain basi
prerequisites. To do this, you may need to obtain technical documentation from the token’s
manufacturer. The exact requirements depend on how you plan to use it.
To authenticate user logins, the token must contain at least one cryptographic key. This key must
be capable of creating a cryptographic signature using an algorithm from one of the following
families:
Elliptic curve signature digest X962
RSA signature digest PSS
RSA signature digest PKCS1v15
Overview
Ensure the Token Meets Minimum Requirements
CryptoTokenKit / Authenticating Users with a Cryptographic Token
Article
Authenticating Users with a Cryptographic
Token
Grant access to user accounts and the keychain by creating a smart card app
extension.


## Page 2

Additionally, to use the token for unlocking the keychain, make sure it contains at least one of the
following keys:
A 256-bit elliptic curve key of type kSecAttrKeyTypeECSECPrimeRandom. This key must
support the ecdhKeyExchangeStandard key exchange algorithm.
A 2048-, 3072-, or 4096-bit RSA key of type kSecAttrKeyTypeRSA. This key must support
decryption with the rsaEncryptionOAEPSHA256 algorithm.
To support an RSA option in either of the above use cases, the token hardware must either
implement the specific RSA signature or decryption algorithm that the key supports, or simply
implement the raw variant (rsaSignatureRaw for login, or rsaEncryptionRaw for keychain
unlock). When the hardware provides only the raw operation, macOS automatically handles any
needed padding.
When you’re ready to begin coding, use Xcode to create an app extension target inside a new,
empty macOS host app. Xcode provides a smart card app extension template that produces both
the target and a group of files to get you started.
For example, for a token extension that you name TokenExtension, Xcode produces the target
plus an entitlements file, an Info.plist file, and the three source files in a new folder within the
project:
For more information about working with app extensions in general, see App Extensions.
Create the Smart Card App Extension


## Page 3

Note
The host app for this kind of extension typically contains no functionality. Instead, it exists only
as a delivery mechanism for the extension.
A smart card app extension has no UI component. The system handles all user interaction
associated with authenticating the user. Instead, your TokenDriver class—derived from the
TKSmartCardTokenDriver class—acts as the entry point for the extension. More precisely, the
NSExtensionAttributes subdictionary of the NSExtension dictionary in the Info.plist
file has a key com.apple.ctk.driver-class that names the entry point class. Xcode sets th
for you as part of the template:
You supply functionality for the Token class (derived from the TKSmartCardToken class) and
TokenSession class (derived from the TKSmartCardTokenSession class) that is specific to
the token hardware you are supporting. These pieces work together to form the app extension:
Register the Extension with SecurityAgent


## Page 4

To activate the app extension and make the token available to the system for authentication, you
launch the extension’s hosting app as the _securityagent user:
The system prompts for an administrative password before executing this call.
The hosting app may in fact do nothing more than exit cleanly, but the act of running it has the sid
effect of registering its app extension with the system. You only need to do this once, typically
during a managed installation.
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on managed
devices.
class TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
class TKSmartCardToken
A representation of a smart card based cryptographic token.
class TKSmartCardTokenSession
A token session that is based on a smart card token.
See Also
Smart Card App Extensions


## Page 5

When you use the CryptoTokenKit framework to manage hardware tokens as two-factor
authentication devices, as Authenticating Users with a Cryptographic Token describes, the
authentication process is subject to certain configuration options.
Configure smart card authentication preferences by setting values in the com.apple.security
.smartcard preferences domain. For each setting, the framework first tries to read from mobile
device management (MDM) settings. Next, it looks at systemwide preferences. Finally, it falls bac
on default values for any remaining unspecificed values.
Note
The framework ignores individual user preferences.
The framework looks for and responds to the following preference keys:
UserPairing
A Boolean that defaults to true.
If set, when a user inserts an unpaired card into the system and the card appears suitable for
authentication, the system prompts the user to associate the card with the current user. The
system requires an administrative user to authorize the association.
When you want to manage the associations between users and tokens on a computer, use th
sc_auth command line utility. See the sc_auth(8) man page for details.
Overview
Set Smart Card Preferences
CryptoTokenKit / Configuring Smart Card Authentication
Article
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on
managed devices.


## Page 6

allowSmartCard
A Boolean that defaults to true.
When disabled, the system doesn’t attempt to use smart cards for user authentication (login
keychain unlock, and so on). However, smart cards are still accessible for other purposes, like
signing emails.
oneCardPerUser
A Boolean that defaults to false.
When enabled, the system allows the host application to pair a user with only a single smart
card. Enabling this feature doesn’t affect any existing pairings in the system. A user already
paired with multiple smart cards doesn’t become unpaired.
enforceSmartCard
A Boolean that defaults to false.
When enabled, the system requires smart card authentication for login, authorization, or
screensaver unlock. Other authentication methods like passwords and Touch ID fail. In some
cases, such as preference sheets that always require a password, the user may receive two
prompts: one for the smart card, followed by one for the password.
checkCertificateTrust
An integer that defaults to 0.
Indicates how the framework handles certificates, with settings ranging from least to most
secure.
The values for checkCertificateTrust:
0 — Trust every certificate. Although this setting is the default, it’s suitable only for users with
self-signed certificates. Corporate systems must typically use a more secure setting.
1 — Test that certificates are within their validity period and that the system trusts the issuer.
2 — Test that the certificates are within the validity period, test that the system trusts the issue
and test against a soft revocation check. A soft revocation check means that as long as the
certificate revocation check doesn’t explicitly reject the certificate, it remains valid. When the
system can’t complete a check, the certificate remains valid.
3 — Test that the certificates are within the validity period, test that the system trusts the issue
and test against a hard revocation check. Unless a certificate revocation check explicitly
validates the certificate, it’s considered invalid.
See Also
Smart Card App Extensions


## Page 7

Authenticating Users with a Cryptographic Token
Grant access to user accounts and the keychain by creating a smart card app extension.
class TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
class TKSmartCardToken
A representation of a smart card based cryptographic token.
class TKSmartCardTokenSession
A token session that is based on a smart card token.


## Page 8

Authenticating Users with a Cryptographic Token
protocol TKSmartCardTokenDriverDelegate
The interface that a smart card token driver delegate implements to respond to token creatio
events.
TKTokenDriver
Mentioned in
Topics
Responding to Token Creation
Relationships
Inherits From
CryptoTokenKit / TKSmartCardTokenDriver
Class
TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 9

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Authenticating Users with a Cryptographic Token
Grant access to user accounts and the keychain by creating a smart card app extension.
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on managed
devices.
class TKSmartCardToken
A representation of a smart card based cryptographic token.
class TKSmartCardTokenSession
A token session that is based on a smart card token.
Conforms To
See Also
Smart Card App Extensions


## Page 10

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


## Page 11

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


## Page 12

Authenticating Users with a Cryptographic Token
Grant access to user accounts and the keychain by creating a smart card app extension.
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on managed
devices.
class TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
class TKSmartCardTokenSession
A token session that is based on a smart card token.


## Page 13

Authenticating Users with a Cryptographic Token
You can use the smartCard property to access and send APDUs to the underlying smart card.
var smartCard: TKSmartCard
The smart card for the active exclusive session and selected application.
Deprecated
func getSmartCard() throws -> TKSmartCard
Mentioned in
Overview
Topics
Accessing the Smart Card
Instance Methods
CryptoTokenKit / TKSmartCardTokenSession
Class
TKSmartCardTokenSession
A token session that is based on a smart card token.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 14

TKTokenSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Authenticating Users with a Cryptographic Token
Grant access to user accounts and the keychain by creating a smart card app extension.
Configuring Smart Card Authentication
Set preferences for smart card authentication operations, including those on managed
devices.
class TKSmartCardTokenDriver
The driver that acts as an entry point for smart card app extensions.
class TKSmartCardToken
A representation of a smart card based cryptographic token.
Relationships
Inherits From
Conforms To
See Also
Smart Card App Extensions


