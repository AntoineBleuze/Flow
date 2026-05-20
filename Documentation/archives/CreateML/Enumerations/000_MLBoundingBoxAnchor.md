# 000_MLBoundingBoxAnchor.pdf

## Page 1

case center
An anchor at the bounding box’s center point.
case topLeft
An anchor at the bounding box’s top-left corner.
case bottomLeft
An anchor at the bounding box’s bottom-left corner.
Copyable
Equatable
Hashable
Topics
Designating anchors
Relationships
Conforms To
Create ML / MLBoundingBoxAnchor
Enumeration
MLBoundingBoxAnchor
A location within a bounding box that an annotation’s coordinates use as their
reference point.
macOS 10.15+


## Page 2

Sendable
SendableMetatype
case boundingBox(units: MLBoundingBoxUnits, origin: MLBoundingBox
CoordinatesOrigin, anchor: MLBoundingBoxAnchor)
An annotation type that defines a rectangle around an object within an image.
enum MLBoundingBoxUnits
The units a bounding box annotation uses to define its position and size.
enum MLBoundingBoxCoordinatesOrigin
The location within an image that an annotation’s coordinates use as their origin.
See Also
Bounding box annotations


