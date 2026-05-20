# 001_Get recurring request status.pdf

## Page 1

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


## Page 2

Get one-time request status
Find the status of a one-time download request.
object RequestStatus
An object that represents the status of a download request.
Response
See Also
Status
Request


