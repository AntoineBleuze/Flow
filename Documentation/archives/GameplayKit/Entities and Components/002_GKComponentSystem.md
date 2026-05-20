# 002_GKComponentSystem.pdf

## Page 1

A GKComponentSystem object manages periodic update messages for components in a game
that uses Entity-Component architecture. Use a component system to perform per-frame logic fo
all components of a specific class without traversing your game’s object hierarchy to dispatch
update messages.
Each GKComponentSystem object manages components of a specific GKComponent subclass.
You create a component system with the init(componentClass:) initializer, specifying the
component class it will work with. Then, you register the components used by the entities in your
game with the addComponent(_:) or addComponent(foundIn:) methods. The component
system will then forward any component-specific messages it receives to all registered instances
of its component class.
The most important of the component-specific messages is the update(deltaTime:) method
Call this method from your game’s update/render loop—that is, from a method such as
update(_:) (SpriteKit) or renderer(_:updateAtTime:) (SceneKit), or from a CADisplay
Link (iOS) or CVDisplayLink (macOS) timer in a custom rendering engine. The component
system then forwards to the update(deltaTime:) method of all the GKComponent subclass
instances it manages, allowing those objects to perform per-frame update logic.
For more information on Entity-Component architecture, read Entities and Components in
GameplayKit Programming Guide.
Overview
GameplayKit / GKComponentSystem
Class
GKComponentSystem
Manages periodic update messages for all component objects of a specified clas
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

init(componentClass: AnyClass)
Initializes a component system to manage components of the specified class.
var componentClass: AnyClass
The class of components managed by the component system.
var components: [ComponentType]
The component system’s list of components.
func addComponent(ComponentType)
Adds a component instance to the component system.
func addComponent(foundIn: GKEntity)
Adds any instances of the component system’s component class in the specified entity to th
component system.
func removeComponent(ComponentType)
Removes the specified component instance from the component system.
func removeComponent(foundIn: GKEntity)
Removes any instances of the component system’s component class in the specified entity
from the component system.
func update(deltaTime: TimeInterval)
Tells all component instances managed by the system to perform their custom periodic
actions.
subscript(Int) -> ComponentType
Returns the component at the specified index in the system’s list of components.
Topics
Creating a Component System
Managing a List of Components
Performing Periodic Updates
Accessing Components With Subscript Syntax


## Page 3

func classForGenericArgument(at: Int) -> AnyClass
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSFastEnumeration
NSObjectProtocol
class GKEntity
An object relevant to gameplay, with functionality entirely provided by a collection of
component objects.
class GKComponent
The abstract superclass for creating objects that add specific gameplay functionality to an
entity.
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Entities and Components


