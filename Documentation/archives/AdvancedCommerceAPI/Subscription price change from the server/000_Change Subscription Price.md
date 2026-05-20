# 000_Change Subscription Price.pdf

## Page 1

transactionId
string
(Required) A transaction identifier of the auto-renewable subscription that is
subject to the price change. Use the subscription’s original transaction ID or
any subsequent transaction ID of a transaction related to the subscription.
SubscriptionPrice
ChangeRequest
The request body that contains the details of the price change.
Content-Type: application/json
200
SubscriptionPrice
ChangeResponse
OK
Success
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Change Subscription Price
Web Service Endpoint
Change Subscription Price
Increase or decrease the price of an auto-renewable subscription, a bundle, or
individual items within a subscription at the next renewal.
Advanced Commerce API 1.0+


## Page 2

400
(NullRequestInfo
Error | NullItems
Error | NullSKUError
| InvalidAppAccount
TokenError | Null
RequestReference
IDError | Invalid
RequestReference
IDError | Invalid
ConsistencyToken
Error | Invalid
StorefrontError |
InvalidCurrencyError
| NegativePriceError
| SKULengthExceeded
Error | Description
LengthExceededError
| DisplayNameLength
ExceededError |
InvalidProductError
| InvalidSKUError |
MismatchedStorefront
Error | Missing
PricingConfigFor
StorefrontError |
OperationNotAllowed
Error | Malformed
PayloadError |
DependentSKUsCannot
BeSharedError |
DependentSKUsCannot
BeChainedError |
ItemCannotBe
SpecifiedMultiple
TimesError | Price
ChangeCannotBeIssued
WhenAlready
CommunicatedError |
InvalidSKUProvided
MustBeCurrentSKUSet
ToRenewError)
Bad Request
Content-Type: application/json
401
Unauthorized
403
(SubscriptionDoesNot
ExistError |
Forbidden
Content-Type: application/json


## Page 3

SubscriptionNot
EligibleError)
404
TransactionIdNot
FoundError
Not Found
Content-Type: application/json
429
RateLimitExceededError
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Content-Type: application/json
Handling subscription price changes
Authorizing API requests from your server
Advanced Commerce API changelog
Identifying rate limits for Advanced Commerce APIs
Call this endpoint when you change the price of a subscription or any bundle or item within it. For
information about the customer communication, see Handling subscription price changes.
Only active subscriptions that aren’t in a billing retry state are eligible for price changes. When yo
call this endpoint, the price change takes effect at the next subscription renewal. Call the endpoin
no later than 24 hours before the renewal date to have it take effect at the renewal.
For information about providing prices, see Specifying prices for Advanced Commerce SKUs.
In the following request:
The subscription includes multiple items, and only one item has a price increase to USD 12.99.
The price increase takes effect at the next subscription renewal.
The decoded signed transaction shows price in the current period, before the increase.
Mentioned in
Discussion
Example request and response


## Page 4

The decoded signed renewal information shows the increased price, which takes effect at the
next renewal period if consented to.
The item has a dependent SKU, which will be cancelled if the price increase is not agreed to.
In this example, the price increase has been communicated, so the status is marked as pending
object SubscriptionPriceChangeRequest
The request body you use to change the price of an auto-renewable subscription.
object SubscriptionPriceChangeResponse
A response that contains signed JWS renewal and JWS transaction information after a
subscription price change request.
Response (decoded signed transaction)
Response (decoded signed renewal information)
See Also
Subscription price change from the server
Request


