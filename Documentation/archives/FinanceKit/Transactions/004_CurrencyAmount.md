# 004_CurrencyAmount.pdf

## Page 1

let amount: Decimal
The numeric value of the amount.
let currencyCode: String
The currency of the amount.
Equatable
Hashable
Sendable
SendableMetatype
Topics
Instance Properties
Relationships
Conforms To
FinanceKit / CurrencyAmount
Structure
CurrencyAmount
A structure that describes a monetary amount and its currency.
iOS 17.4+
iPadOS 17.4+


## Page 2

func transactionHistory(forAccountID: UUID, since: FinanceStore.History
Token?, isMonitoring: Bool) -> FinanceStore.History<Transaction>
Returns the transactions for the specified account ID, optional starting time, and monitoring
indicator for long running transaction queries.
func transactions(query: TransactionQuery) async throws -> [Transaction
Returns transactions that match the provided transaction query.
struct AccountQuery
A structure that defines an account query.
struct AccountCreditInformation
A structure that describes the credit information associated with an account.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.
See Also
Transactions


