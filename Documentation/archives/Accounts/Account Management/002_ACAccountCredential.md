# 002_ACAccountCredential.pdf

## Page 1

Deprecated
Use appropriate non-Apple SDK corresponding to the type of account you want to reference
instead
To create an account credential that uses the OAuth open authentication standard, use the init
AuthToken:tokenSecret:) method.
init!(oAuthToken: String!, tokenSecret: String!)
Initializes an account credential using OAuth.
init!(oAuth2Token: String!, refreshToken: String!, expiryDate: Date!)
Overview
Topics
Initializing Credentials
Accounts / ACAccountCredential Deprecated
Class
ACAccountCredential Deprecated
A credential object that encapsulates the information needed to authenticate a
user.
iOS 6.0–15.0 Deprecated
iPadOS 6.0–15.0 Deprecated
Mac Catalyst 13.1–15.0 Deprecated
macOS 10.8–12.0 Deprecated


## Page 2

Initializes an account credential using OAuth 2.
var oauthToken: String!
The token used for the credential.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ACAccountStore
The object you use to request, manage, and store the user’s account information.
Deprecated
class ACAccount
The information associated with one of the user’s accounts.
Deprecated
Accessing Credential Properties
Relationships
Inherits From
Conforms To
See Also
Account Management


