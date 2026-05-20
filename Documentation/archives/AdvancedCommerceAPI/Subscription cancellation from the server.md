# Subscription cancellation from the server.pdf

## Page 1

transactionId
string
(Required) The transaction identifier of the auto-renewable subscription to
cancel.
SubscriptionCancel
Request
The request body that includes information about the subscription to cancel.
Content-Type: application/json
200
SubscriptionCancel
Response
OK
Success
Content-Type: application/json
400
Bad Request
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Cancel a Subscription
Web Service Endpoint
Cancel a Subscription
Turn off automatic renewal to cancel a customer’s auto-renewable subscription.
Advanced Commerce API 1.0+


## Page 2

(NullRequestInfo
Error | InvalidApp
AccountTokenError |
NullRequestReference
IDError | Invalid
RequestReference
IDError | Invalid
ConsistencyToken
Error | Invalid
StorefrontError |
MismatchedStorefront
Error | OperationNot
AllowedError |
MalformedPayload
Error)
401
Unauthorized
403
(SubscriptionDoesNot
ExistError |
SubscriptionNot
EligibleError |
ProductNotOwned
Error)
Forbidden
Content-Type: application/json
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
Authorizing API requests from your server
Identifying rate limits for Advanced Commerce APIs
Mentioned in
Discussion


## Page 3

When this endpoint succeeds, the system sets the subscription’s auto-renew status to false an
the subscription doesn’t renew at the next renewal period. The customer continues to have acces
to the subscription until the end of the current period.
To immediately cancel a subscription instead, see Revoke Subscription.
Note
To use the Cancel a Subscription endpoint, your membership Account Holder must sign
the Advanced Commerce API Addendum, and you must meet certain eligibility requirements.
For more information, see Advanced Commerce API. If the most recent version of this
agreement isn’t yet accepted, you can’t call this endpoint, and it returns an error.
Refer to the Advanced Commerce API Addendum to learn the use cases for the Cancel a
Subscription, Revoke Subscription, and Request Transaction Refund APIs.
object SubscriptionCancelRequest
The request body for turning off automatic renewal of a subscription.
object SubscriptionCancelResponse
The response body for a successful subscription cancellation.
Example request and response
Response (decoded signed transaction)
Response (decoded signed renewal information)
See Also
Subscription cancellation from the server
Request


## Page 4

requestInfo
RequestInfo
(Required)
storefront
storefront
Cancel a Subscription
Turn off automatic renewal to cancel a customer’s auto-renewable subscription.
object SubscriptionCancelResponse
The response body for a successful subscription cancellation.
Properties
See Also
Subscription cancellation from the server
Advanced Commerce API / SubscriptionCancelRequest
Object
SubscriptionCancelRequest
The request body for turning off automatic renewal of a subscription.
Advanced Commerce API 1.0+


## Page 5

signedRenewalInfo
JWSRenewalInfo
(Required) Subscription renewal information signed by the App Store, in JSO
Web Signature (JWS) format.
signedTransaction
Info
JWSTransaction
(Required) Transaction information signed by the App Store, in JWS Compac
Serialization format.
This is the response body for the Cancel a Subscription endpoint.
Cancel a Subscription
Turn off automatic renewal to cancel a customer’s auto-renewable subscription.
object SubscriptionCancelRequest
Properties
Discussion
See Also
Subscription cancellation from the server
Advanced Commerce API / SubscriptionCancelResponse
Object
SubscriptionCancelResponse
The response body for a successful subscription cancellation.
Advanced Commerce API 1.0+


## Page 6

The request body for turning off automatic renewal of a subscription.


