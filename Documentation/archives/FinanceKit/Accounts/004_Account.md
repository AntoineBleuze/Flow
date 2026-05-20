# 004_Account.pdf

## Page 1

Accounts can include a variety of financial account types such as a bank account, a credit card, o
a college fund.
case asset(AssetAccount)
An asset account.
case liability(LiabilityAccount)
A liability account.
var accountDescription: String?
A person’s description of this account.
var assetAccount: AssetAccount?
Overview
Topics
Enumeration Casess
Instance Properties
FinanceKit / Account
Enumeration
Account
A structure that describes a financial account.
iOS 17.4+
iPadOS 17.4+


## Page 2

An asset account.
var currencyCode: String
The ISO 4217 currency code that identifies the currency that denominates the account.
var displayName: String
The name for this account that a person provided.
var id: UUID
The unique account ID for this account.
var institutionName: String
The name of the institution that holds this account.
var liabilityAccount: LiabilityAccount?
A liability account.
var openingDate: Date?
The date the account was opened, if known.
Decodable
Encodable
Equatable
Identifiable
Sendable
SendableMetatype
func accounts(query: AccountQuery) async throws -> [Account]
Relationships
Conforms To
See Also
Accounts


## Page 3

Returns a list of accounts a person added to their Wallet that meet the criteria in the provide
account query.
func accountHistory(since: FinanceStore.HistoryToken?, isMonitoring:
Bool) -> FinanceStore.History<Account>
Returns a list of accounts a person added since a time specified by the provided financial
history token.
struct AssetAccount
A structure that describes the characteristics of an asset account.
struct LiabilityAccount
A structure that describes the characteristics of a liability account.


