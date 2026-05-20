# 003_Resubmit request.pdf

## Page 1

ResubmissionRequest
The recurring request for which you submit a new instance.
Content-Type: application/json
200
ResubmissionResponse
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
The requestId you pass must be the most recent instance of the series identified by the paren
RequestId.
URL
HTTP Body
Response Codes
Overview
App Data Transfer / Resubmit request
Web Service Endpoint
Resubmit request
Enqueue the next instance of a recurring request.
App Data Transfer 1.0+


## Page 2

Submit request
Starts preparing someone’s data for download.
object JobSubmission
An object that describes a submission that requests someone’s data.
object CreatedJob
An object that represents a newly created download request.
object ResubmissionRequest
An object that describes a request to resubmit a recurring download request.
object ResubmissionResponse
An object that represents a resubmitted recurring download request.
Response
See Also
Request creation
Request


