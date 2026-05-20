# 001_GKObstacleGraph.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


