# Request creation.pdf

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


## Page 4

mode
string
Whether you want a one-time download, a daily download for 30 days, or a
weekly download for 180 days.
Possible Values: ONE_TIME, DAILY_30, WEEKLY_180
Submit request
Starts preparing someone’s data for download.
object CreatedJob
An object that represents a newly created download request.
Resubmit request
Enqueue the next instance of a recurring request.
object ResubmissionRequest
An object that describes a request to resubmit a recurring download request.
Properties
See Also
Request creation
Account Data Transfer / JobSubmission
Object
JobSubmission
An object that describes a submission that requests someone’s data.
Account Data Transfer 1.0+


## Page 5

object ResubmissionResponse
An object that represents a resubmitted recurring download request.


## Page 6

parentRequestId
string
For recurring requests, a UUID that identifies the series of requests. For one-
time requests, the server doesn’t include this key in the response.
requestId
string
A UUID that identifies this request.
status
string
success if the server created the request; error otherwise.
statusCheckDelay
integer
The number of seconds to wait before you call Get recurring request
status or Get one-time request status.
Submit request
Starts preparing someone’s data for download.
object JobSubmission
Properties
See Also
Request creation
Account Data Transfer / CreatedJob
Object
CreatedJob
An object that represents a newly created download request.
Account Data Transfer 1.0+


## Page 7

An object that describes a submission that requests someone’s data.
Resubmit request
Enqueue the next instance of a recurring request.
object ResubmissionRequest
An object that describes a request to resubmit a recurring download request.
object ResubmissionResponse
An object that represents a resubmitted recurring download request.


## Page 8

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
Account Data Transfer / Resubmit request
Web Service Endpoint
Resubmit request
Enqueue the next instance of a recurring request.
Account Data Transfer 1.0+


## Page 9

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


## Page 10

parentRequestId
string
A UUID that identifies the recurring request series.
requestId
string
A UUID that identifies the most recent download request in the recurring seri
Use the parentRequestId and requestId returned by Submit request, or your most rece
call to Resubmit request.
Submit request
Starts preparing someone’s data for download.
object JobSubmission
An object that describes a submission that requests someone’s data.
Properties
Overview
See Also
Request creation
Account Data Transfer / ResubmissionRequest
Object
ResubmissionRequest
An object that describes a request to resubmit a recurring download request.
Account Data Transfer 1.0+


## Page 11

object CreatedJob
An object that represents a newly created download request.
Resubmit request
Enqueue the next instance of a recurring request.
object ResubmissionResponse
An object that represents a resubmitted recurring download request.


## Page 12

parentRequestId
string
A UUID that identifies the recurring request series.
requestId
string
A UUID that identifies the new request.
status
string
success if the server resubmitted the request; error otherwise.
statusCheckDelay
integer
The number of seconds to wait before you call Get recurring request
status.
Submit request
Starts preparing someone’s data for download.
object JobSubmission
Properties
See Also
Request creation
Account Data Transfer / ResubmissionResponse
Object
ResubmissionResponse
An object that represents a resubmitted recurring download request.
Account Data Transfer 1.0+


## Page 13

An object that describes a submission that requests someone’s data.
object CreatedJob
An object that represents a newly created download request.
Resubmit request
Enqueue the next instance of a recurring request.
object ResubmissionRequest
An object that describes a request to resubmit a recurring download request.


