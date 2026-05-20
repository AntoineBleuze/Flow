# 006_CurrentBalance.pdf

## Page 1

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
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
See Also
Balances


