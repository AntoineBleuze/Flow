# Refund lookup.pdf

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


## Page 4

hasMore
hasMore
A Boolean value that indicates whether the App Store has more transactions
than it returns in signedTransactions. If the value is true, use the
revision token to request the next set of transactions by calling Get
Refund History.
revision
revision
A token you provide in a query to request the next set of transactions from th
Get Refund History endpoint.
signedTransactions
[JWSTransaction]
A list of up to 20 JWS transactions, or an empty array if the customer hasn’t
received any refunds in your app.
The transactions are sorted in ascending order by revocationDate.
App Store Server API changelog
The Get Refund History endpoint returns this response.
This response returns a maximum of 20 refunded transactions. If your customer has more than 20
refunded transactions, the hasMore value is true. Each response includes a revision token.
Properties
Mentioned in
Discussion
App Store Server API / RefundHistoryResponse
Object
RefundHistoryResponse
A response that contains an array of signed JSON Web Signature (JWS) refunded
transactions, and paging information.
App Store Server API 1.6+


## Page 5

Call Get Refund History again with the revision token in the query to receive the next set 
transactions. When the App Store has no more transactions to send, the hasMore value is false
Consider storing the revision token from the last page of results with other customer account
information. Use it at a later date when you call Get Refund History to request any new
refunded transactions since the last time you called the endpoint for the customer. By using the
stored revision token, you can avoid fetching transactions you’ve already received.
type hasMore
A Boolean value indicating whether the App Store has more transaction data.
type revision
A token you use in a query to request the next set of transactions for the customer.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
Get Refund History
Get a paginated list of all of a customer’s refunded in-app purchases for your app.
Topics
Response data types
See Also
Refund lookup


