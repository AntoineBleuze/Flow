# 008_GKMatchmakerViewController.pdf

## Page 1

Finding multiple players for a game
Exchanging data between players in real-time games
Finding players for custom server-based games
Finding players using matchmaking rules
Finding players with similar skill levels
Before you create a GKMatchmakerViewController object, create a GKMatchRequest objec
and configure it according to the parameters of your game. Then pass the match request to the
init(matchRequest:) initializer to create the view controller.
Configure the view controller and set its delegate before you present it to the local player. The vie
controller allows the local player to choose other players and, optionally, fill empty slots using
automatch. If you add the Group Activities capability to your Xcode project, the player can invite
others using SharePlay. See Configuring Group Activities.
Implement the GKLocalPlayerListener and GKMatchmakerViewControllerDelegate
protocols to handle when players send and accept invitations. Implement the player(_:did
Accept:) delegate method to present a GKMatchmakerViewController object, which you
Mentioned in
Overview
GameKit / GKMatchmakerViewController
Class
GKMatchmakerViewController
An interface that allows a player to invite other players to a real-time game and
automatch to fill any empty slots.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

create using the init(invite:) initializer, to the player who accepts an invitation. Then,
implement the matchmakerViewController(_:didFind:) delegate method to dismiss the
view controller and start the game when all players accept their invitations.
In iOS, you present and dismiss the view controller from another view controller in your game, usi
the methods from the UIViewController class. If you use SwiftUI, you can get the root view
controller from the UIApplication object.
For visionOS games, the view controller appears anchored to the window, scene, or view relative 
where you present the view controller. For immersive games, set the parent window to a separate
window group than the immersive space window group.
For macOS games, use the GKDialogController class to present and dismiss the view
controller.
For the complete matchmaking flow with code fragments, see Finding multiple players for a game
init?(matchRequest: GKMatchRequest)
Creates a matchmaker view controller for the local player to start inviting other players.
init?(invite: GKInvite)
Creates a matchmaker view controller to present to a player who accepts an invitation.
var matchRequest: GKMatchRequest
The configuration for the desired match.
var canStartWithMinimumPlayers: Bool
A Boolean value that indicates whether your game can start after a minimum number of
players join a match.
var matchmakingMode: GKMatchmakingMode
The mode that a multiplayer game uses to find players.
enum GKMatchmakingMode
Possible modes that a multiplayer game uses to find matches.
Topics
Creating and configuring the view controller


## Page 3

var matchmakerDelegate: (any GKMatchmakerViewControllerDelegate)?
The object that handles matchmaker view controller changes.
protocol GKMatchmakerViewControllerDelegate
An object that handles when the status of matchmaking changes.
func addPlayers(to: GKMatch)
Invites additional players to join an existing match.
var isHosted: Bool
A Boolean value that indicates whether the match is hosted or peer-to-peer.
func setHostedPlayer(GKPlayer, didConnect: Bool)
Updates the connection status of a player in a hosted game.
func setHostedPlayer(String, connected: Bool)
Updates a player’s status on the view to show that the player has connected or disconnecte
from your server.
Deprecated
func setHostedPlayerReady(String)
Informs the controller that a player has joined a hosted match.
Deprecated
var defaultInvitationMessage: String?
The default invitation message sent to a player.
Deprecated
Setting the delegate
Adding players to matches
Hosting matches
Deprecated
Relationships


## Page 4

NSViewController, UINavigationController
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
Creating real-time games
Inherits From
Conforms To
See Also
Real-time games


## Page 5

Develop games where multiple players interact in real time.
Finding multiple players for a game
Discover and invite other players to participate in a real-time game.
Exchanging data between players in real-time games
Send data between players in a real-time multiplayer game.
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
protocol GKInviteEventListener
A protocol that handles invite events from Game Center.
class GKInvite
An invitation to join a match sent to the local player from another player.
class GKMatch
A peer-to-peer network between a group of players that sign into Game Center.


