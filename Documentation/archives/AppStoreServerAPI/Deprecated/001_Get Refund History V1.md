# 001_Get Refund History V1.pdf

## Page 1

Deprecated
Use Get Refund History instead.
originalTransaction
Id
originalTransaction
Id
(Required) The original transaction identifier for a transaction that belongs to
the customer.
200
RefundLookupResponse
OK
Request succeeded.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
Response Codes
App Store Server API / Get Refund History V1 Deprecated
Web Service Endpoint
Get Refund History V1 Deprecated
Get a list of up to 50 of a customer’s refunded in-app purchases for your app.
App Store Server API 1.1–1.6 Deprecated


## Page 2

400
InvalidOriginal
TransactionIdError
Bad Request
The request is invalid. Check the specific error message for further informatio
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
OriginalTransaction
IdNotFoundError
Not Found
The request is invalid. Check the specific error message for further informatio
Content-Type: application/json
429
RateLimitExceeded
Error
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
The request failed. This may be due to a temporary outage. Check the specif
error message for further information.
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
Call this endpoint to get a customer’s refund history for your app. The response (RefundLookup
Response) includes up to 50 of the customer’s most-recently refunded transactions, based on t
revocationDate.
Note
To get the complete refund history, use Get Refund History.
To call this endpoint, provide any original transaction identifier (originalID) for any of the
customer’s in-app purchases. The response only includes App Store-approved refunds for any
product type: consumable, non-consumable, auto-renewable subscriptions, and non-renewing
subscriptions. For more information about product types, see In-app purchase.
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
Get Transaction History V1
Get a customer’s in-app purchase transaction history for your app, except finished
consumable in-app purchases.
Deprecated
Send Consumption Information V1
Send consumption information about a consumable In-App Purchase or auto-renewable
subscription to the App Store after your server receives a consumption request notification.
Deprecated
object ConsumptionRequestV1
The request body containing consumption information.
Deprecated
object RefundLookupResponse
A response that contains an array of signed JSON Web Signature (JWS) transactions.
Deprecated
See Also
Deprecated


