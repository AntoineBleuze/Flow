# Maneuvers.pdf

## Page 1

You use maneuvers to provide turn-by-turn guidance in navigation apps. Each maneuver
represents a single navigation instruction and can include a symbol, an instruction, and estimates
for remaining time and distance.
You supply an instruction as an array of variants, each with a different length. CarPlay chooses th
longest variant that best fits the available space on the screen. You can optionally provide
attributed variants that embed images using NSTextAttachment. See attributed
InstructionVariants for more information.
In addition to the route guidance panel, you can show maneuvers on the CarPlay dashboard or in
notification banners. Use the relevant properties to provide context-specific instructions and
images.
var dashboardInstructionVariants: [String]
An array of instruction variants for the CarPlay dashboard.
var notificationInstructionVariants: [String]
Overview
Topics
Providing instructions
CarPlay / CPManeuver
Class
CPManeuver
An object that describes a single navigation instruction.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

An array of instruction variants for notification banners.
var attributedInstructionVariants: [NSAttributedString]
An array of attributed instruction variants for the maneuver.
var dashboardAttributedInstructionVariants: [NSAttributedString]
An array of attributed instruction variants for the CarPlay dashboard.
var notificationAttributedInstructionVariants: [NSAttributedString]
An array of attributed instruction variants for notification banners.
var initialTravelEstimates: CPTravelEstimates?
An object that describes the distance and time remaining before the maneuver completes.
var symbolImage: UIImage?
An image that represents the maneuver.
var dashboardSymbolImage: UIImage?
An image for the CarPlay dashboard that represents the maneuver.
var notificationSymbolImage: UIImage?
An image for notification banners that represents the maneuver.
var symbolSet: CPImageSet?
An image set that represents the maneuver.
Deprecated
var junctionImage: UIImage?
An image that represents an upcoming junction.
var dashboardJunctionImage: UIImage?
An image for the CarPlay dashboard that represents an upcoming junction.
Providing attributed instructions
Providing travel estimates
Providing symbol images
Providing junction images


## Page 3

var junctionType: CPJunctionType
A value that represents the type of junction associated with this maneuver.
var junctionExitAngle: Measurement<UnitAngle>?
The angle of the exit road of this junction.
var junctionElementAngles: Set<Measurement<UnitAngle>>?
A set of angles for the rest of the roads of this junction.
var maneuverType: CPManeuverType
A value that represents the type of maneuver.
var roadFollowingManeuverVariants: [String]?
An array of strings that represent the names of the road following this maneuver, arranged
from most to least preferred.
var linkedLaneGuidance: CPLaneGuidance
A value that represents lane guidance associated with this maneuver.
var highwayExitLabel: String
A string that describes a highway exit.
var trafficSide: CPTrafficSide
A value that represents which side of the road the traffic drives on.
var userInfo: Any?
A custom object associated with the maneuver.
var cardBackgroundColor: UIColor?
Providing junction information
Providing maneuver information
Providing additional information
Instance properties
Instance Properties


## Page 4

var instructionVariants: [String]
An array of instruction variants for the maneuver.
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
enum CPManeuverState
Values that describe the state of a maneuver.
enum CPManeuverType
Values that describe types of navigation maneuvers.
Relationships
Inherits From
Conforms To
See Also
Maneuvers


## Page 5

case prepare
case initial
case execute
case `continue`
init?(rawValue: Int)
BitwiseCopyable
Equatable
Topics
Enumeration Cases
Initializers
Relationships
Conforms To
CarPlay / CPManeuverState
Enumeration
CPManeuverState
Values that describe the state of a maneuver.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 6

Hashable
RawRepresentable
Sendable
SendableMetatype
class CPManeuver
An object that describes a single navigation instruction.
enum CPManeuverType
Values that describe types of navigation maneuvers.
See Also
Maneuvers


## Page 7

init?(rawValue: UInt)
Creates a new maneuver type with the provided value.
case arriveAtDestination
case arriveAtDestinationLeft
case arriveAtDestinationRight
case arriveEndOfDirections
case arriveEndOfNavigation
case changeFerry
case changeHighway
case changeHighwayLeft
case changeHighwayRight
Topics
Initializers
Maneuver types
CarPlay / CPManeuverType
Enumeration
CPManeuverType
Values that describe types of navigation maneuvers.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+


## Page 8

case enterRoundabout
case enter_Ferry
case exitFerry
case exitRoundabout
case followRoad
case highwayOffRampLeft
case highwayOffRampRight
case keepLeft
case keepRight
case leftTurn
case leftTurnAtEnd
case noTurn
case offRamp
case onRamp
case rightTurn
case rightTurnAtEnd
case roundaboutExit1
case roundaboutExit10
case roundaboutExit11
case roundaboutExit12
case roundaboutExit13
case roundaboutExit14
case roundaboutExit15
case roundaboutExit16
case roundaboutExit17
case roundaboutExit18
case roundaboutExit19
case roundaboutExit2


## Page 9

case roundaboutExit3
case roundaboutExit4
case roundaboutExit5
case roundaboutExit6
case roundaboutExit7
case roundaboutExit8
case roundaboutExit9
case sharpLeftTurn
case sharpRightTurn
case slightLeftTurn
case slightRightTurn
case startRoute
case startRouteWithUTurn
case straightAhead
case uTurn
case uTurnAtRoundabout
case uTurnWhenPossible
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 10

class CPManeuver
An object that describes a single navigation instruction.
enum CPManeuverState
Values that describe the state of a maneuver.
See Also
Maneuvers


