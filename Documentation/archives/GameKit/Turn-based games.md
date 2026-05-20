# Turn-based games.pdf

## Page 1

This sample code project uses the GameKit framework to create a simple turn-based game where
two players take turns incrementing a counter until a player stops playing or forfeits the match. Th
game uses the turn-based matchmaker interface for starting and managing multiple turn-based
matches. This game also uses the GameKit exchanges feature for participants in a turn-based
game to message and exchange data.
To create your own turn-based game, replace the SwiftUI files with your gameplay interface, and
modify the TurnBasedGame class to support your game.
To configure the sample code project, perform the following steps in Xcode:
1. If necessary, change the Bundle Identifier to a unique ID on the Signing & Capabilities pane.
2. Add your Apple ID account and assign the target to a team so Xcode can enable Game Center.
3. In App Store Connect, create an app record that matches the bundle ID (see Add a new app in
App Store Connect Help).
4. Connect two iOS devices to your Mac.
5. If necessary, click Register Device in the Signing & Capabilities pane to create the provisioning
profile.
6. Build and run the sample on the two iOS devices.
Overview
Configure the sample code project
GameKit / Creating turn-based games
Sample Code
Creating turn-based games
Develop games where multiple players take turns and can exchange data while
waiting for their turn.
Download
iOS 15.0+
iPadOS 15.0+
Xcode 15.0+


## Page 2

7. If the Welcome to Game Center sheet appears, sign in using a different Apple ID on each devic
Before using any GameKit APIs, the game needs to initialize the local player by presenting an
interface for them to sign in to Game Center on their device. The TurnBasedGame
.authenticatePlayer() method handles the initialization flow and, when complete, registers
for turn-based game events.
To start or join an existing match, the player taps the Start Match button on the content view. The
the TurnBasedGame.startMatch() action method creates a match request and presents a
GKTurnBasedMatchmakerViewController interface where the player can invite friends or
automatch to fill empty slots.
After the player selects opponents in the Game Center interface, GameKit dismisses the view
controller and invokes the GKTurnBasedEventListener.player(_:receivedTurnEvent
For:didBecomeActive:) protocol method, passing a new GKTurnBasedMatch object. This
method handles a variety of turn-based events throughout the match.
The first time GameKit invokes the player(_:receivedTurnEventFor:didBecome
Active:) method, the local player is the current participant. This method sets the myTurn
property to true, which enables the Take Turn button in the game view interface.
Initialize the player and register for turn-based events
Start a turn-based match


## Page 3

GameKit doesn’t send invitations to the match until the participant who starts the match takes the
first turn. Therefore, this method displays a placeholder name and avatar for the opponent until th
opponent joins the match.
Instead of retaining the GKTurnBasedMatch object, which can change during the course of the
match, this method retains the match ID so the game can fetch the current match object as
necessary later.
When the current participant taps the Take Turn button, the TurnBasedGame.takeTurn()
action method increments the count and passes the turn to the opponent.
First the takeTurn() method loads the current match object using the match ID it retains in the
player(_:receivedTurnEventFor:didBecomeActive:) method.
This method passes the turn to the opponent using the endTurn(withNextParticipants:
turnTimeout:match:completionHandler:) method. It passes the next participant an arra
containing just the opponent, and a Data representation of the game state that contains the
current count.
Then pass the next participants and the game data, specifying a timeout in case the receipients
don’t respond, to the endTurn(withNextParticipants:turnTimeout:match:
completionHandler:) method.
Pass the turn to the next participant


## Page 4

Note
In games with more than two participants, best practice is to add multiple participants to the
array for the next participants. Then if communication fails, or a participant doesn’t finish their
turn within the time limit, Game Center passes the turn to the next participant in the array to
keep the match going.
The first time the game passes the turn, GameKit sends invitations to all the participants.
When the opponent taps the Accept button in the dialog that GameKit displays on their device,
GameKit invokes the GKTurnBasedEventListener.player(_:receivedTurnEventFor:
didBecomeActive:) method.
When the local player accepts the invitation, the other participant’s status is GKTurnBased
Participant.Status.active and its player property is non-nil, allowing this method to get
the opponent’s name and load their avatar from the GKPlayer object.
The match object also contains data, such as the current count, that this method encodes to
update the game view interface. The TurnBasedGame.encodeGameData() and TurnBased
Game.decodeGameData() methods store just the game properties that you need to continue
playing when GameKit sends turn-based events between participants.
Accept turn-based match invitations


## Page 5

If a participant taps the Forfeit button, the TurnBasedGame.forfeitMatch() action method
quits the match whether it’s the participant’s turn or not. Because only the current participant can
update the match data, GameKit provides two different methods to leave a match.
When it’s the local player’s turn, the forfeitMatch() method creates a Data representation o
the game data, selects the next participants, and invokes the participantQuitInTurn(with
nextParticipants:turnTimeout:match:completionHandler:) method, passing
GKTurnBasedMatch.Outcome.quit as the outcome.
When it’s not the local player’s turn, the forfeitMatch() method calls the participantQuit
OutOfTurn(with:withCompletionHandler:) method.
Both of these methods change the status of the participant to GKTurnBasedParticipant
.Status.done and generate a turn-based event that invokes the player(_:receivedTurn
EventFor:didBecomeActive:) method. If there aren’t enough participants to continue (when
there’s only one participant remaining in the match), this method sets the outcome of the recipien
to GKTurnBasedMatch.Outcome.won and ends the game.
Forfeit a turn-based match


## Page 6

The takeTurn() action method also ends the match with a win if there aren’t enough participan
to continue.
Participants can message other participants and exchange items while they’re waiting for the
current participant to take their turn. When a participant taps the message bubble in the game
view, the chat view sheet appears so the participant can send a text message to the opponent.
The TurnBasedGame.sendMessage() method sends the text message as the data in an
exchange request. It passes the data, a localizable message, and a response timeout to the
GKTurnBasedMatch.sendExchange(to:data:localizableMessageKey:arguments:
timeout:completionHandler:) method.
Exchange data between participants


## Page 7

In the recipient’s game instance, GameKit invokes the GKTurnBasedEvent
Listener.player(_:receivedExchangeRequest:for:) protocol method, passing the
player, the exchange object, and the match object. This method displays the message to the
recipient when they have the chat view sheet open. Otherwise, the message appears in the chat
view thread the next time the participant opens it.
For expedience, this method immediately accepts the exchange request when the exchange statu
is GKTurnBasedExchangeStatus.active.
In the sample, each participant starts with 50 items next to their names. To exchange items, a
participant clicks the Exchange Item button below the Send Reminder button. The same code tha
accepts the chat messages also automatically accepts the exchange item request.
When participants reply to exchange requests, GameKit invokes the player(_:received
ExchangeReplies:forCompletedExchange:for:) protocol method in the current
participant and the sender’s game instance. In this sample, the player(_:receivedExchange
Replies:forCompletedExchange:for:) method invokes the TurnBasedGame.save
Exchanges() method.
Because GameKit requires that the current participant save completed exchanges before ending 
match, the takeTurn() method also invokes the saveExchanges(for:) method before endi
a match.
Because only the current participant can save exchanges, the saveExchanges(for:) method
first checks whether the local player is the current participant before continuing.
This method resolves the exchange by transferring one item from the recipient to the sender of th
exchange request. Then it adds the participant’s exchange items to the game data, and passes it
Save completed exchanges


## Page 8

with the completed exchanges to the GKTurnBasedMatch.saveMergedMatch(_:with
ResolvedExchanges:completionHandler:) method.
The saveMergedMatch(_:withResolvedExchanges:completionHandler:) method
removes the completed exchange objects from the GKTurnBasedMatch object’s completed
Exchanges and exchanges properties.
Because the match data changes, GameKit invokes the player(_:receivedTurnEventFor:
didBecomeActive:) method in the other participants’ game instances. The player(_:
receivedTurnEventFor:didBecomeActive:) method unpacks the match data and display
the exchanged items.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
See Also
Turn-based games


## Page 9

A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 10

In a turn-based game, players take turns to advance gameplay, such as in chess, checkers, and
similar board games.
The player who creates a match selects opponents and then takes the first turn. Then you pass th
player’s turn, other game data, and the next participant to GameKit. GameKit saves the match dat
in Game Center, which sends the invitations to the other players. Game Center passes the turn to
the next participant who accepts their invitation, until all participants reach an outcome or the
match ends.
Players can participate in multiple concurrent matches that continue even after players quit a gam
Game Center stores open and completed matches until the player explicitly removes them.
You manage turn-based matches through the GameKit turn-based APIs, specifically by using the
GKTurnBasedMatch object that Game Center passes between participants. The match object
contains the following information:
Status of the match
Participants and current participant
Status and outcomes of individual participants
A message for participants about the most recent turn
Your game-specific data
For design guidance, see Human Interface Guidelines > Technologies > Game Center > Multiplaye
Overview
GameKit / Starting turn-based matches and passing turns between players
Article
Starting turn-based matches and passing
turns between players
Let Game Center store and forward match data between players in a turn-based
game.


## Page 11

Important
The code examples in this article use GameKit asynchronous methods that you invoke from an
async method or within a Task structure. For details about asynchronous flows, see
Concurrency.
First, create a GKMatchRequest object that contains the parameters of your turn-based game.
You can set the number of players, apply groups and attributes to filter the matches, provide an
invitation message, and set other criteria.
To get the maximum number of players Game Center supports for turn-based games, pass
GKMatchType.turnBased to the maxPlayersAllowedForMatch(of:) method.
Let players create a new match and select opponents by using the provided GameKit turn-based
interface. Similar to how the process works in the real-time game interface, the player creates a
match by tapping the plus button (+) in the upper-right corner. In the next few screens, the player
invites players and, optionally, fills empty slots using automatch.
In your code, use the following steps to present the turn-based matchmaker interface:
1. Create a GKTurnBasedMatchmakerViewController object by passing the GKMatch
Request object you configure in the Create a match request section above. Set its delegate to
Create a match request
Start a turn-based match


## Page 12

your game object that conforms to the GKTurnBasedMatchmakerViewController
Delegate protocol.
2. Configure the view controller before presenting it. Optionally, set the view controller’s
matchmakingMode property to limit the use of automatch. You can also set showExisting
Matches to false to remove ongoing matches that appear under Your Turn and Their Turn.
Otherwise, the player can select an existing match rather than create a new one. For more
information about handling existing matches, see the Open an existing turn-based match secti
below.
3. Implement the GKTurnBasedMatchmakerViewControllerDelegate protocol methods to
handle cancellations and errors.
4. Then, present the turn-based matchmaker view controller to the local player.
Alternatively, create your own custom interface, and then programmatically find opponents and
accept invitations using the find(for:withCompletionHandler:), accept
Invite(completionHandler:), and declineInvite(completionHandler:) methods.
Before sending invitations to other players, GameKit invokes the GKTurnBasedEventListener
player(_:receivedTurnEventFor:didBecomeActive:) protocol method for the local
player to take the first turn. Later, GameKit invokes this method each time it becomes the player’s
turn until the player reaches an outcome or the match ends. Implement this method to present th
gameplay interface that lets the player take their turn.
To receive the GKTurnBasedEventListener callbacks, conform your game object to the
GKLocalPlayerListener protocol and register it with the local player object. Register for
callbacks immediately after you initialize the local player because the system brings your game to
the foreground or launches it to deliver important turn-based events. For more information about
initializing a player, see Authenticating a player.
Then implement the player(_:receivedTurnEventFor:didBecomeActive:) method to
perform the following tasks:
1. Retain the GKTurnBasedMatch object that GameKit passes to this method, or retain its matc
ID property. During gameplay, get the current match object by passing the match ID to the loa
Present the gameplay interface for the player to take their
turn


## Page 13

Matches(completionHandler:) class method.
2. Update the gameplay interface by obtaining the latest game data from the match object using
the matchData property. If it’s the first turn, the game data is nil; otherwise, it’s the game da
you set when you pass the turn to the next participant.
3. If the match status property is GKTurnBasedMatch.Status.open, configure the gamepla
interface according to whose turn it is. Use the currentParticipant property to determine
whether it’s the local player’s turn.
4. Present your gameplay interface to the local player.
After the player takes their turn, pass the turn to the next participant based on your game rules an
logic. Implement your game to do the following:
1. Create an array of match participants in the order you want Game Center to pass the turn. If
communication fails or a participant doesn’t respond, Game Center passes the turn to the next
participant in the array. Start with the participants in the GKTurnBasedMatch object. For
example, exclude the current participant and other participants who, for whatever reason, aren
active.
2. Create a Data representation of your game data that GameKit saves and forwards to the next
participant. Ensure that the size of the match data doesn’t exceed the matchDataMaximum
Size property. For example, use the NSKeyedArchiver class to convert your game data to a
Data object.
3. Call the GKTurnBasedMatch endTurn(withNextParticipants:turnTimeout:match
completionHandler:) method, passing the next participant’s array, current game data, and
optional timeout for the participant to take their turn.
If this is the first turn in the match, Game Center sends the invitations to other participants and
then passes the turn to the next participant who accepts their invitation.
Pass the turn to the next participant


## Page 14

Alternatively, use the saveCurrentTurn(withMatch:completionHandler:) method to sa
the game data without passing the turn to the next participant. For example, save and forward
game data to other participants while the player takes a more complicated, multiple-step turn.
After the first turn, Game Center manages the status of participants for you by sending invitations
and continuing to fill empty slots if you use automatch.
To join the match, a participant taps the Game Center invitation that appears on their device, and
then taps the Accept button. If necessary, the system launches your game or brings it to the
foreground. The player can also tap the match under New Invitations in the turn-based matchmak
interface when you present it.
When the local player joins a match, GameKit invokes the GKTurnBasedEventListener
player(_:receivedTurnEventFor:didBecomeActive:) method. Implement this method
to show the gameplay interface with the current game data, and if it’s the local player’s turn, let
them take it.
Optionally, implement the player(_:didRequestMatchWithOtherPlayers:) method to
notify the local player when GameKit sends the invitations.
Enhance your game to show the status, name, and avatar of participants in the match when turn-
based events occur. Also, be sure to update your interface when participants decline invitations o
forfeit the match.
Implement the player(_:receivedTurnEventFor:didBecomeActive:) method to perfor
the following tasks:
1. Get the list of all participants using the GKTurnBasedMatch participants property and ge
the participant taking their turn using the currentParticipant property.
2. Show when participants accept their invitations and are actively playing using the GKTurnBas
Participant status property. During the first turn, the status of other participants is
GKTurnBasedParticipant.Status.matching because Game Center hasn’t sent the
invitations. Later, the status transitions through the GKTurnBasedParticipant.Status
possible values until the participant exits the match when the status becomes GKTurnBased
Participant.Status.done.
3. If the status property is GKTurnBasedParticipant.Status.active, display more deta
that become available using the player property. Display the participant’s name using the
Accept turn-based match invitations
Display participant details


## Page 15

GKPlayer displayName property, and their avatar using the loadPhoto(for:with
CompletionHandler:) method.
4. If the status property is GKTurnBasedParticipant.Status.done, show the outcome o
the participant using the matchOutcome property. For example, show whether a participant
wins, loses, or forfeits a match.
A player can continue a match if they don’t forfeit it when they exit or quit your game. In the turn-
based matchmaker interface, the player opens an existing match by selecting it under Your Turn o
Their Turn.
When the player selects an open match, GameKit invokes the GKTurnBasedEventListener
player(_:receivedTurnEventFor:didBecomeActive:) method. Implement this method
to present the match using the current game data in the match object, and if it’s the local player’s
turn, let them take it.
GameKit also invokes the player(_:receivedTurnEventFor:didBecomeActive:) metho
if the player selects an ended match under Completed and then clicks the View Game button on
the next screen.
If the match status property is GKTurnBasedMatch.Status.ended, show the outcomes of
the participants and the final game data from the match object.
If you don’t want existing matches to appear in the interface, set the view controller’s show
ExistingMatches to false before presenting it.
Alternatively, implement a custom interface that lets players manage existing matches. Use the
GKTurnBasedMatch loadMatches(completionHandler:) method to load the matches fro
Game Center.
A player can forfeit an open match using the turn-based matchmaker interface. The player taps th
information button next to a match under Your Turn or Their Turn, and on the next screen, taps th
Open an existing turn-based match
Forfeit a turn-based match


## Page 16

Forfeit button in the upper-right corner. The player can also forfeit a match from the list by sliding
the match to the left and tapping the Remove button. Players might also forfeit a match using a
control in your gameplay interface.
GameKit invokes the GKTurnBasedEventListener player(_:receivedTurnEventFor:
didBecomeActive:) method in the game instance of the next participant. If the player removes
a match that appears under Completed, GameKit deletes the match from Game Center without
notifying your game.
Implement the player(_:receivedTurnEventFor:didBecomeActive:) method to updat
your interface when the status of a participant changes to GKTurnBasedParticipant.Statu
.done. If the local player can’t continue gameplay because the number of active participants dro
below the minimum number of players, end the match, as described in the next section.
To programmatically forfeit a match, call either of the following methods, depending on whether it
the local player’s turn:
participantQuitInTurn(with:nextParticipants:turnTimeout:match:
completionHandler:)
participantQuitOutOfTurn(with:withCompletionHandler:)
Pass GKTurnBasedMatch.Outcome.quit as the match outcome. If it’s the local player’s turn,
pass an array of next participants and the current game data.
When a player forfeits a match, notify participants using the APIs described in Sending messages
to players in turn-based games. Optionally, implement the player(_:wantsToQuitMatch:)
protocol method to notify players.
You programmatically end a match depending on your game rules and when participants reach an
outcome. You can only end the match when it’s the local player’s turn.
To end a match, set the outcomes of all the participants in the match object using the match
Outcome property. For example, if the local player wins the match, set the current participant’s
outcome to GKTurnBasedMatch.Outcome.won and the other participants’ outcomes to
GKTurnBasedMatch.Outcome.lost.
Then call either of the following methods:
endMatchInTurn(withMatch:completionHandler:)
End a turn-based match


## Page 17

endMatchInTurn(withMatch:leaderboardScores:achievements:completion
Handler:)
Optionally, pass updated game data, leaderboard scores, and achievements. If the game data
doesn’t change, you can pass the existing data.
When a match ends, notify the participants using the APIs described in Sending messages to
players in turn-based games. Optionally, implement the GKTurnBasedEventListener
player(_:matchEnded:) protocol method to notify participants.
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
See Also
Turn-based games


## Page 18

Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 19

GameKit provides several APIs for you to communicate events and send messages in your turn-
based games. You can include a message and custom game data in the GKTurnBasedMatch
object passed between active participants. You can also send a notification to other participants
when they’re not running your game.
To send other types of data between players when they’re not taking their turn, see the GKTurn
BasedExchange class.
Important
The code listings in this article use GameKit asynchronous methods that you invoke from an
async method or within a Task structure. For details on asynchronous flows, see
Concurrency.
You can send localized or non-localized messages from the current participant to others in a turn
based match using the GKTurnBasedMatch object. If the game isn’t running or is in the
background, the message you provide appears immediately at the top of the screen as a
notification. If the game is in the foreground, get the message from the match object GameKit
passes to participants and display it in your own interface.
Before you perform an action such as ending a turn, set the message property of the match
object. Alternatively, set a message that GameKit localizes using the receiving participant’s
language and region settings using the setLocalizableMessageWithKey(_:arguments:)
method.
Overview
Pass messages from the current participant
GameKit / Sending messages to players in turn-based games
Article
Sending messages to players in turn-
based games
Notify players of match events by sending messages and game data.


## Page 20

If a participant taps the notification when it appears, GameKit launches the game or brings it to th
foreground. GameKit invokes the GKTurnBasedEventListener player(_:receivedTurn
EventFor:didBecomeActive:) protocol method passing true as the active parameter.
Implement this method to join the match. For more information on handling turn-based events, se
Starting turn-based matches and passing turns between players.
If the game is in the foreground, GameKit invokes this method but passes false as the active
parameter. You can then present the message in your own interface by getting the message from
the match object using the message property.
To localize a message, add the key you pass to the setLocalizableMessageWithKey(_:
arguments:) method and a placeholder translation to a .strings file in your project (for
example, the default Localizable.strings file). For more information on adapting your game
for different languages and regions, see Localization.
Send a localized message from any participant to others using a Game Center notification. For
example, send a reminder to the current participant from another participant who is waiting for
them to take their turn. GameKit sends the reminder to the participants as a push notification that
doesn’t interrupt their gameplay. The notification only appears when the game isn’t running — it
doesn’t appear if the participant runs the game in either the foreground or background.
Send messages from any participant


## Page 21

To display the GameKit notification:
1. Invoke the GKTurnBasedMatch sendReminder(to:localizableMessageKey:
arguments:completionHandler:) method passing the participants and a localized
message key:
2. Add the localized message key and placeholder translation to a .strings file in your project. 
necessary, add a .strings file (for example, the default Localizable.strings file) to you
project and make it localizable. For the Xcode steps, see Adding resources to localizations and
Editing XLIFF and strings files.


## Page 22

When the player taps the notification, GameKit invokes the GKTurnBasedEventListener
player(_:receivedTurnEventFor:didBecomeActive:) protocol method passing true 
the active parameter. Implement this method to join the existing match. For more information on
handling turn-based events, see Starting turn-based matches and passing turns between players
Note
If you exceed the system’s 10-minute limit for the frequency of sending reminders, a
GKServerTurnBasedMaxSessionOtherError error occurs.
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
See Also
Turn-based games


## Page 23

class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 24

You can increase engagement in turn-based games by letting participants communicate and
exchange data while they wait for the current participant to take their turn.
To implement this feature, provide an interface in your game where participants can communicate
— for example, exchange items in the game. Then initiate an exchange request from the user of
your game instance, called the local player, to one or more recipients. GameKit handles the
requests between participants and the status of the exchange object as participants reply. You
implement protocol methods to accept exchanges, display results, and save completed exchange
When you save completed exchanges, GameKit notifies all other participants.
To receive the protocol messages, register as a listener of the local player, and conform to the
GKTurnBasedEventListener protocol. For more information, see Starting turn-based matche
and passing turns between players.
Important
The code examples in this article use GameKit asynchronous methods that you invoke from an
async method or within a Task structure. For details about asynchronous flows, see
Concurrency.
Overview
Send exchange requests
GameKit / Exchanging data between players in turn-based games
Article
Exchanging data between players in turn-
based games
Add the ability for players to exchange game data and send messages while
waiting for their turns.


## Page 25

Any participant, including the current participant who is taking their turn, can send an exchange
request to one or more other participants. When sending an exchange request, you pass the
recipients, the game-specific exchange data, and a localized message to the GKTurnBasedMatc
sendExchange(to:data:localizableMessageKey:arguments:timeout:completion
Handler:) method.
In the exchange data, provide enough game-specific information for recipients to decide whether
to accept or decline the request.
To localize the message, add the key you pass and a placeholder translation to a .strings file in
your project (for example, the default Localizable.strings file). For more information about
adapting your game for different languages and regions, see Localization.
When a recipient receives an exchange request, GameKit invokes the GKTurnBasedEvent
Listener player(_:receivedExchangeRequest:for:) protocol method, passing the
exchange object. If your game isn’t running or is in the background, GameKit displays a notificatio
containing the localized message first. When the recipient taps the notification, GameKit launches
your game or brings your game back to the foreground, and then invokes the method.
To accept or decline the exchange request on behalf of the participant, implement the player(_
receivedExchangeRequest:for:) method using the following steps:
1. Unarchive the exchange data in the GKTurnBasedExchange object that GameKit passes to
this method.
2. If the status property is GKTurnBasedExchangeStatus.active, present an interface
containing the exchange data that lets the recipient accept or decline the request.
3. To display more details to the recipient, use the other GKTurnBasedExchange properties, su
as the sender and message properties.
4. If the recipient accepts the exchange request, invoke the reply(withLocalizableMessag
Key:arguments:data:completionHandler:) method. Optionally, pass additional
exchange information back to the sender using the data parameter.
When all recipients reply to an exchange request or requests time out, GameKit invokes the
player(_:receivedExchangeReplies:forCompletedExchange:for:) method in the
current participant’s game instance and the original sender’s game instance.
Respond to exchange requests
Save completed exchanges


## Page 26

GameKit passes the exchange object with the status property of GKTurnBasedExchangeStatu
.complete and the recipient details (GKTurnBasedExchangeReply objects) in the replies
parameter. Optionally, present the replies along with their messages and exchange data to the
original sender.
If the local player is the current participant, implement the player(_:receivedExchange
Replies:forCompletedExchange:for:) method to resolve and save the exchange data.
Also, save completed exchanges before the current participant ends their turn, forfeits the match
or ends the match.
1. Add your game-specific exchange data to the match data that you save in Game Center and
send to participants. For example, add code that transfers items between participants or saves
their conversations.
2. Invoke the saveMergedMatch(_:withResolvedExchanges:completionHandler:)
method, passing the current match data, including any exchange data, and the completed
exchange objects. This method removes the exchanges from the match’s completed
Exchanges and exchanges properties.
Only the current participant can invoke the saveMergedMatch(_:withResolvedExchanges
completionHandler:) method, even if the current participant isn’t involved in the exchanges.
When the current participant saves completed exchanges with match data, GameKit invokes the
player(_:receivedTurnEventFor:didBecomeActive:) method in each participant gam
instance. Implement this method to present the new match data, including the exchange data. Fo
example, show the items that transfer between participants and recipient reply messages.
You can cancel an exchange request anytime before the current participant saves it and the statu
property becomes GKTurnBasedExchangeStatus.resolved. To cancel an exchange reques
use the GKTurnBasedExchange cancel(withLocalizableMessageKey:arguments:
completionHandler:) method. Pass a localizable message that GameKit displays in a
notification if the recipient isn’t running your game or it’s in the background.
To update the gameplay interface and display the message when a participant cancels an
exchange request, implement the player(_:receivedExchangeCancellation:for:)
protocol method.
Display exchange results
Cancel exchange requests


## Page 27

Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
See Also
Turn-based games


## Page 28

Starting turn-based matches and passing turns between players
Before you create a GKTurnBasedMatchmakerViewController object, create a GKMatch
Request object and configure it according to the parameters of your game. Then, pass the matc
request to the init(matchRequest:) initializer to create the view controller.
Configure the view controller and set its delegate before you present it to the local player. The vie
controller allows the local player to choose other players and optionally fill empty slots using
automatch. The interface also allows players to select an existing match, forfeit a match, or view a
completed match.
Implement the GKTurnBasedMatchmakerViewControllerDelegate protocol to handle whe
a player selects players, cancels matchmaking, or encounters an error. Implement the turnBase
MatchmakerViewController(_:didFind:) delegate method to dismiss the view controller
when the local player invites players.
Register as a listener of the GKLocalPlayerListener protocol and implement GKTurnBased
EventListener methods that handle other turn-based events. For example, implement the
player(_:receivedTurnEventFor:didBecomeActive:) to update match data and prese
the gameplay interface for the local player to take their turn.
Mentioned in
Overview
GameKit / GKTurnBasedMatchmakerViewController
Class
GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and
automatch to fill any empty slots.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 29

In iOS, you present and dismiss the view controller from another view controller in your game, usi
the methods provided by the UIViewController class. If you use SwiftUI, you can get the root
view controller from the UIApplication object. In macOS, you use the GKDialogControlle
class to present and dismiss the view controller.
init(matchRequest: GKMatchRequest)
Creates a matchmaker view controller for the local player to start inviting other players to a
turn-based game.
var showExistingMatches: Bool
A Boolean value that determines whether the view controller shows existing matches.
var matchmakingMode: GKMatchmakingMode
The mode that a multiplayer game uses to find players.
enum GKMatchmakingMode
Possible modes that a multiplayer game uses to find matches.
var turnBasedMatchmakerDelegate: (any GKTurnBasedMatchmakerView
ControllerDelegate)?
The object that handles turn-based matchmaker view controller changes.
protocol GKTurnBasedMatchmakerViewControllerDelegate
A protocol that handles when the status of turn-based matchmaking changes.
NSViewController, UINavigationController
Topics
Creating and Configuring the View Controller
Setting the Delegate
Relationships
Inherits From
Conforms To


## Page 30

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
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
See Also
Turn-based games


## Page 31

Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 32

Starting turn-based matches and passing turns between players
Sending messages to players in turn-based games
A GKTurnBasedMatch object represents a match in a turn-based game that Game Center store
and forwards to participants in the match. In a turn-based game, participants take turns to advanc
gameplay until they reach an outcome. You end the match when all participants reach an outcome
or they can no longer continue.
A turn-based match object contains the status of the match, list of participants, the participant
whose turn it is, a message about the last turn, and your game-specific data. You can get more
details about the participants through the GKTurnBasedParticipant objects in the
participants property.
You don’t create turn-based match objects directly. When a match event occurs, GameKit passes
the match object to listeners that conform to the GKTurnBasedEventListener protocol. Retai
the match object or its match ID in the protocol methods, so you can get the latest match data lat
during gameplay.
Using the match object passed to GKTurnBasedEventListener protocol methods, you can
perform these actions on behalf of the local player:
Save game data
Mentioned in
Overview
GameKit / GKTurnBasedMatch
Class
GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 33

End a turn
Forfeit a match
End a match
Send a reminder to the participant whose turn it is
Exchange data between participants
Remove a completed match from Game Center
When you end a turn, forfeit a match, or end a match, you update the match data and if gameplay
can continue, choose the next participant. If you end a match, you set the individual participant
outcomes as well.
If you present a GKTurnBasedMatchmakerViewController object for players to manage the
turn-based matches, the player can start a match, accept an invitation, open an existing match,
and forfeit a match.
Don’t subclass the GKTurnBasedMatch class.
class func find(for: GKMatchRequest, withCompletionHandler: (GKTurnBase
Match?, (any Error)?) -> Void)
Creates a new match or finds an existing match that needs a player.
func acceptInvite(completionHandler: ((GKTurnBasedMatch?, (any Error)?)
-> Void)?)
Accepts an invitation for the local player to join a turn-based match.
func declineInvite(completionHandler: (((any Error)?) -> Void)?)
Declines an invitation for the local player to join a turn-based match.
func rematch(completionHandler: ((GKTurnBasedMatch?, (any Error)?) ->
Void)?)
Creates a new turn-based match with the same participants from an existing match.
Subclassing Notes
Topics
Creating a Match
Retrieving Match Details


## Page 34

var matchID: String
A unique identifier for the turn-based match.
var creationDate: Date
The date that Game Center created the match.
var participants: [GKTurnBasedParticipant]
The players that participate in a turn-based match.
var currentParticipant: GKTurnBasedParticipant?
The participant whose turn it is.
var status: GKTurnBasedMatch.Status
The state of the match, such as whether the match is open or has ended.
enum Status
The states of a match from when it’s created to when it ends.
var matchData: Data?
The game-specific data that you store in Game Center and pass between participants throug
a match object.
var matchDataMaximumSize: Int
The maximum size of the match data.
func loadMatchData(completionHandler: ((Data?, (any Error)?) -> Void)?)
Fetches your game-specific data that you store in Game Center when ending a turn, saving a
turn, or leaving a match.
func endTurn(withNextParticipants: [GKTurnBasedParticipant], turnTimeou
: TimeInterval, match: Data, completionHandler: (((any Error)?) -> Void
)?)
Passes the turn from the current participant to the next participant.
func saveCurrentTurn(withMatch: Data, completionHandler: (((any Error)?
-> Void)?)
Saves your match data in Game Center without ending the turn.
Turn Timeouts
A timeout for a player to take their turn.
Ending Turns and Saving Data


## Page 35

func participantQuitInTurn(with: GKTurnBasedMatch.Outcome, next
Participants: [GKTurnBasedParticipant], turnTimeout: TimeInterval, matc
: Data, completionHandler: (((any Error)?) -> Void)?)
Forfeits the match on behalf of the local player when it’s their turn.
func participantQuitOutOfTurn(with: GKTurnBasedMatch.Outcome, with
CompletionHandler: (((any Error)?) -> Void)?)
Forfeits the match on behalf of the local player when it’s not their turn.
enum Outcome
The state of a participant when they forfeit a match or when a match ends.
func endMatchInTurn(withMatch: Data, completionHandler: (((any Error)?)
-> Void)?)
Ends the match.
func endMatchInTurn(withMatch: Data, leaderboardScores: [GKLeaderboard
Score], achievements: [Any], completionHandler: ((any Error)?) -> Void)
Ends the match while submitting scores and achievements for all of the participants.
var message: String?
A message from the current participant to all other participants when you end a turn, forfeit 
match, or end a match.
func setLocalizableMessageWithKey(String, arguments: [String]?)
Sends a localized message from the current participant to all other participants when you en
a turn, forfeit a match, or end a match.
func sendReminder(to: [GKTurnBasedParticipant], localizableMessageKey:
String, arguments: [String], completionHandler: (((any Error)?) -> Void
)?)
Sends a reminder from one participant to a specific set of other participants.
Forfeiting a Match
Ending a Match
Sending Messages Between Participants
Exchanging Data Between Participants


## Page 36

func sendExchange(to: [GKTurnBasedParticipant], data: Data, localizable
MessageKey: String, arguments: [String], timeout: TimeInterval,
completionHandler: ((GKTurnBasedExchange?, (any Error)?) -> Void)?)
Sends an exchange request that contains your game data to one or more participants.
Exchange Timeouts
The amount of time that passes before an exchange times out.
var exchangeDataMaximumSize: Int
The maximum size of the exchange data.
var exchangeMaxInitiatedExchangesPerPlayer: Int
The maximum number of exchanges the local player can initiate.
var activeExchanges: [GKTurnBasedExchange]?
The exchanges that the local player needs to accept or reject.
var completedExchanges: [GKTurnBasedExchange]?
The exchange requests that all recipients replied to and the current participant needs to sav
var exchanges: [GKTurnBasedExchange]?
The exchange requests that are active or complete.
func saveMergedMatch(Data, withResolvedExchanges: [GKTurnBasedExchange]
completionHandler: (((any Error)?) -> Void)?)
Saves match data for completed exchanges without ending the turn.
class func load(withID: String, withCompletionHandler: ((GKTurnBased
Match?, (any Error)?) -> Void)?)
Loads a specific match with the specified identifier.
class func loadMatches(completionHandler: (([GKTurnBasedMatch]?, (any
Error)?) -> Void)?)
Fetches the turn-based matches from Game Center that the local player participates in.
func remove(completionHandler: (((any Error)?) -> Void)?)
Removes a match from Game Center that the local player participants in.
Loading Existing Matches
Deleting a Match from Game Center


## Page 37

func participantQuitInTurn(with: GKTurnBasedMatch.Outcome, next
Participant: GKTurnBasedParticipant, match: Data, completionHandler:
(((any Error)?) -> Void)?)
Resigns the current player from the match without ending the match.
Deprecated
func endMatchInTurn(withMatch: Data, scores: [GKScore]?, achievements: 
GKAchievement]?, completionHandler: (((any Error)?) -> Void)?)
Ends the match while submitting all of the scores and achievements.
Deprecated
func endTurn(withNextParticipant: GKTurnBasedParticipant, match: Data,
completionHandler: (((any Error)?) -> Void)?)
Updates the data stored on Game Center for the current match.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Deprecated Methods
Relationships
Inherits From
Conforms To
See Also


## Page 38

Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
Turn-based games


## Page 39

A GKTurnBasedParticipant represents a player in a turn-based match that Game Center use
to store and forward match data. In your game, use participant objects to show information about
opponents during gameplay.
You get GKTurnBasedParticipant objects from the participants property of a GKTurn
BasedMatch object that GameKit passes to GKTurnBasedEventListener protocol methods.
a participant represents a filled slot in the match, GameKit sets the player property and the
status accordingly. Get more information about a participant, such as the participant’s name an
avatar, through the player property.
Before you end a match, you must set the matchOutcome property for every participant in the
match.
You may not subclass this class.
Overview
Subclassing
Topics
Retrieving Participant Details
GameKit / GKTurnBasedParticipant
Class
GKTurnBasedParticipant
A participant in a turn-based match.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 40

var lastTurnDate: Date?
The date and time that this participant last took a turn in the game.
var timeoutDate: Date?
The date and time that the participant’s turn timed out.
var player: GKPlayer?
The player object containing the participant details.
var status: GKTurnBasedParticipant.Status
The status of the participant.
enum Status
The state the participant is in during the match.
var playerID: String?
The player identifier for this participant.
Deprecated
var matchOutcome: GKTurnBasedMatch.Outcome
The conclusion or results of a participant in a match.
enum Outcome
The state of a participant when they forfeit a match or when a match ends.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Setting Participant Outcomes
Relationships
Inherits From
Conforms To


## Page 41

Hashable
NSObjectProtocol
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
See Also
Turn-based games


## Page 42

A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 43

Exchanging data between players in turn-based games
Starting turn-based matches and passing turns between players
To receive the GKTurnBasedEventListener call backs, register your game object with the loc
player object immediately after initialization.
Adopt the GKLocalPlayerListener protocol to handle a variety of Game Center events instea
of the individual GKChallengeListener, GKInviteEventListener, GKSavedGame
Listener, and GKTurnBasedEventListener protocols.
Then implement the player(_:receivedTurnEventFor:didBecomeActive:) and other
GKTurnBasedEventListener protocol methods to handle turn-based events that occur
throughout a match.
Mentioned in
Overview
GameKit / GKTurnBasedEventListener
Protocol
GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between
participants in a match.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 44

func player(GKPlayer, receivedTurnEventFor: GKTurnBasedMatch, didBecome
Active: Bool)
Handles turn-based match events, such as accepting invitations, passing turns, and saving
match data.
func player(GKPlayer, didRequestMatchWithOtherPlayers: [GKPlayer])
Handles when the player uses Game Center to start a match with other players.
func player(GKPlayer, matchEnded: GKTurnBasedMatch)
Handles when the match ends.
func player(GKPlayer, wantsToQuitMatch: GKTurnBasedMatch)
Handles when the current participant wants to quit a match.
func player(GKPlayer, didRequestMatchWithPlayers: [String])
Handles when the player uses Game Center to start a match with other players.
Deprecated
func player(GKPlayer, receivedExchangeRequest: GKTurnBasedExchange, for
GKTurnBasedMatch)
Handles when the local player receives an exchange request from another participant.
func player(GKPlayer, receivedExchangeReplies: [GKTurnBasedExchangeRepl
], forCompletedExchange: GKTurnBasedExchange, for: GKTurnBasedMatch)
Handles when all recipients of an exchange request respond.
func player(GKPlayer, receivedExchangeCancellation: GKTurnBasedExchange
for: GKTurnBasedMatch)
Handles when the sender cancels an exchange request they intiated.
Topics
Handling Match-Related Events
Handling Data Exchanges
Relationships


## Page 45

GKLocalPlayerListener
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
Inherited By
See Also
Turn-based games


## Page 46

A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 47

Exchanging data between players in turn-based games
Sending messages to players in turn-based games
GameKit sends exchange objects to GKTurnBasedEventListener protocol methods when the
local player receives an exchange request or recipients reply to an exchange request. The
exchange object encapsulates your custom game data that you want to communicate to other
players.
You initiate an exchange request using the GKTurnBasedMatch sendExchange(to:data:
localizableMessageKey:arguments:timeout:completionHandler:) method. Then
GameKit sends the request to the recipients passing the exchange object to the GKTurnBased
EventListener player(_:receivedExchangeRequest:for:) protocol method. GameKi
sets the status of the exchange object to GKTurnBasedExchangeStatus.active.
After all recipients respond to the request, using the reply(withLocalizableMessageKey:
arguments:data:completionHandler:) method, or exceed the time out specified in the
request, GameKit sends the exchange to the sender and the current participant. GameKit sets the
exchange status to GKTurnBasedExchangeStatus.complete and then passes it to the
GKTurnBasedEventListener player(_:receivedExchangeReplies:forCompleted
Exchange:for:) method.
Mentioned in
Overview
GameKit / GKTurnBasedExchange
Class
GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 48

Before the current participant ends their turn, save the completed exchanges using the GKTurn
BasedMatch saveMergedMatch(_:withResolvedExchanges:completionHandler:)
method. Get the exchanges from the match object using the completedExchanges property.
Alternatively, save exchange data in the player(_:receivedExchangeReplies:for
CompletedExchange:for:) protocol method when all recipients reply to specific exchange
requests.
To cancel an active or complete exchange, use the cancel(withLocalizableMessageKey:
arguments:completionHandler:) method. GameKit notifies the recipients when the player
cancels an exchange, using the GKTurnBasedEventListener player(_:received
ExchangeCancellation:for:) protocol method.
var exchangeID: String
The identifier for the exchange request.
var sender: GKTurnBasedParticipant
The participant who sends the exchange request to recipients.
var recipients: [GKTurnBasedParticipant]
The participants who receives the exchange request.
var data: Data?
The game-specific exchange data that GameKit sends to participants.
var message: String?
A localized message from the sender to the recipients of an exchange request.
var sendDate: Date
The date that the sender initiates the exchange request.
var timeoutDate: Date?
The date that the recipients must reply by before the exchange request times out.
func reply(withLocalizableMessageKey: String, arguments: [String], data
Data, completionHandler: (((any Error)?) -> Void)?)
Replies to an exchange request on behalf of a recipient.
Topics
Retrieving Exchange Details
Replying to Exchange Requests


## Page 49

var replies: [GKTurnBasedExchangeReply]?
The replies from recipients of the exchange request.
var status: GKTurnBasedExchangeStatus
The status of the exchange request.
enum GKTurnBasedExchangeStatus
The status of an exchange or reply.
var completionDate: Date?
The date when all recipients of the exchange request reply.
func cancel(withLocalizableMessageKey: String, arguments: [String],
completionHandler: (((any Error)?) -> Void)?)
Cancels an exchange request.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Canceling Exchange Requests
Relationships
Inherits From
Conforms To
See Also
Turn-based games


## Page 50

Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 51

Exchanging data between players in turn-based games
When you accept an exchange request using the reply(withLocalizableMessageKey:
arguments:data:completionHandler:) method, GameKit sends a GKTurnBased
ExchangeReply object to participants using the player(_:receivedExchangeReplies:
forCompletedExchange:for:) protocol method. You can also get responses to exchange
requests from the GKTurnBasedExchange object using the replies parameter.
var data: Data?
The game-specific data that the recipent provides in the exchange request reply.
var message: String?
A message from the recipient to the sender of the exchange request.
Mentioned in
Overview
Topics
Retrieving Reply Details
GameKit / GKTurnBasedExchangeReply
Class
GKTurnBasedExchangeReply
Details about a recipient’s response to an exchange request.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 52

var recipient: GKTurnBasedParticipant
The participant who replies to the exchange request.
var replyDate: Date
The date the recipient replies to the exchange request.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Relationships
Inherits From
Conforms To
See Also
Turn-based games


## Page 53

Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and automatch
to fill any empty slots.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
class GKTurnBasedParticipant
A participant in a turn-based match.
protocol GKTurnBasedEventListener
The protocol that handles turn-based and data-exchange events between participants in a
match.
class GKTurnBasedExchange
Exchange request information that participants send in a turn-based match.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


## Page 54

Type
Boolean
AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
Name: Supported game controller types
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
Name: Supports Controller User Interaction
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
GCSupportsMultipleMicroGamepads
Details
See Also
Games
Bundle Resources / Information Property List / GKGameCenterBadgingDisabled
Property List Key
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based
game icon.
iOS 7.0+
iPadOS 7.0+
visionOS 1.0+


## Page 55

A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Deprecated


