# 004_SpatialTemplateElement.pdf

## Page 1

A type that adopts the SpatialTemplateElement protocol defines the location and orientatio
of a participant in a group activity. You don’t adopt this protocol directly in your custom types.
Instead, you use types that adopt this protocol to retrieve the corresponding details.
static func seat(position: SpatialTemplateElementPosition, direction:
SpatialTemplateElementDirection, role: (any SpatialTemplateRole)?) ->
Self
Creates a seat element with the specified position, direction, and role information.
var position: SpatialTemplateElementPosition
The location of the element in the shared coordinate space.
Required
Overview
Topics
Creating a seat position
Getting the element details
Group Activities / SpatialTemplateElement
Protocol
SpatialTemplateElement
An interface that defines an element in your spatial template.
visionOS 2.0+


## Page 2

var direction: SpatialTemplateElementDirection
The initial orientation of the element in the shared coordinate space.
Required
var role: (any SpatialTemplateRole)?
An optional role you associate with this element.
Required
Equatable
Hashable
Sendable
SendableMetatype
SpatialTemplateSeatElement
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
protocol SpatialTemplate
An interface you use to create custom arrangements of spatial Personas in a scene.
struct SpatialTemplatePreference
A structure that specifies the preferred arrangement of participant spatial Personas in a
shared simulation space.
struct SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
Relationships
Inherits From
Conforming Types
See Also
Custom spatial templates


## Page 3

struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


