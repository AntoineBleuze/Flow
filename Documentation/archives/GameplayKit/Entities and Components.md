# Entities and Components.pdf

## Page 1

A GKEntity object represents an entity in games with Entity-Component architecture. In this
design, an entity is a general type for objects relevant to the game. Entities typically define no
functionality of their own—instead, you define an entity’s features through composition, by adding
components that each handle specific aspects of an entity’s behavior in a general way. Because
components (GKComponent subclasses) are general and reusable, you can add many kinds of
entities to a game by combining components in different ways, without needing to design new
entity classes.
For more information on Entity-Component architecture, read Entities and Components in
GameplayKit Programming Guide.
init()
Initializes a new entity object.
Overview
Topics
Creating an Entity
GameplayKit / GKEntity
Class
GKEntity
An object relevant to gameplay, with functionality entirely provided by a collection
of component objects.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

var components: [GKComponent]
The entity’s list of components.
func addComponent(GKComponent)
Adds a component to the entity.
func update(deltaTime: TimeInterval)
Performs periodic updates for each of the entity’s components.
func component<ComponentType>(ofType: ComponentType.Type) -> Component
Type?
func removeComponent<ComponentType>(ofType: ComponentType.Type)
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
Managing an Entity’s List of Components
Performing Periodic Updates
Instance Methods
Relationships
Inherits From
Conforms To


## Page 3

class GKComponent
The abstract superclass for creating objects that add specific gameplay functionality to an
entity.
class GKComponentSystem
Manages periodic update messages for all component objects of a specified class.
See Also
Entities and Components


## Page 4

GKComponent is the abstract superclass for custom component classes you create when buildin
a game with Entity-Component architecture. In this architecture, an entity is an object relevant to
the game, and a component is an object that handles specific aspects of an entity’s behavior in a
general way. Because a component’s scope of functionality is limited, you can reuse the same
component class for many different kinds of entities.
You create components by subclassing GKComponent to implement reusable behavior. Then, you
build game entities by creating GKEntity objects and using the addComponent(_:) method to
attach instances of your custom component classes.
At runtime, a component-based game needs to dispatch periodic logic—from an update/render
loop method such as update(_:) (SpriteKit) or renderer(_:updateAtTime:) (SceneKit), o
a CADisplayLink (iOS) or CVDisplayLink (macOS) timer in a custom rendering engine—to
each of its components. GameplayKit provides two mechanisms for dispatching updates:
Per-entity. Call each entity’s update(deltaTime:) method, which will then forward to the
update(deltaTime:) method of each component. This option can be quickly implemented 
games with a small number of entities and components.
Per-component. Use a GKComponentSystem object to handle all instances of a specific
component class. When you call a component system’s update(deltaTime:) method, it
forwards to the update(deltaTime:) method of all the component objects it manages.
Because a component system needs no knowledge of your game’s entity/component hierarchy
this option works well for games with complex object graphs.
Overview
GameplayKit / GKComponent
Class
GKComponent
The abstract superclass for creating objects that add specific gameplay
functionality to an entity.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 5

For more information on Entity-Component architecture, read Entities and Components in
GameplayKit Programming Guide.
func update(deltaTime: TimeInterval)
Performs any custom periodic actions defined by the component subclass.
var entity: GKEntity?
The entity that owns this component.
func didAddToEntity()
Notifies the component that it has been assigned to an entity.
func willRemoveFromEntity()
Notifies the component that it has been removed from an entity.
NSObject
GKAgent, GKSCNNodeComponent, GKSKNodeComponent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Topics
Performing Periodic Updates
Working with Entities
Relationships
Inherits From
Inherited By
Conforms To


## Page 6

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKEntity
An object relevant to gameplay, with functionality entirely provided by a collection of
component objects.
class GKComponentSystem
Manages periodic update messages for all component objects of a specified class.
See Also
Entities and Components


## Page 7

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


## Page 8

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


## Page 9

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


