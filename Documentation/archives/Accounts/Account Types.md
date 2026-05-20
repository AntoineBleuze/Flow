# Account Types.pdf

## Page 1

Deprecated
Use appropriate non-Apple SDK corresponding to the type of account you want to reference
instead
You don’t create account type objects directly. To obtain an account type object, use the accoun
Type(withAccountTypeIdentifier:) method or the accountType property of an accoun
object. Use the accounts(with:) method to obtain all accounts of a particular type.
var accessGranted: Bool
A Boolean value indicating whether the user granted the application access to accounts of
this type.
Overview
Topics
Accessing Properties
Accounts / ACAccountType Deprecated
Class
ACAccountType Deprecated
An object that encapsulates information about all accounts of a particular type.
iOS 6.0–15.0 Deprecated
iPadOS 6.0–15.0 Deprecated
Mac Catalyst 13.1–15.0 Deprecated
macOS 10.8–12.0 Deprecated


## Page 2

var accountTypeDescription: String!
A human-readable description of the account type.
var identifier: String!
The unique identifier for the account type.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


