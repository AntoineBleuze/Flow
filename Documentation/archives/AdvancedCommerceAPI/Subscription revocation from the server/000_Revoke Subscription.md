# 000_Revoke Subscription.pdf

## Page 1

transactionId
string
(Required) The transaction identifier of the auto-renewable subscription to
revoke. Use the subscription’s original transaction ID or any subsequent
transaction ID of a transaction related to the subscription.
SubscriptionRevoke
Request
Content-Type: application/json
200
SubscriptionRevoke
Response
OK
Request succeeded.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Revoke Subscription
Web Service Endpoint
Revoke Subscription
Immediately cancel a customer’s subscription and all the items that are included i
the subscription, and request a full or prorated refund.
Advanced Commerce API 1.0+


## Page 2

400
(RepeatedRequest
ReferenceIdError |
NullRequestInfoError
| InvalidAppAccount
TokenError | Null
RequestReference
IDError | Invalid
RequestReference
IDError | Invalid
ConsistencyToken
Error | Invalid
StorefrontError |
MismatchedStorefront
Error | Mismatched
StorefrontError |
OperationNotAllowed
Error | Malformed
PayloadError |
SimulateRefund
DeclineOnlyInSandbox
Error | RefundAmount
WithoutCustomError |
NullRefundRisking
Error | Invalid
RefundTypeError |
InvalidRefundReason
Error | Negative
RefundAmountError |
NullRefundAmount
Error | NullRefund
ReasonError | Null
RefundTypeError |
PendingRefundError |
RevokeOnInactive
SubscriptionError)
Bad Request
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Authorizing API requests from your server.
403
(SubscriptionDoesNot
ExistError |
SubscriptionNot
EligibleError |
ProductNotOwnedError
| InsufficientFunds
Error | Already
Forbidden
Content-Type: application/json


## Page 3

RefundedError |
TransactionNot
RefundableError)
404
TransactionIdNot
FoundError
Not Found
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit. For more information, see Identifying rat
limits for Advanced Commerce APIs.
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Server error. Try again later.
Content-Type: application/json
Authorizing API requests from your server
Advanced Commerce API changelog
Identifying rate limits for Advanced Commerce APIs
When this endpoint succeeds, the system sets the subscription’s auto-renew status to false, an
revokes the subscription with a full or prorated refund. The App Store Server Notifications sends 
REFUND notificationType to your App Store Server Notifications V2 endpoint.
Check the revocationDate property in the notification’s JWSTransactionDecodedPayload
Turn off service for the subscription and its items as of the revocation date. Don’t turn off service
to the subscription until you receive the notification.
To cancel a subscription at the end of the current period instead, see Cancel a Subscriptio
Note
To use the Revoke Subscription endpoint, your membership Account Holder must sign
the Advanced Commerce API Addendum, and you must meet certain eligibility requirements.
For more information, see Advanced Commerce API. If the most recent version of this
agreement isn’t yet accepted, you can’t call this endpoint, and it returns an error.
Mentioned in
Discussion


## Page 4

Refer to the Advanced Commerce API Addendum to learn the use cases for the Cancel a
Subscription, Revoke Subscription, and Request Transaction Refund APIs.
object SubscriptionRevokeRequest
The request body you provide to terminate a subscription and all its items immediately.
object SubscriptionRevokeResponse
The response body for a successful revoke-subscription request.
See Also
Subscription revocation from the server


