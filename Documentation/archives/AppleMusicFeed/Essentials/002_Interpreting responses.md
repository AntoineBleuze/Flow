# 002_Interpreting responses.pdf

## Page 1

Learn how Apple Media Feed API responds to requests for Apple Music Feed data and how to
interpret responses.
Apple Media Feed API has two kinds of responses: resource collections and errors.
Resource collection responses contain a data array and a resources object.
Error responses contain an array of one or more error objects that indicate any issues while
handling the request. The status code of the response reflects the primary error.
Default responses for common requests include the following:
Request description
Status code
Response description
The request is for an existing single
resource object.
200 (OK)
The data array contains th
requested resource object.
The request is for a single resource
object that doesn’t exist.
404 (NotFound)
The response doesn’t
contain a data array.
The request is for multiple resource
objects by ID.
200 (OK)
The data array includes th
existing resource objects.
The request is for multiple resource
objects by ID and none of the resources
200 (OK)
The data array is empty.
Overview
Understand a response
Apple Music Feed / Interpreting responses
Article
Interpreting responses
Learn about responses from Apple Media Feed API to your Apple Music Feed
requests.


## Page 2

Request description
Status code
Response description
exist.
The request isn’t accepted because its
authorization is missing or invalid due
to an issue with the developer token.
401
(Unauthorized)
The response doesn’t
contain a data array.
The request isn’t accepted because the
request is using incorrect
authentication.
403 (Forbidden)
The response doesn’t
contain a data array.
The request isn’t supported as
specified.
400 (Bad
Request)
The errors array contains
an error object for any
identified problem.
The request encounters errors on the
server.
Any status code in the
500 range
The errors array contains
error objects for the errors
for any identified problems.
For more information, see Error object and HTTP status codes.
Generating developer tokens
Create a JSON Web Token to authorize your requests to Apple Media Feed API.
Requesting a feed export
Create requests for Apple Music Catalog metadata.
See Also
Essentials


