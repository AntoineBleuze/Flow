# Postbacks.pdf

## Page 1

static var isSupported: Bool
A Boolean value that indicates whether the framework supports postbacks on a person’s
device.
static var reengagementOpenURLParameter: String
A string that represents the query parameter that AdAttributionKit appends to the URL to
indicate that a reengagement has occurred.
static func updateConversionValue(PostbackUpdate) async throws
Updates the conversion value using the given postback update configuration.
static func updateConversionValue(Int, coarseConversionValue: Coarse
ConversionValue, lockPostback: Bool) async throws
Updates the conversion value with the provided fine and coarse conversion values, and
optionally locks the postback, reducing the amount of time the system needs to deliver a
signal.
Topics
Type Properties
Type Methods
AdAttributionKit / Postback
Structure
Postback
A structure that provides methods you use to update conversion values for ad
attributions.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst


## Page 2

static func updateConversionValue(Int, lockPostback: Bool) async throws
Updates a conversion value with the provided fine and coarse conversion values, and
optionally locks the postback, reducing the system time to deliver a signal.
struct PostbackUpdate
Values you use to update properties in a postback, such as the conversion value.
enum CoarseConversionValue
Values that describe developer-defined, relative-attribution conversion values.
See Also
Postbacks


## Page 3

Identifying conversion values with conversion tags
init(fineConversionValue: Int, lockPostback: Bool, coarseConversionValu
: CoarseConversionValue?, conversionTypes: [PostbackUpdate.Conversion
Type]?)
Creates a new postback update with the conversions values, conversion types, and lock
indication you provide.
init(fineConversionValue: Int, lockPostback: Bool, conversionTag: Strin
, coarseConversionValue: CoarseConversionValue?, conversionTypes: [
PostbackUpdate.ConversionType]?)
let coarseConversionValue: CoarseConversionValue?
Mentioned in
Topics
Initializers
Instance Properties
AdAttributionKit / PostbackUpdate
Structure
PostbackUpdate
Values you use to update properties in a postback, such as the conversion value.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst


## Page 4

An enumeration that represents the coarse conversion value.
let conversionTag: String?
let conversionTypes: [PostbackUpdate.ConversionType]?
An array conversion type the system uses to determine which postbacks to update with this
postback update.
let fineConversionValue: Int
An integer that represents the fine conversion value.
let lockPostback: Bool
A Boolean value that indicates whether the system should lock the postback, reducing syste
time deliver a signal
enum ConversionType
Values that describe the types of conversions.
Sendable, SendableMetatype
struct Postback
A structure that provides methods you use to update conversion values for ad attributions.
enum CoarseConversionValue
Values that describe developer-defined, relative-attribution conversion values.
Enumerations
Relationships
Conforms To
See Also
Postbacks


## Page 5

Use these values to differentiate between the value of a person’s actions that are meaningful for a
specific interaction. These values have no effect on the framework, but calling the update
ConversionValue(_:lockPostback:) method with the value with CoarseConversion
Value.low, for example, causes the postback that the ad network receives to have a field
"coarse-conversion-value": "low".
case high
A value that represents a developer-defined, coarse conversion value that is high.
case low
A value that represents a developer-defined, coarse conversion value that is low.
case medium
A value that represents a developer-defined, coarse conversion value that is medium.
Overview
Topics
Enumeration Cases
AdAttributionKit / CoarseConversionValue
Enumeration
CoarseConversionValue
Values that describe developer-defined, relative-attribution conversion values.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst


## Page 6

Copyable
Decodable
Encodable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct Postback
A structure that provides methods you use to update conversion values for ad attributions.
struct PostbackUpdate
Values you use to update properties in a postback, such as the conversion value.
Relationships
Conforms To
See Also
Postbacks


