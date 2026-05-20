# 000_TKTokenWatcher.pdf

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


