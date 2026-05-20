# Token updates.pdf

## Page 1

UpdateAutoSignIn
TokenRequest
The request body that contains the old sign-in token and the new sign-in
token.
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
Automatic Sign-In API / Update Sign-In Token
Web Service Endpoint
Update Sign-In Token
Updates a specific sign-in token to a new value.
Automatic Sign-In API 1.0+


## Page 2

Signing people in to their media accounts automatically
Use this endpoint to update a specific VSUserAccountManager.AutoSignInToken to a new
value.
object UpdateAutoSignInTokenRequest
The request body that contains the old sign-in token and the new sign-in token.
Mentioned in
Overview
See Also
Token updates


## Page 3

Automatic Sign-In API / UpdateAutoSignInTokenRequest
Object
UpdateAutoSignInTokenRequest
The request body that contains the old sign-in token and the new sign-in token.
Automatic Sign-In API 1.0+


## Page 4

existingAutoSignIn
TokenValue
string
The sign-in token value that needs to be updated.
newAutoSignInToken
Value
string
The new sign-in token value.
This is the request object for the Update Sign-In Token endpoint.
Update Sign-In Token
Updates a specific sign-in token to a new value.
Properties
Overview
See Also
Token updates


