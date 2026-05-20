# 000_accounts_query__.pdf

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


