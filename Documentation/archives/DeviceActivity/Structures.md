# Structures.pdf

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


## Page 3

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


## Page 4

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


## Page 5

Equatable


## Page 6

When you create a report, the system asks your app’s device activity report extension to provide 
View representing the user’s device activity. To protect the user’s privacy, your extension runs in
sandbox. This sandbox prevents your extension from making network requests or moving sensitiv
content outside the extension’s address space. The extension point identifier for all device activity
report extensions is com.apple.deviceactivityui.report-extension. You can configur
a report with a custom context and filter, and then display the report like any SwiftUI view.
Overview
DeviceActivity / DeviceActivityReport
Structure
DeviceActivityReport
A view that reports the user’s application, category, and web domain activity in a
privacy-preserving way.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 7

The system will only provide your extension with device activity data if the user has authorized yo
app for family controls on their device or on the device(s) of children in their iCloud family. See


## Page 8

AuthorizationCenter for more details.
struct Context
A context indicating how your device activity report extension should configure its Device
ActivityReportView.
init(DeviceActivityReport.Context, filter: DeviceActivityFilter)
Creates a new device activity report.
var body: some View
The content of the device activity report.
Sendable, SendableMetatype, View
Topics
Structures
Initializers
Instance Properties
Relationships
Conforms To


## Page 9

static func buildBlock<Scene>(Scene) -> some DeviceActivityReportScene
static func buildBlock<S0, S1>(S0, S1) -> some DeviceActivityReportScen
static func buildBlock<S0, S1, S2>(S0, S1, S2) -> some DeviceActivity
ReportScene
static func buildBlock<S0, S1, S2, S3>(S0, S1, S2, S3) -> some Device
ActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4>(S0, S1, S2, S3, S4) -> some 
DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5>(S0, S1, S2, S3, S4, S5) 
> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6>(S0, S1, S2, S3, S4,
S5, S6) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7>(S0, S1, S2, S3,
S4, S5, S6, S7) -> some DeviceActivityReportScene
Topics
Type Methods
DeviceActivity / DeviceActivityReportBuilder
Structure
DeviceActivityReportBuilder
A result builder that combines one or more DeviceActivityReportScenes
into a single scene.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 10

static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8>(S0, S1, S2,
S3, S4, S5, S6, S7, S8) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9>(S0, S1,
S2, S3, S4, S5, S6, S7, S8, S9) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10>(S0,
S1, S2, S3, S4, S5, S6, S7, S8, S9, S10) -> some DeviceActivityReport
Scene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11) -> some Device
ActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12) -> some 
DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13) -
some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12,
S13, S14) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14, S15>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11,
S12, S13, S14, S15) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14, S15, S16>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10,
S11, S12, S13, S14, S15, S16) -> some DeviceActivityReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14, S15, S16, S17>(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9,
S10, S11, S12, S13, S14, S15, S16, S17) -> some DeviceActivityReport
Scene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14, S15, S16, S17, S18>(S0, S1, S2, S3, S4, S5, S6, S7, S8,
S9, S10, S11, S12, S13, S14, S15, S16, S17, S18) -> some DeviceActivity
ReportScene
static func buildBlock<S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11
S12, S13, S14, S15, S16, S17, S18, S19>(S0, S1, S2, S3, S4, S5, S6, S7,
S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19) -> some Devic
ActivityReportScene


## Page 11



## Page 12

class Iterator
An asynchronous iterator for filtered device activity.
func makeAsyncIterator() -> DeviceActivityResults<Element>.Iterator<
Element>
Creates the asynchronous iterator that produces elements of this asynchronous sequence.
AsyncSequence
Topics
Classes
Instance Methods
Relationships
Conforms To
DeviceActivity / DeviceActivityResults
Structure
DeviceActivityResults
An asynchronous sequence of filtered device activity results.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


