# Enumerations.pdf

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


## Page 3

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


## Page 4

case boundingBox(units: MLBoundingBoxUnits, origin: MLBoundingBox
CoordinatesOrigin, anchor: MLBoundingBoxAnchor)
An annotation type that defines a rectangle around an object within an image.
enum MLBoundingBoxUnits
The units a bounding box annotation uses to define its position and size.
enum MLBoundingBoxAnchor
A location within a bounding box that an annotation’s coordinates use as their reference poin
See Also
Bounding box annotations


## Page 5

All bounding box annotations in an annotation file must use the same units for their coordinates a
size. See MLObjectDetector.AnnotationType.boundingBox(units:origin:
anchor:).
case pixel
A unit of measurement in pixels for an image.
case normalized
A unit of measurement as a portion of an image’s overall width or height.
Overview
Topics
Designating units
Relationships
Create ML / MLBoundingBoxUnits
Enumeration
MLBoundingBoxUnits
The units a bounding box annotation uses to define its position and size.
macOS 10.15+


## Page 6

Copyable
Equatable
Hashable
Sendable
SendableMetatype
case boundingBox(units: MLBoundingBoxUnits, origin: MLBoundingBox
CoordinatesOrigin, anchor: MLBoundingBoxAnchor)
An annotation type that defines a rectangle around an object within an image.
enum MLBoundingBoxAnchor
A location within a bounding box that an annotation’s coordinates use as their reference poin
enum MLBoundingBoxCoordinatesOrigin
The location within an image that an annotation’s coordinates use as their origin.
Conforms To
See Also
Bounding box annotations


