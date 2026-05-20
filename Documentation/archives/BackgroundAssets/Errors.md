# Errors.pdf

## Page 1

case assetPackNotFound(withID: String)
An error that’s thrown when the system can’t find an asset pack with the given ID.
case fileNotFound(at: FilePath)
An error that’s thrown when the system can’t find a file at the specified path.
CustomStringConvertible
Error
LocalizedError
Sendable
SendableMetatype
Topics
Errors
Relationships
Conforms To
Background Assets / ManagedBackgroundAssetsError
Enumeration
ManagedBackgroundAssetsError
An error for a managed asset pack.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

let BAErrorDomain: String
enum BAErrorCode
See Also
Errors


## Page 3

enum ManagedBackgroundAssetsError
An error for a managed asset pack.
enum BAErrorCode
See Also
Errors
Background Assets / BAErrorDomain
Global Variable
BAErrorDomain
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 18.4+
visionOS 2.4+


## Page 4

case callFromExtensionNotAllowed
case callFromInactiveProcessNotAllowed
case callerConnectionInvalid
case callerConnectionNotAccepted
case downloadAlreadyFailed
case downloadAlreadyScheduled
case downloadBackgroundActivityProhibited
case downloadEssentialDownloadNotPermitted
case downloadFailedToStart
case downloadInvalid
case downloadNotScheduled
case downloadWouldExceedAllowance
case sessionDownloadAllowanceExceeded
case sessionDownloadDisallowedByAllowance
Topics
Error codes
Background Assets / BAErrorCode
Enumeration
BAErrorCode
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 18.4+
visionOS 2.4+


## Page 5

case sessionDownloadDisallowedByDomain
case sessionDownloadNotPermittedBeforeAppLaunch
init?(rawValue: Int)
case downloadDoesNotExist
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
enum ManagedBackgroundAssetsError
An error for a managed asset pack.
let BAErrorDomain: String
Initializers
Enumeration Cases
Relationships
Conforms To
See Also
Errors


