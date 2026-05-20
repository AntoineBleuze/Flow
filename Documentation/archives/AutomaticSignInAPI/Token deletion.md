# Token deletion.pdf

## Page 1

DeleteAutoSignIn
TokenRequest
The request body that contains the sign-in token to be deleted.
Content-Type: application/json
204
No Content
The request succeeded.
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
Not Found
Token not found.
URL
Sandbox URL
HTTP Body
Response Codes
Automatic Sign-In API / Delete Sign-In Token
Web Service Endpoint
Delete Sign-In Token
Deletes a specific sign-in token.
Automatic Sign-In API 1.0+


## Page 2

Signing people in to their media accounts automatically
Use this endpoint to delete a specific value.
object DeleteAutoSignInTokenRequest
The request body that contains the sign-in token to be deleted.
Mentioned in
Overview
See Also
Token deletion


## Page 3

autoSignInTokenValue
string
The token value that needs to be deleted.
This is the request object for the Delete Sign-In Token endpoint.
Delete Sign-In Token
Deletes a specific sign-in token.
Properties
Overview
See Also
Token deletion
Automatic Sign-In API / DeleteAutoSignInTokenRequest
Object
DeleteAutoSignInTokenRequest
The request body that contains the sign-in token to be deleted.
Automatic Sign-In API 1.0+


