# 001_MLBoundingBoxCoordinatesOrigin.pdf

## Page 1

case topLeft
An origin at the image’s top-left corner.
case bottomLeft
An origin at the image’s bottom-left corner.
Copyable
Equatable
Hashable
Sendable
SendableMetatype
Topics
Designating origins
Relationships
Conforms To
Create ML / MLBoundingBoxCoordinatesOrigin
Enumeration
MLBoundingBoxCoordinatesOrigin
The location within an image that an annotation’s coordinates use as their origin.
macOS 10.15+


## Page 2

case boundingBox(units: MLBoundingBoxUnits, origin: MLBoundingBox
CoordinatesOrigin, anchor: MLBoundingBoxAnchor)
An annotation type that defines a rectangle around an object within an image.
enum MLBoundingBoxUnits
The units a bounding box annotation uses to define its position and size.
enum MLBoundingBoxAnchor
A location within a bounding box that an annotation’s coordinates use as their reference poin
See Also
Bounding box annotations


