# 002_GKAccessPoint.pdf

## Page 1

Adding an access point to your game
The access point displays a control in a corner of your game that opens a Game Center dashboar
when the player taps or clicks it.
Use the shared property to get the shared access point object. GameKit attaches the access
point to the window you specify in the parentWindow property, in the corner you specify using
the location property. If you don’t specify a parent window, GameKit infers an appropriate
location. For the location of the access point on visionOS, see Configure the access point on
visionOS.
To display highlights, set the showHighlights property to true. Then set isActive to true 
display the access point control.
Mentioned in
Overview
Topics
Getting the shared access point
GameKit / GKAccessPoint
Class
GKAccessPoint
An object that allows players to view and manage their Game Center information
from within your game.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 2

class var shared: GKAccessPoint
The shared access point object.
var location: GKAccessPoint.Location
The corner of the screen to display the access point.
enum Location
Specifies the corner of the screen to display the access point.
var frameInScreenCoordinates: CGRect
The frame of the access point in screen coordinates.
var parentWindow: UIWindow?
The window that contains the access point.
var isActive: Bool
A Boolean value that determines whether to display the access point.
var isPresentingGameCenter: Bool
A Boolean value that indicates whether the game is presenting the Game Center dashboard.
var isVisible: Bool
A Boolean value that indicates whether the access point is visible.
var showHighlights: Bool
A Boolean value that indicates whether to display highlights for achievements and current
ranks for leaderboards.
Deprecated
var isFocused: Bool
A Boolean value that indicates whether the access point is in focus on tvOS.
func trigger(handler: () -> Void)
Displays the Game Center dashboard as if the player taps or presses the access point.
Managing the location
Displaying the access point
Managing the access point


## Page 3

func trigger(state: GKGameCenterViewControllerState, handler: () -> Voi
)
Displays the Game Center dashboard in the specified state as if the player taps or presses th
access point.
func trigger(player: GKPlayer, handler: (() -> Void)?)
Displays the Game Center dashboard in a state that shows a player profile.
func trigger(achievementID: String, handler: (() -> Void)?)
Displays the Game Center dashboard in a state that shows a specific achievement.
func trigger(leaderboardID: String, playerScope: GKLeaderboard.Player
Scope, timeScope: GKLeaderboard.TimeScope, handler: (() -> Void)?)
Displays the Game Center dashboard in a state that shows a specific leaderboard.
func trigger(leaderboardSetID: String, handler: (() -> Void)?)
Displays the Game Center dashboard in a state that shows a specific leaderboard set.
func trigger(challengeDefinitionID: String, handler: (() -> Void)?)
Displays the challenge creation view for the provided challenge definition ID.
func trigger(gameActivity: GKGameActivity, handler: (() -> Void)?)
func trigger(gameActivity: GKGameActivity, handler: (() -> Void)?)
Displays the game activity view for the provided activity instance.
func trigger(gameActivityDefinitionID: String, handler: (() -> Void)?)
Displays the game activity creation view for the provided activity definition ID.
func trigger(gameActivityDefinitionID: String, handler: (() -> Void)?)
func triggerForArcade(handler: (() -> Void)?)
Brings up the Arcade dashboard.
func triggerForChallenges(handler: (() -> Void)?)
Displays the view that allows players to engage each other with challenges.
func triggerForFriending(handler: (() -> Void)?)
Brings up the invite friends view.
func triggerForPlayTogether(handler: (() -> Void)?)
Instance Methods


## Page 4

Displays the view that allows players to engage each other with activities and challenges.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Adding an access point to your game
Provide your users a convenient connection to the Game Center dashboard.
Displaying the Game Center dashboard
Provide an interface for players to navigate to their Game Center data from your game.
class GKDialogController
An object that provides the ability to present the dashboard in macOS games.
protocol GKViewController
The abstract base protocol adopted by GameKit view controller classes.
Relationships
Inherits From
Conforms To
See Also
Game Center interfaces


