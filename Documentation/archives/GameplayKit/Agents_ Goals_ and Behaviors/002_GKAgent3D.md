# 002_GKAgent3D.pdf

## Page 1

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


## Page 2

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


## Page 3

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


