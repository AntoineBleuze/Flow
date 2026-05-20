# 005_CMWaterTemperature.pdf

## Page 1

var date: Date
The time and date when the system recorded the measurements.
var temperature: Measurement<UnitTemperature>
The water temperature.
var temperatureUncertainty: Measurement<UnitTemperature>
The amount of uncertainty in the measurement of the water temperature.
NSObject
Topics
Accessing the data
Relationships
Inherits From
Conforms To
Core Motion / CMWaterTemperature
Class
CMWaterTemperature
An update that contains data about the water temperature.
iOS 16.0+
iPadOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Accessing submersion data
Use a water-submersion manager to receive water pressure, temperature, and depth data on
Apple Watch Ultra.
class CMWaterSubmersionManager
An object for managing the collection of pressure and temperature data during submersion.
protocol CMWaterSubmersionManagerDelegate
A delegate that receives updates about ambient pressure, water pressure, water temperatur
and submersion events.
class CMWaterSubmersionEvent
An event indicating that the device’s submersion state has changed.
class CMWaterSubmersionMeasurement
An update that contains data about the pressure and depth.
See Also
Water submersion


