# Accounts.pdf

## Page 1

query
An AccountQuery that describes the kinds of accounts to look for.
An array of Account structures.
func accountHistory(since: FinanceStore.HistoryToken?, isMonitoring:
Bool) -> FinanceStore.History<Account>
Returns a list of accounts a person added since a time specified by the provided financial
history token.
struct AssetAccount
A structure that describes the characteristics of an asset account.
Parameters
Return Value
See Also
Accounts
FinanceKit / FinanceStore / accounts(query:)
Instance Method
accounts(query:)
Returns a list of accounts a person added to their Wallet that meet the criteria in
the provided account query.
iOS 17.4+
iPadOS 17.4+


## Page 2

struct LiabilityAccount
A structure that describes the characteristics of a liability account.
enum Account
A structure that describes a financial account.


## Page 3

token
An optional HistoryToken.
isMonitoring
A Boolean value that indicates if the framework should return a History that indicates the
changes to the accounts over time. Defaults to true.
A History that describes the accounts.
Use this method to list and monitor accounts present in a person’s Wallet. If provided, the
framework uses the since history token as a starting point to evaluate which accounts to return.
Parameters
Return Value
Discussion
FinanceKit / FinanceStore / accountHistory(since:isMonitoring:)
Instance Method
accountHistory(since:isMonitoring:)
Returns a list of accounts a person added since a time specified by the provided
financial history token.
iOS 17.4+
iPadOS 17.4+


## Page 4

func accounts(query: AccountQuery) async throws -> [Account]
Returns a list of accounts a person added to their Wallet that meet the criteria in the provide
account query.
struct AssetAccount
A structure that describes the characteristics of an asset account.
struct LiabilityAccount
A structure that describes the characteristics of a liability account.
enum Account
A structure that describes a financial account.
See Also
Accounts


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9



## Page 10

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


## Page 11

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


## Page 12

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


