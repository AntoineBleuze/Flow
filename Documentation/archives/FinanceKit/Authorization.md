# Authorization.pdf

## Page 1

An AuthorizationStatus value that indicates the current state of authorization.
func requestAuthorization() async throws -> AuthorizationStatus
Prompts a person to give FinanceKit authorization to access financial data.
enum AuthorizationStatus
Return Value
See Also
Authorization
FinanceKit / FinanceStore / authorizationStatus()
Instance Method
authorizationStatus()
Checks the authorization status for the calling application.
iOS 17.4+
iPadOS 17.4+


## Page 2

An AuthorizationStatus value that indicates the current state of authorization.
If there are no accounts are available to display, the framework presents a “No Accounts” screen
and returns a status of AuthorizationStatus.authorized or AuthorizationStatus
.denied depending on the state of a person’s consent.
It’s safe to call this method multiple times; the framework prompts a person only if necessary.
func authorizationStatus() async throws -> AuthorizationStatus
Checks the authorization status for the calling application.
enum AuthorizationStatus
Return Value
Discussion
See Also
Authorization
FinanceKit / FinanceStore / requestAuthorization()
Instance Method
requestAuthorization()
Prompts a person to give FinanceKit authorization to access financial data.
iOS 17.4+
iPadOS 17.4+


## Page 3

case authorized
A person authorized the app to use FinanceKit services.
case denied
A person denied the use of FinanceKit services for the app.
case notDetermined
A person has not chosen whether the app can use FinanceKit services.
Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
Topics
Enumeration Cases
Relationships
Conforms To
FinanceKit / AuthorizationStatus
Enumeration
AuthorizationStatus
iOS 17.4+
iPadOS 17.4+


## Page 4

SendableMetatype
func authorizationStatus() async throws -> AuthorizationStatus
Checks the authorization status for the calling application.
func requestAuthorization() async throws -> AuthorizationStatus
Prompts a person to give FinanceKit authorization to access financial data.
See Also
Authorization


