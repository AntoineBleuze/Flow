# 001_TokenResponse.pdf

## Page 1

access_token
string
A token used to access allowed data.
expires_in
number
The amount of time, in seconds, before the access token expires.
id_token
string
A JWT that contains the user’s identity information.
refresh_token
string
The refresh token used to regenerate new access tokens when validating an
authorization code. Store this token securely on your server. The refresh toke
isn’t returned when validating an existing refresh token.
token_type
string
The type of access token, which is always bearer.
Possible types:
Properties
Attributes
See Also
Account & Organization…
/ TokenResponse
Dictionary
TokenResponse
The response token object returned on a successful request.
AccountOrganizationalDataSharing 1.0+


## Page 2

object JWKSet
A set of JSON web keys.
object ErrorResponse
The error object returned after an unsuccessful request.
Common objects


