# 003_GKOctreeNode.pdf

## Page 1

You don’t create instances of this class directly; instead, a GKOctree object provides you with a
GKOctreeNode instance when you add an element to a tree. If you plan to remove elements from
the tree, keep references to the corresponding nodes so you can use the remove(_:using:)
method for better performance.
var box: GKBox
The axis-aligned bounding box represented by the node.
NSObject
Overview
Topics
Examining a Node
Relationships
Inherits From
GameplayKit / GKOctreeNode
Class
GKOctreeNode
A helper class for managing the objects you organize in an octree.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKQuadtree
A data structure for organizing objects based on their locations in a two-dimensional space.
class GKQuadtreeNode
A helper class for managing the objects you organize in a quadtree.
class GKOctree
A data structure for organizing objects based on their locations in a three-dimensional space
class GKRTree
A data structure that adaptively organizes objects based on their locations in a two-
dimensional space.
Conforms To
See Also
Spatial Partitioning


