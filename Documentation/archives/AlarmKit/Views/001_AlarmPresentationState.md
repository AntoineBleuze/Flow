# 001_AlarmPresentationState.pdf

## Page 1

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


## Page 2

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


