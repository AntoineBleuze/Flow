# 002_MLBoundingBoxUnits.pdf

## Page 1

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


## Page 2

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


