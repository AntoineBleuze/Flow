# Deprecated.pdf

## Page 1

Deprecated
The verifyReceipt endpoint is deprecated. To validate receipts on your server, follow the
steps in Validating receipts on the device on your server. To validate in-app purchases on your
server without using receipts, call the App Store Server API to get Apple-signed transaction
and subscription information for your customers, or verify the AppTransaction and
Transaction signed data that your app obtains. You can also get the same signed
transaction and subscription information from the App Store Server Notifications
V2 endpoint.
requestBody
The JSON contents you submit with the request.
Content-Type: application/json
URL
Sandbox URL
HTTP Body
Response Codes
App Store Receipts / verifyReceipt Deprecated
Web Service Endpoint
verifyReceipt Deprecated
Send a receipt to the App Store for verification.
App Store Receipts 1.0–1.7 Deprecated


## Page 2

200
responseBody
OK
Content-Type: application/json
Validating with the App Store requires a secure connection between your app and your server, as
well as code on your server to validate the receipt with the App Store. Submit an HTTP POST
request with the contents detailed in requestBody using the verifyReceipt endpoint to verif
receipts with the App Store. Use the receipt fields in the responseBody to validate app and in-
app purchases.
Your server must support the Transport Layer Security (TLS) protocol 1.2 or later to call this
endpoint.
For more information about server-side receipt validation, see Validating receipts with the App
Store.
The sandbox URL for verifying receipts is:
Important
As a best practice, always call the production URL https://buy.itunes.apple
.com/verifyReceipt first and proceed to verify with the sandbox URL if you receive a
21007 status code. Following this approach ensures that you don’t have to switch between
URLs while your app is in testing, in review by App Review, or live in the App Store.
The verifyReceipt endpoint is deprecated. The HTTP header includes the deprecation date,
according to RFC 8594.
object requestBody
Discussion
Use the sandbox URL for sandbox testing
Find deprecation date in the HTTP header
See Also
Deprecated


## Page 3

The JSON contents you submit with the request to the App Store.
Deprecated
object responseBody
The JSON data that returns in the response from the App Store.
Deprecated
object error
Error information that returns in the response body when a request isn’t successful.


## Page 4

Deprecated
The verifyReceipt endpoint is deprecated.
receipt-data
byte
Deprecated   (Required) The Base64-encoded receipt data.
password
string
Deprecated   Your app’s shared secret, which is a hexadecimal string. The
password is required for receipts that include subscriptions, and strongly
recommended otherwise. For more information about the shared secret, see
Generate a shared secret to verify receipts.
exclude-old-
transactions
boolean
Deprecated   Set this value to true for the response to include only the latest
renewal transaction for any subscriptions. Use this field only for app receipts
that contain auto-renewable subscriptions.
To receive a decoded receipt for validation, send a request with the encoded receipt data and app
password to the App Store. For receipts that contain auto-renewable subscriptions, optionally
include an exclusion flag. Send this JSON data using the HTTP POST request method.
Properties
Discussion
App Store Receipts / requestBody Deprecated
Object
requestBody Deprecated
The JSON contents you submit with the request to the App Store.
App Store Receipts 1.0–1.7 Deprecated


## Page 5

verifyReceipt
Send a receipt to the App Store for verification.
Deprecated
object responseBody
The JSON data that returns in the response from the App Store.
Deprecated
object error
Error information that returns in the response body when a request isn’t successful.
See Also
Deprecated


## Page 6

Deprecated
The verifyReceipt endpoint is deprecated.
environment
string
Deprecated   The environment the system generates the receipt for.
Possible Values: Sandbox, Production
is_retryable
boolean
Deprecated   An indicator when an error occurs during the request. A value of 
indicates a temporary issue; retry validation for this receipt at a later time. A
value of 0 indicates an unresolvable issue; don’t retry validation for this receip
This is applicable only to status codes 21100–21199.
latest_receipt
byte
Deprecated   The latest Base64-encoded app receipt. This only returns for
receipts that contain auto-renewable subscriptions.
latest_receipt_info
[responseBody.Latest
_receipt_info]
Deprecated   An array that contains all in-app purchase transactions. This
excludes transactions for consumable products that your app marks as
finished.
pending_renewal_info
[responseBody
.Pending_renewal
_info]
Deprecated   In the JSON file, an array where each element contains the pend
renewal information for each auto-renewable subscription the product_id
identifies. This only returns for app receipts that contain auto-renewable
subscriptions.
Properties
App Store Receipts / responseBody Deprecated
Object
responseBody Deprecated
The JSON data that returns in the response from the App Store.
App Store Receipts 1.0–1.7 Deprecated


## Page 7

receipt
responseBody.Receipt
Deprecated   A JSON representation of the receipt that you send for verificatio
status
status
Deprecated   Either 0 if the receipt is valid, or a status code if there’s an error.
The status code reflects the status of the app receipt as a whole. See statu
for possible status codes and descriptions.
The verifyReceipt endpoint returns this response.
object responseBody.Pending_renewal_info
An array of elements that refers to open or failed auto-renewable subscription renewals.
object responseBody.Latest_receipt_info
An array that contains all in-app purchase transactions.
object responseBody.Receipt
The decoded version of the encoded receipt data that you send with the request to the App
Store.
verifyReceipt
Send a receipt to the App Store for verification.
Deprecated
object requestBody
The JSON contents you submit with the request to the App Store.
Deprecated
object error
Discussion
Topics
Objects
See Also
Deprecated


## Page 8

Error information that returns in the response body when a request isn’t successful.


## Page 9

code
int32
Deprecated   (Required) A standard HTTP status code returned in the respon
body whenever a request isn’t successful due to a general networking issue.
verifyReceipt
Send a receipt to the App Store for verification.
Deprecated
object requestBody
The JSON contents you submit with the request to the App Store.
Deprecated
object responseBody
The JSON data that returns in the response from the App Store.
Properties
See Also
Deprecated
App Store Receipts / error Deprecated
Object
error Deprecated
Error information that returns in the response body when a request isn’t
successful.
App Store Receipts 1.0–1.7 Deprecated


## Page 10

Deprecated


