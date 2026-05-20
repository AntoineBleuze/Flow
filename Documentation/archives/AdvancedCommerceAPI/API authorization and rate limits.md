# API authorization and rate limits.pdf

## Page 1

The following Advanced Commerce APIs are endpoints that you call from your server:
Cancel a Subscription
Change Subscription Metadata
Change Subscription Price
Migrate a Subscription to Advanced Commerce API
Request Transaction Refund
Revoke Subscription
Calls to the Advanced Commerce API’s endpoints require JSON Web Tokens (JWTs) for
authorization; you obtain keys to create the tokens from your organization’s App Store Connect
account. See Creating API keys to authorize API requests to create your keys. See Generating
JSON Web Tokens for API requests to generate tokens using your keys and send API requests.
After you have a complete and signed token, provide the token in the request’s authorization
header as a bearer token. Generate a new token for each new API request, or reuse tokens until
they expire.
Tip
The App Store Server Library provides a client that makes it easier to adopt the Advanced
Commerce APIs, including creating the JWTs to authorize calls. For more information, see
Simplifying your implementation by using the App Store Server Library.
Discussion
Advanced Commerce API / Authorizing API requests from your server
Article
Authorizing API requests from your server
Create JSON Web Tokens (JWTs) to authorize Advanced Commerce requests
from your server.


## Page 2

Identifying rate limits for Advanced Commerce APIs
Recognize and handle the rate limits that apply to Advanced Commerce API endpoints.
See Also
API authorization and rate limits


## Page 3

The Advanced Commerce API limits the number of requests that you can submit to each endpoin
within a specified timespan. The request limits apply per app. The following table lists the rate lim
in the production environment, expressed in requests per second. Limits are enforced on an hour
basis.
Endpoint
Rate limit (per second)
Cancel a Subscription
5
Change Subscription Metadata
50
Change Subscription Price
50
Migrate a Subscription to Advanced Commerce API
50
Request Transaction Refund
5
Revoke Subscription
5
The rate limits in the sandbox environment are 10 percent of the limits in the table above. The
Advanced Commerce server may make adjustments to reduce or increase these rate limits as
needed at any time.
Overview
Handle exceeded rate limits gracefully
Advanced Commerce API / Identifying rate limits for Advanced Commerce APIs
Article
Identifying rate limits for Advanced
Commerce APIs
Recognize and handle the rate limits that apply to Advanced Commerce API
endpoints.


## Page 4

If you exceed a per-hour limit, the API rejects the request with an HTTP 429 response, with a Rat
LimitExceededError in the body. Consider the following as you integrate the API:
If you periodically call the API, throttle your requests to avoid exceeding the per-hour limit for a
endpoint.
Manage the HTTP 429 RateLimitExceededError in your error-handling process. For
example, log the failure and queue the job to process it again at a later time.
Check the Retry-After header if you receive the HTTP 429 error. This header contains a
UNIX time, in milliseconds, that informs you when you can next send a request.
Authorizing API requests from your server
Create JSON Web Tokens (JWTs) to authorize Advanced Commerce requests from your
server.
See Also
API authorization and rate limits


