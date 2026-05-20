# 003_TKTokenSession.pdf

## Page 1

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


## Page 2

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


## Page 3

An object that tracks the tokens available in the system.
class TKTokenDriver
A base class for building token drivers.
class TKToken
A representation of a hardware-based cryptographic token.


