# 003_ElectricityInsightMeasure.pdf

## Page 1

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


## Page 2

A structure describing a query that you use to obtain environmental impact information in th
form of electricity insight records.


