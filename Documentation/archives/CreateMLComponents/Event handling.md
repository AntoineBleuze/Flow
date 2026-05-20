# Event handling.pdf

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


## Page 3

struct Event
Maintains the status of the pipeline.
struct MetricsKey
A key that uniquely identifies a metric.
See Also
Event handling
Create ML Components / EventHandler
Type Alias
EventHandler
A closure to handle processing events.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

static let source: MetricsKey
A key associated with a temporal stream source (e.g. a file name).
static let trainingAccuracy: MetricsKey
A key associated with a training accuracy metric.
static let trainingError: MetricsKey
A key associated with a training error metric.
static let trainingLoss: MetricsKey
A key associated with a training loss metric.
static let trainingMaximumError: MetricsKey
A key associated with a training maximum error metric.
static let trainingMeanAveragePrecision: MetricsKey
A key associated with a training mean average precision metric.
static let validationAccuracy: MetricsKey
A key associated with a validation accuracy metric.
Topics
Getting the properties
Create ML Components / MetricsKey
Structure
MetricsKey
A key that uniquely identifies a metric.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 5

static let validationError: MetricsKey
A key associated with a validation error metric.
static let validationLoss: MetricsKey
A key associated with a validation loss metric.
static let validationMaximumError: MetricsKey
A key associated with a validation maximum error metric.
static let validationMeanAveragePrecision: MetricsKey
A key associated with a validation mean average precision metric.
Copyable
CustomDebugStringConvertible
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct Event
Maintains the status of the pipeline.
typealias EventHandler
A closure to handle processing events.
Relationships
Conforms To
See Also
Event handling


