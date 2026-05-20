# 001_RefundHistoryResponse.pdf

## Page 1

hasMore
hasMore
A Boolean value that indicates whether the App Store has more transactions
than it returns in signedTransactions. If the value is true, use the
revision token to request the next set of transactions by calling Get
Refund History.
revision
revision
A token you provide in a query to request the next set of transactions from th
Get Refund History endpoint.
signedTransactions
[JWSTransaction]
A list of up to 20 JWS transactions, or an empty array if the customer hasn’t
received any refunds in your app.
The transactions are sorted in ascending order by revocationDate.
App Store Server API changelog
The Get Refund History endpoint returns this response.
This response returns a maximum of 20 refunded transactions. If your customer has more than 20
refunded transactions, the hasMore value is true. Each response includes a revision token.
Properties
Mentioned in
Discussion
App Store Server API / RefundHistoryResponse
Object
RefundHistoryResponse
A response that contains an array of signed JSON Web Signature (JWS) refunded
transactions, and paging information.
App Store Server API 1.6+


## Page 2

Call Get Refund History again with the revision token in the query to receive the next set 
transactions. When the App Store has no more transactions to send, the hasMore value is false
Consider storing the revision token from the last page of results with other customer account
information. Use it at a later date when you call Get Refund History to request any new
refunded transactions since the last time you called the endpoint for the customer. By using the
stored revision token, you can avoid fetching transactions you’ve already received.
type hasMore
A Boolean value indicating whether the App Store has more transaction data.
type revision
A token you use in a query to request the next set of transactions for the customer.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
Get Refund History
Get a paginated list of all of a customer’s refunded in-app purchases for your app.
Topics
Response data types
See Also
Refund lookup


