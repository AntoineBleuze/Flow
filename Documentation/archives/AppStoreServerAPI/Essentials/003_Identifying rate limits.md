# 003_Identifying rate limits.pdf

## Page 1

The App Store Server API limits the number of requests that you can submit to each endpoint
within a specified timespan. The request limits apply per app.
The following table lists the rate limits for each endpoint in the production environment, expresse
in requests per second. The system enforces rate limits on an hourly basis.
Endpoint
Rate limit (pe
second
Get App Transaction Info
5
Get Transaction Info
5
Get Transaction History
5
Get Transaction History V1
5
Get All Subscription Statuses
5
Send Consumption Information
5
Send Consumption Information V1
5
Get Notification History
5
Extend a Subscription Renewal Date
2
Set App Account Token
2
Overview
App Store Server API / Identifying rate limits
Article
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle
them in your code.


## Page 2

Endpoint
Rate limit (pe
second
Look Up Order ID
1
Get Refund History
1
Get Refund History V1
1
Extend Subscription Renewal Dates for All Active
Subscribers
Request a Test Notification
Get Test Notification Status
The rate limits in the sandbox environment are 10% of the limits in the table above.
The App Store server may make adjustments to reduce or increase these rate limits as needed at
any time.
If you exceed a per-hour limit, the API rejects the request with an HTTP 429 response, with a Rat
LimitExceededError in the body. Consider the following as you integrate the API:
If you periodically call the API, throttle your requests to avoid exceeding the per-hour limit for a
endpoint.
Manage the HTTP 429 RateLimitExceededError in your error-handling process. For
example, log the failure and queue the job to process it again at a later time.
Check the Retry-After header if you receive the HTTP 429 error. This header contains a
UNIX time, in milliseconds, that informs you when you can next send a request.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Handle exceeded rate limits gracefully
See Also
Essentials


## Page 3

Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Generating JSON Web Tokens for API requests
Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.


