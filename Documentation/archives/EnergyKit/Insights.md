# Insights.pdf

## Page 1

This structure provides electricity usage data categorized by environmental impact (Electricit
InsightRecord.GridCleanliness) and cost factors (ElectricityInsightRecord
.TariffPeak) for analysis and optimization.
The electricity usage data (dataByGridCleanliness) refers to either energy consumption or
generation measurements, or amounts of time that an electrical device is operational and
consuming energy. The type of electricity usage data depends on the generic type parameter
(ElectricityInsightMeasure) for a given instance, which can be either:
ElectricityInsightRecord<Measurement<UnitEnergy>>
ElectricityInsightRecord<Duration>
struct GridCleanliness
Overview
Topics
Getting the grid data
EnergyKit / ElectricityInsightRecord
Structure
ElectricityInsightRecord
A structure that provides environmental impact and cost insights for electricity
usage over a specific time period.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

A structure that describes the environmental impact of grid electricity during specific time
periods.
var dataByGridCleanliness: ElectricityInsightRecord<Measure>.Grid
Cleanliness?
Energy consumption or production, or device operational runtime categorized by the
cleanliness of the grid electricity.
struct TariffPeak
A struct describing energy tariff peaks or duration data, if available.
var dataByTariffPeak: ElectricityInsightRecord<Measure>.TariffPeak?
The electrical energy consumed or generated, or the runtime duration split out by tariff peak
if available.
var totalRuntime: Duration?
The total time that electricity-consuming devices actively ran.
let range: DateInterval
The time period that the insight record spans.
var totalEnergy: Measurement<UnitEnergy>?
The total electrical energy consumed or generated.
actor ElectricityInsightService
A service for retrieving insights about electricity consumption.
struct ElectricityInsightQuery
A structure describing a query that you use to obtain environmental impact information in th
form of electricity insight records.
Getting the tariff peak data
Getting the insight record data
See Also
Insights


## Page 3

protocol ElectricityInsightMeasure
A protocol for types that can measure electricity usage data.


## Page 4

static let shared: ElectricityInsightService
A single, shared insight service object.
func energyInsights(forDeviceID: String, using: ElectricityInsightQuery
atVenue: UUID) async throws -> AsyncStream<ElectricityInsightRecord<
Measurement<UnitEnergy>>>
Returns data that provides insight into electrical usage for a given device.
func runtimeInsights(forDeviceID: String, using: ElectricityInsightQuer
, atVenue: UUID) async throws -> AsyncStream<ElectricityInsightRecord<
Duration>>
Returns records that provide insight into runtime of a given device.
Topics
Retrieving the shared instance
Getting device insights
Relationships
EnergyKit / ElectricityInsightService
Class
ElectricityInsightService
A service for retrieving insights about electricity consumption.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 5

Actor, Sendable, SendableMetatype
struct ElectricityInsightRecord
A structure that provides environmental impact and cost insights for electricity usage over a
specific time period.
struct ElectricityInsightQuery
A structure describing a query that you use to obtain environmental impact information in th
form of electricity insight records.
protocol ElectricityInsightMeasure
A protocol for types that can measure electricity usage data.
Conforms To
See Also
Insights


## Page 6

init(options: ElectricityInsightQuery.Options, range: DateInterval,
granularity: ElectricityInsightQuery.Granularity, flowDirection:
ElectricityFlowDirection)
Creates an electricity insight query request.
struct Options
A set of options that specify optional information to include in electricity insight records
returned from the insight service.
let options: ElectricityInsightQuery.Options
The optional information to include in returned electricity insight records.
enum Granularity
Topics
Creating an insight query request
Adding optional insight records
Getting the query request information
EnergyKit / ElectricityInsightQuery
Structure
ElectricityInsightQuery
A structure describing a query that you use to obtain environmental impact
information in the form of electricity insight records.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 7

The specific temporal granularity of electricity insight records.
let granularity: ElectricityInsightQuery.Granularity
The temporal granularity for returned electricity insight records.
let flowDirection: ElectricityFlowDirection
A property that specifies whether the response contains imported or exported energy.
let range: DateInterval
The requested date range.
Decodable
Encodable
Sendable
SendableMetatype
struct ElectricityInsightRecord
A structure that provides environmental impact and cost insights for electricity usage over a
specific time period.
actor ElectricityInsightService
A service for retrieving insights about electricity consumption.
protocol ElectricityInsightMeasure
A protocol for types that can measure electricity usage data.
Relationships
Conforms To
See Also
Insights


## Page 8

The ElectricityInsightRecord structure uses this protocol as its generic type parameter,
and supports the types:
ElectricityInsightRecord<Measurement<UnitEnergy>>
ElectricityInsightRecord<Duration>
struct ElectricityInsightRecord
A structure that provides environmental impact and cost insights for electricity usage over a
specific time period.
actor ElectricityInsightService
A service for retrieving insights about electricity consumption.
struct ElectricityInsightQuery
Overview
See Also
Insights
EnergyKit / ElectricityInsightMeasure
Protocol
ElectricityInsightMeasure
A protocol for types that can measure electricity usage data.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 9

A structure describing a query that you use to obtain environmental impact information in th
form of electricity insight records.


