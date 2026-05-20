# Error Handling.pdf

## Page 1

When you send a request to the Enterprise Program API, you receive a response that includes an
HTTP status code and, in most cases, a response body. To determine your request’s status and
handle errors, use the HTTP status code along with the code from the ErrorResponse. Interpre
the error starting with the most general information first.
The HTTP status code informs you if the request succeeded or failed. If it succeeded, the HTTP
status code is in the 200 range, and the response body contains the requested data. If the reques
failed, the HTTP status code is in the 400 or 500 range, and the response body contains
information about the error. In many cases, the status code may be all you need to properly handl
errors. See About the HTTP Status Code for more information.
If the API request failed, the ErrorResponse object contains details to help you troubleshoot th
error, and a code property to use for programmatic error handling. See Parsing the Error Respons
Code for more information.
In some cases, the error information includes a source property that precisely locates the proble
in your request. See Pinpointing the Location of Errors for more information.
Overview
Read the HTTP Status Code
Interpret the Error Response
Pinpoint the Source of the Error
Enterprise Program API / Interpreting and Handling Errors
API Collection
Interpreting and Handling Errors
Learn how the Enterprise Program API returns errors and handle them in your cod


## Page 2

About the HTTP Status Code
Learn how the status code helps you determine if an Enterprise Program API request
succeeded or why it failed.
Parsing the Error Response Code
Interpret the error details to troubleshoot API requests and perform programmatic error
handling.
Pinpointing the Location of Errors
Locate the specific source of the error.
object ErrorLinks
object ErrorResponse
The error details that an API returns in the response body whenever the API request isn’t
successful.
object ErrorResponse
The error details that an API returns in the response body whenever the API request isn’t
successful.
Topics
Handling Errors
Objects
See Also
Error Handling


## Page 3

errors
[ErrorResponse
.Errors]
An array of one or more errors.
Possible types:
Parsing the Error Response Code
About the HTTP Status Code
Pinpointing the Location of Errors
object ErrorResponse.Errors
Properties
Attributes
Mentioned in
Topics
Objects
Enterprise Program API / ErrorResponse
Object
ErrorResponse
The error details that an API returns in the response body whenever the API
request isn’t successful.


## Page 4

The details about an error that are returned when an API request isn’t successful.
Interpreting and Handling Errors
Learn how the Enterprise Program API returns errors and handle them in your code.
See Also
Error Handling


