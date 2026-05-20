# 000_Connecting players with their friends in your game.pdf

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


