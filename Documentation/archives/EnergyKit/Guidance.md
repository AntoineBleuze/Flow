# Guidance.pdf

## Page 1

ElectricityGuidance provides information on grid quality and electricity cost, if cost
information is available. You can use ElectricityGuidance to adjust the electricity
consumption of your managed devices to times when electricity is cleaner, and optionally reduce
the overall electricity consumption or cost of your managed devices.
class Service
An interface for obtaining electricity guidance data.
static let sharedService: ElectricityGuidance.Service
A single, shared guidance service object.
struct Value
Overview
Topics
Getting the electricity guidance data
Getting the electrical load weight
EnergyKit / ElectricityGuidance
Structure
ElectricityGuidance
A data model that provides guidance on when electricity is cleaner and less
expensive.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

A normalized weighting value associated with a period of time, describing when to shift or
reduce electricity use.
let values: [ElectricityGuidance.Value]
A series of weighted values for intervals of time, describing when to shift or reduce electricit
use.
enum Options
An enumeration that describes additional factors that influence the weight of a value.
let options: Set<ElectricityGuidance.Options>
The additional factors that influence the weight of a value.
let interval: DateInterval
The time range to which the guidance applies.
let energyVenueID: UUID
An identifier for the physical location to which the guidance applies.
let guidanceToken: UUID
A unique token for the guidance that you use to create an electrical load event.
struct Query
A structure that encapsulates a electricity guidance query request.
let suggestedAction: ElectricityGuidance.SuggestedAction
A property that describes how the electrical load uses the guidance.
enum SuggestedAction
A description of how the electrical load uses the guidance.
Identifying the guidance parameters
Getting the guidance suggestion
Relationships
Conforms To


## Page 3

Decodable
Encodable
Sendable
SendableMetatype


