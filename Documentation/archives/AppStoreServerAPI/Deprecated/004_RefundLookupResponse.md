# 004_RefundLookupResponse.pdf

## Page 1

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


## Page 2

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


