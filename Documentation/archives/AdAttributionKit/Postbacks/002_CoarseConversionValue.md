# 002_CoarseConversionValue.pdf

## Page 1

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


## Page 2

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


