# 001_DeviceActivityName.pdf

## Page 1

Use DeviceActivityName to associate an activity with some of your application’s data. It’s not
possible to have multiple activities with the same name. Monitoring a second activity with the sam
name as a previous activity overwrites the schedule for the first one.
init(rawValue: String)
Creates a new instance with the specified raw value.
init(String)
Creates a new instance with the specified raw value.
Overview
Topics
Creating an Instance
Relationships
DeviceActivity / DeviceActivityName
Structure
DeviceActivityName
The unique name of an activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

Equatable, Hashable, RawRepresentable
struct DeviceActivityEvent
An event that represents an application, category, or website activity.
struct DeviceActivitySchedule
A calendar-based schedule for when to monitor a device’s activity.
struct DeviceActivityCenter
A class that enables an application’s extension to start monitoring scheduled device activity.
Conforms To
See Also
Manage Activities


