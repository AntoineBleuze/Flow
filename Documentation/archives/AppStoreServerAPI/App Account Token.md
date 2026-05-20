# App Account Token.pdf

## Page 1

originalTransaction
Id
originalTransaction
Id
(Required) The original transaction identifier of the transaction to receive the
app account token update.
UpdateAppAccount
TokenRequest
The request body that contains a valid app account token value.
Content-Type: application/json
200
OK
Request succeeded.
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
App Store Server API / Set App Account Token
Web Service Endpoint
Set App Account Token
Sets the app account token value for a purchase the customer makes outside of
your app, or updates its value in an existing transaction.
App Store Server API 1.16+


## Page 2

400
(InvalidTransaction
IdError | App
TransactionIdNot
SupportedError |
FamilyTransactionNot
SupportedError |
InvalidAppAccount
TokenUUIDError |
TransactionIdIsNot
OriginalTransaction
IdError)
Bad Request
Invalid request. See the error code for more information. If there’s no error
code, the request is malformed.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
OriginalTransaction
IdNotFoundError
Not Found
The transaction identifier wasn’t found.
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit. For more information, see Identifying rat
limits.
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
An appAccountToken is a UUID you create to associate a transaction with a customer account 
your system. Use the Set App Account Token endpoint to set or reset the appAccount
Token associated with the transaction you specify in the originalTransactionId parameter
Typically, your app sets the appAccountToken(_:) when a customer makes a purchase in you
app. However, customers can also purchase in-app products outside of your app, for example, by
redeeming an offer code in the App Store. In that case, the original transaction doesn’t include an
Mentioned in
Discussion


## Page 3

app account token. Use the Set App Account Token endpoint to associate an app account
token with such transactions.
This endpoint supports setting the appAccountToken for all product types, including one-time
purchases (consumables, non-consumables, and non-renewing subscriptions) and auto-renewab
subscriptions. If you call this endpoint for a transaction that already has an appAccountToken,
the endpoint replaces the existing value with the new value you supply.
For auto-renewable subscriptions, the endpoint applies the appAccountToken to the current
renewal transaction and subsequent renewals, but it doesn’t affect past transactions. The same
appAccountToken continues to apply to renewal transactions if the customer upgrades,
downgrades, or cross-grades the subscription.
This endpoint doesn’t support transactions for products shared through Family Sharing, where th
transaction has an inAppOwnershipType value of FAMILY_SHARED.
You can assign the same appAccountToken value to more than one transaction, according to
your needs. For example, you may choose to reuse the same appAccountToken value for every
transaction that belongs to the same customer.
object UpdateAppAccountTokenRequest
The request body that contains an app account token value.
See Also
App Account Token


## Page 4

appAccountToken
appAccountToken
Required. A UUID value to associate with the transaction you indicate in the
endpoint parameter.
App Store Server API changelog
This is the request body for the Set App Account Token endpoint.
Set App Account Token
Properties
Mentioned in
Discussion
See Also
App Account Token
App Store Server API / UpdateAppAccountTokenRequest
Object
UpdateAppAccountTokenRequest
The request body that contains an app account token value.
App Store Server API 1.16+


## Page 5

Sets the app account token value for a purchase the customer makes outside of your app, o
updates its value in an existing transaction.


