# 003_GKDialogController.pdf

## Page 1

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


## Page 2

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


## Page 3

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


