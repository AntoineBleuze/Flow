# 000_ASError.pdf

## Page 1

static var activationFailed: ASError.Code
static var invalidated: ASError.Code
static var extensionNotFound: ASError.Code
static var invalidRequest: ASError.Code
static var pickerRestricted: ASError.Code
static var pickerAlreadyActive: ASError.Code
Topics
Activation errors
Life cycle errors
Configuration errors
Picker errors
Cancellation and permission errors
AccessorySetupKit / ASError
Structure
ASError
An error encountered during accessory discovery.
iOS 18.0+
iPadOS 18.0+


## Page 2

static var userCancelled: ASError.Code
static var userRestricted: ASError.Code
static var connectionFailed: ASError.Code
static var discoveryTimeout: ASError.Code
static var success: ASError.Code
static var unknown: ASError.Code
static var errorDomain: String
let ASErrorDomain: String
NSError domain for AccessorySetupKit errors.
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
Communication errors
Success cases
Unclassified errors
Accessing the error domain
Relationships
Conforms To
See Also


## Page 3

let ASErrorDomain: String
NSError domain for AccessorySetupKit errors.
enum Code
Codes that describe errors encountered during accessory discovery.
Errors


