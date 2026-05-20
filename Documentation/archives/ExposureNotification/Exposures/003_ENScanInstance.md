# 003_ENScanInstance.pdf

## Page 1

Important
This property is available in iOS 12.5, and in iOS 13.7 and later.
var minimumAttenuation: ENAttenuation
The minimum attenuation of beacons received during the scan.
var secondsSinceLastScan: Int
The number of seconds elapsed since the previous scan.
var typicalAttenuation: ENAttenuation
The aggregation of the attenuations of beacons received during the scan.
Overview
Topics
Getting Scan Instance Properties
Exposure Notification / ENScanInstance
Class
ENScanInstance
The aggregation of attenuations of beacons received during a scan.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Configuring Exposure Notifications
Define how Exposure Notifications work for a region by assigning server-based key-value
pairs.
class ENExposureConfiguration
The object that contains parameters for configuring exposure notification risk scoring
behavior.
class ENExposureWindow
A set of scan events from observed beacons within a time span.
Exposure Parameter Limits
The limits for the parameters you use in exposure risk calculations.
Relationships
Inherits From
Conforms To
See Also
Exposures


