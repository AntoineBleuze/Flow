# Errors.pdf

## Page 1

static var indexUnavailableError: CSIndexError.Code
The indexer is unavailable.
static var indexingUnsupported: CSIndexError.Code
Indexing isn’t supported on the device.
static var invalidClientStateError: CSIndexError.Code
The provided client state data is invalid.
static var invalidItemError: CSIndexError.Code
The searchable item object is invalid.
static var mismatchedClientState: CSIndexError.Code
The provided client state did not match the information in the index.
static var quotaExceeded: CSIndexError.Code
The quota for the bundle has been exceeded.
static var remoteConnectionError: CSIndexError.Code
An error occurred while communicating with the remote process.
Topics
Getting the error codes
Core Spotlight / CSIndexError
Structure
CSIndexError
Index errors returned by Core Spotlight.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

static var unknownError: CSIndexError.Code
An unknown error occurred.
enum Code
Error codes that describe indexing-specific errors.
static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct CSSearchQueryError
Search query errors returned by Core Spotlight.
CSIndex Errors
Index error codes and error domain.
CSSearchQuery Errors
Getting codes for indexing errors
Getting the error description
Relationships
Conforms To
See Also
Errors


## Page 3

Search query error codes and error domain.


## Page 4

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


## Page 5

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


## Page 6

enum Code
Error codes that describe indexing-specific errors.
let CSIndexErrorDomain: String
The error domain for the index.
struct CSIndexError
Index errors returned by Core Spotlight.
struct CSSearchQueryError
Search query errors returned by Core Spotlight.
CSSearchQuery Errors
Search query error codes and error domain.
Topics
Index Errors
See Also
Errors
Core Spotlight / CSIndex Errors
API Collection
CSIndex Errors
Index error codes and error domain.


## Page 7

enum Code
Error codes that describe reasons a query might fail.
let CSSearchQueryErrorDomain: String
The error domain for search queries.
struct CSIndexError
Index errors returned by Core Spotlight.
struct CSSearchQueryError
Search query errors returned by Core Spotlight.
CSIndex Errors
Index error codes and error domain.
Topics
Query Errors
See Also
Errors
Core Spotlight / CSSearchQuery Errors
API Collection
CSSearchQuery Errors
Search query error codes and error domain.


