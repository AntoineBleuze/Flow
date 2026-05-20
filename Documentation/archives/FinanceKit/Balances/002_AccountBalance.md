# 002_AccountBalance.pdf

## Page 1

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


## Page 2

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


