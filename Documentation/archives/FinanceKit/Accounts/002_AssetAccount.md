# 002_AssetAccount.pdf

## Page 1

An asset account includes accounts such as a bank account or a savings account.
let accountDescription: String?
The description of the account.
let currencyCode: String
ISO 4217 currency code that identifies the currency in which the account is held.
let displayName: String
The name for the account given by a person.
let id: UUID
A unique account identifier.
let institutionName: String
The name of the institution that holds the account.
Overview
Topics
Instance Properties
FinanceKit / AssetAccount
Structure
AssetAccount
A structure that describes the characteristics of an asset account.
iOS 17.4+
iPadOS 17.4+


## Page 2

let openingDate: Date?
The date the account was opened, if known.
Decodable
Encodable
Equatable
Identifiable
Sendable
SendableMetatype
func accounts(query: AccountQuery) async throws -> [Account]
Returns a list of accounts a person added to their Wallet that meet the criteria in the provide
account query.
func accountHistory(since: FinanceStore.HistoryToken?, isMonitoring:
Bool) -> FinanceStore.History<Account>
Returns a list of accounts a person added since a time specified by the provided financial
history token.
struct LiabilityAccount
A structure that describes the characteristics of a liability account.
enum Account
A structure that describes a financial account.
Relationships
Conforms To
See Also
Accounts


