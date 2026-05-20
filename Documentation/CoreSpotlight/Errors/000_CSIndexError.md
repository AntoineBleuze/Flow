# 000_CSIndexError.pdf

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


