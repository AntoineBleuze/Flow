# Players.pdf

## Page 1

Friends are such an important part of social play that GameKit gives you privacy-friendly access t
a player’s Game Center friends. For example, you can show what level friends are on in your game
launch a mission together with friends, or show a friends-only recurring leaderboard.
If the player has friends, you can access the list with their permission. The first time a player tries 
use functionality in your game that requires Game Center friends access, the system displays a
prompt asking the player whether your game can access their friends list. If the player grants
access to their friends, you’ll have access only to friends who also grant access.
For example, if a player grants access, then only the friends who also grant your game access to
their friends appear in the friends list. When a player grants access to their friends, GameKit sync
the permission across the player’s devices so the player only needs to respond to this system
prompt once.
Overview
GameKit / Connecting players with their friends in your game
Article
Connecting players with their friends in
your game
Give players the ability to connect and interact with friends in your game.


## Page 2

Important
The code listings in this article use GameKit asynchronous methods that you invoke within a
Task structure in SwiftUI. For details on asynchronous flows, see Concurrency.
Game Center provides an interface for sending and receiving friend requests including an inbox
that shows requests that a player may have missed. Players can also send friend requests within
your game. For example, use this feature to encourage players to add more friends in your
multiplayer game.
Add a friend request button to your interface using an add person SF Symbol (for example, perso
.crop.circle.badge.plus) for the button image. For details on using SF Symbols, see
Configuring and displaying symbol images in your UI.
Implement the button’s action to call the presentFriendRequestCreator(from:) method
that presents the Game Center request friend view controller. After the player sends the friend
request using this interface, this method dismisses the view controller and returns control to your
game. Before continuing, check whether an error occurs sending the friend request.
You must provide a reason to access a player’s friends by adding the NSGKFriendListUsage
Description key to the information property list. The system displays the reason in the prompt
presents to the player to grant your game access. If you don’t provide this key, an error occurs
when you attempt to access the friends.
For details on the system prompt, see Requesting access to protected resources.
Display the prompt to access friends when it’s convenient for the player by checking whether the
player grants you permission to access their friends using the loadFriendsAuthorization
Status(_:) method.
Sending friend requests
Providing a reason to access the friends list
Checking whether the player grants access


## Page 3

For example, if the player hasn’t denied or authorized access yet, you may want to delay accessin
their friends until there’s a good moment to prompt the player for permission. To ensure you allow
enough time for the player to make a decision, don’t display the prompt during game play.
Implement the completion handler you pass to this method to take the appropriate action:
If the status is GKFriendsAuthorizationStatus.authorized, you can access the friend
list.
If the status is GKFriendsAuthorizationStatus.notDetermined, the system prompts
the player when you access the friends.
If the status is GKFriendsAuthorizationStatus.denied or GKFriendsAuthorizatio
Status.restricted, the system won’t prompt the player and you need to delete any friends
data you previously collected for this player.
Once the player grants access, use the loadFriends(_:) method to get the friends who also
grant you access to their friends.
Accessing the player’s friends


## Page 4

For example, you can display details on their friends leaderboard scores to a player. Pass the
friends array to the loadEntries(for:timeScope:completionHandler:) leaderboard
method to get their avatar, display name, and score on the leaderboard.
Saving the player’s game data to an iCloud account
Save game data during play or after a game in the player’s iCloud account that’s accessible
from any device.
Protecting the player’s privacy using scoped identifiers
Use the scoped identifiers that GameKit provides you as player IDs when transmitting or
saving player data.
class GKLocalPlayer
The local player who signs in to Game Center on the device running the game.
class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
See Also
Players


## Page 5

static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


## Page 6

GameKit provides a convenient method to save game data that needs to persist after the player
quits the game. You can save game data to record a player’s progress, separate data for family
members who use the same device, and support players who switch between devices. For
example, let the player start your game on their iPhone, and then continue playing on their Mac
when they arrive home. You can save just one game at a time using the same filename or multiple
games by giving each game instance a unique filename.
To save a game, the player must have an iCloud account and enable iCloud Drive in their iCloud
settings. To save space in their account and improve performance in your game, minimize the
amount of data you save.
For GameKit to store the game data in the player’s iCloud account, you need to provide an identif
for the iCloud container that stores the data. Add the iCloud capability to your project and select
the iCloud Documents checkbox.
For more information, see Configuring iCloud services.
Decide what data to save to the file and encode it as a Data object. For example, create a structu
containing the properties you want to save to the file that conforms to the Codable protocol. The
encode the structure using the PropertyListEncoder class.
Overview
Provide a container identifier
Save a game
GameKit / Saving the player’s game data to an iCloud account
Article
Saving the player’s game data to an iCloud
account
Save game data during play or after a game in the player’s iCloud account that’s
accessible from any device.


## Page 7

Save the Data object to the file using the GKLocalPlayer saveGameData(_:withName:
completionHandler:) method. GameKit overrides an existing file with the same filename. If y
want to keep the previous file, pass a unique filename when you invoke this method.
Later, use the fetchSavedGames(completionHandler:) method to retrieve all the saved
games. This method returns an array of GKSavedGame objects that contain file properties, such a
the filename and modification date. For example, you can use the results to present a list of the
saved games to the player.
Use the GKSavedGame loadData(completionHandler:) method to load the contents of a
file. For example, let the player choose the game that they want to continue playing from the list.
Then restart the game with the contents of the file.
Fetch the saved games


## Page 8

Optionally, provide a similar interface for the player to remove saved games using the GKLocal
Player deleteSavedGames(withName:completionHandler:) method.
Occasionally, your game may need to resolve a conflict that occurs when the player saves game
data from multiple devices using the same filename. For example, your game may present an
interface that lets the player choose the correct game data or determine which data to keep base
on some other criteria, such as the game with the highest score.
If GameKit notices two saved games with the same filename when you either fetch saved games,
load game data, or save game data, it invokes the GKSavedGameListener player(_:has
ConflictingSavedGames:) protocol method. To resolve a conflict in your code, adopt the
GKLocalPlayerListener protocol and implement this method to save the correct data using
the GKLocalPlayer resolveConflictingSavedGames(_:with:completionHandler:
method.
Connecting players with their friends in your game
Give players the ability to connect and interact with friends in your game.
Protecting the player’s privacy using scoped identifiers
Use the scoped identifiers that GameKit provides you as player IDs when transmitting or
saving player data.
class GKLocalPlayer
The local player who signs in to Game Center on the device running the game.
class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
Resolve conflicts
See Also
Players


## Page 9

static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


## Page 10

If you store player data outside of Game Center, use the scoped player identifiers that GameKit
provides for you to identify the local player’s data — not their name and avatar, which may change
or other personal information that’s private. The identifiers that Game Center provides are
persistent and scoped to your game instances.
GameKit scopes the identifiers of other players in the game instance to each leaderboard object o
to each multiplayer match object, not your game instances (except for friend identifiers as
described below). Therefore, in a multiplayer game, save the game data for the local player only,
not the data for the other players in the match.
For design guidance on protecting the player’s privacy, see Human Interface Guidelines > Privacy
Before you can get a scoped identifier, initialize the local player who is running your game on the
device. During the initialization process, the player signs in to their Game Center account if they
haven’t already done so. Identifiers for a player are persistent; that is, the values are the same
across all instances of your game. For more information, see Authenticating a player.
After initialization, you can get a unique identifier for the local player from the GKLocalPlayer
shared object using the gamePlayerID property:
Overview
Initialize the local player
Get the local player’s scoped identifier
GameKit / Protecting the player’s privacy using scoped identifiers
Article
Protecting the player’s privacy using
scoped identifiers
Use the scoped identifiers that GameKit provides you as player IDs when
transmitting or saving player data.


## Page 11

If you need to track a player across multiple games belonging to your developer team, you can us
the teamPlayerID property instead. Game Center scopes this property to instances of all game
that use the same Team ID. But if you transfer your game to another team, the value of the team
PlayerID property changes.
If you use either the teamPlayerID or the deprecated, non-scoped playerID property, you
need to provide details on your game’s privacy practices in App Store Connect. To learn more, se
App privacy details on the App Store.
If initialization fails, the gamePlayerID and teamPlayerID properties return a temporary
identifier that’s not persistent. If you need unique and persistent identifiers, use the scopedIDs
ArePersistent() method before accessing the properties. Don’t rely on the format of the
identifiers to determine whether they’re persistent.
Later, you can use either the gamePlayerID or the teamPlayerID values in GameKit calls to
identify the player.
If you have permission from the local player to access their friends list, you can also get scoped
identifiers for their friends. The friend identifiers are persistent and scoped to game instances the
local player and their friends run.
You get the scoped identifiers for the friends from the GKPlayer objects that the load
Friends(_:) method returns using the gamePlayerID property. In the game instances that
mutual friends run, the identifiers for the GKPlayer objects that the loadFriends(_:) method
returns are the same:
For details on loading the local player’s friends, see Providing a reason to access the friends list
and Accessing the player’s friends.
Get scoped identifiers for friends of the local player


## Page 12

Connecting players with their friends in your game
Give players the ability to connect and interact with friends in your game.
Saving the player’s game data to an iCloud account
Save game data during play or after a game in the player’s iCloud account that’s accessible
from any device.
class GKLocalPlayer
The local player who signs in to Game Center on the device running the game.
class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.
See Also
Players


## Page 13

Authenticating a player
Initializing and configuring Game Center
Protecting the player’s privacy using scoped identifiers
Only one player can sign in to Game Center on a device at a time and that player is the local playe
Before you can start a game that uses GameKit features, verify that the local player signs in to the
Game Center account.
You set the handler of the local player shared instance using the authenticateHandler
property. Then implement this method to handle the multiple times GameKit invokes it during the
sign-in process. If the local player needs to create an account or sign in, GameKit provides a view
controller that you present to the local player. If the local player successfully signs in, determine
whether they have any account restrictions and adjust your game accordingly. For more
information about the initialization of the local player, see Authenticating a player.
After the local player signs in, their account data and GameKit features are available. You can
display the local player’s nickname and avatar, access their recent players and friends, and load
their leaderboards and achievements. You can also register a listener object that GameKit calls
when the local player sends or accepts invitations to play with others.
Mentioned in
Overview
GameKit / GKLocalPlayer
Class
GKLocalPlayer
The local player who signs in to Game Center on the device running the game.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 14

class var local: GKLocalPlayer
The shared instance of the local player.
var authenticateHandler: ((UIViewController?, (any Error)?) -> Void)?
A handler that GameKit calls while initializing the local player.
var isAuthenticated: Bool
A Boolean value that indicates whether a local player has signed in to Game Center.
func fetchItems(forIdentityVerificationSignature: ((URL?, Data?, Data?,
UInt64, (any Error)?) -> Void)?)
Generates a signature that you can use to authenticate the local player on your own server.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
var isUnderage: Bool
A Boolean value that indicates whether the local player is underage.
var isMultiplayerGamingRestricted: Bool
A Boolean value that indicates whether the player can join multiplayer games.
var isPersonalizedCommunicationRestricted: Bool
A Boolean value that indicates whether the player can use personalized communication on th
device.
func loadFriendsAuthorizationStatus((GKFriendsAuthorizationStatus, (any
Error)?) -> Void)
Topics
Accessing the Local Player
Authenticating the Local Player
Determining Whether the Player Is Underage or Restricted
Accessing Friends and Recents


## Page 15

Returns whether the player authorizes your game to access their friends list.
enum GKFriendsAuthorizationStatus
Constants that indicate if the local player grants access to their friends list.
func loadFriends(([GKPlayer]?, (any Error)?) -> Void)
Loads the local player’s friends list if the local player and their friends grant access.
func loadFriends(identifiedBy: [String], completionHandler: ([GKPlayer
]?, (any Error)?) -> Void)
Loads the player’s friends list, scoped by the identifiers, if the player and their friends grant
access.
NSGKFriendListUsageDescription
A message that tells people why the app needs access to their Game Center friends list.
func loadChallengableFriends(completionHandler: (([GKPlayer]?, (any
Error)?) -> Void)?)
Loads players to whom the local player can issue a challenge.
func loadRecentPlayers(completionHandler: (([GKPlayer]?, (any Error)?) 
> Void)?)
Loads players from the friends list or players that recently participated in a game with the loc
player.
var isPresentingFriendRequestViewController: Bool
A Boolean value that indicates whether your game presents the friends request view
controller.
func presentFriendRequestCreator(from: UIViewController) throws
Presents a view controller with a Messages sheet for the player to request friends.
func presentFriendRequestCreator(from: NSWindow?) throws
Opens the Messages app with a sheet for the player to request friends.
func loadDefaultLeaderboardIdentifier(completionHandler: ((String?, (an
Error)?) -> Void)?)
Loads the identifier for the local player’s default leaderboard.
Adding Friends
Working with Leaderboards


## Page 16

Deprecated
func setDefaultLeaderboardIdentifier(String, completionHandler: (((any
Error)?) -> Void)?)
Sets the local player’s default leaderboard.
Deprecated
func register(any GKLocalPlayerListener)
Registers a listener for a particular event.
func unregisterAllListeners()
Unregisters all listeners in your game.
func unregisterListener(any GKLocalPlayerListener)
Unregisters a listener object.
Saving the player’s game data to an iCloud account
Save game data during play or after a game in the player’s iCloud account that’s accessible
from any device.
func saveGameData(Data, withName: String, completionHandler: ((GKSaved
Game?, (any Error)?) -> Void)?)
Saves game data with the specified name.
func fetchSavedGames(completionHandler: (([GKSavedGame]?, (any Error)?)
-> Void)?)
Retrieves all available saved games.
func resolveConflictingSavedGames([GKSavedGame], with: Data, completion
Handler: (([GKSavedGame]?, (any Error)?) -> Void)?)
Replaces duplicate saved games that use the same filename with one file containing the
specified game data.
func deleteSavedGames(withName: String, completionHandler: (((any Error
)?) -> Void)?)
Deletes saved games with the specified filename.
class GKSavedGame
Registering Listeners
Saving Game Data


## Page 17

An object that represents a file containing saved game data.
protocol GKSavedGameListener
A protocol that handles events related to saving game data.
Deprecated symbols
Review unsupported symbols and their replacements.
GKPlayer
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKSavedGameListener
Hashable
NSCopying
NSObjectProtocol
Connecting players with their friends in your game
Give players the ability to connect and interact with friends in your game.
Saving the player’s game data to an iCloud account
Deprecated
Relationships
Inherits From
Conforms To
See Also
Players


## Page 18

Save game data during play or after a game in the player’s iCloud account that’s accessible
from any device.
Protecting the player’s privacy using scoped identifiers
Use the scoped identifiers that GameKit provides you as player IDs when transmitting or
saving player data.
class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


## Page 24

GKBasePlayer is the abstract superclass for the classes that represent the local player running
your app and remote players who may join their games. Use the GKLocalPlayer subclass to
initialize the local player who runs your app on their device. Then you can access the local player’
nickname, avatar, leaderboards, and achievements. You can also invite other players (GKPlayer
objects), and send information between players.
var displayName: String?
The Game Center profile name for a player.
var playerID: String?
A unique identifier for a player.
Deprecated
Overview
Topics
Identifying a Player
GameKit / GKBasePlayer
Class
GKBasePlayer
A class that provides common data and methods for the different player objects.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+
watchOS 3.0+


## Page 25

NSObject
GKCloudPlayer, GKPlayer
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
Relationships
Inherits From
Inherited By
Conforms To
See Also
Players


## Page 26

class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
protocol GKLocalPlayerListener
A protocol that handles events for Game Center players.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.


## Page 27

Finding multiple players for a game
Saving the player’s game data to an iCloud account
Starting turn-based matches and passing turns between players
Adopt the GKLocalPlayerListener protocol to listen for and handle a variety of Game Center
events for player accounts instead of the individual GKChallengeListener, GKInviteEvent
Listener, GKSavedGameListener, and GKTurnBasedEventListener protocols.
Mentioned in
Overview
Relationships
GameKit / GKLocalPlayerListener
Protocol
GKLocalPlayerListener
A protocol that handles events for Game Center players.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+
iOS, iPadOS, Mac Catalyst, macOS, visionOS
tvOS, watchOS


## Page 28

GKChallengeListener
GKGameActivityListener
GKInviteEventListener
GKSavedGameListener
GKTurnBasedEventListener
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
class GKPlayer
A remote player who the local player running your game can invite and communicate with
through Game Center.
class GKBasePlayer
A class that provides common data and methods for the different player objects.
static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
Inherits From
See Also
Players


## Page 29

A notification that posts when a player object’s data changes.


## Page 30

The object property for this notification is a GKLocalPlayer object. Passing nil provides
standard Notification Center behavior, which is to receive the notification for any object.
static let GKPlayerDidChangeNotificationName: NSNotification.Name
A notification that posts when a player object’s data changes.
Discussion
See Also
GameKit
Foundation
/ NSNotification.Name / GKPlayerAuthenticationDidChangeNotificationName
Type Property
GKPlayerAuthenticationDidChange
NotificationName
A notification that posts after GameKit authenticates the local player.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+
/


## Page 31

static let GKPlayerAuthenticationDidChangeNotificationName:
NSNotification.Name
A notification that posts after GameKit authenticates the local player.
See Also
GameKit
Foundation
/ NSNotification.Name / GKPlayerDidChangeNotificationName
Type Property
GKPlayerDidChangeNotificationName
A notification that posts when a player object’s data changes.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+
/


