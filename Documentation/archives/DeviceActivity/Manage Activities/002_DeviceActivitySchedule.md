# 002_DeviceActivitySchedule.pdf

## Page 1

Create a new schedule using DateComponents that allows your app to monitor the person’s
device activity during a period of time. You can set a schedule for your app to monitor on a
regularly occuring basis. You can create a warning time that the system uses to provide your app
extension with callbacks whenever a schedule is about to start or end, or when an event is close t
reaching its threshold.
init(intervalStart: DateComponents, intervalEnd: DateComponents, repeat
: Bool, warningTime: DateComponents?)
Creates a new schedule.
var intervalEnd: DateComponents
The date components that represent the end time for a schedule’s interval.
var intervalStart: DateComponents
The date components that represent the start time for a schedule’s interval.
Overview
Topics
Creating a Schedule
DeviceActivity / DeviceActivitySchedule
Structure
DeviceActivitySchedule
A calendar-based schedule for when to monitor a device’s activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

var nextInterval: DateInterval?
The schedule’s next interval or the current interval if one is ongoing.
var repeats: Bool
A Boolean value that indicates whether the schedule recurs.
var warningTime: DateComponents?
Optional components that generate a warning prior to regularly scheduled events.
Equatable
struct DeviceActivityEvent
An event that represents an application, category, or website activity.
struct DeviceActivityName
The unique name of an activity.
struct DeviceActivityCenter
A class that enables an application’s extension to start monitoring scheduled device activity.
Relationships
Conforms To
See Also
Manage Activities


