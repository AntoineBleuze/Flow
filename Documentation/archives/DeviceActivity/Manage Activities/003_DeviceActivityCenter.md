# 003_DeviceActivityCenter.pdf

## Page 1

Activity begins when someone first uses a device within the scheduled time interval and ends whe
someone first uses the device outside of the interval. The system only invokes the intervalDid
Start(for:) and intervalDidEnd(for:) when the device is in use. Likewise, the system
invokes the eventDidReachThreshold(_:activity:) function when an event reaches its
threshold.
init()
Creates an activity center to manage which device activities your application monitors.
func startMonitoring(DeviceActivityName, during: DeviceActivitySchedule
events: [DeviceActivityEvent.Name : DeviceActivityEvent]) throws
Starts monitoring the specified device activity.
func stopMonitoring([DeviceActivityName])
Stops monitoring the specified device activities.
Overview
Topics
Monitoring Device Activities
DeviceActivity / DeviceActivityCenter
Structure
DeviceActivityCenter
A class that enables an application’s extension to start monitoring scheduled
device activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

var activities: [DeviceActivityName]
The activities that the application’s extension currently monitors.
func events(for: DeviceActivityName) -> [DeviceActivityEvent.Name :
DeviceActivityEvent]
Fetches the events of a device activity.
func schedule(for: DeviceActivityName) -> DeviceActivitySchedule?
Fetches the schedule of a device activity.
enum MonitoringError
Errors that may occur when starting to monitor an activity.
struct DeviceActivityEvent
An event that represents an application, category, or website activity.
struct DeviceActivityName
The unique name of an activity.
struct DeviceActivitySchedule
A calendar-based schedule for when to monitor a device’s activity.
Getting the Events and Schedules
Enumerations
See Also
Manage Activities


