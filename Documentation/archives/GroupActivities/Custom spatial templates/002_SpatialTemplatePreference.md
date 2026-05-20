# 002_SpatialTemplatePreference.pdf

## Page 1

Use the static members of this structure to specify your preferred arrangement of participants
around your app’s content. The system applies your preference only when displaying spatial
Personas in the scene.
static let none: SpatialTemplatePreference
An arrangement where the system places spatial Personas based on your app’s content.
static let sideBySide: SpatialTemplatePreference
An arrangement where the participants sit in a line with the content in front of them.
static let conversational: SpatialTemplatePreference
An arrangement where the participants can see one another and the app’s content.
static func custom(any SpatialTemplate) -> SpatialTemplatePreference
Creates a template preference with the given custom spatial template.
Overview
Topics
Getting the spatial position preferences
Group Activities / SpatialTemplatePreference
Structure
SpatialTemplatePreference
A structure that specifies the preferred arrangement of participant spatial
Personas in a shared simulation space.
visionOS 1.0+


## Page 2

func contentExtent(CGFloat) -> SpatialTemplatePreference
Sets the distance between the app’s content and any participants.
static let surround: SpatialTemplatePreference
An arrangement where the participants sit around the content.
CustomStringConvertible, Sendable, SendableMetatype
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
protocol SpatialTemplate
An interface you use to create custom arrangements of spatial Personas in a scene.
struct SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
Specifying the distance between content and participants
Type Properties
Relationships
Conforms To
See Also
Custom spatial templates


## Page 3

struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


