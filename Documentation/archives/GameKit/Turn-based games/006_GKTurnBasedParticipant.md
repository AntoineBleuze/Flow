# 006_GKTurnBasedParticipant.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

A Boolean value indicating whether GameKit can add badges to a turn-based game icon.


