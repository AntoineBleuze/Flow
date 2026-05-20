# 002_AlarmAttributes.pdf

## Page 1

Provide all the information for the alarm up-front. At widget archiving time, the widget extension
can choose which state to provide based on the mode in the AlarmPresentationState activi
content state payload. The following example defines the attributes for the alarm UI.
init(presentation: AlarmPresentation, metadata: Metadata?, tintColor:
Color)
Creates an instance of an alarm UI.
var tintColor: Color
The tint color applied to the templated UI.
Overview
Topics
Creating an alarm attribute
AlarmKit / AlarmAttributes
Structure
AlarmAttributes
An object that contains all information necessary for the alarm UI.
iOS 26.0+
iPadOS 26.0+


## Page 2

var presentation: AlarmPresentation
The content required for the various states of the UI.
var metadata: Metadata?
The additional data you can include in your attributes.
typealias ContentState
The type alias for the structure that describes the content of an alarm.
init(from: any Decoder) throws
Creates an instance from the given decoder.
func encode(to: any Encoder) throws
Performs encoding of the value using the given encoder.
ActivityAttributes
Decodable
Encodable
Sendable
SendableMetatype
struct AlarmPresentation
An object that describes the content required for the alarm UI.
struct AlarmPresentationState
An object that describes the mutable content of the alarm.
Decoding and encoding
Relationships
Conforms To
See Also
Views


## Page 3

protocol AlarmMetadata
A metadata object that contains information about an alarm.


