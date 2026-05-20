# 004_GKRTree.pdf

## Page 1

An R-tree manages its structure to optimize for spatial searches—unlike a basic data structure su
as an array or dictionary, an R-tree can find all elements occupying a specific position or region
very quickly. Additionally, R-trees adapt their internal structure as you add and remove elements,
increasing the amount of time required to perform those operations, but decreasing the time
required to search for elements later.
An R-tree partitions the space it describes by calculating the minimum bounding regions that
enclose each of the added objects. For example, in Figure 1, the numbered shapes are objects
added to the tree, and the rectangles marked with letters are the data structure the tree creates t
organize them.
Overview
GameplayKit / GKRTree
Class
GKRTree
A data structure that adaptively organizes objects based on their locations in a
two-dimensional space.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 2

In this example, the rectangle C is the smallest rectangle that entirely contains objects 1 and 2; th
rectangle D is the smallest that contains objects 3, 4, and 5; the rectangle A is the smallest
containing all the objects in rectangles C and D; and so on. The R-tree automatically creates thes
divisions in a way that keeps the tree balanced—that is, so that no branch of the tree contains
significantly more objects or sub-branches than any other branch—so that searches for objects in
the tree require a uniformly minimal amount of processing.
R-trees can be useful for many tasks in game design. For example:
Deciding which game characters are close enough to each other for interaction
Deciding which portions of a large game world need to be processed at a given time
Finding out which other objects are entirely contained within the region occupied by a certain
object
The GKRTree class is one of three spatial partitioning data structures that GameplayKit provides.
See these other classes for other tasks:
The GKOctree class provides the three-dimensional equivalent of a quadtree. Use an octree
when you need to organize objects in 3D space.
The GKQuadTree class provides a different algorithm for two-dimensional spatial indexing.
Quadtrees and R-trees have different performance tradeoffs for different tasks: quadtrees can
be faster when objects are more uniformly distributed in space or when their positions change
frequently, and R-trees can be faster when searching for all objects in a given region.
init(maxNumberOfChildren: Int)
Initializes a new R-tree object.
func addElement(ElementType, boundingRectMin: vector_float2, bounding
RectMax: vector_float2, splitStrategy: GKRTreeSplitStrategy)
Adds the specified object to the tree.
func removeElement(ElementType, boundingRectMin: vector_float2, boundin
RectMax: vector_float2)
Removes the specified object from the tree.
Topics
Creating an R-Tree
Adding and Removing Elements


## Page 3

func elements(inBoundingRectMin: vector_float2, rectMax: vector_float2)
-> [ElementType]
Searches the tree and returns all elements found within the specified bounding region.
var queryReserve: Int
The number of elements to reserve space for when searching.
enum GKRTreeSplitStrategy
Options that control how a tree balances its internal structure when adding elements, used
with the addElement(_:boundingRectMin:boundingRectMax:splitStrategy:)
method.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Searching for Elements
Constants
Relationships
Inherits From
Conforms To
See Also
Spatial Partitioning


## Page 4

class GKQuadtree
A data structure for organizing objects based on their locations in a two-dimensional space.
class GKQuadtreeNode
A helper class for managing the objects you organize in a quadtree.
class GKOctree
A data structure for organizing objects based on their locations in a three-dimensional space
class GKOctreeNode
A helper class for managing the objects you organize in an octree.


