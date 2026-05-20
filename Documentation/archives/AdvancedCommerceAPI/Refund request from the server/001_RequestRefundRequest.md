# 001_RequestRefundRequest.pdf

## Page 1

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


## Page 2

Request Transaction Refund
Request a refund for a one-time charge or subscription transaction.
object RequestRefundResponse
The response body for a transaction refund request.
object RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund amount, reason
and type.
See Also
Refund request from the server


