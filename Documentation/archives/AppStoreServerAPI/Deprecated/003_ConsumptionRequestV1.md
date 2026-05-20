# 003_ConsumptionRequestV1.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


