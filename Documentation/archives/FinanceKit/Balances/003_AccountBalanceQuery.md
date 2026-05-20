# 003_AccountBalanceQuery.pdf

## Page 1

Use an AccountBalanceQuery to find and filter specific balances in a person’s accounts.
init(sortDescriptors: [SortDescriptor<AccountBalance>], predicate:
Predicate<AccountBalance>?, limit: Int?, offset: Int?)
Creates a new account balance query structure with the provided sort descriptors.
static func predicate(availableSince: Date, until: Date?) -> Predicate<
AccountBalance>
A predicate that returns available account balances since a specified date, and, optionally,
until another date.
static func predicate(bookedSince: Date, until: Date?) -> Predicate<
AccountBalance>
Overview
Topics
Initializers
Type Methods
FinanceKit / AccountBalanceQuery
Structure
AccountBalanceQuery
A structure that defines an account balance query.
iOS 17.4+
iPadOS 17.4+


## Page 2

A predicate that returns booked account balances since a specified date until another date.
Sendable, SendableMetatype
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
struct Balance
A structure that describes an account balance.
enum CreditDebitIndicator
Values that the framework uses to describe transactions as credits or debits.
enum CurrentBalance
Values that describe the state of an account’s credit balance.
Relationships
Conforms To
See Also
Balances


