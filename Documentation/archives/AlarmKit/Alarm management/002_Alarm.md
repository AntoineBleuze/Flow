# 002_Alarm.pdf

## Page 1

The following is an example of a 10 second timer:
The following is an example of an alarm that includes a 9 minute snooze option and plays the
default sound:
Overview
AlarmKit / Alarm
Structure
Alarm
An object that describes an alarm that can alert once or on a repeating schedule.
iOS 26.0+
iPadOS 26.0+


## Page 2

struct CountdownDuration
An object that defines the durations used in an alarm that has a countdown.
var countdownDuration: Alarm.CountdownDuration?
The time left before an alert, in seconds.
var id: UUID
The unique identifier of the alarm.
enum State
An enum that lists all possible states of an alarm.
var state: Alarm.State
The current state of the alarm.
enum Schedule
A list of all types of schedules that the framework supports.
var schedule: Alarm.Schedule?
The schedule determines when the alarm alerts.
Decodable
Encodable
Identifiable
Sendable
SendableMetatype
Topics
Defining a countdown duration
Setting an alarm schedule
Relationships
Conforms To


## Page 3

Scheduling an alarm with AlarmKit
Create prominent alerts at specified dates for your iOS app.
class AlarmManager
An object that exposes functions to work with alarms: scheduling, snoozing, cancelling.
See Also
Alarm management


