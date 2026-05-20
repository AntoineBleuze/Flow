# 000_ACAccountStore.pdf

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


