# Game Center interfaces.pdf

## Page 1

You can add an access point to your game that provides a way for players to manage their profile,
and view leaderboards, achievements, and challenges.
The access point initially shows player highlights, like how many achievements they’ve earned and
where they stand in leaderboards. Then the access point collapses into the player’s avatar and
remains on your game’s screen. When the player taps or clicks the avatar, GameKit displays the
dashboard so players can drill down into the details of their Game Center data, including more
highlights and statistics. You can choose where to display the access point, and select the
highlights to display.
You can also display the dashboard on its own, or a particular section of the dashboard. For more
information, see Displaying the Game Center dashboard. For design guidance, see Human
Interface Guidelines > Technologies > Game Center > Access point.
Overview
GameKit / Adding an access point to your game
Article
Adding an access point to your game
Provide your users a convenient connection to the Game Center dashboard.


## Page 2

You can place the access point in a corner of the screen and choose whether to show highlights
when the access point first appears, such as the number of achievements or the player’s rank on
the default leaderboard. Start by obtaining the shared GKAccessPoint object using the shared
class property.
If you don’t want the access point to appear on the main window, set it to another window using t
parentWindow property. For example, set the parent window to your title screen or main menu.
For volumetric games on visionOS, you need to set the parent window for the access point to
appear. For immersive games on visionOS, it appears below the HUD and in front of the person by
default.
Use the location property to set the corner in which the access point appears. The default
location is the upper-left corner (GKAccessPoint.Location.topLeading). For volumetric an
immersive games on visionOS, if you don’t set the parent window, GameKit ignores the locatio
property (see Configure the access point on visionOS).
For right-to-left languages, such as Arabic and Hebrew, the system flips the location. For example
GKAccessPoint.Location.topLeading specifies the upper-right corner and GKAccess
Point.Location.bottomLeading specifies the bottom-left corner.
To display highlights when the access point appears, set the showHighlights property to true
When you’re done configuring the access point, set the isActive property to true:
Hide the access point when displaying game intros or settings. To give your players a consistent
experience, see Access Point in the Human Interface Guidelines.
You can observe access point properties to adjust your game when the access point either
changes sizes or just before it presents the dashboard.
Configure the access point
Adapt your game to the access point


## Page 3

To adjust your graphics when the access point size changes (for example, while it displays
highlights), observe the frameInScreenCoordinates property. Be sure to convert the screen
coordinates of the access point to your view’s coordinates.
To make changes to your game before the player interacts with the dashboard, observe the is
PresentingGameCenter property. For example, you should pause animations when the player
clicks or taps the access point to display the dashboard.
Change the focus and display the dashboard
programmatically


## Page 4

If you handle the input from an Apple TV remote and game controller yourself, you need to
programmatically change the focus to the access point and display the dashboard when the playe
taps or clicks it.
You can use the frameInScreenCoordinates property to change the focus when the player
navigates the area behind the access point:
Then use the trigger(state:handler:) method to show the dashboard when the player
selects the access point.
The location of the access point and dashboard varies depending on the type of visionOS game. T
change the default behavior below, set the location and parentWindow properties before you
set isActive to true. For example, if you don’t set the parent window of volumetric games, the
access point doesn’t appear.
Type
Access point behavior
Compatible
Appears over the main or parent window in the specified location.
Native
Appears outside of the main or parent window in the specified location.
Volumetric
If the parent window is non-nil, appears outside of it in the specified location. If
the parent window is nil (the default value), it doesn’t appear.
Immersive
If the parent window is non-nil, appears outside of it in the specified location. If
the parent window is nil (the default value), it appears below the HUD in front of
the person and tracks their head position.
For all types of visionOS games, when the person displays the dashboard using the access point,
appears in a separate floating container app that the person can position in the space. However, i
you use the GKGameCenterViewController class to present the dashboard (see Displaying t
Game Center dashboard), it appears anchored to the window, scene, or view relative to where you
present the view controller.
Configure the access point on visionOS


## Page 5

Displaying the Game Center dashboard
Provide an interface for players to navigate to their Game Center data from your game.
class GKAccessPoint
An object that allows players to view and manage their Game Center information from within
your game.
class GKDialogController
An object that provides the ability to present the dashboard in macOS games.
protocol GKViewController
The abstract base protocol adopted by GameKit view controller classes.
See Also
Game Center interfaces


## Page 6

The dashboard provides a central location from which players can browse and manage their Gam
Center data. The player can access information about their profile, as well as leaderboards,
achievements, and challenges. The dashboard also displays highlights in these areas as the playe
navigate.
Use the GKGameCenterViewController class to present the dashboard in a specific state —
such as the main dashboard,_ _from which the player can navigate to any area, including the play
profile or a list of leaderboards. For visionOS games, the dashboard appears anchored to the
window, scene, or view relative to where you present the view controller.
Alternatively, to add the access point to a fixed location in your game that allows the player to ope
the dashboard whenever they want, see Adding an access point to your game.
Overview
GameKit / Displaying the Game Center dashboard
Article
Displaying the Game Center dashboard
Provide an interface for players to navigate to their Game Center data from your
game.


## Page 7

For design guidance, see Human Interface Guidelines > Technologies > Game Center > Custom
dashboard links.
To display the main dashboard, pass dashboard as the state parameter to the init(state:)
method when you create the view controller, set the delegate of the view controller to your object
and then present it:
In the profile area, the player can see their achievements, find friends, and see what games their
friends are playing. They can also edit their Game Center settings, such as their nickname and
avatar.
To present the local player’s profile, pass localPlayerProfile as the state parameter to the
init(state:) method:
Present the main dashboard
Show the player’s profile


## Page 8

You can display a list of leaderboards in the dashboard that allows the player to navigate to the
leaderboards they want to see. When the player selects a leaderboard, the dashboard displays th
details for that leaderboard.
To present a list of leaderboards, pass leaderboards as the state parameter to the
init(state:) method:
You can present a specific leaderboard in the dashboard that allows players to see how they rank
against friends, players with whom they played recently, and players from all over the world. They
can use the filter in the header area to adjust the scope of the leaderboard by a time period, or
show a specific occurrence of a recurring leaderboard. They can scroll to the top of the list by
tapping on the name in the header.
Present the list of leaderboards
Display a single leaderboard


## Page 9

To present a single leaderboard, pass the leaderboard ID (the identifier you entered in App Store
Connect when creating the leaderboard) along with the player scope and time scope when you
create the view controller:
The player can filter and scope scores by player (Friends, Recent, or Global) and time period (for
example, All Time).
You can show the player a list of achievements they received and achievements they’ve yet to
complete. An achievement is a collectible item indicating that the player successfully reached a
particular goal in your game. In the dashboard, an achievement appears as either locked, in-
progress, completed, or hidden.
Display the player’s achievements


## Page 10

To present the achievements, pass achievements as the state parameter to the init(state:
method:
Implement the gameCenterViewControllerDidFinish(_:) delegate method in the GKGam
CenterControllerDelegate protocol to dismiss the dashboard when the player closes it.
Adding an access point to your game
Provide your users a convenient connection to the Game Center dashboard.
class GKAccessPoint
Dismiss the dashboard
See Also
Game Center interfaces


## Page 11

An object that allows players to view and manage their Game Center information from within
your game.
class GKDialogController
An object that provides the ability to present the dashboard in macOS games.
protocol GKViewController
The abstract base protocol adopted by GameKit view controller classes.


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

For macOS games, use a GKDialogController object to present the dashboard from which
players can browse and manage their Game Center data.
Initialize a new GKGameCenterViewController object, as you would for an iOS game,
specifying the state and setting its delegate. Then get the singleton dialog controller using the
shared() class method, or initialize a new GKDialogController object.
To present the dashboard, set the parentWindow property to the window that should display th
dashboard and then call the present(_:) method, passing the GKGameCenterView
Controller object.
When the player closes the dashboard, GameKit calls the gameCenterViewControllerDid
Finish(_:) delegate method. Implement this method to dismiss the shared dialog controller
Overview
GameKit / GKDialogController
Class
GKDialogController
An object that provides the ability to present the dashboard in macOS games.
macOS 10.8+


## Page 17

using the dismiss(_:) method.
class func shared() -> GKDialogController
Retrieves the shared instance of the dialog controller.
var parentWindow: NSWindow?
The window that displays the dashboard.
func present(any NSViewController & GKViewController) -> Bool
Presents the dashboard in the window.
func dismiss(Any)
Dismisses the dashboard.
NSResponder
CVarArg
Topics
Accessing the Shared Dialog Controller
Setting the Presentation Window
Presenting and Dismissing the Dialog
Relationships
Inherits From
Conforms To


## Page 18

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Sendable
SendableMetatype
Adding an access point to your game
Provide your users a convenient connection to the Game Center dashboard.
Displaying the Game Center dashboard
Provide an interface for players to navigate to their Game Center data from your game.
class GKAccessPoint
An object that allows players to view and manage their Game Center information from within
your game.
protocol GKViewController
The abstract base protocol adopted by GameKit view controller classes.
See Also
Game Center interfaces


## Page 19

GKAchievementViewController
GKChallengesViewController
GKFriendRequestComposeViewController
GKGameCenterViewController
GKLeaderboardViewController
GKMatchmakerViewController
GKTurnBasedMatchmakerViewController
Adding an access point to your game
Provide your users a convenient connection to the Game Center dashboard.
Displaying the Game Center dashboard
Provide an interface for players to navigate to their Game Center data from your game.
Relationships
Conforming Types
See Also
Game Center interfaces
GameKit / GKViewController
Protocol
GKViewController
The abstract base protocol adopted by GameKit view controller classes.
macOS 10.8+


## Page 20

class GKAccessPoint
An object that allows players to view and manage their Game Center information from within
your game.
class GKDialogController
An object that provides the ability to present the dashboard in macOS games.


