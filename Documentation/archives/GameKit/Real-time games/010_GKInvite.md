# 010_GKInvite.pdf

## Page 1

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


## Page 2

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


## Page 3

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


