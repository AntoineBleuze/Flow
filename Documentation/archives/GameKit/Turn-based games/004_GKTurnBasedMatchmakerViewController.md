# 004_GKTurnBasedMatchmakerViewController.pdf

## Page 1

Starting turn-based matches and passing turns between players
Before you create a GKTurnBasedMatchmakerViewController object, create a GKMatch
Request object and configure it according to the parameters of your game. Then, pass the matc
request to the init(matchRequest:) initializer to create the view controller.
Configure the view controller and set its delegate before you present it to the local player. The vie
controller allows the local player to choose other players and optionally fill empty slots using
automatch. The interface also allows players to select an existing match, forfeit a match, or view a
completed match.
Implement the GKTurnBasedMatchmakerViewControllerDelegate protocol to handle whe
a player selects players, cancels matchmaking, or encounters an error. Implement the turnBase
MatchmakerViewController(_:didFind:) delegate method to dismiss the view controller
when the local player invites players.
Register as a listener of the GKLocalPlayerListener protocol and implement GKTurnBased
EventListener methods that handle other turn-based events. For example, implement the
player(_:receivedTurnEventFor:didBecomeActive:) to update match data and prese
the gameplay interface for the local player to take their turn.
Mentioned in
Overview
GameKit / GKTurnBasedMatchmakerViewController
Class
GKTurnBasedMatchmakerViewController
An interface that allows a player to invite other players to a turn-based match and
automatch to fill any empty slots.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

In iOS, you present and dismiss the view controller from another view controller in your game, usi
the methods provided by the UIViewController class. If you use SwiftUI, you can get the root
view controller from the UIApplication object. In macOS, you use the GKDialogControlle
class to present and dismiss the view controller.
init(matchRequest: GKMatchRequest)
Creates a matchmaker view controller for the local player to start inviting other players to a
turn-based game.
var showExistingMatches: Bool
A Boolean value that determines whether the view controller shows existing matches.
var matchmakingMode: GKMatchmakingMode
The mode that a multiplayer game uses to find players.
enum GKMatchmakingMode
Possible modes that a multiplayer game uses to find matches.
var turnBasedMatchmakerDelegate: (any GKTurnBasedMatchmakerView
ControllerDelegate)?
The object that handles turn-based matchmaker view controller changes.
protocol GKTurnBasedMatchmakerViewControllerDelegate
A protocol that handles when the status of turn-based matchmaking changes.
NSViewController, UINavigationController
Topics
Creating and Configuring the View Controller
Setting the Delegate
Relationships
Inherits From
Conforms To


## Page 3

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKViewController
Hashable
NSCoding
NSEditor
NSExtensionRequestHandling
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Creating turn-based games
Develop games where multiple players take turns and can exchange data while waiting for
their turn.
Starting turn-based matches and passing turns between players
Let Game Center store and forward match data between players in a turn-based game.
Sending messages to players in turn-based games
See Also
Turn-based games


## Page 4

Notify players of match events by sending messages and game data.
Exchanging data between players in turn-based games
Add the ability for players to exchange game data and send messages while waiting for their
turns.
class GKTurnBasedMatch
An object that encapsulates the match data for games where players take turns.
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


