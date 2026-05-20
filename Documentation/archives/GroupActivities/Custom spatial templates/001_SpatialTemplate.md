# 001_SpatialTemplate.pdf

## Page 1

Configure your visionOS app for sharing with people nearby
Use the SpatialTemplate protocol to specify an arrangement of participants for one of your
app’s group activities in visionOS. A custom template can have any number of seats, with each se
occupying a precise location in the shared coordinate space. You can also assign roles to seats an
use those roles to give participants a particular responsibility. For example, a game might divide
participants into opposing teams using roles.
To specify the seat positions, implement the elements property and return an array with all of th
possible seats you support. Specify the location of each seat relative to the app’s content, which 
at the origin of the shared coordinate space. You specify locations as the number of meters from
the origin along the x- and z-axes. For example, the following code specifies two seats one meter
from the app window in different directions along the z-axis:
Mentioned in
Overview
Group Activities / SpatialTemplate
Protocol
SpatialTemplate
An interface you use to create custom arrangements of spatial Personas in a
scene.
visionOS 2.0+


## Page 2

If a seat doesn’t have an assigned role, any participant can occupy it. If you add a role to a seat, th
participant must specifically acquire that role to occupy the seat. For example, a game might assi
a team-specific role to players when they join that team. Choose the roles that make sense for yo
activity and implement them using the SpatialTemplateRole protocol.
The system orients each participant’s spatial Persona to face your app’s content by default. To
change the direction someone faces, include that information when you specify the seat. For
example, the following template has a presenter role and up to four audience members. The
inclusion of direction parameters causes the presenter to look at the audience and the audience t
look at the presenter by default.
Topics


## Page 3

var configuration: SpatialTemplateConfiguration
Information a spatial template uses to configure itself.
Required Default implementation provided.
struct SpatialTemplateConfiguration
A type that contains the configuration details for a spatial template.
var elements: [any SpatialTemplateElement]
The collection of spatial Persona seats this template contains.
Required
Sendable, SendableMetatype
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
struct SpatialTemplatePreference
A structure that specifies the preferred arrangement of participant spatial Personas in a
shared simulation space.
struct SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
Configuring the spatial template
Placing the template seats
Relationships
Inherits From
See Also
Custom spatial templates


## Page 4

protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


