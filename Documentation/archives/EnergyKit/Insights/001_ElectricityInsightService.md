# 001_ElectricityInsightService.pdf

## Page 1

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


## Page 2

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


