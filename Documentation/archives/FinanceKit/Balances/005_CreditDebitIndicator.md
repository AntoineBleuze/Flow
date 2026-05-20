# 005_CreditDebitIndicator.pdf

## Page 1

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
enum CurrentBalance
Values that describe the state of an account’s credit balance.
See Also
Balances


