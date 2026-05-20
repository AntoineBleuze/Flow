# 000_Event.pdf

## Page 1

init(origin: String, itemCount: Int, totalItemCount: Int?, metrics: [
MetricsKey : any Sendable])
Creates an event.
var itemCount: Int
The number of items processed so far.
var metrics: [MetricsKey : any Sendable]
A dictionary of custom metrics values.
var origin: String
A description of the event’s origin.
var totalItemCount: Int?
The total number of items being processed.
Topics
Creating the event
Getting the properties
Create ML Components / Event
Structure
Event
Maintains the status of the pipeline.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
typealias EventHandler
A closure to handle processing events.
struct MetricsKey
A key that uniquely identifies a metric.
Relationships
Conforms To
See Also
Event handling


