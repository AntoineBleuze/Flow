# 002_SendReportSuccessResponse.pdf

## Page 1

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


## Page 2

The contents of an external purchase report for a single token.
object SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed, including erro
details for the line items in your report.


