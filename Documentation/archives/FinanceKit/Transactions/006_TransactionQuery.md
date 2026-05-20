# 006_TransactionQuery.pdf

## Page 1

Use a TransactionQuery to find and filter transactions in a person’s accounts.
init(sortDescriptors: [SortDescriptor<Transaction>], predicate:
Predicate<Transaction>?, limit: Int?, offset: Int?)
Creates a new transaction query with the provided sort descriptors, predicate, and limit on t
number of records the query should return.
static func predicate(forMerchantCategoryCodes: [MerchantCategoryCode])
-> Predicate<Transaction>
A predicate that returns transactions that match any of the provided merchant category
codes.
Overview
Topics
Initializers
Type Methods
FinanceKit / TransactionQuery
Structure
TransactionQuery
A structure that describes the parameters to use for a transaction query.
iOS 17.4+
iPadOS 17.4+


## Page 2

static func predicate(forStatuses: [TransactionStatus]) -> Predicate<
Transaction>
Returns a predicate that matches any of the provided transaction statuses.
static func predicate(forTransactionTypes: [TransactionType]) ->
Predicate<Transaction>
Returns a predicate that matches any of the provided transaction types.
Sendable, SendableMetatype
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
struct CurrencyAmount
A structure that describes a monetary amount and its currency.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
Relationships
Conforms To
See Also
Transactions


## Page 3

enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.


