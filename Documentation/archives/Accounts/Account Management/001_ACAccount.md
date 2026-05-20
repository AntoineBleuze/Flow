# 001_ACAccount.pdf

## Page 1

Deprecated
Use appropriate non-Apple SDK corresponding to the type of account you want to reference
instead
An ACAccount object encapsulates information about a user account stored in the Accounts
database. You can create and retrieve accounts using an ACAccountStore object. The
ACAccountStore object provides an interface to the persistent Accounts database. For each
user, all account objects belong to a single ACAccountStore object.
init!(accountType: ACAccountType!)
Initializes a new account of the specified type.
Overview
Topics
Creating an Account Object
Accounts / ACAccount Deprecated
Class
ACAccount Deprecated
The information associated with one of the user’s accounts.
iOS 6.0–15.0 Deprecated
iPadOS 6.0–15.0 Deprecated
Mac Catalyst 13.1–15.0 Deprecated
macOS 10.8–12.0 Deprecated


## Page 2

var accountDescription: String!
A human-readable description of the account.
var accountType: ACAccountType!
The type of service account.
var credential: ACAccountCredential!
The credential used to authenticate the user of this account.
var identifier: NSString!
A unique identifier for this account.
var username: String!
The username for this account.
var userFullName: String!
The full name associated with the user account.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Accessing Properties
Relationships
Inherits From
Conforms To
See Also


## Page 3

class ACAccountStore
The object you use to request, manage, and store the user’s account information.
Deprecated
class ACAccountCredential
A credential object that encapsulates the information needed to authenticate a user.
Deprecated
Account Management


