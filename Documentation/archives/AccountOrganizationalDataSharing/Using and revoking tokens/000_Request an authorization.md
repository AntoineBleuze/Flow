# 000_Request an authorization.pdf

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


