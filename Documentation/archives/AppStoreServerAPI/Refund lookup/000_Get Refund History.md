# 000_Get Refund History.pdf

## Page 1

transactionId
transactionId
(Required) The identifier of a transaction that belongs to the customer, and
which may be an original transaction identifier (originalTransactionId)
revision
revision
A token you provide to get the next set of up to 20 transactions. All response
include a revision token. Use the revision token from the previous
RefundHistoryResponse.
You can store the revision token from the final results page and use it for a
future call. For more information, see RefundHistoryResponse.
The revision token is required in all requests except the initial request.
200
OK
URL
Sandbox URL
Path Parameters
Query Parameters
Response Codes
App Store Server API / Get Refund History
Web Service Endpoint
Get Refund History
Get a paginated list of all of a customer’s refunded in-app purchases for your app
App Store Server API 1.6+


## Page 2

RefundHistory
Response
Request succeeded.
Content-Type: application/json
400
(InvalidTransaction
IdError | Invalid
RequestRevision
Error)
Bad Request
Invalid request. Check the specific error message for further information.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
TransactionIdNot
FoundError
Not Found
Invalid request. Check the specific error message for further information.
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
Call this endpoint to get the customer’s complete refund history for your app by providing the
transaction identifier (transactionId) for any of the customer’s in-app purchases. Each
response (RefundHistoryResponse) contains a maximum of 20 refunded transactions. If the
hasMore property in the response is true, call the endpoint again using the revision token
from the response to get the next set of refunded transactions.
The response only includes App Store-approved refunds for any product type: consumable, non-
consumable, auto-renewable subscriptions, and non-renewing subscriptions. For more informatio
about product types, see In-app purchase.
Mentioned in
Discussion


## Page 3

The information in the response is the same as the information in one or more REFUND notificatio
(notificationType) from App Store Server Notifications. Use this API to retrieve any refund
notifications you may have missed, such as during a server outage.
A successful response may have an empty signedTransactions array if the customer hasn’t
received any App Store-approved refunds. To identify the date and reason code for a refund, see
revocationDate and revocationReason in the JWSTransactionDecodedPayload.
The App Store Server API returns information based on the customer’s in-app purchase history
regardless of whether the customer installs, removes, or reinstalls the app on their devices.
To get a customer’s full refund history for your app, start by calling the endpoint without any quer
parameters, as follows:
For subsequent requests, include the revision token from the previous RefundHistory
Response.
object RefundHistoryResponse
A response that contains an array of signed JSON Web Signature (JWS) refunded
transactions, and paging information.
See Also
Refund lookup


