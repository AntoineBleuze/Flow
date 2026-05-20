# 000_AlarmPresentation.pdf

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


