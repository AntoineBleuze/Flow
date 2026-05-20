# 003_LiabilityAccount.pdf

## Page 1

A liability account includes accounts such as credit cards.
let accountDescription: String?
A description of the account.
let creditInformation: AccountCreditInformation
Information regarding credits to the account.
let currencyCode: String
An ISO 4217 currency code that identifies the currency in which the account is held.
let displayName: String
The name for the account given by an individual.
let id: UUID
A unique account ID.
Overview
Topics
Instance Properties
FinanceKit / LiabilityAccount
Structure
LiabilityAccount
A structure that describes the characteristics of a liability account.
iOS 17.4+
iPadOS 17.4+


## Page 2

let institutionName: String
The name of the institution that holds the account.
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
struct AssetAccount
A structure that describes the characteristics of an asset account.
enum Account
A structure that describes a financial account.
Relationships
Conforms To
See Also
Accounts


## Page 3



