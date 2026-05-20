# Balances.pdf

## Page 1

query
An AccountQuery that describes the kinds of accounts to look for.
An array of AccountBalance structures.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalance
Parameters
Return Value
See Also
Balances
FinanceKit / FinanceStore / accountBalances(query:)
Instance Method
accountBalances(query:)
Returns a list of balances that meet the criteria in the provided account query.
iOS 17.4+
iPadOS 17.4+


## Page 2

A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct AccountBalanceQuery
A structure that defines an account balance query.
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.


## Page 3

accountID
A UUID that identifies a specific account a person has added to the finance store.
token
An optional HistoryToken that defines the starting date and time to return records from.
isMonitoring
A Boolean value that indicates whether the framework should return a History sequence th
indicates the changes to the accounts over time. Defaults to true.
A History that describes the account balances.
Parameters
Return Value
FinanceKit / FinanceStore / accountBalanceHistory(forAccountID:since:isMonitoring:)
Instance Method
accountBalanceHistory(forAccountID:
since:isMonitoring:)
Returns the account balance history since a time specified by the provided
financial history token.
iOS 17.4+
iPadOS 17.4+


## Page 4

Use this method to monitor the balance of a specific account. Provide a historyToken to speci
a starting data and time.
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
struct AccountBalance
A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct AccountBalanceQuery
A structure that defines an account balance query.
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
Discussion
See Also
Balances


## Page 5

let accountID: UUID
The account ID the balance belongs to.
var available: Balance?
The available balance, if present.
var booked: Balance?
The booked balance, if present.
var currencyCode: String
The balance currency.
let currentBalance: CurrentBalance
The balance at a particular moment in time.
let id: UUID
A unique account balance ID.
Topics
Instance Properties
FinanceKit / AccountBalance
Structure
AccountBalance
A structure that describes the financial balance of an account at a specific point i
time. The financial balance of an account at a specific point in time.
iOS 17.4+
iPadOS 17.4+


## Page 6

Decodable
Encodable
Equatable
Identifiable
Sendable
SendableMetatype
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalanceQuery
A structure that defines an account balance query.
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
Relationships
Conforms To
See Also
Balances


## Page 7

Use an AccountBalanceQuery to find and filter specific balances in a person’s accounts.
init(sortDescriptors: [SortDescriptor<AccountBalance>], predicate:
Predicate<AccountBalance>?, limit: Int?, offset: Int?)
Creates a new account balance query structure with the provided sort descriptors.
static func predicate(availableSince: Date, until: Date?) -> Predicate<
AccountBalance>
A predicate that returns available account balances since a specified date, and, optionally,
until another date.
static func predicate(bookedSince: Date, until: Date?) -> Predicate<
AccountBalance>
Overview
Topics
Initializers
Type Methods
FinanceKit / AccountBalanceQuery
Structure
AccountBalanceQuery
A structure that defines an account balance query.
iOS 17.4+
iPadOS 17.4+


## Page 8

A predicate that returns booked account balances since a specified date until another date.
Sendable, SendableMetatype
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalance
A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
Relationships
Conforms To
See Also
Balances


## Page 9

let amount: CurrencyAmount
The amount of the balance.
let asOfDate: Date
The date and time the system calculated the balance.
let creditDebitIndicator: CreditDebitIndicator
A value that indicates whether the balance is a credit or a debit balance.
Decodable
Encodable
Equatable
Hashable
Topics
Instance Properties
Relationships
Conforms To
FinanceKit / Balance
Structure
Balance
A structure that describes an account balance.
iOS 17.4+
iPadOS 17.4+


## Page 10

Sendable
SendableMetatype
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalance
A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct AccountBalanceQuery
A structure that defines an account balance query.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
See Also
Balances


## Page 11

case credit
A value that indicates an amount which increases an asset or decreases a liability.
case debit
A value that indicates an amount which increases a liability or decreases an asset.
CaseIterable
Copyable
Decodable
Encodable
Equatable
Hashable
RawRepresentable
Topics
Enumeration Cases
Relationships
Conforms To
FinanceKit / CreditDebitIndicator
Enumeration
CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
iOS 17.4+
iPadOS 17.4+


## Page 12

Sendable
SendableMetatype
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalance
A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct AccountBalanceQuery
A structure that defines an account balance query.
struct Balance
A structure that describes an account balance.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
See Also
Balances


## Page 13

case available(Balance)
Only the available balance is present.
case availableAndBooked(available: Balance, booked: Balance)
Both available and booked balances are present.
case booked(Balance)
Only the booked balance is present.
Decodable
Encodable
Equatable
Hashable
Topics
Enumeration Cases
Relationships
Conforms To
FinanceKit / CurrentBalance
Enumeration
CurrentBalance
Values that describe the state of an account’s credit balance.
iOS 17.4+
iPadOS 17.4+


## Page 14

Sendable
SendableMetatype
func accountBalances(query: AccountBalanceQuery) async throws -> [
AccountBalance]
Returns a list of balances that meet the criteria in the provided account query.
func accountBalanceHistory(forAccountID: UUID, since: FinanceStore.
HistoryToken?, isMonitoring: Bool) -> FinanceStore.History<Account
Balance>
Returns the account balance history since a time specified by the provided financial history
token.
struct AccountBalance
A structure that describes the financial balance of an account at a specific point in time. The
financial balance of an account at a specific point in time.
struct AccountBalanceQuery
A structure that defines an account balance query.
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
See Also
Balances


