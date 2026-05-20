# 001_PostbackUpdate.pdf

## Page 1

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


## Page 2

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


