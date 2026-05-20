# Alarm management.pdf

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


## Page 7

Schedule your alarm alert using AlarmManager. The following example calls the AlarmManage
schedule function by passing in the id and configuration.
static let shared: AlarmManager
The singleton instance for interacting with the alarm system.
struct AlarmUpdates
Overview
Topics
Creating a shared instance
Updating an alarm
AlarmKit / AlarmManager
Class
AlarmManager
An object that exposes functions to work with alarms: scheduling, snoozing,
cancelling.
iOS 26.0+
iPadOS 26.0+


## Page 8

An async sequence that publishes whenever an alarm changes.
var alarmUpdates: some AsyncSequence<Array<Alarm>, Never>
An asynchronous sequence that emits events when the set of alarms changes.
var alarms: [Alarm]
Fetches all alarms from the daemon that belong to the current client.
func schedule<Metadata>(id: Alarm.ID, configuration: AlarmManager.Alarm
Configuration<Metadata>) async throws -> Alarm
Schedules a new alarm.
struct AlarmConfiguration
An object that contains all the properties necessary to schedule an alarm.
func requestAuthorization() async throws -> AlarmManager.Authorization
State
Requests permission to use the alarm system if it hasn’t been requested before.
struct AlarmAuthorizationStateUpdates
An asynchronous sequence that publishes a new value when authorization for the alarms an
timers system changes.
var authorizationUpdates: some AsyncSequence<AlarmManager.Authorization
State, Never>
An asynchronous sequence that emits events when authorization to use alarms changes.
enum AuthorizationState
An enumeration describing all authorization states for the client process.
var authorizationState: AlarmManager.AuthorizationState
Returns the current authorization state for this client.
Scheduling an alarm
Requesting authorization
Checking authorization status
Changing an alarm state


## Page 9

func cancel(id: Alarm.ID) throws
Cancels the alarm with the specified ID.
func countdown(id: Alarm.ID) throws
Performs a countdown for the alarm with the specified ID if it’s currently alerting.
func pause(id: Alarm.ID) throws
Pauses the alarm with the specified ID if it’s in the countdown state.
func resume(id: Alarm.ID) throws
Resumes the alarm with the specified ID if it’s in the paused state.
func stop(id: Alarm.ID) throws
Stops the alarm with the specified ID.
enum AlarmError
An error that occurs when trying to schedule a timer.
Scheduling an alarm with AlarmKit
Create prominent alerts at specified dates for your iOS app.
struct Alarm
An object that describes an alarm that can alert once or on a repeating schedule.
Throwing an error
See Also
Alarm management


## Page 10

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


## Page 11

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


## Page 12

Scheduling an alarm with AlarmKit
Create prominent alerts at specified dates for your iOS app.
class AlarmManager
An object that exposes functions to work with alarms: scheduling, snoozing, cancelling.
See Also
Alarm management


