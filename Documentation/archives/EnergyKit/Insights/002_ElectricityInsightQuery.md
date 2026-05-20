# 002_ElectricityInsightQuery.pdf

## Page 1

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


## Page 2

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


