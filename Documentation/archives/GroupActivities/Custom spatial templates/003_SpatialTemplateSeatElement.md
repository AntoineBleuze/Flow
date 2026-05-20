# 003_SpatialTemplateSeatElement.pdf

## Page 1

Add SpatialTemplateSeatElement types to a custom SpatialTemplate to specify the
placement and orientation of participants in a group activity. When an activity starts, the system
places participants into the shared coordinate space and orients them according to the seat
information you provide. If you associate roles with one or more seats, participants must acquire
the associated role before they can occupy the corresponding seat.
Create seat elements directly from this type and add them to the elements property of your
custom template. Alternatively, use the inherited seat(position:direction:role:) functio
to create seats, as shown in the following example, which creates two seats on either side of the
app’s content along the z-axis:
Overview
Topics
Group Activities / SpatialTemplateSeatElement
Structure
SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
visionOS 2.0+


## Page 2

let position: SpatialTemplateElementPosition
The location of the element in the shared coordinate space.
let direction: SpatialTemplateElementDirection
The initial orientation of the element in the shared coordinate space.
let role: (any SpatialTemplateRole)?
An optional role you associate with this element.
static func == (SpatialTemplateSeatElement, SpatialTemplateSeatElement)
-> Bool
Returns a Boolean value that indicates whether two values are equal.
init(position: SpatialTemplateElementPosition, direction: Spatial
TemplateElementDirection, role: (any SpatialTemplateRole)?)
Creates a seat element with the specified position, direction, and role information.
func hash(into: inout Hasher)
Hashes the essential components of this value by feeding them into the given hasher.
Equatable
Hashable
Sendable
SendableMetatype
Getting the element details
Operators
Initializers
Instance Methods
Relationships
Conforms To


## Page 3

SpatialTemplateElement
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
protocol SpatialTemplate
An interface you use to create custom arrangements of spatial Personas in a scene.
struct SpatialTemplatePreference
A structure that specifies the preferred arrangement of participant spatial Personas in a
shared simulation space.
protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.
See Also
Custom spatial templates


