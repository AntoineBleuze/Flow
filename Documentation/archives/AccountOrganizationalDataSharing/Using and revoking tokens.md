# Using and revoking tokens.pdf

## Page 1

client_id
string
(Required) The identifier (App ID or Services ID) for your app. To prevent
exposing sensitive data to the end user, don’t include your Team ID in the
identifier.
nonce
string
A unique, single-use string that your app provides to associate a client sessio
with the user’s identity token. This value also prevents replay attacks, and
correlates the initial authentication request to the identity token provided in th
authorization response.
redirect_uri
string
(Required) The destination URI associated with your app that the authorizati
redirects. The URI must use the HTTPS protocol, include a domain name, can
be an IP address or localhost, and must not contain a fragment identifer (#
response_mode
string
response_type
string
(Required) The type of response requested. Use the value code.
scope
string
(Required) The amount of personal information your app or web service
requests from Apple’s servers. Valid values are edu.users.read and edu
.classes.read. You can request one, both, or none. Use space separation
URL
Query Parameters
Account & Organization…
/ Request an authorization
Web Endpoint
Request an authorization
Request a user authorization to Account & Organizational Data Sharing apps and
web services.
AccountOrganizationalDataSharing 1.0+


## Page 2

and percent-encoding for multiple scopes; for example, "scope=edu.user
.read%20edu.classes.read".
state
string
An arbitrary string that your app provides to represent the current state of the
authorization request. This value mitigates cross-site request forgery attacks
by comparing against the state value contained in the authorization response
200
OK
The request was successful.
Content-Type: application/json
404
Not Found
Resource not found.
Content-Type: application/json
Token revocation
Invalidate the tokens and associated user authorizations for someone when they are no long
associated with your app.
Response Codes
See Also
Using and revoking tokens


## Page 3

form-data
The list of input parameters required for the server to invalidate the token.
Content-Type: application/x-www-form-urlencoded
Parts
client_id
string
(Required) The identifier (App ID or Services ID) for your app. The identifier
must match the value provided during the authorization request for the
person’s information. To help mitigate the possibility of exposing sensitive da
to the end user, the identifier must not include your Team ID.
Content-Type: text/plain
client_secret
string
(Required) A secret JWT that uses the Account and Organizational Data
Sharing private key associated with your developer account. For more
information about creating client secrets, see Generate and validate
tokens.
Content-Type: text/plain
token
string
(Required) The user refresh token or access token intended to be revoked. If
the request is successful, revoke the user session associated with the provid
token.
Content-Type: text/plain
URL
HTTP Body
Account & Organization…
/ Token revocation
Web Endpoint
Token revocation
Invalidate the tokens and associated user authorizations for someone when they
are no longer associated with your app.
AccountOrganizationalDataSharing 1.0+


## Page 4

token_type_hint
string
A hint about the type of the token submitted for revocation. Use refresh
_token or access_token.
Content-Type: text/plain
200
OK
The request was successful; the provided token has been revoked successfu
or was previously invalid.
Content-Type: application/json
400
ErrorResponse
Bad Request
The server was unable to process the request. See the error code description
for more information about the underlying error.
Content-Type: application/json
To revoke authorization for a user, you must obtain a valid refresh token or access token. If you
don’t have either token for the user, you can generate tokens when validating an authorization
code. For more information about user tokens and creating client secrets, see Generate and
validate tokens.
To invalidate a user’s refresh token, invoke the revoke endpoint with the following HTTP POST
method:
Additionally, to invalidate a user’s access token, use the following HTTP POST method:
Response Codes
Overview


## Page 5

For either token revocation request, the revoke endpoint returns a 200 response code without a
response body after the server invalidates the token value, or if the token was previously
invalidated. If the server encounters an error, it returns an ErrorResponse that identifies the
problem.
Request an authorization
Request a user authorization to Account & Organizational Data Sharing apps and web
services.
See Also
Using and revoking tokens


