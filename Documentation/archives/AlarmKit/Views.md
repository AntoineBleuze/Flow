# Views.pdf

## Page 1

The following example shows how to set different views for an alarm using the Alarm
Presentation model.
Overview
Topics
Defining the alarm UI
AlarmKit / AlarmPresentation
Structure
AlarmPresentation
An object that describes the content required for the alarm UI.
iOS 26.0+
iPadOS 26.0+


## Page 2

init(alert: AlarmPresentation.Alert, countdown: AlarmPresentation.
Countdown?, paused: AlarmPresentation.Paused?)
Configures an alert with an optional countdown and paused state.
var alert: AlarmPresentation.Alert
The content for the alert mode of the alarm.
var countdown: AlarmPresentation.Countdown?
The content for the snooze or countdown mode of the alarm.
var paused: AlarmPresentation.Paused?
The content for the pause mode of the alarm.
struct Alert
An object that describes the UI of the alert that appears when an alarm fires.
struct Countdown
An object that describes the content required for the countdown UI.
struct Paused
An object that describes the content required for the paused UI.
Decodable
Encodable
Sendable
SendableMetatype
Describing an alarm state
Relationships
Conforms To
See Also
Views


## Page 3

struct AlarmPresentationState
An object that describes the mutable content of the alarm.
struct AlarmAttributes
An object that contains all information necessary for the alarm UI.
protocol AlarmMetadata
A metadata object that contains information about an alarm.


## Page 4

This structure includes alerting, countdown, and paused states. Live Activities consists of two
types of information: immutable attributes and mutable content. For example, in a live activity tha
showing the score of a soccer game the immutable attributes are the names of the teams involve
in the game and the mutable content is the current score.
For alarms, immutable content is information you supply through your own processes, including
information such as the tint color and the snooze button label. While mutable content comes from
AlarmKit and contains information from the system, such as the alarm alert date and the alarm
mode.
init(alarmID: Alarm.ID, mode: AlarmPresentationState.Mode)
Creates an instance of an alarm state.
var alarmID: Alarm.ID
The unique ID of the alarm.
Overview
Topics
Creating an alarm state
AlarmKit / AlarmPresentationState
Structure
AlarmPresentationState
An object that describes the mutable content of the alarm.
iOS 26.0+
iPadOS 26.0+


## Page 5

var mode: AlarmPresentationState.Mode
The specific state of the alarm, either alerting, countdown, or paused.
enum Mode
A list of all modes the alarm can be in: either alert, countdown, or paused.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
struct AlarmPresentation
An object that describes the content required for the alarm UI.
struct AlarmAttributes
An object that contains all information necessary for the alarm UI.
protocol AlarmMetadata
A metadata object that contains information about an alarm.
Relationships
Conforms To
See Also
Views


## Page 6

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


## Page 7

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


## Page 8

protocol AlarmMetadata
A metadata object that contains information about an alarm.


## Page 9

Provide an implementation of this for your own custom content or other information. The
implementation can be empty if you don’t want to provide any additional data for your alarm UI.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Overview
Relationships
Inherits From
See Also
Views
AlarmKit / AlarmMetadata
Protocol
AlarmMetadata
A metadata object that contains information about an alarm.
iOS 26.0+
iPadOS 26.0+


## Page 10

struct AlarmPresentation
An object that describes the content required for the alarm UI.
struct AlarmPresentationState
An object that describes the mutable content of the alarm.
struct AlarmAttributes
An object that contains all information necessary for the alarm UI.


