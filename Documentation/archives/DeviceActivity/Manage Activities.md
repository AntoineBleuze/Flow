# Manage Activities.pdf

## Page 1

Device activity is the amount of time an application, category, or web domain is frontmost on the
screen and accumulates based on the time zone of the scheduled start date. Web domain activity
includes domains visited in Safari or any third-party browser that contributes web usage via a
STWebpageController.
init(applications: Set<ApplicationToken>, categories: Set<Activity
CategoryToken>, webDomains: Set<WebDomainToken>, threshold: Date
Components)
Creates a new event.
struct Name
The unique name of an event.
var includesAllActivity: Bool
A Boolean value that indicates whether the event includes all applications, categories, and
web domains.
Overview
Topics
Creating an Event
DeviceActivity / DeviceActivityEvent
Structure
DeviceActivityEvent
An event that represents an application, category, or website activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

var applications: Set<ApplicationToken>
The applications that the event includes.
var categories: Set<ActivityCategoryToken>
The categories that the event includes.
var webDomains: Set<WebDomainToken>
The web domains that the event includes.
var threshold: DateComponents
The amount of time to monitor the provided applications, categories, and web domains.
init(applications: Set<ApplicationToken>, categories: Set<Activity
CategoryToken>, webDomains: Set<WebDomainToken>, threshold: Date
Components, includesPastActivity: Bool)
Creates a new event.
var includesPastActivity: Bool
Whether the system takes into account the person’s device activity before your app starts
monitoring the event.
Equatable
Including Objects in an Event
Initializers
Instance Properties
Relationships
Conforms To
See Also


## Page 3

struct DeviceActivityName
The unique name of an activity.
struct DeviceActivitySchedule
A calendar-based schedule for when to monitor a device’s activity.
struct DeviceActivityCenter
A class that enables an application’s extension to start monitoring scheduled device activity.
Manage Activities


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


