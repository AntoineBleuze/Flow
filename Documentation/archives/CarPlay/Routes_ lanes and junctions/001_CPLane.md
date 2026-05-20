# 001_CPLane.pdf

## Page 1

var primaryAngle: Measurement<UnitAngle>
A value that represents the angle the framework highlights if this lane is preferred or good.
Deprecated
var secondaryAngles: [Measurement<UnitAngle>]
A list of the remaining angles of this lane guidance.
Deprecated
var status: CPLaneStatus
A value that describes the lane’s status.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
init()
Deprecated
Topics
Properties
Lane status
Initializers
CarPlay / CPLane
Class
CPLane
A class that describes characteristics of a lane on a roadway.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 2

init(angles: [Measurement<UnitAngle>])
init(angles: [Measurement<UnitAngle>], highlightedAngle: Measurement<
UnitAngle>, isPreferred: Bool)
var angles: [Measurement<UnitAngle>]
var highlightedAngle: Measurement<UnitAngle>?
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CPRouteInformation
A class that describes the characteristic elements of a route.
class CPLaneGuidance
Instance Properties
Relationships
Inherits From
Conforms To
See Also
Routes, lanes and junctions


## Page 3

A class that provides information that describes the number of lanes on a roadway and
navigation instruction variants.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
enum CPJunctionType
Values that represent types of roadway junctions.


