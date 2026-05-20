# 000_DeviceActivityEvent.pdf

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


