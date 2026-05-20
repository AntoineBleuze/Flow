# 005_SpatialTemplateElementPosition.pdf

## Page 1

Use the SpatialTemplateElementPosition type to specify the position of an element along
the x- and z-axes in the shared coordinate space. You place elements relative to the app’s conten
which sits at the origin of the coordinate space. Specify distances in meters. The following examp
positions two participants one meter away from the app’s content, and on opposite sides of it:
static var app: SpatialTemplateElementPosition
The position of the app’s content in the shared coordinate space.
Overview
Topics
Getting the app’s position
Group Activities / SpatialTemplateElementPosition
Structure
SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
visionOS 2.0+


## Page 2

func offsetBy(x: Double, z: Double) -> SpatialTemplateElementPosition
Returns a new position at the specified distance from the origin of the shared coordinate
space.
Equatable
Hashable
Sendable
SendableMetatype
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
protocol SpatialTemplate
An interface you use to create custom arrangements of spatial Personas in a scene.
struct SpatialTemplatePreference
A structure that specifies the preferred arrangement of participant spatial Personas in a
shared simulation space.
struct SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementDirection
Modifying a position
Relationships
Conforms To
See Also
Custom spatial templates


## Page 3

The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


