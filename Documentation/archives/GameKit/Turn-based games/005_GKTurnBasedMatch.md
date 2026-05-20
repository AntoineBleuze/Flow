# 005_GKTurnBasedMatch.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


