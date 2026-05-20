# 000_Building a guessing game for visionOS.pdf

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


