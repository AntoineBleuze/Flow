# Routes_ lanes and junctions.pdf

## Page 1

init(maneuvers: [CPManeuver], laneGuidances: [CPLaneGuidance], current
Maneuvers: [CPManeuver], currentLaneGuidance: CPLaneGuidance, trip:
CPTravelEstimates, maneuverTravelEstimates: CPTravelEstimates)
Initializes a new route information object with maneuvers, lane guidances, the current
maneuvers, the current lane guidance, and trip and current maneuver travel estimates.
var currentLaneGuidance: CPLaneGuidance
A lane guidance object that describes the current lane guidance.
var currentManeuvers: [CPManeuver]
An array of maneuver objects that describes the current maneuvers.
var laneGuidances: [CPLaneGuidance]
An array of lane guidance objects.
var maneuverTravelEstimates: CPTravelEstimates
An object that describes the time and distance estimates for a maneuver.
Topics
Initializers
Properties
CarPlay / CPRouteInformation
Class
CPRouteInformation
A class that describes the characteristic elements of a route.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 2

var maneuvers: [CPManeuver]
An array of maneuver objects.
var tripTravelEstimates: CPTravelEstimates
A travel estimates object that describes the estimated time and distance for the current trip.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class CPLane
A class that describes characteristics of a lane on a roadway.
class CPLaneGuidance
A class that provides information that describes the number of lanes on a roadway and
navigation instruction variants.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
Relationships
Inherits From
Conforms To
See Also
Routes, lanes and junctions


## Page 3

enum CPJunctionType
Values that represent types of roadway junctions.


## Page 4

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


## Page 5

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


## Page 6

A class that provides information that describes the number of lanes on a roadway and
navigation instruction variants.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
enum CPJunctionType
Values that represent types of roadway junctions.


## Page 7

var instructionVariants: [String]
An array of strings that represent the instruction for this lane guidance, arranged from most-
to least-preferred.
var lanes: [CPLane]
An array of lane objects, each describing a single lane.
NSObject
CVarArg
Topics
Properties
Relationships
Inherits From
Conforms To
CarPlay / CPLaneGuidance
Class
CPLaneGuidance
A class that provides information that describes the number of lanes on a roadwa
and navigation instruction variants.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 8

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
class CPLane
A class that describes characteristics of a lane on a roadway.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
enum CPJunctionType
Values that represent types of roadway junctions.
See Also
Routes, lanes and junctions


## Page 9

init?(rawValue: Int)
Creates a lane status with the provided value.
case notGood
The lane status is not good.
case good
The lane status is good.
case preferred
The lane status is preferred.
Topics
Initializers
Lane statuses
Relationships
CarPlay / CPLaneStatus
Enumeration
CPLaneStatus
Values that describe the status or preferability of a lane.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 10

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CPRouteInformation
A class that describes the characteristic elements of a route.
class CPLane
A class that describes characteristics of a lane on a roadway.
class CPLaneGuidance
A class that provides information that describes the number of lanes on a roadway and
navigation instruction variants.
enum CPJunctionType
Values that represent types of roadway junctions.
Conforms To
See Also
Routes, lanes and junctions


## Page 11

init?(rawValue: UInt)
Creates a junction type with the provided integer value.
case intersection
A single intersection with roads coming to a common point.
case roundabout
Junction elements that represent roads exiting the roundabout.
BitwiseCopyable
Topics
Initializers
Junction types
Relationships
Conforms To
CarPlay / CPJunctionType
Enumeration
CPJunctionType
Values that represent types of roadway junctions.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 12

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CPRouteInformation
A class that describes the characteristic elements of a route.
class CPLane
A class that describes characteristics of a lane on a roadway.
class CPLaneGuidance
A class that provides information that describes the number of lanes on a roadway and
navigation instruction variants.
enum CPLaneStatus
Values that describe the status or preferability of a lane.
See Also
Routes, lanes and junctions


