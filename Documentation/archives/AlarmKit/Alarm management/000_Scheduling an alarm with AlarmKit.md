# 000_Scheduling an alarm with AlarmKit.pdf

## Page 1

An alarm is an alert that presents at a pre-determined time based on a schedule or after a
countdown. It overrides both a device’s focus and silent mode, if necessary.
This sample project uses AlarmKit to create and manage different types of alarms. In this app
people can create and manage:
One-time alarms which alert only once at a specified time in the future.
Repeating alarms which alert with a weekly cadence.
Timers which alert after a countdown, and start immediately.
This project also includes a widget extension for setting up the custom countdown Live Activity
associated with an alarm.
Note
This sample code project is associated with WWDC25 session 230: Wake up to the AlarmKit
API.
This sample prompts people to authorize the app to allow AlarmKit to schedule alarms and create
alerts by calling requestAuthorization() on AlarmManager. Otherwise, when a person ad
their first alarm, AlarmKit automatically requests this authorization on behalf of the app, before
Overview
Authorize the app to schedule alarms
AlarmKit / Scheduling an alarm with AlarmKit
Sample Code
Scheduling an alarm with AlarmKit
Create prominent alerts at specified dates for your iOS app.
Download
iOS 26.0+
iPadOS 26.0+
Xcode 26.0+


## Page 2

scheduling the alarm. If this sample doesn’t get this authorization, then any alarm created by the
app isn’t scheduled and subsequently doesn’t alert.
The sample includes the NSAlarmKitUsageDescription key in the app’s Info.plist with a
descriptive string explaining why it schedules alarms. This string appears in the system prompt
when requesting authorization, in this sample the string is:
If the NSAlarmKitUsageDescription key is missing or its value is an empty string, apps can’t
schedule alarms with AlarmKit.
The sample app creates an alarm with either, or both, a countdown duration and a schedule, base
on the options a person sets.
Alarm.CountdownDuration uses the selected TimeInterval for the pre-alert countdown,
which displays the alert when the countdown reaches 0.
Alarm.Schedule enables people to set a one-time alarm, or configure a weekly schedule. For
single-occurrence alarms, the repeats property is set to Alarm.Schedule.Relative
.Recurrence.never. For recurring alarms, the repeats property is set to Alarm.Schedule
.Relative.Recurrence.weekly(_:) with an associated array Locale.Weekday, indicatin
the days of the week the alarm alerts.
Create the alarm schedule


## Page 3

AlarmKit provides a presentation for each of the three alarm states - AlarmPresentation
.Alert, AlarmPresentation.Countdown, and AlarmPresentation.Paused. Because
Countdown and Paused are optional presentations, this sample doesn’t use them if the alarm on
has an Alert state.
Alongside the stopButton, the sample includes another action button in the alerting UI. This
action depends on secondaryButton and secondaryButtonBehavior.
When the secondaryButtonBehavior property is set to AlarmPresentation.Alert
.SecondaryButtonBehavior.countdown, the secondary button is a Repeat action, which
re-triggers the alarm after a certain TimeInterval, as specified in postAlert. If the
secondaryButtonBehavior is set to AlarmPresentation.Alert.SecondaryButton
Behavior.custom, the alarm alert displays an Open action to launch the app.
Configure the alarm’s UI attributes


## Page 4

Note
The system forwards the alert presentation to a paired watch (if any) to notify people when an
alarm is alerting.
The content for these presentations is wrapped into ActivityAttributes, along with tint
Color, and metadata. The tint color associates the alarms with the sample app and also
differentiates them from other app’s alarms on the person’s device.
The sample uses a unique identifier to track alarms registered with AlarmKit. The sample manage
and updates alarm states, such as pause(id:) and cancel(id:), using this identifier.
When a person taps the button in the alerting UI, the AlarmManager automatically handles stop
or countdown functionalities, depending on the button type.
Tip
You can add additional actions for each button type using App Intents, which you can
configure using AlarmManager.AlarmConfiguration.
Schedule the configured alarm


## Page 5

This sample creates the alarm ID and AlarmManager.AlarmConfiguration and schedules t
alarm with AlarmManager.
At initialization, the ViewModel subscribes to alarm events from shared. This enables the samp
app to have the latest state of an alarm even if the alarm state updated while the sample app isn’t
running.
Note
An Alarm that’s not included in the alarmUpdates asynchronous stream is no longer
scheduled with AlarmKit.
The sample app adds a widget extension target to customize non-alerting presentations in the
Dynamic Island, Lock Screen, and StandBy. The widget extension receives the same Alarm
Attributes structure that you provide to shared when scheduling alarms. It includes the
metadata provided in the Configure the alarm’s UI attributes section above.
Important
AlarmKit expects a widget extension if an app supports a countdown presentation. Otherwise,
the system may unexpectedly dismiss alarms and fail to alert. For more information, see
ActivityKit.
Observe state changes on the alarms
Create a Widget Extension for Live Activities
See Also


## Page 6

class AlarmManager
An object that exposes functions to work with alarms: scheduling, snoozing, cancelling.
struct Alarm
An object that describes an alarm that can alert once or on a repeating schedule.
Alarm management


