# Status.pdf

## Page 1

requestId
string
(Required) A UUID that identifies the download request.
200
RequestStatus
OK
Content-Type: application/json
URL
Path Parameters
Response Codes
Overview
Response
App Data Transfer / Get one-time request status
Web Service Endpoint
Get one-time request status
Find the status of a one-time download request.
App Data Transfer 1.0+
Request


## Page 2

Get recurring request status
Get the status of an instance of a recurring download request.
object RequestStatus
An object that represents the status of a download request.
See Also
Status


## Page 3

parentRequestId
string
(Required) A UUID that identifies the series of recurring download requests.
requestId
string
(Required) A UUID that identifies the individual request.
200
RequestStatus
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
URL
Path Parameters
Response Codes
Overview
App Data Transfer / Get recurring request status
Web Service Endpoint
Get recurring request status
Get the status of an instance of a recurring download request.
App Data Transfer 1.0+


## Page 4

Get one-time request status
Find the status of a one-time download request.
object RequestStatus
An object that represents the status of a download request.
Response
See Also
Status
Request


## Page 5

App Data Transfer / RequestStatus
Object
RequestStatus
An object that represents the status of a download request.
App Data Transfer 1.0+


## Page 6

jobStatus
string
The status of the download request.
Possible Values: completed, request_not_found, in_progress,
error, completed_with_error, cancelled
status
string
success if the operation succeeded; error otherwise.
statusCheckDelay
integer
The number of seconds to wait before re-requesting the status.
Get one-time request status
Find the status of a one-time download request.
Get recurring request status
Get the status of an instance of a recurring download request.
Properties
See Also
Status


