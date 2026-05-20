# Account Management.pdf

## Page 1

Deprecated
Use appropriate non-Apple SDK corresponding to the type of account you want to reference
instead
The ACAccountStore class provides an interface for accessing, managing, and storing account
To create and retrieve accounts from the Accounts database, you must create an ACAccount
Store object. Each ACAccount object belongs to a single account store object.
func requestAccessToAccounts(with: ACAccountType!, options: [AnyHashabl
: Any]!, completion: ((Bool, (any Error)?) -> Void)!)
Obtains permission to access protected user properties.
Overview
Topics
Requesting Access
Accounts / ACAccountStore Deprecated
Class
ACAccountStore Deprecated
The object you use to request, manage, and store the user’s account information.
iOS 6.0–15.0 Deprecated
iPadOS 6.0–15.0 Deprecated
Mac Catalyst 13.1–15.0 Deprecated
macOS 10.8–12.0 Deprecated


## Page 2

typealias ACAccountStoreRequestAccessCompletionHandler
Specifies a handler to call when access is granted or denied.
var accounts: NSArray!
The accounts managed by this account store.
func account(withIdentifier: String!) -> ACAccount!
Returns the account with the specified identifier.
func accounts(with: ACAccountType!) -> [Any]!
Returns all accounts of the specified type.
func accountType(withAccountTypeIdentifier: String!) -> ACAccountType!
Returns an account type that matches the specified identifier.
func saveAccount(ACAccount!, withCompletionHandler: ((Bool, (any Error
)?) -> Void)!)
Saves an account to the Accounts database.
typealias ACAccountStoreSaveCompletionHandler
Specifies a handler to call when an Accounts database operation is complete.
func renewCredentials(for: ACAccount!, completion: ((ACAccountCredentia
RenewResult, (any Error)?) -> Void)!)
Renews account credentials when the credentials are no longer valid.
typealias ACAccountStoreCredentialRenewalHandler
Specifies a handler to call when credentials are renewed.
enum ACAccountCredentialRenewResult
Status codes of credential renewal requests.
Getting Accounts
Getting Account Types
Saving Accounts
Renewing Account Credentials


## Page 3

func removeAccount(ACAccount!, withCompletionHandler: ((Bool, (any Erro
)?) -> Void)!)
Removes an account from the account store.
typealias ACAccountStoreRemoveCompletionHandler
Specifies a handler to call when an account is removed from the store.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ACAccount
The information associated with one of the user’s accounts.
Deprecated
class ACAccountCredential
A credential object that encapsulates the information needed to authenticate a user.
Removing Accounts
Relationships
Inherits From
Conforms To
See Also
Account Management


## Page 4

Deprecated


## Page 5

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


## Page 6

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


## Page 7

class ACAccountStore
The object you use to request, manage, and store the user’s account information.
Deprecated
class ACAccountCredential
A credential object that encapsulates the information needed to authenticate a user.
Deprecated
Account Management


## Page 8

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


## Page 9

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


