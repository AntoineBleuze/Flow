# Transactions.pdf

## Page 1

accountID
An account identifier.
token
An optional FinanceStore.HistoryToken that describes a start time.
isMonitoring
A Boolean value that indicates the method should return records asynchronously as the
system updates the FinanceStore.
A FinanceStore.History of transactions that match the provided accountID.
Parameters
Return Value
FinanceKit / FinanceStore / transactionHistory(forAccountID:since:isMonitoring:)
Instance Method
transactionHistory(forAccountID:since:is
Monitoring:)
Returns the transactions for the specified account ID, optional starting time, and
monitoring indicator for long running transaction queries.
iOS 17.4+
iPadOS 17.4+


## Page 2

Use this method to search the finance store for transactions in a specific account and receive
updates as the framework enters new transactions into the finance store. You can, optionally,
specify a starting date and time by providing a historyToken.
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
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.
Discussion
See Also
Transactions


## Page 3

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


## Page 4

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


## Page 5

Use an AccountQuery to find and filter a person’s accounts.
init(sortDescriptors: [SortDescriptor<Account>], predicate: Predicate<
Account>?, limit: Int?, offset: Int?)
Creates a new account query structure with the provided sort descriptors and, optionally, a
predicate and limit on the number of records the query should return.
Overview
Topics
Initializers
Relationships
Conforms To
FinanceKit / AccountQuery
Structure
AccountQuery
A structure that defines an account query.
iOS 17.4+
iPadOS 17.4+


## Page 6

Sendable, SendableMetatype
func transactionHistory(forAccountID: UUID, since: FinanceStore.History
Token?, isMonitoring: Bool) -> FinanceStore.History<Transaction>
Returns the transactions for the specified account ID, optional starting time, and monitoring
indicator for long running transaction queries.
func transactions(query: TransactionQuery) async throws -> [Transaction
Returns transactions that match the provided transaction query.
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
See Also
Transactions


## Page 7

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


## Page 8

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


## Page 9

enum TransactionStatus
Values that describe the status of a transaction.


## Page 10

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


## Page 11

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


## Page 12

This can include transactions such as a deposit to or a withdrawn from bank account, a credit car
transaction.
let accountID: UUID
The account ID the transaction belongs to.
let creditDebitIndicator: CreditDebitIndicator
An indicator that describes if the transaction is a credit or a debit.
let foreignCurrencyAmount: CurrencyAmount?
The total amount of the transaction, if it was carried out in a foreign currency.
let foreignCurrencyExchangeRate: Decimal?
The currency exchange rate, if the transaction was carried out in a foreign currency.
let id: UUID
Overview
Topics
Instance Properties
FinanceKit / Transaction
Structure
Transaction
A structure that represents a transaction relating to a specific financial account.
iOS 17.4+
iPadOS 17.4+


## Page 13

A unique internal ID.
let merchantCategoryCode: MerchantCategoryCode?
The ISO 18245 category code for the transaction.
let merchantName: String?
The name of the merchant, if present.
let originalTransactionDescription: String
The unmodified description of the transaction.
let postedDate: Date?
The date and time that the transaction was posted to the account.
let status: TransactionStatus
The status of the transaction, if available.
let transactionAmount: CurrencyAmount
The total amount of the transaction.
let transactionDate: Date
The time the transaction took place, if available.
let transactionDescription: String
A description of the transaction.
let transactionType: TransactionType
The type of the transaction.
Decodable
Encodable
Equatable
Identifiable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 14

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
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.
See Also
Transactions


## Page 15

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


## Page 16

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


## Page 17

enum TransactionType
Values that describe kinds of transactions.
enum TransactionStatus
Values that describe the status of a transaction.


## Page 18

case adjustment
A credit or debit adjustment transaction.
case atm
An ATM transaction.
case billPayment
A bill payment, usually carried out through an eBill or eCheck system.
case check
A check payment.
case deposit
A deposit of money by a payer into a payee’s bank account.
case directDebit
A payment to a third party on agreed dates, typically in order to pay bills.
case directDeposit
A deposit of money by a payer directly into a payee’s bank account.
Topics
Enumeration Cases
FinanceKit / TransactionType
Enumeration
TransactionType
Values that describe kinds of transactions.
iOS 17.4+
iPadOS 17.4+


## Page 19

case dividend
A distribution of a company’s earnings to its shareholders.
case fee
A fee or charge levied by the account provider.
case interest
A credit or debit due to interest earned or incurred.
case loan
A loan drawdown or repayment.
case pointOfSale
A Point of Sales transaction.
case refund
A refund.
case standingOrder
A regular payment of a fixed amount that’s paid on a specified date.
case transfer
A transfer between accounts.
case unknown
The transaction’s category doesn’t map to a known value.
case withdrawal
An automatic or recurring withdrawal of funds by another party.
CaseIterable
Copyable
Decodable
Encodable
Equatable
Hashable
Relationships
Conforms To


## Page 20

RawRepresentable
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
struct AccountCreditInformation
A structure that describes the credit information associated with an account.
struct CurrencyAmount
A structure that describes a monetary amount and its currency.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
enum TransactionStatus
Values that describe the status of a transaction.
See Also
Transactions


## Page 21

case authorized
The transaction is in an authorized state.
case booked
The transaction is in a booked state.
case memo
A memo that provides information about the transaction.
case pending
The transaction is in a pending state.
case rejected
The transaction is in a rejected state.
Topics
Enumeration Cases
Relationships
FinanceKit / TransactionStatus
Enumeration
TransactionStatus
Values that describe the status of a transaction.
iOS 17.4+
iPadOS 17.4+


## Page 22

CaseIterable
Copyable
Decodable
Encodable
Equatable
Hashable
RawRepresentable
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
struct AccountCreditInformation
A structure that describes the credit information associated with an account.
struct CurrencyAmount
A structure that describes a monetary amount and its currency.
struct Transaction
A structure that represents a transaction relating to a specific financial account.
struct TransactionQuery
A structure that describes the parameters to use for a transaction query.
Conforms To
See Also
Transactions


## Page 23

enum TransactionType
Values that describe kinds of transactions.


