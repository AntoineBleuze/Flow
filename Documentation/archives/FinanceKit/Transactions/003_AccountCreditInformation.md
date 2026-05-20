# 003_AccountCreditInformation.pdf

## Page 1

Credit information includes credit limits, payment dates, and minimum payment dates and amoun
for current and upcoming payments.
let creditLimit: CurrencyAmount?
The credit limit of the account.
let minimumNextPaymentAmount: CurrencyAmount?
Minimum amount of the next non-overdue payment.
let nextPaymentDueDate: Date?
Date of the next payment.
let overduePaymentAmount: CurrencyAmount?
The amount by which the account is overdue for the current period.
Overview
Topics
Instance Properties
FinanceKit / AccountCreditInformation
Structure
AccountCreditInformation
A structure that describes the credit information associated with an account.
iOS 17.4+
iPadOS 17.4+


## Page 2

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
func transactionHistory(forAccountID: UUID, since: FinanceStore.History
Token?, isMonitoring: Bool) -> FinanceStore.History<Transaction>
Returns the transactions for the specified account ID, optional starting time, and monitoring
indicator for long running transaction queries.
func transactions(query: TransactionQuery) async throws -> [Transaction
Returns transactions that match the provided transaction query.
struct AccountQuery
A structure that defines an account query.
struct CurrencyAmount
A structure that describes a monetary amount and its currency.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionType
Values that describe kinds of transactions.
Relationships
Conforms To
See Also
Transactions


## Page 3

enum TransactionStatus
Values that describe the status of a transaction.


