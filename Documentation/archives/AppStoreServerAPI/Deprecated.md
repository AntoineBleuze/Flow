# Deprecated.pdf

## Page 1

Deprecated
Use Get Transaction History instead, which gets the history for all product types,
including consumable in-app purchases in the finished state.
transactionId
transactionId
(Required) The identifier of a transaction that belongs to the customer, and
which may be an original transaction identifier (originalTransactionId)
revision
revision
A token you provide to get the next set of up to 20 transactions. All response
include a revision token. Use the revision token from the previous
URL
Sandbox URL
Path Parameters
Query Parameters
App Store Server API / Get Transaction History V1 Deprecated
Web Service Endpoint
Get Transaction History V1 Deprecated
Get a customer’s in-app purchase transaction history for your app, except finishe
consumable in-app purchases.
App Store Server API 1.0–1.12 Deprecated


## Page 2

HistoryResponse.
Note: The revision token is required in all requests except the initial reques
For requests that use the revision token, include the same query paramete
from the initial request.
startDate
startDate
An optional start date of the timespan for the transaction history records you
requesting. The startDate needs to precede the endDate if you specify
both dates. The results include a transaction if its purchaseDate is equal to
or greater than the startDate.
endDate
endDate
An optional end date of the timespan for the transaction history records you’
requesting. Choose an endDate that’s later than the startDate if you
specify both dates. Using an endDate in the future is valid. The results inclu
a transaction if its purchaseDate is less than the endDate.
productId
[productId]
An optional filter that indicates the product identifier to include in the
transaction history. Your query may specify more than one productID.
productType
[string]
An optional filter that indicates the product type to include in the transaction
history. Your query may specify more than one productType.
Possible Values: AUTO_RENEWABLE, NON_RENEWABLE, CONSUMABLE,
NON_CONSUMABLE
sort
string
An optional sort order for the transaction history records. The response sorts
the transaction records by their recently modified date. The default value is
ASCENDING, so you receive the oldest records first.
Possible Values: ASCENDING, DESCENDING
subscriptionGroup
Identifier
[subscriptionGroup
Identifier]
An optional filter that indicates the subscription group identifier to include in
the transaction history. Your query may specify more than one subscripti
GroupIdentifier.
inAppOwnershipType
inAppOwnershipType
An optional filter that limits the transaction history by the in-app ownership
type.
revoked
boolean
An optional Boolean value that indicates whether the response includes only
revoked transactions when the value is true, or contains only nonrevoked
transactions when the value is false. By default, the request doesn’t include
this parameter.
Possible Values: true, false
excludeRevoked
boolean
Deprecated   Set revoked to false to exclude revoked transactions instead.
Possible Values: true, false


## Page 3

200
HistoryResponse
OK
Request succeeded.
Content-Type: application/json
400
(InvalidApp
IdentifierError |
InvalidRequest
RevisionError |
InvalidTransactionId
Error | InvalidSort
Error | InvalidStart
DateError | Invalid
EndDateError |
InvalidProductType
Error | Invalid
ProductIdError |
InvalidSubscription
GroupIdentifierError
| InvalidInApp
OwnershipTypeError |
InvalidExclude
RevokedError |
InvalidRevokedError)
Bad Request
Invalid request.
Content-Type: application/json
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
Internal Server Error
Server error. Try again later.
Content-Type: application/json
Response Codes


## Page 4

InternalRetryable
Error)
App Store Server API changelog
Identifying rate limits
The Get Transaction History V1 endpoint returns results for the following product types:
Auto-renewable subscriptions
Non-renewing subscriptions
Non-consumable in-app purchases
Consumable in-app purchases if the transaction is refunded or revoked, or if the app hasn’t
finished processing the transaction. The results don’t include consumable in-app purchases th
the app marks as finished. For more information about finishing transactions, see finish() a
finishTransaction(_:).
Note
Use Get Transaction History instead to get all the product types, including consumable
in-app purchases in the finished state.
You can customize your request by including query parameters that filter the transaction history.
The query parameters limit the scope of the request by dates, product IDs, product types, and
subscription group identifiers. You can also exclude revoked or nonrevoked transactions, and limi
the transactions by in-app ownership type. If you provide multiple filters in the query, the
transactions that return match all the filters.
You can also specify a sort order. The App Store sorts the transactions based on their recently
modified dates. Use a DESCENDING order to get the most recent transactions first. The App Stor
updates the recently modified date if the customer upgrades a subscription or the App Store
revokes an in-app purchase. If a transaction updates while you’re receiving transaction history an
the response is sorted in ASCENDING order, you may receive the transaction again with updated
data.
The productId, productType, and subscriptionGroupIdentifier query parameters
allow you to specify multiple values. To specify more than one value for a query parameter, includ
Mentioned in
Discussion


## Page 5

it in the request multiple times. For example, to filter the transaction history by non-consumable
and auto-renewable product types, include the following within your request:
When you specify multiple values for a single query parameter, the response contains transaction
that match any of the values.
Note
If you use optional query parameters, be sure to use the same query parameters on
subsequent requests that include the revision parameter.
To request a full transaction history in ascending order for your app, start by calling the endpoint
without any query parameters, as follows:
For subsequent requests, include the revision token from the previous HistoryResponse.
Get Refund History V1
Get a list of up to 50 of a customer’s refunded in-app purchases for your app.
Deprecated
Send Consumption Information V1
Send consumption information about a consumable In-App Purchase or auto-renewable
subscription to the App Store after your server receives a consumption request notification.
Deprecated
object ConsumptionRequestV1
The request body containing consumption information.
Deprecated
See Also
Deprecated


## Page 6

object RefundLookupResponse
A response that contains an array of signed JSON Web Signature (JWS) transactions.
Deprecated


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

Deprecated
Use Send Consumption Information instead.
transactionId
transactionId
(Required) The transaction identifier for which you’re providing consumption
information. You receive this identifier in the CONSUMPTION_REQUEST
notification the App Store sends to your server’s App Store Server
Notifications V2 endpoint.
ConsumptionRequestV1
The request body.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
App Store Server API / Send Consumption Information V1 Deprecated
Web Service Endpoint
Send Consumption Information V1 Deprecated
Send consumption information about a consumable In-App Purchase or auto-
renewable subscription to the App Store after your server receives a consumption
request notification.
App Store Server API 1.0–1.19 Deprecated


## Page 11

202
Accepted
The App Store server received the consumption information.
400
(InvalidAccount
TenureError |
InvalidAppAccount
TokenError | Invalid
ConsumptionStatus
Error | Invalid
CustomerConsented
Error | Invalid
DeliveryStatusError
| InvalidLifetime
DollarsPurchased
Error | Invalid
LifetimeDollars
RefundedError |
InvalidPlatformError
| InvalidPlayTime
Error | Invalid
SampleContent
ProvidedError |
InvalidUserStatus
Error | Invalid
RefundPreference
Error | Invalid
TransactionTypeNot
SupportedError)
Bad Request
Invalid request. See the error code for more information. If there’s no error
code, the request is malformed.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
TransactionIdNot
FoundError
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
GeneralInternalError
Internal Server Error
Server error. Try again later.
Content-Type: application/json
Response Codes


## Page 12

App Store Server API changelog
Identifying rate limits
The App Store uses a variety of factors to determine if a refund request is approved or denied. To
help inform and improve the refund process, you can send information about a customer’s
consumption of the In-App Purchase to the App Store when the customer requests a refund. The
App Store uses the consumption information you provide to inform its refund decisions.
When a customer initiates a refund request for a consumable In-App Purchase or auto-renewable
subscription, the App Store sends a CONSUMPTION_REQUEST notificationType to your
server through your App Store Server Notifications V2 endpoint. If the customer
provided consent, respond by calling this API and sending the consumption data in the
ConsumptionRequestV1 to the App Store. If not, don’t respond to the CONSUMPTION_REQUES
notification.
Respond within 12 hours of receiving the CONSUMPTION_REQUEST notification.
For information about configuring your server to receive App Store server notifications, see
Enabling App Store Server Notifications. For information about initiating refund requests in an app
see any of the refund request methods, including beginRefundRequest(in:), beginRefund
Request(for:in:), beginRefundRequest(in:), and beginRefundRequest(for:in:)
You must obtain valid consent from the customer before sharing their personal data with Apple in
the Send Consumption Information V1 API. You, the developer, are solely responsible for
obtaining valid consent because you’re sharing with Apple the data that you collected from the
customer.
The requirements to obtain valid consent vary under applicable law, and Apple can’t advise you o
specific ways to obtain valid consent. Developers are responsible for determining specific
compliance with applicable laws. If your app violates Apple’s guidelines, App Review will reach ou
and work with you to address any concerns.
Here are some general guidelines to keep in mind for obtaining valid consent:
Valid consent is freely given, specific, informed, and unambiguous as to a customer’s wishes
with respect to their personal data.
As an example, when requesting consent, you may include: clear language that conveys to a
customer that you will provide Apple with some of their personal data to assist with reviewing
Mentioned in
Discussion
Obtain valid consent


## Page 13

the customer’s app refund requests; clear language that conveys to customers that they can
withdraw their consent at any time; and a method for customers to give their affirmative conse
Opt-in consent is a higher standard for consent than offering an opt-out. Generally, if you don’t
offer an individual the opportunity to opt out, it can be difficult to show that consent is freely
given.
After you’ve obtained consent, if there is a change in circumstances causing you to conclude
that the customer’s consent is no longer valid — for example, due to a change in the way you u
or share data, or if the customer withdraws consent for this purpose — you should update the
customerConsented flag and not send any further data from that customer.
Important
Don’t use the App Tracking Transparency prompt to obtain consent for sharing data with Apple
through the Send Consumption Information V1 API. Obtaining consent needed to use
the Send Consumption Information V1 endpoint is unrelated to App Tracking
Transparency. These two features are distinct and unrelated.
The data you share with Apple through the Send Consumption Information V1 API isn’t
used for tracking. You must separately obtain consent from customers when sharing data with
Apple using the Send Consumption Information V1 API.
If you adopt the Send Consumption Information V1 API, answer the app privacy questions
to disclose in your labels any data you collect from your customers and what you’re using it for. Fo
more information about app privacy labels, see App privacy details on the App Store.
Apple uses and protects the data you share through the Send Consumption Information V
API in accordance with Apple’s Privacy Policy. For additional information about how Apple protect
data, see Apple Platform Security Guide. Apple retains the data you provide through the Send
Consumption Information V1 API for the period necessary to fulfill the purpose for which th
data was collected, which is to improve the refund process by obtaining data that assists with
reviewing the customer’s refund request. Apple may share the data you provide through the Send
Consumption Information V1 API with service providers who act on our behalf, our partner
or others at your direction. Apple will not share the data with third parties for their own marketing
purposes. For more information, see App Store & Privacy.
If your customers request access to or deletion of their personal data related to consumption
information, inform them that they may submit requests directly to Apple by visiting
Disclose data usage
Handle requests to access or delete consumption data


## Page 14

privacy.apple.com. If your app stores data in CloudKit on behalf of your customers, see Respondin
to Requests to Delete Data, Providing User Access to CloudKit Data, and Changing Access Contro
on User Data for more information.
Get Transaction History V1
Get a customer’s in-app purchase transaction history for your app, except finished
consumable in-app purchases.
Deprecated
Get Refund History V1
Get a list of up to 50 of a customer’s refunded in-app purchases for your app.
Deprecated
object ConsumptionRequestV1
The request body containing consumption information.
Deprecated
object RefundLookupResponse
A response that contains an array of signed JSON Web Signature (JWS) transactions.
Deprecated
See Also
Deprecated


## Page 15

Deprecated
Use ConsumptionRequest with the Send Consumption Information endpoint instead.
accountTenure
accountTenure
Deprecated   (Required) The age of the customer’s account.
appAccountToken
appAccountToken
Deprecated   (Required) The UUID of the in-app user account that completed
the in-app purchase transaction.
consumptionStatus
consumptionStatus
Deprecated   (Required) A value that indicates the extent to which the custom
consumed the in-app purchase.
customerConsented
customerConsented
Deprecated   (Required) A Boolean value of true or false that indicates
whether the customer consented to provide consumption data.
Note: The App Store server rejects requests that have a customer
Consented value other than true by returning an HTTP 400 error with an
InvalidCustomerConsentedError.
deliveryStatus
deliveryStatusV1
Deprecated   (Required) A value that indicates whether the app successfully
delivered an in-app purchase that works properly.
Properties
App Store Server API / ConsumptionRequestV1 Deprecated
Object
ConsumptionRequestV1 Deprecated
The request body containing consumption information.
App Store Server API 1.0+


## Page 16

lifetimeDollars
Purchased
lifetimeDollars
Purchased
Deprecated   (Required) A value that indicates the total amount, in USD, of in-
app purchases the customer has made in your app, across all platforms.
lifetimeDollars
Refunded
lifetimeDollars
Refunded
Deprecated   (Required) A value that indicates the total amount, in USD, of
refunds the customer has received, in your app, across all platforms.
platform
platform
Deprecated   (Required) A value that indicates the platform on which the
customer consumed the in-app purchase.
playTime
playTime
Deprecated   (Required) A value that indicates the amount of time that the
customer used the app.
refundPreference
refundPreferenceV1
Deprecated   A value that indicates your preference, based on your operationa
logic, as to whether Apple should grant the refund.
sampleContent
Provided
sampleContent
Provided
Deprecated   (Required) A Boolean value of true or false that indicates
whether you provided, prior to its purchase, a free sample or trial of the
content, or information about its functionality.
userStatus
userStatus
Deprecated   (Required) The status of the customer’s account.
App Store Server API changelog
Use ConsumptionRequestV1 to provide information about the customer’s consumable in-app
purchase or auto-renewable subscription when you call the Send Consumption Informatio
V1 endpoint.
To create a valid request and avoid an HTTP 400 Bad Request error, ConsumptionRequest
V1 must contain all the required fields with proper data types and valid values. However, you can
choose whether or not to provide information for most fields. Most fields have a valid option if you
choose not to provide the information.
Mentioned in
Discussion


## Page 17

Note
Use the field value for undeclared, where available, if you choose not to provide information.
For example, if you choose not to provide information for the accountTenure field, set accoun
Tenure to 0. If you choose not to provide information for the appAccountToken field, set its
value to an empty string. Refer to each field’s documentation for the list of valid values, including
the undeclared value where available.
The App Store server rejects requests that have a customerConsented value other than true 
returning an HTTP 400 error with an InvalidCustomerConsentedError.
The ConsumptionRequestV1 request body requires that you set the appAccountToken to a
valid value of either a UUID or an empty string. Set the appAccountToken value to the value you
received in the CONSUMPTION_REQUEST notification, or, if you choose not to provide this
information, set the value to an empty string.
If you receive a CONSUMPTION_REQUEST notification for a transaction, find its associated app
AccountToken value as follows:
If you receive App Store Server Notifications V2, the appAccountToken value is i
JWSTransactionDecodedPayload.
If you receive App Store Server Notifications Version 1, the appAccountToken value is in
unified_receipt.Latest_receipt_info.
The appAccountToken value may be an empty string if your app doesn’t use app account token
For more information about App Store Server Notifications versions, see App Store Server
Notifications changelog.
type accountTenure
The age of the customer’s account.
type appAccountToken
The UUID that you generate to associate a customer’s In-App Purchase with its resulting Ap
Store transaction.
Provide the app account token in a consumption request
Topics
Consumption data types


## Page 18

type consumptionStatus
A value that indicates the extent to which the customer consumed the In-App Purchase.
type customerConsented
A Boolean value that indicates whether the customer consented to provide consumption dat
to the App Store.
type deliveryStatusV1
A value that indicates whether the app successfully delivered an In-App Purchase that works
properly.
type lifetimeDollarsPurchased
A value that indicates the dollar amount of in-app purchases the customer has made in your
app, since purchasing the app, across all platforms.
type lifetimeDollarsRefunded
A value that indicates the dollar amount of refunds the customer has received in your app,
since purchasing the app, across all platforms.
type platform
The platform on which the customer consumed the in-app purchase.
type playTime
A value that indicates the amount of time that the customer used the app.
type refundPreferenceV1
A value that indicates your preferred outcome for the refund request.
type sampleContentProvided
A Boolean value that indicates whether you provided, prior to its purchase, a free sample or
trial of the content, or information about its functionality.
type userStatus
The status of a customer’s account within your app.
Get Transaction History V1
See Also
Deprecated


## Page 19

Get a customer’s in-app purchase transaction history for your app, except finished
consumable in-app purchases.
Deprecated
Get Refund History V1
Get a list of up to 50 of a customer’s refunded in-app purchases for your app.
Deprecated
Send Consumption Information V1
Send consumption information about a consumable In-App Purchase or auto-renewable
subscription to the App Store after your server receives a consumption request notification.
Deprecated
object RefundLookupResponse
A response that contains an array of signed JSON Web Signature (JWS) transactions.
Deprecated


## Page 20

Deprecated
Use Get Refund History and its response, RefundHistoryResponse, instead.
signedTransactions
[JWSTransaction]
Deprecated   A list of JWS transactions, or an empty array if the customer has
received no refunds in your app. The transactions are sorted in ascending
order by their revocationDate.
App Store Server API changelog
If the customer hasn’t received any refunds for in-app purchases in your app, the signed
Transactions array is empty. To read the transaction information, decode the payload for each
JWSTransaction object in the signedTransactions array. Use a JWSTransactionDecod
Payload object to read the transaction information in the payload.
This response can contain a maximum of 50 transactions in the signedTransactions array.
Properties
Mentioned in
Discussion
App Store Server API / RefundLookupResponse Deprecated
Object
RefundLookupResponse Deprecated
A response that contains an array of signed JSON Web Signature (JWS)
transactions.
App Store Server API 1.1–1.6 Deprecated


## Page 21

Get Transaction History V1
Get a customer’s in-app purchase transaction history for your app, except finished
consumable in-app purchases.
Deprecated
Get Refund History V1
Get a list of up to 50 of a customer’s refunded in-app purchases for your app.
Deprecated
Send Consumption Information V1
Send consumption information about a consumable In-App Purchase or auto-renewable
subscription to the App Store after your server receives a consumption request notification.
Deprecated
object ConsumptionRequestV1
The request body containing consumption information.
Deprecated
See Also
Deprecated


