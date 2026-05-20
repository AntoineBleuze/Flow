# Common objects.pdf

## Page 1

keys
[JWKSet.Keys]
Possible types:
object JWKSet.Keys
An object that defines a single JSON Web Key.
Properties
Attributes
Topics
Getting the fields
See Also
Common objects
Account & Organization…
/ JWKSet
Dictionary
JWKSet
A set of JSON web keys.
AccountOrganizationalDataSharing 1.0+


## Page 2

object TokenResponse
The response token object returned on a successful request.
object ErrorResponse
The error object returned after an unsuccessful request.


## Page 3

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


## Page 4

object JWKSet
A set of JSON web keys.
object ErrorResponse
The error object returned after an unsuccessful request.
Common objects


## Page 5

error
string
A string that describes the reason for the unsuccessful request. The string is
one of the allowed values, listed below.
Possible Values: invalid_request, invalid_client,
invalid_grant, unauthorized_client,
unsupported_grant_type, invalid_scope
Possible types:
The error property is one of the following values:
invalid_request
A malformed request, typically because it’s missing a parameter, contains an unsupported
parameter, includes multiple credentials, or uses more than one mechanism for authenticatin
the client.
invalid_client
The client authentication failed, typically due to a mismatched or invalid client identifier, inval
client secret (expired token, malformed claims, or invalid signature), or mismatched or invalid
redirect URI.
Properties
Attributes
Overview
Account & Organization…
/ ErrorResponse
Dictionary
ErrorResponse
The error object returned after an unsuccessful request.
AccountOrganizationalDataSharing 1.0+


## Page 6

invalid_grant
The authorization grant or refresh token is invalid, typically due to a mismatched or invalid
client identifier, invalid code (expired or previously used authorization code), or invalid refresh
token.
unauthorized_client
The client isn’t authorized to use this authorization grant type.
unsupported_grant_type
The authenticated client isn’t authorized to use this grant type.
invalid_scope
The requested scope is invalid.
object JWKSet
A set of JSON web keys.
object TokenResponse
The response token object returned on a successful request.
See Also
Common objects


