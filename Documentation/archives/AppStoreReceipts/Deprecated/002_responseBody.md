# 002_responseBody.pdf

## Page 1

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


## Page 2

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


## Page 3

Error information that returns in the response body when a request isn’t successful.


