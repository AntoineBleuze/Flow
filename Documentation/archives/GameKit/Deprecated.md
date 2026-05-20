# Deprecated.pdf

## Page 1

class GKAchievementViewController
An GKAchievementViewController object provides a standard user interface to display
achievement progress for the local player. If the GKGameCenterViewController class is
available, you should use it instead.
Deprecated
class GKChallengeEventHandler
The GKChallengeEventHandler class is used to respond to events related to challenges
sent or received by the local player.
Deprecated
class GKChallengesViewController
Deprecated
class GKChallenge
A challenge issued by the local player to another player.
Deprecated
class GKScoreChallenge
A type of challenge where a player must beat the leaderboard score of another player.
Deprecated
class GKAchievementChallenge
A type of challenge where a player must earn another player’s achievement.
Deprecated
Topics
Deprecated classes
GameKit / Deprecated symbols
API Collection
Deprecated symbols
Review unsupported symbols and their replacements.


## Page 2

class GKCloudPlayer
The object representing the currently signed-in iCloud user.
Deprecated
class GKGameCenterViewController
The dashboard that allows players to access their Game Center data in your game.
Deprecated
class GKGameSession
A game session you can use to save game data, invite other players, and create turn-based
and real-time game apps.
Deprecated
class GKGameSessionSharingViewController
A user interface you can use to invite other users into a tvOS game session.
Deprecated
class GKFriendRequestComposeViewController
Your game uses the GKFriendRequestComposeViewController class to present a
screen that allows the local player to send friend requests to other players.
Deprecated
class GKLeaderboardViewController
The GKLeaderboardViewController class provides a standard user interface that
displays leaderboard scores to the player. If the GKGameCenterViewController class is
available, you should use it instead.
Deprecated
class GKPeerPickerController
Provides a standard user interface to allow one iOS device to discover and connect to anoth
Deprecated
class GKScore
An object containing information for a score that was earned by the player.
Deprecated
class GKSession
A GKSession object provides the ability to discover and connect to nearby iOS devices usin
Bluetooth or Wi-fi.
Deprecated
class GKTurnBasedEventHandler


## Page 3

The GKTurnBasedEventHandler class is used to respond to important messages related
to turn-based matches. To use it, call the shared() class method to get the singleton
instance and assign an object that implements the GKTurnBasedEventHandlerDelegat
protocol to its delegate property. All methods are called on the main thread.
Deprecated
class GKVoiceChat
A voice channel that allows players to speak with each other in a multiplayer game.
Deprecated
class GKVoiceChatService
The GKVoiceChatService class allows your application to connect two iOS devices into a
voice chat.
Deprecated
class GKNotificationBanner
A Game Center-style banner that displays a message to the local player.
Deprecated
protocol GKAchievementViewControllerDelegate
An object implementing the GKAchievementViewControllerDelegate protocol is calle
when the user dismisses the achievements view controller. Typically, this protocol is
implemented by the object in your game that originally displayed the achievements user
interface.
Deprecated
protocol GKChallengeEventHandlerDelegate
You implement the GKChallengeEventHandlerDelegate delegate to control how
challenges are displayed in your game.
Deprecated
protocol GKChallengesViewControllerDelegate
Deprecated
protocol GKChallengeListener
An object that responds to challenge events.
Deprecated
protocol GKFriendRequestComposeViewControllerDelegate
The GKFriendRequestComposeViewControllerDelegate protocol is implemented by
delegates of the GKFriendRequestComposeViewController class. The delegate is
Deprecated protocols


## Page 4

called when the player dismisses the friend request.
Deprecated
protocol GKGameSessionEventListener
An event listener that handles game session events.
Deprecated
protocol GKLeaderboardViewControllerDelegate
The GKLeaderboardViewControllerDelegate protocol is implemented by delegates o
the GKLeaderboardViewController class. The delegate is called when the player
dismisses the leaderboard.
Deprecated
protocol GKPeerPickerControllerDelegate
The GKPeerPickerControllerDelegate protocol is implemented on an object to
customize the behavior of a GKPeerPickerController object. The delegate is called by
the peer picker to create a session object and to respond as the session is configured by the
controller.
Deprecated
protocol GKSessionDelegate
An object implements the GKSessionDelegate protocol to control the behavior of a
GKSession object. The delegate is called when other visible peers change their state relativ
to the session. It is also called to determine whether another peer is allowed to connect to th
session.
Deprecated
protocol GKTurnBasedEventHandlerDelegate
The GKTurnBasedEventHandlerDelegate protocol is implemented by an object to
receive notifications events for turn-based matches. All methods are called on the main
thread.
Deprecated
protocol GKVoiceChatClient
The GKVoiceChatClient protocol is implemented to control the behavior of the GKVoice
ChatService object. The voice chat client has a number of responsibilities:
Deprecated
struct GKVoiceChatServiceError
Deprecated
struct GKSessionError
Deprecated
Deprecated structures


## Page 5

struct GKGameSessionError
Error codes for the game session domain.
Deprecated
let GKGameSessionErrorDomain: String
The error domain for game sessions.
Deprecated
let GKSessionErrorDomain: String
An error occurred in GKSession.
Deprecated
let GKVoiceChatServiceErrorDomain: String
An error occurred in GKVoiceChatService.
Deprecated
enum Code
Error codes for the game session domain.
Deprecated
enum GKPeerConnectionState
The state of a peer known to the session.
Deprecated
enum GKPeerPickerConnectionType
Network connections available to the peer picker dialog.
Deprecated
enum GKSendDataMode
The mechanism used to transmit data to other peers.
Deprecated
enum Code
Error codes for the session error domain.
Deprecated
struct GKSessionError
Deprecated
Deprecated constants
Deprecated enumerations


## Page 6

enum GKSessionMode
Modes that determine how a session interacts with other peers.
Deprecated
enum Code
Error codes for the voice chat service error domain.
Deprecated
struct GKVoiceChatServiceError
Deprecated


