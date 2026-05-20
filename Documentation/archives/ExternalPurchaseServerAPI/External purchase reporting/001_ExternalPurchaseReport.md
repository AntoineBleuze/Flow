# 001_ExternalPurchaseReport.pdf

## Page 1

requestIdentifier
requestIdentifier
(Required) A UUID that you generate to uniquely identify the report.
externalPurchaseId
externalPurchaseId
(Required) The unique identifier of the external purchase token for which yo
submit the report.
status
status
(Required) The status of the token that determines the information the repor
contains.
lineItems
[*]
An array of line items that describe transactions or events associated with the
token identified by the externalPurchaseId.
Possible types: OneTimeBuyLineItem, SubscriptionBuyLineItem,
RefundLineItem
Reporting tokens with transactions
Reporting unrecognized and transactionless tokens
External Purchase Server API changelog
Reporting corrections
Properties
Mentioned in
External Purchase Serve… / ExternalPurchaseReport
Object
ExternalPurchaseReport
The contents of an external purchase report for a single token.
External Purchase Server API 1.0.0+


## Page 2

This object is the request body for the Send External Purchase Report endpoint. Populat
this object with data about a single external purchase token that you’re reporting, including its
transactions. The Retrieve External Purchase Report endpoint also returns this object
when you request a report you previously successfully submitted.
The requestIdentifier field identifies the report. Generate a UUID for each report you send.
Tip
Store the requestIdentifier value in your records with the external purchase token to
identify your reports.
The externalPurchaseId field is the token’s identifier. To get that value, decode the external
purchase token you receive in your app or on your website. For more information, see Receiving
and decoding external purchase tokens.
The status field represents the token’s status, which you provide to indicate the report’s conten
and whether it includes a lineItems array. The status value determines the type of report you
send:
Use a LINE_ITEM status to report a token with transactions that you list in the lineItems
array. Use this status when a token has associated transactions, and to send corrections to
previously submitted line items. For more information, see Reporting tokens with transactions.
Use a NO_LINE_ITEM status for a report of a token that didn’t result in any successful
transactions. Don’t include lineItems in the request with this status. For more information, s
Reporting unrecognized and transactionless tokens.
Use an UNRECOGNIZED_TOKEN status to report a token you receive in an App Store Server
Notification, but that you don’t have recorded in your system. Don’t include lineItems in the
request with this status. For more information, see Reporting unrecognized and transactionless
tokens.
Use a DUPLICATE_TOKEN status to report a SERVICES or ACQUISITION token that you
recognize, but which you aren’t using to report transactions because it’s a duplicate token. Don
include lineItems in the request with this status. For more information, see Reporting
unrecognized and transactionless tokens.
You can also submit corrections to restate line items, or retract a previous submission. For more
information, see Reporting corrections.
A line item represents each transaction for the token identified by the externalPurchaseId.
There are three types of line items:
OneTimeBuyLineItem, for one-time charges
Discussion


## Page 3

RefundLineItem, for refunds
SubscriptionBuyLineItem, for auto-renewable subscription events and transactions
Include as many line items as there are transactions that apply to the token. If your system
completes new transactions after you successfully submit a report for a token, send a new report
for the token with the new transactions.
type requestIdentifier
A UUID that uniquely identifies an external purchase report.
type externalPurchaseId
The unique identifier of an external purchase token.
type status
A string value you provide to indicate the status of the token and the contents of the externa
purchase report.
Send External Purchase Report
Report required information about external purchase tokens and associated transactions.
object SendReportSuccessResponse
A response that contains the request identifier and indicates the server successfully receive
your external purchase report.
object SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed, including erro
details for the line items in your report.
Topics
Data types
See Also
External purchase reporting


