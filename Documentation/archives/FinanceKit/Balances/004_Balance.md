# 004_Balance.pdf

## Page 1

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


## Page 2

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


