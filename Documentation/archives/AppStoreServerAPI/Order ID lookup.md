# Order ID lookup.pdf

## Page 1

orderId
orderId
(Required) The order ID for in-app purchases that belong to the customer.
200
OrderLookupResponse
OK
Request succeeded.
Content-Type: application/json
400
GeneralBadRequest
Error
Bad Request
The request is invalid and can’t be accepted.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
429
RateLimitExceeded
Error
The request exceeded the rate limit.
Content-Type: application/json
500
Internal Server Error
URL
Path Parameters
Response Codes
App Store Server API / Look Up Order ID
Web Service Endpoint
Look Up Order ID
Get a customer’s in-app purchases from a receipt using the order ID.
App Store Server API 1.1+


## Page 2

(GeneralInternal
Error | General
InternalRetryable
Error)
Server error. Try again later.
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
Important
This endpoint isn’t available in the sandbox environment.
Call this endpoint to identify and validate a customer’s in-app purchases, based on their order ID.
When a customer contacts you for support, ask for their order ID and use that value to call this
endpoint. Customers can retrieve their order IDs from their purchase history on the App Store; for
more information, see See your purchase history for the App Store, iTunes store, and more. The
App Store also sends customers an email receipt with an order ID each time they make in-app
purchases.
A successful response with an OrderLookupStatus value of 0 contains an array of one or more
signed transactions for the in-app purchase based on the order ID. Use the decoded transaction,
JWSTransactionDecodedPayload, to identify information such as the productId and
purchaseDate that you can use to provide customer support.
A response with an OrderLookupStatus value of 1 doesn’t contain a signed transactions array
The App Store Server API returns information based on the customer’s in-app purchase history
regardless of whether the customer installed, removed, or reinstalled the app on their devices.
type orderId
The customer’s order ID from an App Store receipt for in-app purchases.
Mentioned in
Discussion
Topics
Request data types


## Page 3

type orderId
The customer’s order ID from an App Store receipt for in-app purchases.
object OrderLookupResponse
A response that includes the order lookup status and an array of signed transactions for the
in-app purchases in the order.
See Also
Order ID lookup


## Page 4

When customers make one or more in-app purchases in your app, the App Store emails them a
receipt. The receipt contains an order ID. Use this order ID to call Look Up Order ID. Custome
can also retrieve their order IDs from their purchase history on the App Store; for more informatio
see See your purchase history for the App Store, iTunes store, and more.
Look Up Order ID
Get a customer’s in-app purchases from a receipt using the order ID.
object OrderLookupResponse
A response that includes the order lookup status and an array of signed transactions for the
in-app purchases in the order.
Discussion
See Also
Order ID lookup
App Store Server API / orderId
Type
orderId
The customer’s order ID from an App Store receipt for in-app purchases.
App Store Server API 1.1+


## Page 5

status
OrderLookupStatus
The status that indicates whether the order ID is valid.
signedTransactions
[JWSTransaction]
An array of in-app purchase transactions that are part of order, signed by
Apple, in JSON Web Signature format.
The order lookup response contains information about the orderId you specify when you call
Look Up Order ID.
If the orderId that you provide in the request is invalid, the response doesn’t include the signe
Transactions array. If the orderId is valid, expect at least one transaction in the signed
Transactions array.
Properties
Discussion
Topics
Response data types
App Store Server API / OrderLookupResponse
Object
OrderLookupResponse
A response that includes the order lookup status and an array of signed
transactions for the in-app purchases in the order.
App Store Server API 1.1+


## Page 6

type OrderLookupStatus
A value that indicates whether the order ID in the request is valid for your app.
Look Up Order ID
Get a customer’s in-app purchases from a receipt using the order ID.
type orderId
The customer’s order ID from an App Store receipt for in-app purchases.
See Also
Order ID lookup


