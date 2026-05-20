# 000_Postback.pdf

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


