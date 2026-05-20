# 001_Finding multiple players for a game.pdf

## Page 1

GameKit enables the user of your game, called the local player, to discover and connect with othe
players in real-time multiplayer games.
For design guidance, see Human Interface Guidelines > Technologies > Game Center > Multiplaye
You can present a Game Center interface that allows the local player to invite nearby or recent
players, friends, contacts, Game Center or Message groups, and anyone with a phone number or
email address.
The default interface allows the player to use automatic matches to fill any empty slots. The local
player can see the status of players accepting or declining their invitations, as they invite addition
players or remove players. Once the number of players that you specify accept their invitations, th
local player can start gameplay. Optionally, your game can continue processing responses to
invitations, and GameKit can continue automatching to fill empty slots until the maximum number
of players that you specify join the game.
Overview
Choose whether to use the Game Center interface
GameKit / Finding multiple players for a game
Article
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.


## Page 2

Alternatively, you can present your own custom interface to invite players, invite specific players, 
let Game Center automatch players without presenting an interface.
In your code, you create a match request and optionally present the matchmaker view controller.
Then you implement methods to present the appropriate interface to all players during the proces
of receiving and accepting invitations.
First, create a GKMatchRequest object and set the parameters of the game. You can set the
number of players, apply groups and attributes to filter the matches, specify the game mode, and
set other criteria.
Use the maxPlayersAllowedForMatch(of:) method to get the maximum number of players
for your match type (GKMatchType.peerToPeer, GKMatchType.hosted, or GKMatchType
.turnBased).
If you use game-specific matchmaking rules to find players, set the queueName and optionally, th
properties properties of the GKMatchRequest object. Also, set the minPlayers and max
Players properties within the bounds of the rule set’s minPlayers and maxPlayers fields. Fo
more information, see Finding players using matchmaking rules.
Create a match request
Enable the local player to choose other players


## Page 3

The local player can choose opponents from the Game Center interface when you present a
GKMatchmakerViewController object and handle the resulting invitation events.
Pass the GKMatchRequest object to the GKMatchmakerViewController initializer and set t
view controller’s delegate to your game object before you present it. Use the present(_:
animated:completion:) or equivalent method to present the matchmaker view controller, in
which the local player can choose players or automatch to fill empty slots.
Optionally, configure the view controller before you present it:
To show only nearby players for games where players need to be in the same room, as in
augmented reality (ARKit) games, set the matchmakingMode property to GKMatchmaking
Mode.nearbyOnly.
To use automatch only to connect with other players, set the mode to GKMatchmakingMode
.automatchOnly, or to invite players without using automatch, set the mode to
GKMatchmakingMode.inviteOnly.
To allow the local player to start gameplay with a minimum number of players, while Game
Center continues to fill empty slots in the background, set the canStartWithMinimum
Players property to true. Then design your game to progressively add players as they acce
their invitations.
Players automatically have the ability to chat with other players using FaceTime. The view controll
shows a SharePlay button, in addition to the Invite Players and Quick Match buttons. To implemen
a custom group activities experience, see startGroupActivity(playerHandler:). For
macOS apps, add the Group Activities capability to your Xcode project to show the SharePlay
button.


## Page 4

Then adopt the GKLocalPlayerListener and GKMatchmakerViewControllerDelegate
protocols to implement methods that keep track of the invitations GameKit sends and the
invitations players accept. To receive the GKInviteEventListener callbacks that the GKLoca
PlayerListener protocol includes, register your game object with the local player object:
Game Center sends invitations to the players asynchronously. When a player accepts an invitation
from another player, GameKit notifies Game Center and invokes the GKInviteEventListener
player(_:didAccept:) method.
Implement the player(_:didAccept:) method to present the matchmaker view controller in
the invitation state so the recipient of the invitation can see the progress as other players accept
Accept an invitation from another player


## Page 5

their invitations. Create the matchmaker view controller by passing the invite to the initializer, and
then present it.
The matchmaker view controller shows the players who received or accepted invitations. When a
the players accept their invitations, GameKit invokes the GKMatchmakerViewController
Delegate matchmakerViewController(_:didFind:) method in the app instances for all
players in the game, including the player who sent the invitations.
Implement the matchmakerViewController(_:didFind:) method to dismiss the view
controller and start your game. If the player count is low or players accept invitations quickly, you
can add a delay before you dismiss the view controller, so players see the outgoing invitations
before you start the game.
Start the game when players accept invitations


## Page 6

Then use the GKMatch object that GameKit passes to this delegate method to get the player list
and send data from one player to another during the game.
When the local player closes the matchmaker interface without choosing players, or some other
error occurs while choosing players, implement the matchmakerViewControllerWas
Cancelled(_:) delegate method to dismiss the view controller.
Also, implement the matchmakerViewController(_:didFailWithError:) method to
handle any errors that might occur. For possible errors, see GKError.
GameKit can automatch the local player without presenting the Game Center matchmaking
interface where players invite others. To start automatch, pass the match request to the shared
GKMatchmaker object using the findMatch(for:withCompletionHandler:) method.
If another game instance starts automatch at the same time, the findMatch(for:with
CompletionHandler:) method creates a match with that player and returns the correspondin
Handle matchmaking cancellations and errors
Let Game Center match the player with others


## Page 7

GKMatch object. To receive a callback when players join the match, set the match’s delegate to a
object that implements the match(_:player:didChange:) delegate method.
Implement the match(_:player:didChange:) method to check whether the state paramet
is GKPlayerConnectionState.connected before starting the game and accessing the
player’s properties, such as the display name and avatar.
After enough players join the match, or if the player cancels automatch, call the shared
GKMatchmaker finishMatchmaking(for:) method to stop GameKit from looking for player
Alternatively, to invite specific players without presenting an interface, set the match request’s
recipients property before invoking the findMatch(for:withCompletionHandler:)
method.
Creating real-time games
Develop games where multiple players interact in real time.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
See Also
Real-time games


## Page 8

Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
matches.
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find the best
matches.
class GKMatchRequest
An object that encapsulates the parameters to create a real-time or turn-based match.
class GKMatchmaker
An object that creates matches with other players without presenting an interface to the
players.
class GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and automatch to
fill any empty slots.
protocol GKInviteEventListener
A protocol that handles invite events from Game Center.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


