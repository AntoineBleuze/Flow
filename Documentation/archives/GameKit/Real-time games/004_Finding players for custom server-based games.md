# 004_Finding players for custom server-based games.pdf

## Page 1

Hosted matches allow your game to use the Game Center matchmaking service to find players
while using your own server to exchange game data. This approach gives you more control over t
networking architecture. You can quickly find players for your game with hosted matches by using
the Game Center service and optionally use matchmaking rules to filter and prioritize match
requests to find the most compatible players.
When you implement hosted matches, Game Center handles the matchmaking process but return
player identifiers instead of a complete match object. Your game then connects each player to yo
server, which becomes responsible for routing network data between players.
Creating a hosted match requires your game to implement all of the low-level networking needed
for your game. In particular, design and implement:
Networking code to connect each device to your server
A networking protocol to inform other devices of the state of any participant in the match
A service to map player identifiers to the specific device connected to your server
If your game uses the standard matchmaking user interface in GameKit, each device needs to
inform GameKit after it connects to your server. This information allows GameKit to update its use
interface.
Overview
Use the Game Center interface or programmatic
matchmaking
GameKit / Finding players for custom server-based games
Article
Finding players for custom server-based
games
Connect players to your custom server-hosted games by creating game sessions
with hosted matches.


## Page 2

You can present a Game Center interface for the local player to discover and invite other players t
participate. Alternatively, you can present your own custom interface to connect players or match
players without presenting an interface.
In your code, you create a match request and optionally present the matchmaker view controller.
Then you implement methods to handle the process of receiving and accepting invitations. The
code you write for hosted matchmaking is similar to the code you write for real-time matches.
Note
Features in real-time matchmaking compose key parts of game creation with hosted matches.
For more information, see Start a real-time match.
The critical difference between the two models is that hosted matchmaking returns player
identifiers instead of a completed match object. Your game then connects that player to your own
server. Your server must match that player’s network address to the player identifier and, similar t
a match, perform routing when one device in the match needs to communicate with others.
The following table lists the most common methods for real-time matchmaking and the
corresponding methods or implementation details for hosted matchmaking.
Real-time matchmaking
Hosted matchmaking
Your view controller delegate
implements the matchmaker
ViewController(_:did
Find:) method to receive the
match.
Your delegate implements the matchmakerView
Controller(_:hostedPlayerDidAccept:) method to
receive a notification that a player has accepted an invitation
to join the match.
Your programmatic
matchmaking code calls find
Match(for:with
CompletionHandler:) to
create a new match.
Your programmatic code calls findPlayers(forHosted
Request:withCompletionHandler:) to find a set of
new players for a match. Alternatively, call findMatched
Players(_:withCompletionHandler:) to find players
using matchmaking rules.
Your programmatic code calls
addPlayers(to:match
Request:completion
Handler:) to add players to a
match.
Your programmatic code calls findPlayers(forHosted
Request:withCompletionHandler:) or findMatched
Players(_:withCompletionHandler:) to find a set of
new players for a match. Because you implement your own
matching architecture, you decide when to make this call and
whether you’re adding players to an existing hosted match.
Your game receives an
invitation.
The GKInvite object’s isHosted property tells you
whether the match is a hosted match. This matters only if


## Page 3

Real-time matchmaking
Hosted matchmaking
your game implements both hosted and nonhosted matches.
Your players can send invites to fill empty player slots and start a game by using the default
matchmaking interface. To create a hosted match using GKMatchmakerViewController:
1. Create and configure a new GKMatchRequest.
2. Initialize a new GKMatchmakerViewController instance using the match request.
3. Set the GKMatchmakerViewController instance’s isHosted property to true.
4. Make your presenting view controller the matchmaking view controller’s delegate.
5. Present the matchmaking interface.
The player interacts with the matchmaking screen until the match is ready to start or an error
occurs. Handle matchmaking changes and errors from GKMatchmakerViewController by
setting the matchmakerDelegate with an object that notifies you when players accept their
invitations. As a hosted view controller, your matchmakerDelegate implements matchmaker
ViewController(_:hostedPlayerDidAccept:) to process new players, and matchmaker
ViewController(_:didFailWithError:) to handle errors. Your delegate needs to behave
differently depending on which device your game is running on:
When called on the new player’s device, the device needs to connect to your own server. When
successfully connected, call the setHostedPlayer(_:didConnect:) method to tell the
view controller that the player has connected to the match.
When called on another player’s device, the players’s game needs to determine that it can talk 
the new player’s device through your server connection. When the game knows it can send
messages to the new player, call the setHostedPlayer(_:didConnect:) method to upda
the user interface.
The following code example implements matchmakerDelegate methods to connect new playe
to a server and inform Game Center of the connections:
Create a hosted match with the Game Center interface


## Page 4

When all of the players accept their invitations to a match, GameKit invokes matchmakerView
Controller(_:didFindHostedPlayers:) in the app instances for all players in the game,
including the local player who initiates the invitations. Start the game by dismissing the view
controller and connecting the players through your own server.
After all invitees have accepted your app’s match request, you send the information about the
players to your server. Then, send a start-game message to all of the invitees. When invitees
receive the start-game message, they must manually close the view controller for their app.
Dismiss the matchmaker view controller


## Page 5

Without the default Game Center interface, your app can start hosted matches by
programmatically inviting players. The following example starts a match by calling find
Players(forHostedRequest:withCompletionHandler:) and connecting players in the
completion handler:
Start a hosted match programmatically


## Page 6

You can find players for a hosted match with matchmaking rules by initiating a request with find
MatchedPlayers(_:withCompletionHandler:). Set the rules-related properties in the
GKMatchRequest (queueName and optionally, properties) before you call this method. In thi
example, the app connects players using a match request configured with matchmaking rules:
Start a hosted match with matchmaking rules


## Page 7

For more information on creating rules-based matches, see Create match requests that use the
matchmaking rules.
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find the best
matches.
class GKMatchRequest
An object that encapsulates the parameters to create a real-time or turn-based match.
See Also
Real-time games


## Page 8

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


