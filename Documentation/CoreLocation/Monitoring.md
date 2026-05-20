# Monitoring.pdf

## Page 1

Handling location updates in the background
Use CLMonitor to monitor for and observe events such as the entry to a specific geographic are
or proximity to a beacon with characteristics that you specify.
This service is unavailable in a compatible iPad or iPhone app running in visionOS.
init(String) async
Creates a location monitor with the name you specify.
func add(any CLCondition, identifier: String)
Mentioned in
Overview
Topics
Creating a monitor
Adding and removing conditions
Core Location / CLMonitor
Class
CLMonitor
An object that monitors the conditions you add to it.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 2

Adds the given condition for monitoring.
func add(any CLCondition, identifier: String, assuming: CLMonitor.Event
State)
Adds the monitoring condition with the identifier and initial state you specify.
func record(for: String) -> CLMonitor.Record?
A record that contains a condition and the most recent event your app receives.
func remove(String)
Removes the condition and its enclosed record associated with the identifier you provide.
var identifiers: [String]
An array that contains the identifiers of the conditions the framework is monitoring.
let events: CLMonitor.Events
An asynchronous sequence of events that represent the conditions the monitor object
observes.
struct BeaconIdentityCondition
A condition that describes the characteristics of a beacon.
struct CircularGeographicCondition
A condition that describes a circular geographic area that a center point and radius define.
struct Event
An event object that the framework passes to the events sequence in the monitor.
struct Record
A structure that represents a condition and its associated event information that the
framework is monitoring.
struct Events
Accessing the location monitor’s identifiers
Accessing the monitor’s events
Monitor conditions
Monitor events


## Page 3

A type that represents an asynchronous sequence of events.
Actor, Sendable, SendableMetatype
Relationships
Conforms To


