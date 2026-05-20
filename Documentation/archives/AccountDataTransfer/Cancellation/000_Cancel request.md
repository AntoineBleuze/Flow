# 000_Cancel request.pdf

## Page 1

CancellationRequest
An object that identifies the request to cancel.
Content-Type: application/json
200
CancellationResponse
OK
Content-Type: application/json
400
Bad Request
401
Unauthorized
403
Forbidden
500
Internal Server Error
A cancellation request only succeeds if the request is currently in progress.
URL
HTTP Body
Response Codes
Overview
Account Data Transfer / Cancel request
Web Service Endpoint
Cancel request
Tells the server to stop processing an active request.
Account Data Transfer 1.0+


## Page 2

object CancellationRequest
An object that identifies a one-time request, or an individual instance of a recurring request, 
cancel.
object CancellationResponse
An object that describes the outcome of canceling a download request.
Cancel a one-time download
Response
Cancel a recurring download
Response
See Also
Cancellation
Request
Request


