# Xcode and SpriteKit Integration.pdf

## Page 1

When you create a scene in the Xcode SpriteKit scene editor, Xcode automatically creates a
GKScene object to manage any GameplayKit objects you add to the scene (entities, components
or pathfinding graphs) and archive them alongside the SpriteKit scene content.
To use a SpriteKit scene that contains GameplayKit objects, load the scene file with the GKScene
init(fileNamed:) method. You can then use the entities and graphs properties to acces
the GKEntity (and associated GKComponent) objects and GKGraph objects in the scene, and
the rootNode property to access the scene’s SpriteKit content.
Note
Any SpriteKit node in the scene to which you’ve attached an entity or components
automatically has a GKSKNodeComponent object to manage the relationship between the
node and the the GKEntity object it represents.
For more information on Entity-Component architecture and pathfinding graphs, see Entities and
Components and Pathfinding in GameplayKit Programming Guide.
Overview
Topics
GameplayKit / GKScene
Class
GKScene
A container for associating GameplayKit objects with a SpriteKit scene.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 2

convenience init?(fileNamed: String)
Loads the specified SpriteKit scene file, creating a GKScene object containing the SpriteKit
scene and associated GameplayKit objects.
var rootNode: (any GKSceneRootNodeType)?
The SpriteKit scene managed by this GKScene object.
var entities: [GKEntity]
The list of GameplayKit entities managed by the scene.
func addEntity(GKEntity)
Adds a GameplayKit entity to the list of entities managed by the scene.
func removeEntity(GKEntity)
Removes a GameplayKit entity from the list of entities managed by the scene.
var graphs: [String : GKGraph]
The list of pathfinding graph objects managed by the scene.
func removeGraph(String)
Removes a pathfinding graph from the list of graphs managed by the scene.
convenience init?(fileNamed: String, rootNode: any GKSceneRootNodeType)
func addGraph(GKGraph, name: String)
Loading a Scene File
Accessing the SpriteKit Scene
Managing Entities and Components
Managing Pathfinding Graphs
Initializers
Instance Methods


## Page 3

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
protocol GKSceneRootNodeType
Identifies scene classes from other frameworks that support embedded GameplayKit
information.
class GKSKNodeComponent
A component that manages a SpriteKit node.
Relationships
Inherits From
Conforms To
See Also
Xcode and SpriteKit Integration


## Page 4

You do not define classes that adopt this protocol. GameplayKit adds this protocol declaration to
classes (such as SKScene) for which the GKScene class supports archiving and loading
embedded GameplayKit information.
For more information, see GameplayKit Programming Guide.
NSObjectProtocol
Overview
Relationships
Inherits From
See Also
Xcode and SpriteKit Integration
GameplayKit / GKSceneRootNodeType
Protocol
GKSceneRootNodeType
Identifies scene classes from other frameworks that support embedded
GameplayKit information.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 5

class GKScene
A container for associating GameplayKit objects with a SpriteKit scene.
class GKSKNodeComponent
A component that manages a SpriteKit node.


## Page 6

Adding a GKSKNodeComponent object to an entity automatically updates the entity property o
the component’s SpriteKit node (an SKNode object) to point to that entity.
When you add entities and components to a node in the Xcode SpriteKit scene editor, Xcode
automatically creates a GKSKNodeComponent object to manage the relationship between that
SpriteKit node and the GKEntity object that node represents. Load the scene file with the
GKScene class to access these entities and components.
Tip
The GKSKNodeComponent class adopts the GKAgentDelegate protocol. If you use the
GKAgent2D class to drive the movement of game entities, set your GKSKNodeComponent
instance as the delegate for the entity’s agent, and GameplayKit will automatically synchronize
the agent and its SpriteKit representation.
For more information on Entity-Component architecture, read Entities and Components in
GameplayKit Programming Guide.
Overview
Topics
GameplayKit / GKSKNodeComponent
Class
GKSKNodeComponent
A component that manages a SpriteKit node.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 7

init(node: SKNode)
Initializes a component to manage the specified SpriteKit node.
var node: SKNode
The SpriteKit node managed by the component.
GKComponent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKAgentDelegate
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKScene
A container for associating GameplayKit objects with a SpriteKit scene.
Creating a SpriteKit Component
Accessing the Component’s SpriteKit Node
Relationships
Inherits From
Conforms To
See Also
Xcode and SpriteKit Integration


## Page 8

protocol GKSceneRootNodeType
Identifies scene classes from other frameworks that support embedded GameplayKit
information.


