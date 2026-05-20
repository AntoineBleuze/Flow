# 000_Submit request.pdf

## Page 1

JobSubmission
The description of the new download request.
Content-Type: application/json
200
CreatedJob
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
Request the app-store data type to get App Store information and app-install activity.
URL
HTTP Body
Response Codes
Overview
Account Data Transfer / Submit request
Web Service Endpoint
Submit request
Starts preparing someone’s data for download.
Account Data Transfer 1.0+


## Page 2

object JobSubmission
An object that describes a submission that requests someone’s data.
object CreatedJob
An object that represents a newly created download request.
Resubmit request
Enqueue the next instance of a recurring request.
object ResubmissionRequest
An object that describes a request to resubmit a recurring download request.
Request a one-time download
Response
Request a recurring download
Response
See Also
Request creation
Request
Request


## Page 3

object ResubmissionResponse
An object that represents a resubmitted recurring download request.


