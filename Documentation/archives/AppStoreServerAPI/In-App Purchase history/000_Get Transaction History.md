# 000_Get Transaction History.pdf

## Page 1

transactionId
transactionId
(Required) The identifier of a transaction that belongs to the customer, and
which may be an original transaction identifier (originalTransactionId)
revision
revision
A token you provide to get the next set of up to 20 transactions. All response
include a revision token. Use the revision token from the previous
HistoryResponse.
Note: The revision token is required in all requests except the initial reques
For requests that use the revision token, include the same query paramete
from the initial request.
startDate
startDate
An optional start date of the timespan for the transaction history records you
requesting. The startDate needs to precede the endDate if you specify
both dates. The results include a transaction if its purchaseDate is equal to
or greater than the startDate.
URL
Sandbox URL
Path Parameters
Query Parameters
App Store Server API / Get Transaction History
Web Service Endpoint
Get Transaction History
Get a customer’s in-app purchase transaction history for your app.
App Store Server API 1.12+


## Page 2

endDate
endDate
An optional end date of the timespan for the transaction history records you’
requesting. Choose an endDate that’s later than the startDate if you
specify both dates. Using an endDate in the future is valid. The results inclu
a transaction if its purchaseDate is less than the endDate.
productId
[productId]
An optional filter that indicates the product identifier to include in the
transaction history. Your query may specify more than one productID.
productType
[string]
An optional filter that indicates the product type to include in the transaction
history. Your query may specify more than one productType.
Possible Values: AUTO_RENEWABLE, NON_RENEWABLE, CONSUMABLE,
NON_CONSUMABLE
inAppOwnershipType
inAppOwnershipType
An optional filter that limits the transaction history by the in-app ownership
type.
sort
string
An optional sort order for the transaction history records. The response sorts
the transaction records by their recently modified date. The default value is
ASCENDING, so you receive the oldest records first.
Possible Values: ASCENDING, DESCENDING
revoked
boolean
An optional Boolean value that indicates whether the response includes only
revoked transactions when the value is true, or contains only nonrevoked
transactions when the value is false. By default, the request doesn’t include
this parameter.
Possible Values: true, false
subscriptionGroup
Identifier
[subscriptionGroup
Identifier]
An optional filter that indicates the subscription group identifier to include in
the transaction history. Your query may specify more than one subscripti
GroupIdentifier.
excludeRevoked
boolean
Deprecated   Set revoked to false to exclude revoked transactions instead.
Possible Values: true, false
200
HistoryResponse
OK
Request succeeded.
Content-Type: application/json
400
(InvalidApp
IdentifierError |
InvalidRequest
RevisionError |
InvalidTransactionId
Bad Request
Invalid request.
Content-Type: application/json
Response Codes


## Page 3

Error | InvalidSort
Error | InvalidStart
DateError | Invalid
EndDateError |
InvalidProductType
Error | Invalid
ProductIdError |
InvalidSubscription
GroupIdentifierError
| InvalidInApp
OwnershipTypeError |
InvalidExclude
RevokedError |
InvalidRevokedError)
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
(AccountNotFound
Error | AccountNot
FoundRetryableError
| AppNotFoundError |
AppNotFoundRetryable
Error | Transaction
IdNotFoundError)
Not Found
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit.
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Server error. Try again later.
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
Mentioned in
Discussion


## Page 4

The Get Transaction History endpoint returns results for all in-app purchase product type
auto-renewable subscriptions, non-renewing subscriptions, non-consumable, and consumable.
The result returns transactions in any state, including transactions that are refunded or revoked,
and transactions that the app has or hasn’t marked as finished.
You can customize your request by including query parameters that filter the transaction history.
The query parameters limit the scope of the request by dates, product IDs, product types, and
subscription group identifiers. You can also exclude revoked or nonrevoked transactions, and limi
the transactions by in-app ownership type. If you provide multiple filters in the query, the
transactions that return match all the filters.
You can also specify a sort order. The App Store sorts the transactions based on their recently
modified dates. Use a DESCENDING order to get the most recent transactions first. The App Stor
updates the recently modified date if the customer upgrades a subscription or the App Store
revokes an in-app purchase. If a transaction updates while you’re receiving transaction history an
the response is sorted in ASCENDING order, you may receive the transaction again with updated
data.
The productId, productType, and subscriptionGroupIdentifier query parameters
allow you to specify multiple values. To specify more than one value for a query parameter, includ
it in the request multiple times. For example, to filter the transaction history by non-consumable
and auto-renewable product types, include the following within your request:
When you specify multiple values for a single query parameter, the response contains transaction
that match any of the values.
Note
If you use optional query parameters, be sure to use the same query parameters on
subsequent requests that include the revision parameter.
To request a full transaction history in ascending order for your app, start by calling the endpoint
without any query parameters, as follows:
For subsequent requests, include the revision token from the previous HistoryResponse.


## Page 5

object HistoryResponse
A response that contains the customer’s transaction history for an app.
See Also
In-App Purchase history


