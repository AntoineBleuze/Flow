# Agents_ Goals_ and Behaviors.pdf

## Page 1

The GKAgent class is abstract, defining only the general functionality of an agent—its movement
constraints and the behavior property containing its goals (GKGoal objects). To implement
agent-based gameplay, choose a concrete subclass that fits your game.
Use the GKAgent2D class for 2D game worlds, or for 3D games where all gameplay-relevant
movement is constrained to two dimensions.
Use the GKAgent3D class for game worlds that allow movement in three dimensions.
To learn more about the agent simulation, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
Because GKAgent is a subclass of GKComponent, you can use Entity-Component architecture to
add agent-based behaviors to your game. (For details on this architecture, see Entities and
Components in GameplayKit Programming Guide.)
To integrate agents with gameplay, call each agent’s update(deltaTime:) method each time
you want to update the simulation that governs the agent’s behavior. Typically, you call this metho
once for each frame processed by your game’s graphics engine—for example, in the update(_:
method of a SpriteKit scene or the renderer(_:updateAtTime:) method of a SceneKit
renderer delegate. If your game uses Entity-Component architecture, you can use a GKComponen
Overview
An Agent is a Component
GameplayKit / GKAgent
Class
GKAgent
A component that moves a game entity according to a set of goals and realistic
constraints.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

System object to update all the agents in the game scene for each frame. If not, you must call
each agent’s update(deltaTime:) method directly.
Each time an agent’s update(deltaTime:) method runs, the agent evaluates each GKGoal
object listed in its behavior property to find the change in direction and speed necessary to mo
toward fulfilling that goal (within the limits of the time delta and the agent’s maximum speed and
turn rate). It then combines the effects from all the goals in its behavior, using the weights specifi
in the GKBehavior object to modulate the influence of each goal, resulting in a total change in it
direction and speed.
There are two options for using the output of this simulation to move game entities:
In a per-frame update that executes after the agent’s update(deltaTime:) method—such a
the update(deltaTime:) method of another GKComponent subclass in your game or a
game engine method such as didEvaluateActions() (SpriteKit) or renderer(_:will
RenderScene:atTime:) (SceneKit)—examine the position and rotation of each agent and u
that information to update the properties of any visual objects representing the agents.
Set the delegate property of each agent to an object responsible for that agent’s visual
representation. That object can implement the agentDidUpdate(_:) method, which the
agent calls every time it updates its position and direction. In that method, you can examine the
agent’s properties and make corresponding changes to a visual representation.
In addition, an agent delegate can implement the agentWillUpdate(_:) method to feed
information into the agent simulation. This option can be useful for combining agent-based
movement with an external physics engine (such as those found in SceneKit and SpriteKit), or wit
other APIs that might apply motion to an agent’s visual representation (such as SpriteKit actions).
However, the agent simulation cannot account for momentum introduced by such influences, so
the accuracy of the agent’s planning will be reduced in these scenarios.
Tip
If you use the GKSKNodeComponent class to manage the relationship between an entity and a
SpriteKit node, set your GKSKNodeComponent instance as the delegate for that entity’s
agent, and GameplayKit will automatically synchronize the agent and its SpriteKit
representation.
An Agent Simulates Movement Based on Goals


## Page 3

Note
The simulation responsible for agent movement is based on realistic physical behaviors;
however, this simulation is not connected to the physics subsystems in SpriteKit, SceneKit, or
any other graphics engine. For example, setting the mass property of an agent does not affect
the collision behavior of any SpriteKit physics bodies.
var behavior: GKBehavior?
A weighted collection of goals that influence the agent’s movement.
var mass: Float
The resistance of the agent to changes in speed or direction.
var maxAcceleration: Float
The upper limit to changes in the agent’s speed or direction.
var maxSpeed: Float
The agent’s maximum forward speed, in units per second.
var radius: Float
The agent’s radius.
var delegate: (any GKAgentDelegate)?
An object that prepares for or responds to updates in the agent simulation.
var speed: Float
The agent’s current forward speed, in units per second.
Topics
Defining an Agent’s Behavior
Constraining an Agent’s Movement
Synchronizing an Agent’s Visual Representation
Managing an Agent’s Attributes


## Page 4

GKComponent
GKAgent2D, GKAgent3D
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKAgent2D
An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKGoal
An influence that motivates the movement of one or more agents.
class GKBehavior
A set of goals that together influence the movement of an agent.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 5

class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 6

Agents are game entities that move according to realistic constraints and whose behavior is
determined by goals that motivate movement. The general functionality of an agent is defined by
the abstract superclass GKAgent; however, you use instances of the GKAgent2D class to
implement agent-based gameplay in a 2D game (or in a 3D game where gameplay-relevant
movement is restricted to two dimensions).
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
var position: vector_float2
The current position of the agent in 2D space.
var rotation: Float
The rotation of the agent around the z-axis.
Overview
Topics
Managing an Agent’s Position and Orientation
Running the Agent Simulation
GameplayKit / GKAgent2D
Class
GKAgent2D
An agent that operates in a two-dimensional space.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 7

func update(deltaTime: TimeInterval)
Causes the agent to evaluate its goals and update its position, rotation, and velocity
accordingly.
var velocity: vector_float2
The current velocity of the agent in 2D space.
GKAgent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKGoal
An influence that motivates the movement of one or more agents.
Relationships
Inherits From
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 8

class GKBehavior
A set of goals that together influence the movement of an agent.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 9

Agents are game entities that move according to realistic constraints and whose behavior is
determined by goals that motivate movement. The general functionality of an agent is defined by
the abstract superclass GKAgent; however, you use instances of the GKAgent3D class to
implement agent-based gameplay in a 3D game.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
var position: vector_float3
The current position of the agent in 3D space.
var rotation: matrix_float3x3
The orientation of the agent in 3D space.
Overview
Topics
Managing an Agent’s Position and Orientation
Running the Agent Simulation
GameplayKit / GKAgent3D
Class
GKAgent3D
An agent that operates in a three-dimensional space.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 10

func update(deltaTime: TimeInterval)
Causes the agent to evaluate its goals and update its position, rotation, and velocity
accordingly.
var velocity: vector_float3
The current velocity of the agent in 3D space.
var rightHanded: Bool
GKAgent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
Instance Properties
Relationships
Inherits From
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 11

class GKAgent2D
An agent that operates in a two-dimensional space.
class GKGoal
An influence that motivates the movement of one or more agents.
class GKBehavior
A set of goals that together influence the movement of an agent.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 12

Goals can motivate agents (GKAgent objects) to actions such as moving toward a target, followin
a path, or staying aligned with a group of other agents. To give an agent one or more goals,
combine those goals in a GKBehavior object (which includes weights for the relative influence o
each goal) and assign that object to the agent’s behavior property.
Each time an agent’s update(deltaTime:) method runs, the agent evaluates each goal in its
behavior to find the change in direction and speed necessary to move toward fulfilling that goal
(within the limits of the time delta and the agent’s maximum speed and turn rate). It then combine
the effects from all the goals in its behavior, using the weights in the behavior to modulate the
influence of each goal, to produce a total change in its direction and speed.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
convenience init(toSeekAgent: GKAgent)
Creates a goal whose effect is to move an agent toward the current position of the specified
other agent.
Overview
Topics
Creating Goals for General Movement Behavior
GameplayKit / GKGoal
Class
GKGoal
An influence that motivates the movement of one or more agents.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 13

convenience init(toFleeAgent: GKAgent)
Creates a goal whose effect is to move an agent away from the current position of the
specified other agent.
convenience init(toReachTargetSpeed: Float)
Creates a goal whose effect is to accelerate or decelerate an agent until it reaches the
specified speed.
convenience init(toWander: Float)
Creates a goal whose effect is to make an agent wander aimlessly, moving forward and
turning at random.
convenience init(toAvoid: [GKAgent], maxPredictionTime: TimeInterval)
Creates a goal whose effect is to make an agent avoid colliding with the specified other
agents, taking into account the other agents’ movement.
convenience init(toAvoid: [GKObstacle], maxPredictionTime: TimeInterval
Creates a goal whose effect is to make an agent avoid colliding with the specified static
obstacles.
convenience init(toInterceptAgent: GKAgent, maxPredictionTime: Time
Interval)
Creates a goal whose effect is to make an agent pursue the specified other agent, taking int
account the target’s movement.
convenience init(toSeparateFrom: [GKAgent], maxDistance: Float, maxAngl
: Float)
Creates a goal whose effect is to make an agent maintain the specified distance from other
agents in a specified group.
convenience init(toAlignWith: [GKAgent], maxDistance: Float, maxAngle:
Float)
Creates a goal whose effect is to make an agent align its orientation with that of other agent
in a specified group.
convenience init(toCohereWith: [GKAgent], maxDistance: Float, maxAngle:
Float)
Creating Goals for Avoidance and Interception Behavior
Creating Goals for Flocking Behavior


## Page 14

Creates a goal whose effect is to make an agent stay near the other agents in a specified
group.
convenience init(toStayOn: GKPath, maxPredictionTime: TimeInterval)
Creates a goal whose effect is to maintain an agent’s position within the specified path.
convenience init(toFollow: GKPath, maxPredictionTime: TimeInterval,
forward: Bool)
Creates a goal whose effect is to both maintain position on and traverse the specified path.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent2D
Creating Goals for Path-Following Behavior
Relationships
Inherits From
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 15

An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKBehavior
A set of goals that together influence the movement of an agent.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 16

By combining multiple goals (GKGoal objects) you can create complex behavior, such as groups 
agents (GKAgent objects) that move together naturally. To assign a set of goals to an agent, use
its behavior property.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
convenience init(goal: GKGoal, weight: Float)
Creates a behavior with a single goal.
convenience init(goals: [GKGoal])
Creates a behavior with the specified goals.
convenience init(goals: [GKGoal], andWeights: [NSNumber])
Creates a behavior with the specified goals and weights.
Overview
Topics
Creating a Behavior
GameplayKit / GKBehavior
Class
GKBehavior
A set of goals that together influence the movement of an agent.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 17

convenience init(weightedGoals: [GKGoal : NSNumber])
Creates a behavior with the specified mapping of goals to their weights.
func setWeight(Float, for: GKGoal)
Sets the weight for the specified goal’s influence on agents, adding that goal to the behavior
not already present.
func weight(for: GKGoal) -> Float
Returns the weight for the specified goal’s influence on agents.
func remove(GKGoal)
Removes the specified goal from the behavior.
func removeAllGoals()
Removes all goals from the behavior.
var goalCount: Int
The number of goals in the behavior.
subscript(GKGoal) -> NSNumber!
Returns the weight associated with the goal specified by subscript syntax.
subscript(Int) -> GKGoal
Returns the goal at the specified index in the behavior’s list of goals.
NSObject
GKCompositeBehavior
Managing a Behavior’s Set of Goals
Working with Goals Using Subscript Syntax
Relationships
Inherits From
Inherited By


## Page 18

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSFastEnumeration
NSObjectProtocol
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent2D
An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKGoal
An influence that motivates the movement of one or more agents.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 19

By composing GKGoal objects into subgroups (GKBehavior objects) and composing those
behaviors into composite behaviors, you can control certain aspects of a GKAgent object’s
movement in concert. To assign a behavior to an agent, use its behavior property.
For example, you might create a behavior for a set of agents to stay together as a flock (with
cohesion, alignment, and separation goals) while loosely following a path. With a single
GKBehavior object, whenever you want to change the importance of the flocking goals relative 
the path-following goals, you’d need to individually change the weight of each goal. With a
composite behavior, you can adjust the relative influence of a group of goals together, as in the
following code.
Overview
Objective-C
GameplayKit / GKCompositeBehavior
Class
GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the
movement of an agent.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
Swift


## Page 20

After constructing this behavior, you can use the setWeight(_:for:) method to increase or
decrease the influence of the flock and meanderOnPath behaviors relative to one another.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
convenience init(behaviors: [GKBehavior])
Creates a composite behavior from the specified individual behaviors.
convenience init(behaviors: [GKBehavior], andWeights: [NSNumber])
Creates a behavior with the specified behaviors and weights.
func setWeight(Float, for: GKBehavior)
Sets the weight for the specified individual behavior’s influence on agents, adding that
behavior to the composite behavior if it is not already present.
func weight(for: GKBehavior) -> Float
Returns the weight for the specified individual behavior’s influence on agents.
func remove(GKBehavior)
Removes the specified individual behavior from the composite behavior.
func removeAllBehaviors()
Removes all individual behaviors from the composite behavior.
var behaviorCount: Int
The number of individual behaviors in the composite behavior.
subscript(GKBehavior) -> NSNumber
Topics
Creating a Composite Behavior
Managing the Individual Behaviors in a Composite Behavior
Working with Behaviors Using Subscript Syntax


## Page 21

Returns the weight associated with the behavior specified by subscript syntax.
subscript(Int) -> GKBehavior
Returns the individual behavior at the specified index in the composite behavior’s list of
behaviors.
GKBehavior
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSFastEnumeration
NSObjectProtocol
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent2D
An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKGoal
Relationships
Inherits From
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 22

An influence that motivates the movement of one or more agents.
class GKBehavior
A set of goals that together influence the movement of an agent.
class GKPath
A polygonal path that can be followed by an agent.
protocol GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 23

To make an agent move to or stay within the area defined by a path, create a goal with the
init(toStayOn:maxPredictionTime:) method; to make an agent traverse along a path,
create a goal with the init(toFollow:maxPredictionTime:forward:) method.
A path can be expressed as a sequence of either 2D points or 3D points. Use the former to create
paths for use by GKAgent2D objects, and the latter to create paths for GKAgent3D objects to
follow.
Note
The coordinate system in which you express the path’s vertices and radius is arbitrary; you
may choose how to map agent positions and sizes into your game scene. It often makes sense
to use the same coordinate system as your game engine—for example, when using agents in a
SpriteKit-based game, you’d typically specify a path in screen points.
To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
Overview
Topics
GameplayKit / GKPath
Class
GKPath
A polygonal path that can be followed by an agent.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 24

init(graphNodes: [GKGraphNode], radius: Float)
Initializes a path using the positions of the specified graph nodes.
var radius: Float
The radius of the path.
var isCyclical: Bool
A Boolean value that determines whether the path loops around on itself (that is, the path’s
end point connects to its start point).
var numPoints: Int
The number of vertices in the path.
func float2(at: Int) -> vector_float2
Returns the 2D point at the specified index in the path’s list of vertices.
func float3(at: Int) -> vector_float3
Returns the 3D point at the specified index in the path’s list of vertices.
func point(at: Int) -> vector_float2
Returns the 2D point at the specified index in the path’s list of vertices.
Deprecated
convenience init(points: [SIMD3<Float>], radius: Float, cyclical: Bool)
convenience init(points: [SIMD2<Float>], radius: Float, cyclical: Bool)
Creating a Path
Managing a Path’s Attributes
Inspecting a Path’s Shape
Initializers
Relationships


## Page 25

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent2D
An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
class GKGoal
An influence that motivates the movement of one or more agents.
class GKBehavior
A set of goals that together influence the movement of an agent.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
protocol GKAgentDelegate
Inherits From
Conforms To
See Also
Agents, Goals, and Behaviors


## Page 26

Implement this protocol to synchronize the state of an agent with its visual representation in
your game.


## Page 27

A GKAgent object simulates its own movement according to constraints and goals. Use this
protocol to manage an external object related to the agent, such as the sprite or 3D object that
provides that agent’s visual representation in your game.
You can synchronize with an agent in either or both directions:
To update a visual representation based on the latest data from the agent simulation, implemen
the agentDidUpdate(_:) method. In this method you can read the position and
rotation properties of the agent (as a GKAgent2D or GKAgent3D object) and set the
corresponding attributes of whatever object provides the agent’s visual representation.
To update the agent simulation with data from an external source—for example, if the game
object corresponding to an agent is also affected by a physics engine such as those used in
SpriteKit and SceneKit—implement the agentWillUpdate(_:) method. In this method you
can set the position and rotation properties of the agent (as a GKAgent2D or GKAgent3
object) so that the next simulation step will take your changes to those properties into account
Tip
If you use the GKSKNodeComponent class to manage the relationship between an entity and a
SpriteKit node, set your GKSKNodeComponent instance as the delegate for that entity’s
agent, and GameplayKit will automatically synchronize the agent and its SpriteKit
representation.
Overview
GameplayKit / GKAgentDelegate
Protocol
GKAgentDelegate
Implement this protocol to synchronize the state of an agent with its visual
representation in your game.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 28

To learn more about using goals and agents, see Agents, Goals, and Behaviors in GameplayKit
Programming Guide.
func agentWillUpdate(GKAgent)
Tells the delegate that an agent is about to perform its next simulation step.
func agentDidUpdate(GKAgent)
Tells the delegate that an agent has just performed a simulation step.
NSObjectProtocol
GKSCNNodeComponent, GKSKNodeComponent
class GKAgent
A component that moves a game entity according to a set of goals and realistic constraints.
class GKAgent2D
An agent that operates in a two-dimensional space.
class GKAgent3D
An agent that operates in a three-dimensional space.
Topics
Synchronizing with Agents
Relationships
Inherits From
Conforming Types
See Also
Agents, Goals, and Behaviors


## Page 29

class GKGoal
An influence that motivates the movement of one or more agents.
class GKBehavior
A set of goals that together influence the movement of an agent.
class GKCompositeBehavior
A set of behaviors, each of which is a set of goals, that together influence the movement of a
agent.
class GKPath
A polygonal path that can be followed by an agent.


