# Subscription status.pdf

## Page 1

transactionId
transactionId
(Required) The identifier of a transaction that belongs to the customer, and
which may be an original transaction identifier (originalTransactionId)
status
[status]
An optional filter that indicates the status of subscriptions to include in the
response. Your query may specify more than one status query parameter.
200
StatusResponse
OK
Request succeeded.
Content-Type: application/json
400
Bad Request
Content-Type: application/json
URL
Sandbox URL
Path Parameters
Query Parameters
Response Codes
App Store Server API / Get All Subscription Statuses
Web Service Endpoint
Get All Subscription Statuses
Get the statuses for all of a customer’s auto-renewable subscriptions in your app.
App Store Server API 1.0+


## Page 2

(InvalidApp
IdentifierError |
InvalidTransactionId
Error | Invalid
StatusError)
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
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
This API returns the status for all of the customer’s subscriptions, organized by their subscription
group identifier.
Specify multiple values for the status query parameter to get a response that contains
subscriptions with statuses that match any of the values. For example, the following request
returns subscriptions that are active (status value of 1) and subscriptions that are in the Billing
Grace Period (status value of 4):
Mentioned in
Discussion


## Page 3

object StatusResponse
A response that contains status information for all of a customer’s auto-renewable
subscriptions in your app.
See Also
Subscription status


## Page 4

data
[SubscriptionGroup
IdentifierItem]
An array of information for auto-renewable subscriptions, including App Store
signed transaction information and App Store-signed renewal information.
environment
environment
The server environment, sandbox or production, in which the App Store
generated the response.
appAppleId
appAppleId
Your app’s App Store identifier.
bundleId
bundleId
Your app’s bundle identifier.
object SubscriptionGroupIdentifierItem
Properties
Topics
Response Objects and Data Types
App Store Server API / StatusResponse
Object
StatusResponse
A response that contains status information for all of a customer’s auto-renewabl
subscriptions in your app.
App Store Server API 1.0+


## Page 5

Information for auto-renewable subscriptions, including signed transaction information and
signed renewal information, for one subscription group.
type environment
The server environment, either sandbox or production.
type appAppleId
The unique identifier of an app in the App Store.
type bundleId
The bundle identifier of an app.
Get All Subscription Statuses
Get the statuses for all of a customer’s auto-renewable subscriptions in your app.
See Also
Subscription status


