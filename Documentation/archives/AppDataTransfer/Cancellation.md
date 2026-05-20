# Cancellation.pdf

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
App Data Transfer / Cancel request
Web Service Endpoint
Cancel request
Tells the server to stop processing an active request.
App Data Transfer 1.0+


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


## Page 3

requestId
string
An identifier for the request to cancel. For a one-time request, use the
request’s UUID. For a recurring request, use the parentRequest’s UUID.
Cancel request
Tells the server to stop processing an active request.
object CancellationResponse
An object that describes the outcome of canceling a download request.
Properties
See Also
Cancellation
App Data Transfer / CancellationRequest
Object
CancellationRequest
An object that identifies a one-time request, or an individual instance of a recurrin
request, to cancel.
App Data Transfer 1.0+


## Page 4

jobStatus
string
The current status of the download request.
Value: cancelled
status
string
The outcome of the cancellation operation.
Possible Values: success, error
Cancel request
Tells the server to stop processing an active request.
object CancellationRequest
An object that identifies a one-time request, or an individual instance of a recurring request, 
cancel.
Properties
See Also
Cancellation
App Data Transfer / CancellationResponse
Object
CancellationResponse
An object that describes the outcome of canceling a download request.
App Data Transfer 1.0+


