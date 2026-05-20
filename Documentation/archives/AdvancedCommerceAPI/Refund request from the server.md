# Refund request from the server.pdf

## Page 1

transactionId
string
(Required) The transaction identifier for which you request a refund.
RequestRefundRequest
The request body.
Content-Type: application/json
200
RequestRefund
Response
OK
Request succeeded.
Content-Type: application/json
400
Bad Request
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Request Transaction Refund
Web Service Endpoint
Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
Advanced Commerce API 1.0+


## Page 2

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
RemovalAllNotAllowed
Error | Pending
RefundError |
ProratedOnlyLatest
TransactionError |
PartialSimulate
RefundDeclineError)
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Authorizing API requests from your server.
403
(SubscriptionDoesNot
ExistError |
SubscriptionNot
EligibleError |
Forbidden
Content-Type: application/json


## Page 3

ProductNotOwnedError
| InsufficientFunds
Error | Already
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
Note
To use the Request Transaction Refund endpoint, your membership Account Holder
must sign the Advanced Commerce API Addendum, and you must meet certain eligibility
requirements. For more information, see Advanced Commerce API. If the most recent version
of this agreement isn’t yet accepted, you can’t call this endpoint, and it returns an error.
Refer to the Advanced Commerce API Addendum to learn the use cases for the Cancel a
Subscription, Revoke Subscription, and Request Transaction Refund APIs.
Mentioned in
Discussion
See Also


## Page 4

object RequestRefundRequest
The request body for requesting a refund for a transaction.
object RequestRefundResponse
The response body for a transaction refund request.
object RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund amount, reason
and type.
Refund request from the server


## Page 5

currency
currency
The currency of the transaction.
items
[RequestRefundItem]
(Required)
refundRisking
Preference
refundRisking
Preference
(Required)
requestInfo
RequestInfo
(Required)
storefront
storefront
This is the request body for the Request Transaction Refund endpoint.
Properties
Discussion
Advanced Commerce API / RequestRefundRequest
Object
RequestRefundRequest
The request body for requesting a refund for a transaction.
Advanced Commerce API 1.1+


## Page 6

Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
object RequestRefundResponse
The response body for a transaction refund request.
object RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund amount, reason
and type.
See Also
Refund request from the server


## Page 7

signedRenewalInfo
JWSRenewalInfo
Subscription renewal information signed by the App Store, in JSON Web
Signature (JWS) format.
signedTransaction
Info
JWSTransaction
(Required) Transaction information signed by the App Store, in JWS Compac
Serialization format.
##Discussion This is the response body for the Request Transaction Refund endpoint.
Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
object RequestRefundRequest
The request body for requesting a refund for a transaction.
Properties
Overview
See Also
Refund request from the server
Advanced Commerce API / RequestRefundResponse
Object
RequestRefundResponse
The response body for a transaction refund request.
Advanced Commerce API 1.1+


## Page 8

object RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund amount, reason
and type.


## Page 9

SKU
SKU
(Required) The product identifier.
Maximum length: 128
refundAmount
refundAmount
The refund amount you’re requesting for the SKU, in milliunits of the currency
refundReason
refundReason
(Required) The reason for the refund request.
refundType
string
(Required) The type of refund requested.
Possible Values: FULL, PRORATED, CUSTOM
revoke
boolean
(Required)
Properties
See Also
Refund request from the server
Advanced Commerce API / RequestRefundItem
Object
RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund
amount, reason, and type.
Advanced Commerce API 1.1+


## Page 10

Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
object RequestRefundRequest
The request body for requesting a refund for a transaction.
object RequestRefundResponse
The response body for a transaction refund request.


