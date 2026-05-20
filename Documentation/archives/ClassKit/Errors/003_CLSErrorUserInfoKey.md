# 003_CLSErrorUserInfoKey.pdf

## Page 1

static let objectKey: CLSErrorUserInfoKey
A key whose value is the object that caused the error.
static let successfulObjectsKey: CLSErrorUserInfoKey
static let underlyingErrorsKey: CLSErrorUserInfoKey
A key whose value is the array of errors that contributed to this error.
init(String)
Initializes the key.
init(rawValue: String)
Initializes the key with a value.
Topics
Keys
Initializers
Relationships
ClassKit / CLSErrorUserInfoKey
Structure
CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct CLSError
Errors issued by ClassKit.
let CLSErrorCodeDomain: String
The error domain that ClassKit uses when issuing errors.
enum Code
Error codes that ClassKit issues.
Conforms To
See Also
Errors


