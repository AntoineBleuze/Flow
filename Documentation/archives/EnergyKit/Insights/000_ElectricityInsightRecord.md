# 000_ElectricityInsightRecord.pdf

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


