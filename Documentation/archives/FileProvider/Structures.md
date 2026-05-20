# Structures.pdf

## Page 1

init(String)
init(rawValue: String)
static let experimentID: NSFileProviderUserInfoKey
System interpreted user info key When setting a value to that user info on a domain, the
system will ingest this value. If user has given their consent for telemetry, this value will be
used to decorate telemetry messages sent by the FileProvider subsystem. The telemetry
messages can be then later on retrieved by developers along with the other metrics through
the CloudKit console as detailed here:
https://developer.apple.com/documentation/fileprovider/exporting-file-provider-metrics-data
language=objc This will help developers triaging data they receive from testing population
compared to regular users The value must either be a NSNumber between [0 - 31]. If it’s not
in that range, or if it is not a NSNumber, any call to addDomain with that invalid UserInfo
dictionary will fail with a EINVAL POSIX NSError. To update this value, the provider must call
addDomain with an updated userInfo dictionary
Topics
Initializers
Type Properties
File Provider / NSFileProviderUserInfoKey
Structure
NSFileProviderUserInfoKey
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 3

static var unknown: NSFileProviderVolumeUnsupportedReason
static var nonEncrypted: NSFileProviderVolumeUnsupportedReason
static var readOnly: NSFileProviderVolumeUnsupportedReason
static var network: NSFileProviderVolumeUnsupportedReason
static var quarantined: NSFileProviderVolumeUnsupportedReason
init(rawValue: UInt)
static var nonAPFS: NSFileProviderVolumeUnsupportedReason
Topics
Reasons
Initializers
Type Properties
File Provider / NSFileProviderVolumeUnsupportedReason
Structure
NSFileProviderVolumeUnsupported
Reason
Constants that describe why an external volume might not be eligible for storing a
domain.
macOS 15.0+


## Page 4

BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
case eligible
case ineligible(NSFileProviderVolumeUnsupportedReason)
Relationships
Conforms To
See Also
Determining eligibility


