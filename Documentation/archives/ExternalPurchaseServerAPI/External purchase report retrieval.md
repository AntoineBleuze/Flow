# External purchase report retrieval.pdf

## Page 1

requestIdentifier
requestIdentifier
(Required) The UUID that identifies the external purchase report you’re
requesting.
200
RetrieveReport
SuccessResponse
OK
Success. The RetrieveReportSuccessResponse object contains your
report.
Content-Type: application/json
400
NotFoundError
Bad Request
The request returned an error. Check the requestIdentifier parameter 
ensure it’s a valid identifer for a report that you successfully submitted.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid.
URL
Sandbox URL
Path Parameters
Response Codes
External Purchase Serve… / Retrieve External Purchase Report
Web Service Endpoint
Retrieve External Purchase Report
Get an external purchase report by providing its request identifier.
External Purchase Server API 1.0.0+


## Page 2

429
Rate limit exceeded.
500
Internal Server Error
Server error. Try again later.
Call this endpoint to retrieve an external purchase report that you successfully sent to Apple. This
endpoint takes the requestIdentifier that you create when you call Send External
Purchase Report, for reports that were successfully submitted.
type requestIdentifier
A UUID that uniquely identifies an external purchase report.
object RetrieveReportSuccessResponse
A response that indicates success and includes your external purchase report data.
Discussion
Topics
Data types
See Also
External purchase report retrieval


## Page 3

report
ExternalPurchase
Report
(Required) The external purchase report data.
This successful response contains the external purchase report data that you request when you
call Retrieve External Purchase Report.
object ExternalPurchaseReport
The contents of an external purchase report for a single token.
Properties
Discussion
Topics
Data types
External Purchase Serve… / RetrieveReportSuccessResponse
Object
RetrieveReportSuccessResponse
A response that indicates success and includes your external purchase report
data.
External Purchase Server API 1.0.0+


## Page 4

Retrieve External Purchase Report
Get an external purchase report by providing its request identifier.
See Also
External purchase report retrieval


