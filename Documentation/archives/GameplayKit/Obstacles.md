# Obstacles.pdf

## Page 1

You do not use this class directly; instead, create instances of its concrete subclasses GKCircle
Obstacle, GKSphereObstacle, and GKPolygonObstacle. To make agents (GKAgent
objects) avoid obstacles, create a goal with the goalToAvoidObstacles:timeBeforeCollisionToAvoid
method.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
For more information, see GameplayKit Programming Guide.
NSObject
GKCircleObstacle, GKPolygonObstacle, GKSphereObstacle
Overview
Relationships
Inherits From
Inherited By
GameplayKit / GKObstacle
Class
GKObstacle
The abstract base class for objects representing impassable areas in a game
world.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKCircleObstacle
A circular impassable area to be avoided by agents.
class GKSphereObstacle
A spherical impassable volume to be avoided by agents.
class GKPolygonObstacle
A polygon-shaped impassable area in a 2D game world.
Conforms To
See Also
Obstacles


## Page 3

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


## Page 4

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


## Page 5

To make agents (GKAgent objects) avoid obstacles, create a goal with the init(toAvoid:max
PredictionTime:) method. Agents affected by an avoid-obstacles goal will attempt to move
such that their radius never overlaps that of a spherical obstacle.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
init(radius: Float)
Initializes a spherical obstacle with the specified radius.
var position: vector_float3
The position of the obstacle.
var radius: Float
Overview
Topics
Creating an Obstacle
Placing an Obstacle
GameplayKit / GKSphereObstacle
Class
GKSphereObstacle
A spherical impassable volume to be avoided by agents.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 6

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
class GKCircleObstacle
A circular impassable area to be avoided by agents.
class GKPolygonObstacle
A polygon-shaped impassable area in a 2D game world.
Relationships
Inherits From
Conforms To
See Also
Obstacles


## Page 7

Polygon obstacles serve two purposes in GameplayKit: You can use polygon obstacles to constru
a navigability graph of your game world (a GKObstacleGraph object) for use in pathfinding. You
can also use polygon obstacles to define regions for agents (GKAgent objects) to avoid, using th
GKGoal method init(toAvoid:maxPredictionTime:).
To easily create obstacles for use with a SpriteKit game, create and arrange a set of nodes that
define the non-navigable regions of your game world. You can create such nodes
programmatically, or use the SpriteKit Scene Editor in Xcode. If you’re already using nodes with
physics bodies to keep sprites from entering those regions, you can reuse those nodes. Then, use
the obstacles(fromNodeBounds:), obstacles(fromSpriteTextures:accuracy:), o
obstacles(fromNodePhysicsBodies:) method to generate a set of GKPolygonObstacle
objects.
To learn more about both ways of using polygon obstacles, see Pathfinding and Agents, Goals, an
Behaviors in GameplayKit Programming Guide.
var vertexCount: Int
Overview
Topics
Inspecting Vertices
GameplayKit / GKPolygonObstacle
Class
GKPolygonObstacle
A polygon-shaped impassable area in a 2D game world.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 8

The number of vertices that define the polygon-shaped area of the obstacle.
func vertex(at: Int) -> vector_float2
Returns the point coordinates of the specified vertex.
convenience init(points: [SIMD2<Float>])
GKObstacle
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class GKObstacle
The abstract base class for objects representing impassable areas in a game world.
class GKCircleObstacle
A circular impassable area to be avoided by agents.
class GKSphereObstacle
Initializers
Relationships
Inherits From
Conforms To
See Also
Obstacles


## Page 9

A spherical impassable volume to be avoided by agents.


