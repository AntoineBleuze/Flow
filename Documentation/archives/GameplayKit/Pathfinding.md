# Pathfinding.pdf

## Page 1

Individual nodes in a graph represent discrete locations that a character or other object in your
game can occupy, and the connections between adjacent nodes represent the ability of a game
entity to travel from one location to another. Use the GKGraph class to create a general graph, or
the GKGridGraph, GKObstacleGraph, or GKMeshGraph subclass to generate specialized
graphs that contain more information about the geometry of your game world.
Each set of graph and node classes can generate graphs for different kinds of spaces:
The base classes GKGraph and GKGraphNode contain functionality general to all graphs and
nodes. You can also use these classes on their own to construct graphs that contain no
geometry information. This option is useful for games where the connections between spaces
are more important than their physical locations, such as board games.
Use the GKGridGraph and GKGridGraphNode classes to describe game worlds that constra
movement to an integer grid, such as tactical role-playing games.
Use the GKObstacleGraph or GKMeshGraph class to describe 2D game worlds that allow
continuous movement in open spaces that are interrupted by impassable obstacles (GKPolyg
Obstacle objects). Obstacle graphs automatically generate nodes containing 2D point
information (GKGraphNode2D objects), and you can also add your own such nodes
representing locations of interest.
The graphs modeled by this class are always directed—that is, a connection between two nodes
describes one direction of travel between them. To enable travel between two nodes in either
Overview
GameplayKit / GKGraph
Class
GKGraph
A collection of nodes that describes the navigability of a game world and provide
pathfinding methods to search for routes through that space.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

direction, you must create a connection in each direction. You can choose to connect both
directions at once with the connectToLowestCostNode(node:bidirectional:) method
(for graphs) or the addConnection:bidirectional: method (for nodes).
Using a graph for pathfinding typically involves three major steps:
1. Create a graph once (for example, when initializing a game level class) with static information
about your game world.
2. When you need to find a route between points, connect temporary nodes to the graph at those
points. Use the connectToLowestCostNode(node:bidirectional:) method to connec
nodes using their own geometry information, or the connectUsingObstacles(node:) or
connectToAdjacentNodes(node:) method to use the additional constraints of obstacle
and grid graphs.
3. Call the findPath(from:to:) method to find a route between locations in the graph. This
method returns an array of graph nodes, starting with the requested start point of the path, and
proceeding to adjacent nodes in order until it reaches the requested end point. Use the
geometry information contained in each node to make use of the route—for example, in a
SpriteKit game you might create a sequence of move actions to move a character from point to
point along the path.
4. The temporary nodes you created for finding a path typically have little usefulness after a path
has been found. Remove those nodes before reusing the graph for future searches.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init([GKGraphNode])
Initializes a graph with the specified list of nodes.
func add([GKGraphNode])
Adds the specified nodes to the graph.
func connectToLowestCostNode(node: GKGraphNode, bidirectional: Bool)
Adds a node to the graph, connecting it to the node already in the graph for which the
connection has the lowest cost.
func remove([GKGraphNode])
Topics
Creating a Graph
Working with Nodes in a Graph


## Page 3

Removes the specified nodes from the graph.
var nodes: [GKGraphNode]?
The list of nodes in the graph.
func findPath(from: GKGraphNode, to: GKGraphNode) -> [GKGraphNode]
Computes and returns a sequence of nodes that represents the shortest traversal of the
graph between the specified nodes.
NSObject
GKGridGraph, GKMeshGraph, GKObstacleGraph
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Pathfinding with a Graph
Relationships
Inherits From
Inherited By
Conforms To
See Also
Pathfinding


## Page 4

class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 5

You create an obstacle graph with a collection of GKObstacle objects. To use the graph for
pathfinding, you add GKGraphNode2D objects representing points of interest (such as the curren
position of a game character and the location it needs to find a route to). Then use methods of th
superclass GKGraph to find routes through the graph.
Unlike the related GKMeshGraph class, an obstacle graph creates a minimal network of graph
nodes, resulting in paths that are efficient but not smooth.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(obstacles: [GKPolygonObstacle], bufferRadius: Float, nodeClass: An
Class)
Initializes a graph with the specified list of obstacles, using the specified node class.
init(obstacles: [GKPolygonObstacle], bufferRadius: Float)
Initializes a graph with the specified list of obstacles.
Overview
Topics
Creating a Graph
GameplayKit / GKObstacleGraph
Class
GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise
pathfinding around obstacles.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 6

var obstacles: [GKPolygonObstacle]
The list of obstacle objects in the graph, each of which describes a polygon-shaped
impassable area.
func addObstacles([GKPolygonObstacle])
Adds new obstacles to the graph.
func removeObstacles([GKPolygonObstacle])
Removes the specified obstacle from the graph.
func removeAllObstacles()
Removes all obstacles from the graph.
func nodes(for: GKPolygonObstacle) -> [NodeType]
Returns the group of nodes corresponding to an obstacle in the graph.
func connectUsingObstacles(node: NodeType)
Adds the specified node to the graph, connecting it to its nearest neighbors without creating
connections that pass through obstacles or their buffer regions.
func connectUsingObstacles(node: NodeType, ignoring: [GKPolygonObstacle
])
Adds the specified node to the graph, connecting it to its nearest neighbors while ignoring th
area occupied by the specified obstacles.
func connectUsingObstacles(node: NodeType, ignoringBufferRadiusOf: [
GKPolygonObstacle])
Adds the specified node to the graph, connecting it to its nearest neighbors while ignoring th
buffer regions around the specified obstacles.
var bufferRadius: Float
The distance from obstacle edges that should also be considered impassable.
func lockConnection(from: NodeType, to: NodeType)
Prevents the specified nodes from being disconnected due to the addition of obstacles.
Working with Obstacles
Working with Nodes
Locking Node Connections


## Page 7

func unlockConnection(from: NodeType, to: NodeType)
Allows the specified nodes to be disconnected due to the addition of obstacles.
func isConnectionLocked(from: NodeType, to: NodeType) -> Bool
Returns a Boolean value indicating whether the specified nodes are protected from
disconnection due to the addition of obstacles.
func classForGenericArgument(at: Int) -> AnyClass
GKGraph
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Pathfinding


## Page 8

class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 9

To use a mesh graph for pathfinding, add a collection of GKObstacle objects representing
impassable areas and GKGraphNode2D objects representing points of interest (such as the
current position of a game character and the location it needs to find a route to). Then use
methods of the superclass GKGraph to find routes through the graph.
Unlike the related GKObstacleGraph class, a mesh graph creates a space-filling network of
graph nodes, resulting in paths that are smooth but not the most efficient.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(bufferRadius: Float, minCoordinate: vector_float2, maxCoordinate:
vector_float2, nodeClass: AnyClass)
Initializes a graph to cover the specified area, using the specified node class.
init(bufferRadius: Float, minCoordinate: vector_float2, maxCoordinate:
vector_float2)
Overview
Topics
Creating a Graph
GameplayKit / GKMeshGraph
Class
GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for
smooth pathfinding around obstacles.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 10

Initializes a graph to cover the specified area.
var obstacles: [GKPolygonObstacle]
The list of obstacle objects in the graph, each of which describes a polygon-shaped
impassable area.
func addObstacles([GKPolygonObstacle])
Adds new obstacles to the graph.
func removeObstacles([GKPolygonObstacle])
Removes the specified obstacle from the graph.
func connectUsingObstacles(node: NodeType)
Adds the specified node to the graph, connecting it to its nearest neighbors without creating
connections that pass through obstacles or their buffer regions.
var bufferRadius: Float
The distance from obstacle edges that should also be considered impassable.
func triangulate()
Creates or updates the graph with a network of nodes that describes the open space around
its obstacles.
var triangulationMode: GKMeshGraphTriangulationMode
A set of options for how to place graph nodes when triangulating the graph.
func triangle(at: Int) -> GKTriangle
The triangle definition at the specified index.
var triangleCount: Int
The number of triangles in the mesh.
struct GKMeshGraphTriangulationMode
Working with Obstacles
Working with Nodes
Managing the Mesh
Constants


## Page 11

Options for how to place graph nodes when generating the graph, used by the
triangulationMode property.
struct GKTriangle
The definition of a triangle in the mesh, available with the triangle(at:) method.
func classForGenericArgument(at: Int) -> AnyClass
GKGraph
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Pathfinding


## Page 12

A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 13

Use this class to generate a graph containing GKGridGraphNode objects representing a specifie
grid. Then use methods of the superclass GKGraph to find routes through the graph.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(fromGridStartingAt: vector_int2, width: Int32, height: Int32,
diagonalsAllowed: Bool, nodeClass: AnyClass)
Initializes a graph that describes an integer grid with the specified dimensions, using the
specified node class.
init(fromGridStartingAt: vector_int2, width: Int32, height: Int32,
diagonalsAllowed: Bool)
Initializes a graph that describes an integer grid with the specified dimensions.
Overview
Topics
Creating a Graph
GameplayKit / GKGridGraph
Class
GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an
integer grid.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 14

func node(atGridPosition: vector_int2) -> NodeType?
Returns the node in the graph at the specified grid coordinates.
func connectToAdjacentNodes(node: GKGridGraphNode)
Adds the specified node to the graph, connecting it to its nearest neighbors in the grid.
var diagonalsAllowed: Bool
A Boolean value that indicates whether nodes in the grid are connected to their diagonal
neighbors.
var gridOrigin: vector_int2
The lowest x- and y-coordinates that appear in the grid.
var gridWidth: Int
The number of possible x-coordinates in the grid.
var gridHeight: Int
The number of possible y-coordinates in the grid.
func classForGenericArgument(at: Int) -> AnyClass
GKGraph
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Working with Nodes
Inspecting a Graph
Instance Methods
Relationships
Inherits From
Conforms To


## Page 15

Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.
See Also
Pathfinding


## Page 16

A set of connected nodes form a graph that describes the navigability of a game world. Use grap
nodes together with a GKGraph object (or one of its subclasses) to perform actions that relate to
the network of nodes as a whole, such as pathfinding to determine routes through the network.
This class describes the general features of graph nodes, but does not contain geometry
information that relates the graph to a game world. You can construct a graph with this class or an
of its subclasses:
On its own, the GKGraphNode class is useful for worlds such as board games, where the
connections between nodes are important but their spatial position has no effect on gameplay.
Create GKGridGraphNode objects (for use with the GKGridGraph class) to model worlds
where movement is constrained to a two-dimensional integer grid.
Create GKGraphNode2D objects to model worlds that allow full freedom of movement in a two
dimensional plane. Use these nodes together with the GKObstacleGraph or GKMeshGraph
class to create graphs that route around impassable obstacles.
Create GKGraphNode3D objects to model worlds that allow full freedom of movement in three
dimensional space.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
Overview
GameplayKit / GKGraphNode
Class
GKGraphNode
A single node in a navigation graph for use in pathfinding.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 17

var connectedNodes: [GKGraphNode]
The list of other nodes connected to this node.
func addConnections(to: [GKGraphNode], bidirectional: Bool)
Connects this node to all nodes in the specified list.
func removeConnections(to: [GKGraphNode], bidirectional: Bool)
Removes the connections from this node to the specified nodes.
func cost(to: GKGraphNode) -> Float
Returns the cost to travel from this node to the specified, directly connected, node.
func estimatedCost(to: GKGraphNode) -> Float
Returns an underestimate of the cost of travel from this node to the specified node.
func findPath(to: GKGraphNode) -> [GKGraphNode]
Computes and returns a sequence of nodes that represents the lowest-cost graph traversal
from this node to the specified node.
func findPath(from: GKGraphNode) -> [GKGraphNode]
Computes and returns a sequence of nodes that represents the lowest-cost graph traversal
from the specified node to this node.
NSObject
Topics
Working with Connections
Computing Traversal Costs
Finding Paths
Relationships
Inherits From


## Page 18

GKGraphNode2D, GKGraphNode3D, GKGridGraphNode
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
Inherited By
Conforms To
See Also
Pathfinding


## Page 19

class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 20

Together, a network of nodes form a graph that describes the navigability of a game world. Use
graph nodes with a GKGraph, GKObstacleGraph, or GKMeshGraph object to perform actions
that relate to the network of nodes as a whole, such as pathfinding to determine routes through th
network.
When you use the GKObstacleGraph or GKMeshGraph class to describe a game world in terms
of open spaces interrupted by obstacles, GameplayKit automatically creates and manages
GKGraphNode2D instances that represent positions along possible paths that navigate around
those obstacles.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(point: vector_float2)
Initializes a graph node with the specified point.
class func node(withPoint: vector_float2) -> Self
Creates a graph node with the specified point.
Overview
Topics
Creating a Graph Node
GameplayKit / GKGraphNode2D
Class
GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 21

var position: vector_float2
The position of the node in continuous 2D space.
GKGraphNode
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
Inspecting a Node’s Position
Relationships
Inherits From
Conforms To
See Also
Pathfinding


## Page 22

A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 23

Together, a network of nodes form a graph that describes the navigability of a game world. Use
graph nodes with a GKGraph object to perform actions that relate to the network of nodes as a
whole, such as pathfinding to determine routes through the network.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(point: vector_float3)
Initializes a graph node with the specified point.
class func node(withPoint: vector_float3) -> Self
Creates a graph node with the specified point.
var position: vector_float3
Overview
Topics
Creating a Graph Node
Inspecting a Node’s Position
GameplayKit / GKGraphNode3D
Class
GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 24

The position of the node in continuous 2D space.
GKGraphNode
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
Relationships
Inherits From
Conforms To
See Also
Pathfinding


## Page 25

class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-dimensional grid.


## Page 26

Together, a network of nodes form a graph that describes the navigability of a game world. Use
graph nodes with a GKGridGraph object (and methods of its superclass GKGraph) to perform
actions that relate to the network of nodes as a whole, such as pathfinding to determine routes
through the network.
To learn more about graphs and pathfinding, see Pathfinding in GameplayKit Programming Guide
init(gridPosition: vector_int2)
Initializes a graph node with the specified position on a grid.
var gridPosition: vector_int2
Overview
Topics
Creating a Graph Node
Inspecting a Node’s Position
GameplayKit / GKGridGraphNode
Class
GKGridGraphNode
A node in a navigation graph, associated with a position on a discrete two-
dimensional grid.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 27

The position of the node on a discrete integer grid.
GKGraphNode
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class GKGraph
A collection of nodes that describes the navigability of a game world and provides pathfindin
methods to search for routes through that space.
class GKObstacleGraph
A navigation graph for 2D game worlds that creates a minimal network for precise pathfindin
around obstacles.
class GKMeshGraph
A navigation graph for 2D game worlds that creates a space-filling network for smooth
pathfinding around obstacles.
class GKGridGraph
A navigation graph for 2D game worlds where movement is constrained to an integer grid.
Relationships
Inherits From
Conforms To
See Also
Pathfinding


## Page 28

class GKGraphNode
A single node in a navigation graph for use in pathfinding.
class GKGraphNode2D
A node in a navigation graph, associated with a point in continuous 2D space.
class GKGraphNode3D
A node in a navigation graph, associated with a point in continuous 3D space.


