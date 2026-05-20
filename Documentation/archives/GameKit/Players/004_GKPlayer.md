# 004_GKPlayer.pdf

## Page 1

Protecting the player’s privacy using scoped identifiers
Authenticating a player
Before using Game Center for the first time, players create a single account that identifies them
across all Game Center games. The player only needs to sign in to Game Center once per device 
start using GameKit features in your game. A player sets a nickname and avatar in their account
that provide a consistent and familiar look in your game. Game Center then uses the account to
record leaderboard scores and achievements, and to start games with other players.
In your code, GKPlayer represents remote or other players who the local player running your app
can invite and communicate with. GKPlayer is also the superclass for the local player GKLocal
Player class that provides common data and methods for all players. For example, use the alia
property to get the nickname for a player. To load the player avatars, use the loadPhoto(for:
withCompletionHandler:) method.
To create a guest player who doesn’t have a Game Center account, use the anonymousGuest
Player(withIdentifier:) method. GameKit treats guest players similar to Game Center
players except they can’t earn achievements, post to leaderboards, or participate in challenges.
Mentioned in
Overview
GameKit / GKPlayer
Class
GKPlayer
A remote player who the local player running your game can invite and
communicate with through Game Center.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

Use the gamePlayerID property as a unique identifier for just your game, and the teamPlayer
ID property as a unique identifier for all games that you offer through your developer account. Fo
more information, see Protecting the player’s privacy using scoped identifiers.
var gamePlayerID: String
A unique identifier for a player of the game.
var teamPlayerID: String
A unique identifier for a player of all the games that you distribute using your developer
account.
func scopedIDsArePersistent() -> Bool
Returns a Boolean value depending on whether the player identifiers are persistent across
game instances or unique to the game instance.
let GKPlayerIDNoLongerAvailable: String
A constant for a player ID that’s no longer available.
var playerID: String
A unique identifier for a player of the game.
Deprecated
var alias: String
A string the player chooses to identify themself to other players.
var displayName: String
A string to display for the player.
var isInvitable: Bool
A Boolean value that indicates whether the local player can send an invitation to the player.
var isFriend: Bool
A Boolean value that indicates whether the player is a friend of the local player.
Deprecated
Topics
Identifying the player
Accessing player details


## Page 3

func loadPhoto(for: GKPlayer.PhotoSize, withCompletionHandler: ((UIImag
?, (any Error)?) -> Void)?)
Loads a photo of the player from Game Center.
enum PhotoSize
The size of a photo that Game Center loads.
class func anonymousGuestPlayer(withIdentifier: String) -> Self
Creates a guest player with the specified identifier.
var guestIdentifier: String?
A developer-created string that identifies a guest player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.
class func loadPlayers(forIdentifiers: [String], withCompletionHandler:
(([GKPlayer]?, (any Error)?) -> Void)?)
Loads information about a list of players from Game Center.
Deprecated
GKBasePlayer
Loading player photos
Creating a guest player
Observing notifications
Loading player details
Relationships
Inherits From
Inherited By


## Page 4

GKLocalPlayer
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Connecting players with their friends in your game
Give players the ability to connect and interact with friends in your game.
Saving the player’s game data to an iCloud account
Save game data during play or after a game in the player’s iCloud account that’s accessible
from any device.
Protecting the player’s privacy using scoped identifiers
Use the scoped identifiers that GameKit provides you as player IDs when transmitting or
saving player data.
class GKLocalPlayer
The local player who signs in to Game Center on the device running the game.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
Conforms To
See Also
Players


## Page 5

static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


