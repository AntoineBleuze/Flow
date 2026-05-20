# 000_GKEntity.pdf

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


