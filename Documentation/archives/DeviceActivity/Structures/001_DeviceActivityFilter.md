# 001_DeviceActivityFilter.pdf

## Page 1

Your app can choose to filter device activity data for a specific date interval, filter by user and
device, as well as specify a subset of applications, categories, and web domains to include in a
report.
struct Devices
A type your app uses to indiciate which devices to include in a device activity report.
struct Users
A type your app uses to indicate which users to include in a device activity report.
init(segment: DeviceActivityFilter.SegmentInterval, devices: Device
ActivityFilter.Devices?, applications: Set<ApplicationToken>, categorie
: Set<ActivityCategoryToken>, webDomains: Set<WebDomainToken>)
Overview
Topics
Structures
Initializers
DeviceActivity / DeviceActivityFilter
Structure
DeviceActivityFilter
A type that filters the device activity data to include in a report.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 2

Creates a new filter for the current user.
init(segment: DeviceActivityFilter.SegmentInterval, users: Device
ActivityFilter.Users, devices: DeviceActivityFilter.Devices,
applications: Set<ApplicationToken>, categories: Set<ActivityCategory
Token>, webDomains: Set<WebDomainToken>)
Creates a new filter for the specified users and devices.
var applications: Set<ApplicationToken>
An optional set of applications to include in a report.
var categories: Set<ActivityCategoryToken>
An optional set of categories to include in a report.
let devices: DeviceActivityFilter.Devices?
The devices to include in a report.
var segmentInterval: DeviceActivityFilter.SegmentInterval
The interval at which the system subdivides the report’s device activity data during a specifi
date interval.
let users: DeviceActivityFilter.Users?
The users to include in a report.
var webDomains: Set<WebDomainToken>
An optional set of web domains to include in a report.
enum SegmentInterval
A type indicating the interval at which the system subdivides device activity data within a
specified date interval.
Instance Properties
Enumerations
Relationships
Conforms To


## Page 3

Equatable


