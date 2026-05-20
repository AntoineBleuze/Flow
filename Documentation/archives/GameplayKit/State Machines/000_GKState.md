# 000_GKState.pdf

## Page 1

The GKState abstract class defines the features of state classes to be used with a state machine
(a GKStateMachine object). You build a state machine by defining a separate GKState subclas
for each state of the machine. In each state class, you use the isValidNextState(_:) metho
to define which other states are valid for a machine to transition into. State classes provide a plac
to put state-dependent game logic, such as actions that should happen when entering or exiting 
specific state, or per-frame update code that is valid only when in a specific state.
For more information about state machines, read State Machines in GameplayKit Programming
Guide.
init()
Initializes a state object.
var stateMachine: GKStateMachine?
Overview
Topics
Creating a State
Working with State Machines
GameplayKit / GKState
Class
GKState
The abstract superclass for defining state-specific logic as part of a state machin
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

The state machine that owns this state object.
func isValidNextState(AnyClass) -> Bool
Returns a Boolean value indicating whether a state machine currently in this state is allowed 
transition into the specified state.
func didEnter(from: GKState?)
Performs custom actions when a state machine transitions into this state.
func update(deltaTime: TimeInterval)
Performs custom actions when a state machine updates while in this state.
func willExit(to: GKState)
Performs custom actions when a state machine transitions out of this state.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Handling State Transitions and Updates
Relationships
Inherits From
Conforms To
See Also
State Machines


## Page 3

class GKStateMachine
A finite-state machine—a collection of state objects that each define logic for a particular
state of gameplay and rules for transitioning between states.


