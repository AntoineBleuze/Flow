# Custom spatial templates.pdf

## Page 1

This sample shows how to build a guessing game for two competing teams. Participants, using an
Apple Vision Pro during a FaceTime call, can play as members of the red or blue team or watch
from the audience. At each stage of the game, the sample positions participants according to the
role as a team member or spectator.
After the initial welcome screen for the game, the participants select categories and divide into tw
teams. During the team-selection process, all participants start in the audience section. If a
participant chooses to join a team, they move to the appropriate team area. During the game itsel
the teams take turns guessing a word or phrase in a window that only one team member can see.
The team member that sees the word or phrase can use any gestures or phrases to elicit a correc
guess, but can’t say the word or phrase itself. If the team correctly guesses the word or phrase, th
team scores a point. The team with the most points at the end of the game wins.
Note
This sample code project is associated with WWDC24 session 10201: Customize spatial
Persona templates in SharePlay.
Overview
Group Activities / Building a guessing game for visionOS
Sample Code
Building a guessing game for visionOS
Create a team-based guessing game for visionOS using Group Activities.
Download
visionOS 2.0+
Xcode 16.0+


## Page 2

Note
SharePlay requires the com.apple.developer.group-session entitlement. For
instructions on configuring this entitlement, see “Configure the SharePlay entitlements”
section of doc:defining-your-apps-shareplay-activities#Configure-the-SharePlay-
entitlements.
The GroupActivity protocol provides the system with the context and metadata to start an
activity-related session. The sample defines a single GroupActivity to represent the game:
For more information, see Defining your app’s SharePlay activities.
The welcome screen displays a custom SharePlayButton; tapping it starts the game. If the
player is already in a FaceTime call, the GuessTogetherActivity activates. Otherwise, a Grou
ActivitySharingController displays a sheet inviting the player to start the FaceTime call.
When a recipient accepts the FaceTime call, the system prompts them to join the GuessTogethe
Activity:
Define the group activity
Encourage people to start a game


## Page 3



## Page 4

For more information, see Presenting SharePlay activities from your app’s UI.
The system creates a GroupSession when a player activates an activity. Players can activate an
activity in several ways, at any time. This sample uses an asynchronous task in MainView to
monitor the creation of new GroupSession instances for GuessTogetherActivity. This tas
calls the observeGroupSessions method, which receives new sessions and creates a Sessio
Controller to manage gameplay. A separate task detects when the session ends and cleans up
the SessionController.
Join and manage the activity


## Page 5

For more information, see Joining and managing a shared activity.
When a player’s action changes the game state, SessionController uses GroupSession
Messenger to send an update to the other players. For example, when player X joins the red team
TeamSelectionView calls SessionController.joinTeam. This sets SessionControlle
.localPlayer.team, sending a call to SessionController.shareLocalPlayerState.
Synchronize game state by sending and receiving
messages


## Page 6

SessionController.shareLocalPlayerState uses GroupSessionMessenger to send
player X’s new state to other players.
At the same time, SessionController.observeRemotePlayerModelUpdates receives an
processes player state updates. Each update modifies SessionController.players to reflec
the synchronized player state. For example, when player X joins the red team, other players are
notified and update their local representation of player X’s state accordingly.
For more information, see Synchronizing data during a SharePlay activity.


## Page 7

To display spatial Personas when an immersive space is open, set the supportsGroup
ImmersiveSpace property on SystemCoordinator.Configuration to true:
In an immersive space, the system provides a shared coordinate system for participants and
content. This allows you to position entities consistently across all participants’ perspectives. For
example, an entity positioned 0.5 meters in front of player X appears 0.5 meters in front of player 
from player Y’s perspective.
For more information, see Adding spatial Persona support to an activity.
The game has three distinct stages:
Category-selection stage, where players choose the words and phrases they want to try to elic
from their teammates.
Team-selection stage, where players join one of the teams.
Game stage, where the teams take turns playing the game.
Each time the current stage changes, the SessionController object updates the position of
the participants in the space. When selecting a category, the participants appear side by side in
front of the game window. During team selection and gameplay, the game arranges players using
custom spatial templates. The game specifies each arrangement of participants by changing the
configuration of the SystemCoordinator object.
Enable spatial personas in an immersive space
Specify custom positions for participants


## Page 8

When the game moves to the team-selection stage, the session rearranges the participants
according to which team they choose. All participants start in the audience initially facing the app
window, which displays buttons to join either the red team or blue team.
The TeamSelectionTemplate specifies the positions of seats during the team-selection
process. Participants don’t have an assigned role initially, so the system places them in the
audience seats. As participants join a team, the system moves them to the assigned seating area
for their chosen team.
The spatial template specifies all seat positions up front, including seats for the blue and red
teams, and the audience. Seat positions reflect the distance in meters from the app’s main windo
along the x and z axes. Seat roles reflect the role that a participant must have to occupy that seat
When a participant asks to join a team, the sample app assigns them the corresponding role. If a
seat with that role is available, the participant receives the role and their spatial Persona moves to
the next available seat.


## Page 9

During gameplay, teams take turns playing the game while the audience watches. Audience
members face the main window while the active team sits on either side of that window. The team
member giving clues sits on one side of the window, while their teammates sit opposite. The
template orients the active team members so that they face each other at the start of the game,
with audience members facing the main window.
The GameTemplate structure defines separate roles for the current player and the active team
members. Members of the opposing team don’t receive a role until it’s their turn to play, so they
initially sit in the audience positions. Because the active team members face each other, and not
the app window, their seat positions include a direction parameter to specify where they look
initially.


## Page 10

For more information about building custom spatial templates, see SpatialTemplate.
protocol SpatialTemplate
See Also
Custom spatial templates


## Page 11

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
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


## Page 16

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


## Page 17

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


## Page 18

struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


## Page 25

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


## Page 26

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


## Page 27

The initial direction a participant faces when an activity starts.
protocol SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group activity.


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

An interface for defining roles that you assign to the participants of a group activity.


## Page 32

Adopt the SpatialTemplateRole interface in a custom enum and use it with your custom
spatial template. Roles are an optional way for you to assign a purpose to participants with a spat
Persona. For example, a spatial template for a game might define roles for the opposing teams.
When a participant joins an activity, assign one of your custom roles to place them in a specific se
of your template. Seats in the template are available only to participants with spatial Personas.
The following example shows a spatial template for a table tennis game with two teams. The first
four seats are for the players of the team, and the last seat is for a spectator. When participants
request a role for the red or blue team, the template assigns them to the first available seat in the
array with that role.
Overview
Group Activities / SpatialTemplateRole
Protocol
SpatialTemplateRole
An interface for defining roles that you assign to the participants of a group
activity.
visionOS 2.0+


## Page 33

var roleIdentifier: String
The unique identifier string for the role.
Required Default implementation provided.
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
Topics
Getting the role identifier
Relationships
Inherits From
See Also
Custom spatial templates


## Page 34

struct SpatialTemplateSeatElement
A spatial template element that represents a seat for a participant in the activity.
protocol SpatialTemplateElement
An interface that defines an element in your spatial template.
struct SpatialTemplateElementPosition
A type that defines the position of an element in a spatial template.
struct SpatialTemplateElementDirection
The initial direction a participant faces when an activity starts.


