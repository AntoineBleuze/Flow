# Tokens.pdf

## Page 1

Using Cryptographic Assets Stored on a Smart Card
Create a token watcher and register an insertion handler to be notified when tokens are added to
the system. You can also add removal handlers for specific tokens to be notified when those toke
are removed from the system.
init()
Initializes a token watcher.
init(insertionHandler: (String) -> Void)
Initializes a token watcher with the specified insertion handler.
Deprecated
Mentioned in
Overview
Topics
Creating Token Watchers
CryptoTokenKit / TKTokenWatcher
Class
TKTokenWatcher
An object that tracks the tokens available in the system.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

var tokenIDs: [String]
The token IDs currently available in the system.
func addRemovalHandler((String) -> Void, forTokenID: String)
Adds a removal handler for the specified token ID.
func setInsertionHandler((String) -> Void)
Sets an insertion handler closure to be called when a new token is inserted into the system.
class TokenInfo
func tokenInfo(forTokenID: String) -> TKTokenWatcher.TokenInfo?
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Accessing Token Identifiers
Configuring Handlers
Classes
Instance Methods
Relationships
Inherits From
Conforms To


## Page 3

class TKTokenDriver
A base class for building token drivers.
class TKToken
A representation of a hardware-based cryptographic token.
class TKTokenSession
A token session that manages the authentication state of a token.
See Also
Tokens


## Page 4

When using the TKTokenDriver class, implement the TKTokenDriverDelegate protocol wit
the tokenDriver(_:tokenFor:) method, which the system invokes when it requests the
creation of a token instance. After you create the token driver, it can examine keychainItems a
configurationData to implement your desired functionality.
An implementation can also access its associated token configuration using the TKToken
.Configuration property.
Note
When working with smart card tokens, use or inherit from the TKSmartCardTokenDriver
subclass instead.
var delegate: (any TKTokenDriverDelegate)?
The token driver delegate.
Overview
Topics
Responding to Token Creation
CryptoTokenKit / TKTokenDriver
Class
TKTokenDriver
A base class for building token drivers.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 5

protocol TKTokenDriverDelegate
The interface that a token driver delegate implements to respond to token creation events.
typealias ClassID
The type of the class identifier for the token driver.
class Configuration
A configuration for one class of token.
NSObject
TKSmartCardTokenDriver
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class TKTokenWatcher
An object that tracks the tokens available in the system.
class TKToken
Relationships
Inherits From
Inherited By
Conforms To
See Also
Tokens


## Page 6

A representation of a hardware-based cryptographic token.
class TKTokenSession
A token session that manages the authentication state of a token.


## Page 7

Note
When working with smart card tokens, use or inherit from the TKSmartCardToken subclass
instead.
init(tokenDriver: TKTokenDriver, instanceID: TKToken.InstanceID)
Initializes a token with the driver you specify.
typealias InstanceID
A type that represents the instance identifier of a token.
var delegate: (any TKTokenDelegate)?
Overview
Topics
Creating Tokens
Responding to Session Creation
CryptoTokenKit / TKToken
Class
TKToken
A representation of a hardware-based cryptographic token.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 8

The token delegate.
protocol TKTokenDelegate
The interface that a token delegate implements to respond to session creation events.
var tokenDriver: TKTokenDriver
The token driver.
var keychainContents: TKTokenKeychainContents?
The contents of the keychain for this token.
class TKTokenKeychainContents
A representation of the state of the keychain for a particular token.
class TKTokenKeychainItem
An abstract base class for managing a token’s contents as keychain items.
class TKTokenKeychainCertificate
A token’s certificate as stored in the keychain.
class TKTokenKeychainKey
A token’s key as stored in the keychain.
typealias ObjectID
A unique and persistent identifier of a particular token object.
typealias ObjectID
A unique and persistent identifier of a particular token object.
var configuration: TKToken.Configuration
The current configuration for a token.
class Configuration
A token’s configuration.
Accessing the Driver
Accessing Keychain Items
Configuring the Token


## Page 9

NSObject
TKSmartCardToken
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class TKTokenWatcher
An object that tracks the tokens available in the system.
class TKTokenDriver
A base class for building token drivers.
class TKTokenSession
A token session that manages the authentication state of a token.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Tokens


## Page 10

A token session communicates with its delegate to perform operations with its token that are
bound to the authentication state.
A session is always instantiated by a TKToken instance through the token’s delegate when the
framework detects access to the token from a new authentication session.
Important
Never share the authentication status of a token, such as the PIN entered to unlock a smart
card, with other token sessions.
init(token: TKToken)
Initializes a token session with the specified token.
Overview
Topics
Creating Token Sessions
Responding to Authentication Events
CryptoTokenKit / TKTokenSession
Class
TKTokenSession
A token session that manages the authentication state of a token.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 11

var delegate: (any TKTokenSessionDelegate)?
The token session delegate.
protocol TKTokenSessionDelegate
The interface that a session instance delegate implements to respond to token session
authentication events.
var token: TKToken
The token to which the session is bound.
NSObject
TKSmartCardTokenSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class TKTokenWatcher
Accessing the Token
Relationships
Inherits From
Inherited By
Conforms To
See Also
Tokens


## Page 12

An object that tracks the tokens available in the system.
class TKTokenDriver
A base class for building token drivers.
class TKToken
A representation of a hardware-based cryptographic token.


