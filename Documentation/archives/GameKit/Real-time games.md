# Real-time games.pdf

## Page 1

This sample code project uses the GameKit framework to create a simple real-time game where
two players are immediately aware of the actions each other takes. The sample shows both the
matchmaker interface that enables players to invite others, and the automatch feature that lets
Game Center find players. It provides access to Game Center using the access point and
dashboard to show the players’ progress toward an achievement, as well as scores on the game
leaderboard. It uses the match object to send game data and text messages between players. It
also uses voice chat for additional communications.
To create your own real-time game, replace the SwiftUI files with your gameplay interface, and
modify the RealTimeGame class to support your game. To extend this sample to use
matchmaking rules, see Finding players using matchmaking rules.
To configure the sample code project, perform the following steps in Xcode:
1. Choose Xcode > Settings > Accounts, click the Add button (+), and add your Apple ID account
2. Select the project in the Project navigator, click the Signing & Capabilities pane, select the
target, and assign your team to it. Optionally, enter a unique identifier in the Bundle Identifier te
field. Otherwise, use the existing bundle ID that ends in your team ID.
3. If necessary, add the Game Center capability (see Enabling and configuring Game Center).
4. In App Store Connect, create an app record that matches the bundle ID (see Add a new app in
App Store Connect Help).
Overview
Configure the sample code project
GameKit / Creating real-time games
Sample Code
Creating real-time games
Develop games where multiple players interact in real time.
Download
iOS 17.4+
iPadOS 17.4+
Xcode 15.3+


## Page 2

5. Add a classic leaderboard with 123 as the leaderboard ID, Integer as the score format type, Be
Score as the score submission type, High to Low as the sort order, and 0 to 100 as the score
range. Add one localization with an integer format. See Configure leaderboards.
6. Add an achievement with 1234 as the achievement ID, 100 as the point value, and No for the
hidden option (see Configure achievements). Add one localization with an image.
7. Connect two iOS devices to your Mac.
8. If necessary, click Register Device in the Signing & Capabilities pane to create the provisioning
profile.
9. Build and run the sample on the two iOS devices.
10. If the Welcome to Game Center sheet appears, sign in using a different Apple ID on each devic
Before using any GameKit APIs, the game needs to initialize the local player by presenting an
interface for them to sign in to Game Center on their device. The RealTimeGame.authenticat
Player() method handles the initialization flow and, when complete, registers for real-time gam
events.
To start a real-time game, the player taps Choose Player on the content view. Then the RealTime
Game.choosePlayer() method creates a match request for a two-player game and presents a
GKMatchmakerViewController interface where the player can invite friends or automatch to 
empty slots.
Initialize the player and register for real-time events
Start a real-time match


## Page 3

After the player selects an opponent in the Game Center interface, GameKit sends the invitation
and changes the view controller interface to show the invitation status.
After the opponent accepts the invitation by tapping the notification that appears, GameKit
launches the game on their device and invokes the GKLocalPlayerListener.player(did
Accept:) protocol method. This method presents the matchmaker view controller that shows th
connection status.
When the status of the players changes from Connecting to Ready in the interface, GameKit
invokes the GKMatchmakerViewControllerDelegate.matchmakerViewController(_:
didFind:) method in both game instances, passing the local view controller and new GKMatch
object. The matchmakerViewController(_:didFind:) method first dismisses the view
controller and then starts the match by invoking the RealTimeGame.startMyMatch
With(match:) method.
The startMyMatchWith(match:) method sets the playingGame property to true, which
displays the game interface, and loads the opponent’s avatar.
To let Game Center find an opponent without presenting the matchmaker view controller, the play
taps the Automatch toggle. The RealTimeGame.findPlayer() method creates a match
request and passes it to the GKMatchmaker.findMatch(for:withCompletionHandler:)
method. When a player running another game instance taps the Automatch toggle, the
GKMatchmaker.findMatch(for:withCompletionHandler:) method returns a match
object.
Then the findPlayer() method invokes startMyMatchWith(match:), which sets the
match’s delegate so that when the opponent connects to the match, GameKit calls the GKMatch
Delegate.match(_:player:didChange:) delegate method. The game view displays a
placeholder for the opponent’s name until they connect. If the state is .connected when GameK
invokes the RealTimeGame.match(_:player:didChange:) method, it sets the opponent
property and loads the opponent’s avatar, which updates the game view.
Automatch the local player with others


## Page 4

To stop finding players, the player taps Automatch again and it invokes GKMatchmaker
.shared().cancel().
Each time the player takes an action, the game shares the results with the other player. When the
player taps Take Action, their score increases in both game instances. If the player taps End Game
or Forfeit, both game instances exit the match.
The RealTimeGame.takeAction() method increments the score, then encodes and sends th
game data to the opponent.
When the player taps the message bubble in the game view, the chat view sheet appears so the
player can send a text message to the opponent. The sendMessage(content:) method sends
the text message as game data.
Similarly, the endMatch() and forfeitMatch() methods encode and send game data, except
they send the game outcome.
In the recipient’s game instance, GameKit invokes the GKMatchDelegate.match(_:did
Receive:fromRemotePlayer:) method. The RealTimeGame implementation of match(_:
didReceive:fromRemotePlayer:) decodes the data object and updates the game state,
depending on its contents.
For example, this method exits the match if the opponent ends or forfeits the game. In both game
instances, an alert appears showing each player the outcome of the game. When the player taps
OK, the game returns to the content view.
When the player taps the telephone bubble in the game view, the RealTimeGame.startVoice
Chat() method starts a voice chat audio session with the opponent.
First it creates a GKVoiceChat object, providing a unique name for the channel, sets a connectio
change handler, and sets the volume.
Exchange game data between players
Start voice chat between players


## Page 5

Next it activates a shared audio session.
Then it starts and activates the voice chat.
After both players tap the telephone bubble, the state changes to GKVoiceChat.PlayerState
.connected and they can begin speaking.
The first time the sample starts voice chat, the system displays a dialog asking the player whethe
the sample may use the microphone. This dialog displays the value of the NSMicrophoneUsage
Description information property list key as the reason for requesting access permission.
When the player taps the telephone bubble again, the stopVoiceChat() method stops the voic
chat and deactivates the shared audio session.


## Page 6

You can enhance this sample to provide more feedback and controls, such as:
Show when players connect to the voice chat and start speaking in the connection change
handler.
Add a control to mute the voice chat using the muteVoiceChat() and unmuteVoiceChat(
methods.
Let players change the volume using the voiceChat(volume:) method.
Notify the player when the opponent wants to voice chat.
This sample uses Game Center features that let players request friends and let the game access
the player’s friends list.
When the player taps Add Friends in the Friends section of the content view, the RealTimeGame
.addFriends() method presents a view controller that allows the player to send a friend reque
to another player.
When the player taps Access Friends, the accessFriends() method checks the authorization
status before accessing the player’s friends.
If the status is GKFriendsAuthorizationStatus.notDetermined or GKFriends
AuthorizationStatus.authorized, the method loads the friends and displays their names 
Connect players with friends


## Page 7

a sheet.
The first time the sample loads the player’s friends, the system displays a dialog asking the playe
whether the sample may access their friends. This dialog displays the value of the NSGKFriend
ListUsageDescription information property list key as the reason for requesting access
permission.
An error occurs if the sample calls loadFriends() without permission or without providing a
reason using the NSGKFriendListUsageDescription key.
The startMyMatchWith(match:) method also reports progress toward an achievement. Each
time the player starts a match, they earn 10% toward this achievement until they reach 100%.
For details about configuring achievements for a game, see Rewarding players with achievements
The saveScore() method saves the local player’s score to the leaderboard when either the
player wins or the opponent forfeits.
Report progress toward an achievement
Submit scores to the leaderboard


## Page 8

For details about configuring leaderboards, see Creating recurring leaderboards.
The player can see their achievements and top scores using the access point that appears in the
upper-left corner, or by tapping the buttons below Game Center Data in the content view. For
example, when the player taps Top Scores, the RealTimeGame.topScore() method shows the
scores in the Game Center dashboard.
For more information about displaying Game Center information, see Adding an access point to
your game and Displaying the Game Center dashboard.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
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
Display achievements and leaderboards
See Also
Real-time games


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

In a multiplayer game, you can exchange game data between players to synchronize the state of
the game or to facilitate communication between players. You can begin exchanging data when tw
or more players join or after all the player slots fill when you start the game. For example, if your
game provides text messaging, players can send messages to each other while they wait for othe
players to join the game. GameKit handles the low-level communication of generic data; you desig
the structure of your game data, and implement the interface for presenting or entering that data
When enough players join a multiplayer game, you can begin exchanging data. For example,
present an interface for players to send text messages.
If you use the GKMatchmakerViewController class to find players, you can start the game an
begin exchanging data when GameKit calls the matchmakerViewController(_:didFind:)
delegate method.
To begin exchanging data before the game starts, implement the match(_:player:did
Change:) delegate method. Use the match expectedPlayerCount property in the method to
determine when you can begin exchanging data. If two or more players join the game, you can
begin exchanging data, or if the expected player count is 0, you can start the game and then
exchange data. GameKit also invokes this method when players disconnect or leave the game.
Overview
Start exchanging data
GameKit / Exchanging data between players in real-time games
Article
Exchanging data between players in real-
time games
Send data between players in a real-time multiplayer game.


## Page 19

To reinvite players whose match state becomes disconnected in a two-player match, implement t
match(_:shouldReinviteDisconnectedPlayer:) delegate method to return true.
GameKit exchanges generic data between players to give you flexibility in designing your game
data. You just need to convert your model objects to a Data object before you send it. Then, you
choose the type of transmission and size of the data depending on the characteristics of your
game. You can send data to a subset of players or all players in the game.
Use the send(_:to:dataMode:) or sendData(toAllPlayers:with:) method to send da
to one or more players. To guarantee that players receive the data in the order you send it, pass
GKMatch.SendDataMode.reliable as the data mode. If the data is small and a delay in
transmission invalidates its contents (such as position and velocity in a real-time game), pass
GKMatch.SendDataMode.unreliable as the data mode.
The following example shows how to convert a string to a Data object and send it as a message
from one player to another player.
Send data to players


## Page 20

For large data or many players, you can layer a network topology that performs better over the
peer-to-peer topology that GameKit provides. For example, reduce the network traffic by
implementing a client-server or ring topology. If you send data only to and from one player, you ca
reduce the network connections by half.
If you choose a client-server topology, use the chooseBestHostingPlayer(completion
Handler:) delegate method to find the player with the best network connection to act as the
server. Invoke this method simultaneously in each game instance running on each player’s device
Finally, you process the data that players receive from other players. For the recipients of the data
implement the match(_:didReceive:fromRemotePlayer:) delegate method to unpack the
data sent by other players. For example, if the data contains a text message from another player,
convert the Data object to a string. To display which player sent the data, use the player
parameter.
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
matches.
Matchmaking rules
Receive data from players
See Also
Real-time games


## Page 21

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


## Page 22

Important
The GKVoiceChat class is deprecated. Use SharePlay instead. See Enable the local player to
choose other players and startGroupActivity(playerHandler:).
Use the GKVoiceChat class to implement voice communication among players in a multiplayer
game. Enable the player to communicate with all players in a group chat or a subset of players
using separate audio channels. GameKit handles the low-level voice encoding and transmission fo
you; you add the controls to choose players, start and stop chats, mute players, and change the
volume.
To learn about audio channels, see the AVFAudio framework.
Note
A player can only participate in voice chat when their device has a microphone and it’s
connected to a Wi-Fi network. But, your game can configure and start voice chat when the
device isn’t currently capable of using voice chat. If conditions change to allow voice chat —
for example, the device connects to Wi-Fi — the voice chat object automatically connects to
the associated channel.
To configure voice chat, add the NSMicrophoneUsageDescription key to the Information
Property List in your project. Set it to a string that GameKit presents to the player when your gam
attempts to access the microphone. The string needs to state the reason your game needs acces
Overview
Configure voice chat
GameKit / Adding voice chat to multiplayer games
Article
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.


## Page 23

to the microphone. If the user doesn’t allow access, when you attempt to start voice chat, it fails
with an error.
Next, activate the system audio so that GameKit can use the default audio session for voice chat.
You can use one or more separate audio channels for voice chat. For example, use one channel fo
communicating with all the players and another channel for communicating between team
members.
Create a GKVoiceChat object that specifies a unique name for the channel. To communicate on
the same channel, players need to use the same channel name. A GameKit match can have multip
channels, and a player can join as many channels as they want. If the player joins multiple channe
GameKit mixes the audio it receives from each channel into one audio output.
To start voice chat on a channel, set the voice chat properties, such as the volume level, and invo
the start() method.
The first time your game accesses the microphone on the player’s device, the system presents a
dialog to the user that displays the reason your app wants permission to use the microphone. If yo
don’t provide a reason that the system presents to the player or the player doesn’t grant
permission, GameKit won’t start the channel. To provide a reason, add the NSMicrophoneUsage
Description key to the Information Property List.
Create separate voice channels
Start voice chat


## Page 24

If the player grants permission, the voice chat object connects to the channel and GameKit notifie
other players connected to the channel that the player joined the chat. When the player is
connected, GameKit automatically plays voice data from other players.
After you start voice chat on a channel, the player can hear the other players speak but you need 
activate the microphone so GameKit can begin transmitting the player’s voice to the channel.
For a single channel, you can enable the microphone immediately after you start the chat, so that
the player can begin speaking. Alternatively, you can provide a control for the player to activate th
microphone when speaking, like a push-to-talk style interface. Use the isActive property to
enable the microphone:
If the match has multiple channels, only one channel can use the microphone at a time. When you
activate a channel, GameKit deactivates the other channels in the match. So, you need to provide
control in the interface for the player to choose the channel before speaking.
You need to implement an interface that displays the status of players, shows when players
connect and speak, mutes other players, and changes the volume of individual channels.
First, update your interface when the state of a player changes. Set the playerVoiceChatStat
DidChangeHandler property to perform an action when a player connects, speaks, or
disconnects from the chat. For example, highlight the avatar for the player who is speaking.
Activate and switch the microphone between channels
Add controls and feedback to your interface


## Page 25

Then, you can add a control that allows the player to mute other players including themselves usin
the setPlayer(_:muted:) method. Finally, add another control for the player to adjust the
volume of individual channels using the volume property.
To stop transmitting data over the channel, use the stop() method, and deactivate the audio
session. If you mute all the players, GameKit still sends the data to the local player, so instead use
the stop() method.
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Stop voice chat
See Also
Real-time games


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

When all of the players accept their invitations to a match, GameKit invokes matchmakerView
Controller(_:didFindHostedPlayers:) in the app instances for all players in the game,
including the local player who initiates the invitations. Start the game by dismissing the view
controller and connecting the players through your own server.
After all invitees have accepted your app’s match request, you send the information about the
players to your server. Then, send a start-game message to all of the invitees. When invitees
receive the start-game message, they must manually close the view controller for their app.
Dismiss the matchmaker view controller


## Page 31

Without the default Game Center interface, your app can start hosted matches by
programmatically inviting players. The following example starts a match by calling find
Players(forHostedRequest:withCompletionHandler:) and connecting players in the
completion handler:
Start a hosted match programmatically


## Page 32

You can find players for a hosted match with matchmaking rules by initiating a request with find
MatchedPlayers(_:withCompletionHandler:). Set the rules-related properties in the
GKMatchRequest (queueName and optionally, properties) before you call this method. In thi
example, the app connects players using a match request configured with matchmaking rules:
Start a hosted match with matchmaking rules


## Page 33

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


## Page 34

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


## Page 35

With matchmaking rules, you have finer control over automatch of players to fill empty slots in
peer-to-peer and hosted match requests. During development, you use the matchmaking rules
APIs to upload your rules to the Game Center server. You group rules into rule sets and assign the
rule sets to queues. In your game code, you configure match requests to use your set of
matchmaking rules by specifying a queue. Game Center applies your rules to all the match
requests in the queue to fill the empty slots.
You group rules into sets for each configuration, feature, or purpose in your game and associate
the rule sets with a queue. Game instances submit match requests to specific queues, and Game
Center applies the corresponding rules to the match requests in that queue. The rules contain an
expression that behaves like a query to filter and prioritize the requests. Game Center finds the
most compatible players that meet your criteria, in a reasonable amount of time.
For more information on this feature, see Meet rule-based matchmaking in Game Center.
Overview
GameKit / Matchmaking rules
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find
the best matches.


## Page 36

When finding players using matchmaking rules, Game Center applies four different types of rules 
match requests in the queue, along with performing other steps in the algorithm. Game Center
applies the expression of the rule, which is a JMESPath formatted string with some Game Center
matchmaking function additions. Depending on the type of rule, Game Center evaluates the
expression on two or more match requests in the queue.
Game Center performs the following steps in sequence:
Sorts the match requests in a queue by age of the request to minimize player wait time and the
applies compatible rules to pairs of requests. Compatible rules compare two requests and retu
a Boolean value that indicates whether the requests are compatible. If all the compatible rules
return true, Game Center continues processing the pair. For example, requiring the app versio
to be 2.0 and above is a compatible rule.
Applies the distance rules to pairs of compatible requests. Distance rules compare two request
and return a numeric value between 0.0 and 1.0. Game Center uses the value to prioritize
similar requests, where 0.0 is the most similar and 1.0 is the least similar. For example,
requiring the geo latency between players to be low is a distance rule.
Prioritizes compatible matches by age and distance, and generates candidate matches that ha
the most number of players within the range that you specify in the rule set. Sorts candidate
matches by age and applies the match rules. Match rules apply to a set of matches and return 
Boolean value that indicates whether the requests are valid matches. For example, requiring a
range in skill level between 0 and 5 is a match rule.
Generates candidate teams from combinations of candidate matches and applies the team rule
If you add rules to assign players to teams. Team rules apply to a set of teams containing playe
The matchmaking rules algorithm


## Page 37

and return a Boolean value that indicates whether the teams satisfy a constraint. For example,
ensuring that the total skill difference between teams is less than 1 is a team rule.
For more information on matchmaking rules with examples, see Finding players using matchmakin
rules. For details on the matchmaking REST APIs, see Matchmaking rules in App Store Connect
API.
Finding players using matchmaking rules
Create a more customized and optimized gaming experience by using matchmaking rules to
find players in a real-time game.
Letting players join matches using party codes
Add a rule that lets players invite players and join matches using a shared party code.
Finding players with similar skill levels
Add a rule to find players in a range of skill levels to balance competitive gameplay.
Assigning players to teams using rules
Set criteria for assigning players to teams in your game using matchmaking rules.
Creating matchmaking rules for backward compatibility
Add matchmaking rules that support previous classic matchmaking versions of your game.
Testing matchmaking rules
Test your matchmaking rules before you use them in your game.
Troubleshooting matchmaking rules using metrics
Investigate issues with Game Center by evaluating your matchmaking rules using metrics
endpoints.
Testing rule sets with player traffic using metrics
Topics
Essentials
Rules
Testing


## Page 38

Get metrics on a new rule set with real match requests before releasing it.
Game Center
Manage Game Center data and configurations for your apps.
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
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
See Also
Related Documentation
Real-time games


## Page 39

class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


## Page 40

Finding multiple players for a game
Finding players using matchmaking rules
Finding players for custom server-based games
Starting turn-based matches and passing turns between players
Assigning players to teams using rules
To request a match, set the properties of the match request, such as the number of players, the
invitation message, and whether to use automatch to fill the player slots. You’re required to set th
minimum and maximum number of players allowed in the match. Then, pass the match request to
the appropriate class, depending on the type of game and whether you implement your own user
interface.
To use the matchmaking user interface that GameKit provides, pass the match request to the
GKMatchmakerViewController class for real-time games, or the GKTurnBasedMatchmake
ViewController class for turn-based games. GameKit sends messages to the delegates of
these classes when players receive and accept invitations to the match.
If you implement your own interface for finding players, pass the match request to the
GKMatchmaker class for real-time games, or the GKTurnBasedMatch class for turn-based
Mentioned in
Overview
GameKit / GKMatchRequest
Class
GKMatchRequest
An object that encapsulates the parameters to create a real-time or turn-based
match.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 41

games. If the player selects the other players to invite in your interface, set the recipients, the
inviteMessage, and the recipientResponseHandler properties before creating the match
You can refine the match results and reduce player wait times by configuring matchmaking before
you present an interface. You can either find players using matchmaking rules you set up on the
server, or find players from a subset of players you specify in the game.
To use matchmaking rules, set the queueName property to the queue name that you configure in
App Store Connect. Optionally, set properties and recipientProperties to game-specific
criteria. Players in the recipientProperties property need to also be in the recipients
property — that is, be a recipient of an invitation. When using matchmaking rules, Game Center
ignores the subset that you specify using the playerGroup and playerAttributes propertie
If you set the request’s minPlayers and maxPlayers properties, use values that are in the rule
set’s player range. Otherwise, the default values for these properties are the rule set’s min
Players and maxPlayers fields (see Create a rule set).
If you don’t use matchmaking rules, you can restrict finding players to a subset of players. Set the
queueName property to nil, and set the playerGroup and playerAttributes properties to
specify the subset. Then matchmaking ignores the rules-based properties and recipient
Properties properties.
For more information, see Finding players using matchmaking rules.
Important
Matchmaking rules are only available for peer-to-peer (GKMatchType.turnBased) and
hosted (GKMatchType.hosted) match requests.
class func maxPlayersAllowedForMatch(of: GKMatchType) -> Int
Returns the maximum number of players allowed in the match request for a given match typ
enum GKMatchType
The kind of match managed by Game Center.
var minPlayers: Int
Matchmaking using rules
Topics
Restricting the number of players


## Page 42

The minimum number of players that can join the match.
var maxPlayers: Int
The maximum number of players that can join the match.
var defaultNumberOfPlayers: Int
The default number of players for the match.
var inviteMessage: String?
The message sent to other players when the local player invites them to join a match.
var recipients: [GKPlayer]?
The players to invite to the match.
var recipientResponseHandler: ((GKPlayer, GKInviteRecipientResponse) ->
Void)?
A method that handles when a player responds to an invitation to join a match.
enum GKInviteRecipientResponse
A player’s response to an invitation to join a match.
var queueName: String?
The name of the queue that Game Center places the match request in.
var properties: [String : Any]?
The criteria for the local player that Game Center uses to find other players when using
matchmaking rules.
var recipientProperties: [GKPlayer : [String : Any]]?
The criteria for recipients of the match request that Game Center uses to find other players
when using matchmaking rules.
var playerGroup: Int
A number identifying a subset of players invited to join a match.
var playerAttributes: UInt32
Inviting players
Matching players using rules
Matching specific players


## Page 43

A mask that specifies the role that the local player would like to play in the game.
var inviteeResponseHandler: ((String, GKInviteeResponse) -> Void)?
Handles when a player responds to an invitation.
Deprecated
typealias GKInviteeResponse
Possible responses from an invitation to a remote player.
Deprecated
var playersToInvite: [String]?
A list of player identifiers for players to invite to the match.
Deprecated
var restrictToAutomatch: Bool
A Boolean value that determines whether a game uses automatch to find players or the loca
player invites players.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Deprecated methods and properties
Relationships
Inherits From
Conforms To


## Page 44

Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
matches.
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find the best
matches.
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
See Also
Real-time games


## Page 45

A peer-to-peer network between a group of players that sign into Game Center.


## Page 46

Creating activities for your game
Finding multiple players for a game
Finding players with similar skill levels
Use the GKMatchmaker class to auto-match players for a quicker game start, programmatically
invite specific players, or implement your own interface for players to invite other players. If you
want to present a familiar matchmaking GameKit interface to players, instead use either the
GKMatchmakerViewController or GKTurnBasedMatchmakerViewController class.
If you host a game on your own server, you can also use this class to find Game Center players.
That is, you implement the networking and communication between the players through your own
servers not Game Center.
To find players using this class, create a GKMatchRequest object and configure it according to
the parameters of your game. Then, pass the match request and a handler using the find
Match(for:withCompletionHandler:) method, or the findPlayers(forHostedMatch
Request:withCompletionHandler:) method for hosted games, to the shared
GKMatchmaker object.
Mentioned in
Overview
GameKit / GKMatchmaker
Class
GKMatchmaker
An object that creates matches with other players without presenting an interface
to the players.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 47

GameKit calls the handler when players accept their invitations. Implement the handler to set the
delegate of the GKMatch object that GameKit sends and start the game when there are enough
players.
If the match doesn’t have enough players (for example, some players decline their invitations), yo
can create another match request and call the addPlayers(to:matchRequest:completion
Handler:) method repeatedly until the match’s expectedPlayerCount property is zero. Whe
you have enough players to start the match, call the finishMatchmaking(for:) method to en
the matchmaking process.
If you provide a SharePlay interface for inviting players, use the startGroupActivity(player
Handler:) and stopGroupActivity() methods to create a group activity on behalf of the
player.
class func shared() -> GKMatchmaker
Returns the singleton matchmaker instance.
func match(for: GKInvite, completionHandler: ((GKMatch?, (any Error)?) 
> Void)?)
Creates a match from an invitation that the local player accepts.
func findMatch(for: GKMatchRequest, withCompletionHandler: ((GKMatch?,
(any Error)?) -> Void)?)
Initiates a request to find players for a peer-to-peer match.
func findPlayers(forHostedRequest: GKMatchRequest, withCompletionHandle
: (([GKPlayer]?, (any Error)?) -> Void)?)
Initiates a request to find players for a hosted match.
func findMatchedPlayers(GKMatchRequest, withCompletionHandler: (
GKMatchedPlayers?, (any Error)?) -> Void)
Initiates a request to find players for a hosted match that uses matchmaking rules.
Topics
Retrieving the shared matchmaker
Receiving invitations from other players
Matching players


## Page 48

class GKMatchedPlayers
An object that represents matchmaking results, including the players that join the match and
their properties that matchmaking rules uses.
func addPlayers(to: GKMatch, matchRequest: GKMatchRequest, completion
Handler: (((any Error)?) -> Void)?)
Invites additional players to an existing match.
func finishMatchmaking(for: GKMatch)
Informs the server when programmatic matchmaking finishes.
func cancel()
Cancels a matchmaking request.
func cancelPendingInvite(to: GKPlayer)
Cancels a pending invitation to another player.
func queryActivity(completionHandler: ((Int, (any Error)?) -> Void)?)
Finds the number of players, across player groups, who recently requested a match.
func queryPlayerGroupActivity(Int, withCompletionHandler: ((Int, (any
Error)?) -> Void)?)
Finds the number of players in a player group who recently requested a match.
func queryQueueActivity(String, withCompletionHandler: ((Int, (any Erro
)?) -> Void)?)
Finds the number of players in a specific queue who recently requested a match.
func startBrowsingForNearbyPlayers(handler: ((GKPlayer, Bool) -> Void)?
Finds nearby players through Bluetooth or WiFi on the same subnet.
func stopBrowsingForNearbyPlayers()
Stops finding nearby players.
func startGroupActivity(playerHandler: (GKPlayer) -> Void)
Finding players who request matches
Looking for nearby players
Starting matches using SharePlay


## Page 49

Begins a SharePlay activity for your game when a FaceTime call is active.
func stopGroupActivity()
Ends a SharePlay activity for the entire group, which the local player activates.
Deprecated Symbols
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Real-time games


## Page 50

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
class GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and automatch to
fill any empty slots.
protocol GKInviteEventListener
A protocol that handles invite events from Game Center.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


## Page 51

Finding multiple players for a game
Exchanging data between players in real-time games
Finding players for custom server-based games
Finding players using matchmaking rules
Finding players with similar skill levels
Before you create a GKMatchmakerViewController object, create a GKMatchRequest objec
and configure it according to the parameters of your game. Then pass the match request to the
init(matchRequest:) initializer to create the view controller.
Configure the view controller and set its delegate before you present it to the local player. The vie
controller allows the local player to choose other players and, optionally, fill empty slots using
automatch. If you add the Group Activities capability to your Xcode project, the player can invite
others using SharePlay. See Configuring Group Activities.
Implement the GKLocalPlayerListener and GKMatchmakerViewControllerDelegate
protocols to handle when players send and accept invitations. Implement the player(_:did
Accept:) delegate method to present a GKMatchmakerViewController object, which you
Mentioned in
Overview
GameKit / GKMatchmakerViewController
Class
GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and
automatch to fill any empty slots.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 52

create using the init(invite:) initializer, to the player who accepts an invitation. Then,
implement the matchmakerViewController(_:didFind:) delegate method to dismiss the
view controller and start the game when all players accept their invitations.
In iOS, you present and dismiss the view controller from another view controller in your game, usi
the methods from the UIViewController class. If you use SwiftUI, you can get the root view
controller from the UIApplication object.
For visionOS games, the view controller appears anchored to the window, scene, or view relative 
where you present the view controller. For immersive games, set the parent window to a separate
window group than the immersive space window group.
For macOS games, use the GKDialogController class to present and dismiss the view
controller.
For the complete matchmaking flow with code fragments, see Finding multiple players for a game
init?(matchRequest: GKMatchRequest)
Creates a matchmaker view controller for the local player to start inviting other players.
init?(invite: GKInvite)
Creates a matchmaker view controller to present to a player who accepts an invitation.
var matchRequest: GKMatchRequest
The configuration for the desired match.
var canStartWithMinimumPlayers: Bool
A Boolean value that indicates whether your game can start after a minimum number of
players join a match.
var matchmakingMode: GKMatchmakingMode
The mode that a multiplayer game uses to find players.
enum GKMatchmakingMode
Possible modes that a multiplayer game uses to find matches.
Topics
Creating and configuring the view controller


## Page 53

var matchmakerDelegate: (any GKMatchmakerViewControllerDelegate)?
The object that handles matchmaker view controller changes.
protocol GKMatchmakerViewControllerDelegate
An object that handles when the status of matchmaking changes.
func addPlayers(to: GKMatch)
Invites additional players to join an existing match.
var isHosted: Bool
A Boolean value that indicates whether the match is hosted or peer-to-peer.
func setHostedPlayer(GKPlayer, didConnect: Bool)
Updates the connection status of a player in a hosted game.
func setHostedPlayer(String, connected: Bool)
Updates a player’s status on the view to show that the player has connected or disconnecte
from your server.
Deprecated
func setHostedPlayerReady(String)
Informs the controller that a player has joined a hosted match.
Deprecated
var defaultInvitationMessage: String?
The default invitation message sent to a player.
Deprecated
Setting the delegate
Adding players to matches
Hosting matches
Deprecated
Relationships


## Page 54

NSViewController, UINavigationController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKViewController
Hashable
NSCoding
NSEditor
NSExtensionRequestHandling
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Creating real-time games
Inherits From
Conforms To
See Also
Real-time games


## Page 55

Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
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
protocol GKInviteEventListener
A protocol that handles invite events from Game Center.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


## Page 56

Finding multiple players for a game
Implement the methods in the GKInviteEventListener protocol to accept invitations from
other players or handle when other players accept invitations from the local player.
Adopt the GKLocalPlayerListener protocol to listen for and handle a variety of Game Center
events for player accounts instead of the individual GKChallengeListener, GKInviteEvent
Listener, GKSavedGameListener, and GKTurnBasedEventListener protocols.
For details, see Finding multiple players for a game.
func player(GKPlayer, didAccept: GKInvite)
Handles the event when the local player accepts an invitation from another player.
Mentioned in
Overview
Topics
Starting a New Match
GameKit / GKInviteEventListener
Protocol
GKInviteEventListener
A protocol that handles invite events from Game Center.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 57

func player(GKPlayer, didRequestMatchWithRecipients: [GKPlayer])
Handles the event when the local player sends other players an invitation to join a match.
func player(GKPlayer, didRequestMatchWithPlayers: [String])
Handles the event when the local player sends other players an invitation to join a match.
Deprecated
GKLocalPlayerListener
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Adding voice chat to multiplayer games
Enable players to voice chat with all, or groups of, players in a multiplayer game.
Finding players for custom server-based games
Connect players to your custom server-hosted games by creating game sessions with hoste
matches.
Matchmaking rules
Game Center applies different type of rules you create in a particular order to find the best
matches.
Relationships
Inherited By
See Also
Real-time games


## Page 58

class GKMatchRequest
An object that encapsulates the parameters to create a real-time or turn-based match.
class GKMatchmaker
An object that creates matches with other players without presenting an interface to the
players.
class GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and automatch to
fill any empty slots.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


## Page 59

Finding players for custom server-based games
Your game never directly creates GKInvite objects. Instead, these objects are created by
GameKit and delivered to your game’s matchmaking event handler. The properties of the invitatio
object describe the match to which another player invites the local player.
var sender: GKPlayer
The player who sends the invitation.
var playerAttributes: UInt32
The player attributes for the match.
var playerGroup: Int
Mentioned in
Overview
Topics
Getting Properties
GameKit / GKInvite
Class
GKInvite
An invitation to join a match sent to the local player from another player.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 60

The player group for the match.
var isHosted: Bool
A Boolean value that indicates whether you host the game on your own servers.
var inviter: String
The identifier for the player who sends the invitation.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
Relationships
Inherits From
Conforms To
See Also
Real-time games


## Page 61

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
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


## Page 62

Finding multiple players for a game
Assigning players to teams using rules
Creating activities for your game
Matches provide a mechanism for a player to send both game and voice data to other players.
You never create a GKMatch object directly. Instead, GameKit passes a match object to a
GKMatchmakerViewControllerDelegate method or a GKMatchmaker handler when you se
up a multiplayer game. For details, see Finding multiple players for a game.
If you use the GKMatchmakerViewController class to find players, implement the
matchmakerViewController(_:didFind:) delegate method to set the match delegate. If
you use the GKMatchmaker class, set the match delegate in the handler you pass to the find
Match(for:withCompletionHandler:) method.
You can begin exchanging data when two or more players join the match. Implement the match(_
player:didChange:) delegate method to track when players connect or disconnect from the
match. Then use either the sendData(toAllPlayers:with:) or the send(_:to:data
Mode:) method to send data. To process the data on the recipient side, implement the match(_
didReceive:fromRemotePlayer:) delegate method.
Mentioned in
Overview
GameKit / GKMatch
Class
GKMatch
A peer-to-peer network between a group of players that sign into Game Center.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 63

To implement voice chat, use the voiceChat(withName:) method to create one or more voice
channels represented by the returned GKVoiceChat object.
When you’re finished with a match, call the disconnect() method and set the match’s delegate
to nil. Otherwise, GameKit may send match(_:player:didChange:) to the delegate until a
players disconnect from the match.
var delegate: (any GKMatchDelegate)?
The delegate that handles communication between players in a match.
protocol GKMatchDelegate
An object that receives connection status and data transmitted in a multiplayer game.
var expectedPlayerCount: Int
The remaining number of players invited but not yet connected to the match.
var players: [GKPlayer]
The players that join the match.
func chooseBestHostingPlayer(completionHandler: (GKPlayer?) -> Void)
Determines the best player in the game to act as the server for a client-server topology.
func send(Data, to: [GKPlayer], dataMode: GKMatch.SendDataMode) throws
Transmits data to one or more players connected to the match.
func sendData(toAllPlayers: Data, with: GKMatch.SendDataMode) throws
Transmits data to all players connected to the match.
enum SendDataMode
The mechanism used to transmit data to other players.
Topics
Setting the delegate
Working with other players
Sending data to other players
Joining a voice chat


## Page 64

func voiceChat(withName: String) -> GKVoiceChat?
Joins the local player to a voice channel.
Deprecated
var properties: [String : Any]?
The local player’s properties that matchmaking rules used to find the players with some
additions.
var playerProperties: [GKPlayer : [String : Any]]?
The properties for other players that matchmaking rules uses to find players, with some
additions.
func disconnect()
Disconnects the local player from the match.
func rematch(completionHandler: ((GKMatch?, (any Error)?) -> Void)?)
Creates a new match with the players from an existing match.
func chooseBestHostPlayer(completionHandler: (String?) -> Void)
Determines the best player in the game to act as the server for a client-server match.
Deprecated
var playerIDs: [String]?
The player identifiers for remote players in the match.
Deprecated
func send(Data, toPlayers: [String], with: GKMatch.SendDataMode) throws
Transmits data to a list of connected players.
Deprecated
Getting matchmaking properties
Finishing the match
Deprecated Methods and Properties
Relationships


## Page 65

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating real-time games
Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
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
Inherits From
Conforms To
See Also
Real-time games


## Page 66

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


