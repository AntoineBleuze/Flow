# 002_AuthorizationStatus.pdf

## Page 1

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


## Page 2

SendableMetatype
func authorizationStatus() async throws -> AuthorizationStatus
Checks the authorization status for the calling application.
func requestAuthorization() async throws -> AuthorizationStatus
Prompts a person to give FinanceKit authorization to access financial data.
See Also
Authorization


