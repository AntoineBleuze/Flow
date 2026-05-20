# 006_SpatialTemplateElementDirection.pdf

## Page 1

A SpatialTemplateElementDirection type indicates where a participant faces at the start 
an activity. You might configure participants to face your app’s content, another participant, or an
arbitrary point in the shared coordinate system. You can also modify an existing direction value by
adding an arbitrary amount of additional rotation. When a participant joins an activity, the system
sets the initial orientation of their spatial Persona to the direction assigned to their seat position. I
you don’t specify an initial direction for a seat, the participant faces your app’s content.
The following example creates a spatial template for a table tennis game with four participants an
a spectator. The template places the red and blue teams at opposite ends of the table along the z
axis, and each person faces the app’s content along that axis. The final participant sits to the side
of the table to watch the game.
Overview
Group Activities / SpatialTemplateElementDirection
Structure
SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
visionOS 2.0+


## Page 2

static func lookingAt(any SpatialTemplateElement) -> SpatialTemplate
ElementDirection
Creates a direction that orients the participant to face another template element.
static func lookingAt(SpatialTemplateElementPosition) -> SpatialTemplat
ElementDirection
Creates a direction that orients the participant to face the specified point in the shared
coordinate space.
static func alignedWith(appAxis: SpatialTemplateElementAxis) -> Spatial
TemplateElementDirection
Creates a direction that orients the participant to look along the specified axis in the directio
of the app’s content.
struct SpatialTemplateElementAxis
An axis to use when aligning elements in a spatial template.
func rotatedBy(Angle2D) -> SpatialTemplateElementDirection
Returns a new direction structure that adds the specified rotation angle to the current
direction’s value.
static func + (SpatialTemplateElementDirection, Angle2D) -> Spatial
TemplateElementDirection
Topics
Looking at a specific location
Looking along an axis
Rotating the element
Operators


## Page 3

Adds the y-axis rotations for the specified values together and returns a new structure with
the result.
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
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
protocol SpatialTemplateRole
Relationships
Conforms To
See Also
Custom spatial templates


## Page 4

An interface for defining roles that you assign to the participants of a group activity.


