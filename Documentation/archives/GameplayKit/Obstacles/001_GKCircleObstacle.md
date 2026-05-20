# 001_GKCircleObstacle.pdf

## Page 1

To make agents (GKAgent objects) avoid obstacles, create a goal with the init(toAvoid:max
PredictionTime:) method. Agents affected by an avoid-obstacles goal will attempt to move
such that their radius never overlaps that of a circular obstacle.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
init(radius: Float)
Initializes a circular obstacle with the specified radius.
var position: vector_float2
The position of the obstacle.
var radius: Float
Overview
Topics
Creating an Obstacle
Placing an Obstacle
GameplayKit / GKCircleObstacle
Class
GKCircleObstacle
A circular impassable area to be avoided by agents.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

The radius of the obstacle.
GKObstacle
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKObstacle
The abstract base class for objects representing impassable areas in a game world.
class GKSphereObstacle
A spherical impassable volume to be avoided by agents.
class GKPolygonObstacle
A polygon-shaped impassable area in a 2D game world.
Relationships
Inherits From
Conforms To
See Also
Obstacles


