# 001_CancellationRequest.pdf

## Page 1

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


