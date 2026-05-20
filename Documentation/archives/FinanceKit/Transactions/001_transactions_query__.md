# 001_transactions_query__.pdf

## Page 1

query
A TransactionQuery that describes the kinds of transactions to look for.
An array of Transaction records that match the provided query.
func transactionHistory(forAccountID: UUID, since: FinanceStore.History
Token?, isMonitoring: Bool) -> FinanceStore.History<Transaction>
Returns the transactions for the specified account ID, optional starting time, and monitoring
indicator for long running transaction queries.
struct AccountQuery
A structure that defines an account query.
Parameters
Return Value
See Also
Transactions
FinanceKit / FinanceStore / transactions(query:)
Instance Method
transactions(query:)
Returns transactions that match the provided transaction query.
iOS 17.4+
iPadOS 17.4+


## Page 2

struct AccountCreditInformation
A structure that describes the credit information associated with an account.
struct CurrencyAmount
A structure that describes a monetary amount and its currency.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.


