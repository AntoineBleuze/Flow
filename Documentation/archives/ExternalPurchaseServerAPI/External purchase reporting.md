# External purchase reporting.pdf

## Page 1

ExternalPurchase
Report
The request body that contains the report information.
Content-Type: application/json
200
SendReportSuccess
Response
OK
The report was received and passed validation checks successfully.
Content-Type: application/json
400
SendReportError
Response
Bad Request
The report failed because the request was malformed, a duplicate request, o
the SendReportErrorResponse object is present that the line item
validation failed.
Content-Type: application/json
URL
Sandbox URL
HTTP Body
Response Codes
External Purchase Serve… / Send External Purchase Report
Web Service Endpoint
Send External Purchase Report
Report required information about external purchase tokens and associated
transactions.
External Purchase Server API 1.0.0+


## Page 2

401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid.
429
Rate limit exceeded.
500
Internal Server Error
Server error. Try again later.
Reporting corrections
Reporting unrecognized and transactionless tokens
Reporting tokens with transactions
Call this endpoint to report an external purchase token that your app or website receives, and the
transactions and events associated with the token. For information on the reporting requirements
see the Commission, transaction reports, and payments section of the article Using alternative
payment options on the App Store in the European Union.
To send the report, add your data to the ExternalPurchaseReport request body. For more
information about creating reports, see the following:
Reporting tokens with transactions
Reporting unrecognized and transactionless tokens
Reporting corrections
The server indicates it successfully received your report by returning an HTTP 200 response with
your requestIdentifier in the SendReportSuccessResponse. If you receive an HTTP 40
error response with a SendReportErrorResponse object, the server didn’t successfully receiv
any of the data in the report. Fix the errors listed in the response object, and resubmit the full
report using the same requestIdentifier. The server also sends an HTTP 400 error if the
request is a duplicate, or if it’s malformed.
Call this endpoint using its sandbox URL only for tokens that the system generates in the sandbox
environment. For more information about identifying sandbox tokens, see Receiving and decoding
external purchase tokens.
Mentioned in
Discussion
Testing in the sandbox environment


## Page 3

Important
The sandbox tokens and any test transaction data you submit through the sandbox URLs of
the External Purchase Server API are not actual transactions.
object ExternalPurchaseReport
The contents of an external purchase report for a single token.
object SendReportSuccessResponse
A response that contains the request identifier and indicates the server successfully receive
your external purchase report.
object SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed, including erro
details for the line items in your report.
See Also
External purchase reporting


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

requestIdentifier
requestIdentifier
(Required) The UUID that you generated to uniquely identify the report when
calling the Send External Purchase Report endpoint.
The Send External Purchase Report endpoint returns this response when the server
successfully receives a report that passes validation checks. Record the requestIdentifier i
your system. Use the requestIdentifer to get the report by sending a request to the
Retrieve External Purchase Report endpoint.
Send External Purchase Report
Report required information about external purchase tokens and associated transactions.
object ExternalPurchaseReport
Properties
Discussion
See Also
External purchase reporting
External Purchase Serve… / SendReportSuccessResponse
Object
SendReportSuccessResponse
A response that contains the request identifier and indicates the server
successfully received your external purchase report.
External Purchase Server API 1.0.0+


## Page 8

The contents of an external purchase report for a single token.
object SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed, including erro
details for the line items in your report.


## Page 9

errors
[*]
(Required)
Possible types: DuplicateValueError, ReportingCurrencyMismat
Error, NotFoundError, OmittedFieldError, FieldNotAllowed
Error, FutureDateError, UnknownEnumError, LineItemStatus
RegressionError, MissingLineItemsForStatusError, Line
ItemsNotAllowedForStatusError, IncorrectAmountTax
InclusiveError, IncorrectNetAmountError, SelfReference
Error, ReferenceInvalidSubscriptionEventError, Negative
ValueNotAllowedError, PositiveValueRequiredError, Start
DateAfterEndDateError, ReportingCurrencyExchangeNot
AllowedError, MaximumLengthExceededError, Erroneously
SubmittedNotRestatementError, ReferenceLineItemNotABuy
Error, ErroneousLineItemReferencedByValidLineItemError,
TaxCountryMismatchError, NetAmountMismatchError, Valid
LineItemReferencesErroneousLineItemError, Simultaneous
SubmissionError, DateTooFarInPastError, RefundReferenced
ByRefundError, NonInitialBuyReferencedByBuyError, Repeat
ErroneousSubmissionError, ReferencedCreationDate
IncompatibleError, PricingCurrencyMismatchError, Exchang
RateMismatchError, SubscriptionStartNonZeroDaysPaid
ServiceError, InvalidTaxInclusiveAmountForSubscription
PaymentError, LineItemCreationDateOutOfRangeError,
DuplicateTokenStatusNotAllowedError, RestatementCreation
DateMismatchError, RestatementNotAllowedCreationDate
Error, RefundNotAllowedCreationDateError
Properties
External Purchase Serve… / SendReportErrorResponse
Object
SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed,
including error details for the line items in your report.
External Purchase Server API 1.0.0+


## Page 10

Send External Purchase Report
Report required information about external purchase tokens and associated transactions.
object ExternalPurchaseReport
The contents of an external purchase report for a single token.
object SendReportSuccessResponse
A response that contains the request identifier and indicates the server successfully receive
your external purchase report.
See Also
External purchase reporting


