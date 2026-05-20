# 001_CSSearchQueryError.pdf

## Page 1

static var cancelled: CSSearchQueryError.Code
The query stopped because someone canceled it.
static var indexUnreachable: CSSearchQueryError.Code
The index is unreachable.
static var invalidQuery: CSSearchQueryError.Code
The query is syntactically invalid or specifies items that your app doesn’t have access to.
static var unknown: CSSearchQueryError.Code
An unknown error occurred.
enum Code
Error codes that describe reasons a query might fail.
Topics
Getting the error codes
Getting codes for query-related errors
Getting the error description
Core Spotlight / CSSearchQueryError
Structure
CSSearchQueryError
Search query errors returned by Core Spotlight.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.13+
visionOS 1.0+


## Page 2

static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct CSIndexError
Index errors returned by Core Spotlight.
CSIndex Errors
Index error codes and error domain.
CSSearchQuery Errors
Search query error codes and error domain.
Relationships
Conforms To
See Also
Errors


