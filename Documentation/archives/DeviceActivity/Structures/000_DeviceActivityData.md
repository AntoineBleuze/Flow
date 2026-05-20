# 000_DeviceActivityData.pdf

## Page 1

struct ActivitySegment
Represents the user’s activity during a particular date interval.
struct ApplicationActivity
struct CategoryActivity
A categorized representation of a user’s application and web domain activity.
struct Device
A device for which to report activity data.
struct User
struct WebDomainActivity
var activitySegments: DeviceActivityResults<DeviceActivityData.Activity
Segment>
Topics
Structures
Instance Properties
DeviceActivity / DeviceActivityData
Structure
DeviceActivityData
Represents the activity of a DeviceActivityData.User on a particular
DeviceActivityData.Device.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 2

The activity of the user divided into segments.
var device: DeviceActivityData.Device
The device associated with the activity report.
var lastUpdatedDate: Date
The date when the system last updated the data for this device.
var segmentInterval: DeviceActivityFilter.SegmentInterval
The segment interval of each DeviceActivityData.ActivitySegment in activity
Segments.
var user: DeviceActivityData.User
The user associated with the activity report.
Equatable, Hashable
Relationships
Conforms To


