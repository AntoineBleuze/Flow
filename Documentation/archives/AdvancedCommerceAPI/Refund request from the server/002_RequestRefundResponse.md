# 002_RequestRefundResponse.pdf

## Page 1

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


## Page 2

object RequestRefundItem
Information about the refund request for an item, such as its SKU, the refund amount, reason
and type.


