# 003_RequestRefundItem.pdf

## Page 1

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


## Page 2

Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
object RequestRefundRequest
The request body for requesting a refund for a transaction.
object RequestRefundResponse
The response body for a transaction refund request.


