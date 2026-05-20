# 000_accountBalances_query__.pdf

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


