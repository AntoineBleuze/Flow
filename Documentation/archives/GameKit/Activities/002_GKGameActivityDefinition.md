# 002_GKGameActivityDefinition.pdf

## Page 1

Creating activities for your game
var title: String
A short title for the game activity.
var details: String?
A more detailed description of the game activity.
var defaultProperties: [String : String]
Default properties defined by the developer for this type of game activity.
func loadImage(completionHandler: (UIImage?, (any Error)?) -> Void)
Asynchronously load the image. Error will be nil on success.
Mentioned in
Topics
Getting the display properties and image
Getting the activity capabilities
GameKit / GKGameActivityDefinition
Class
GKGameActivityDefinition
An object that represents the static metadata you define for the activity.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

var supportsPartyCode: Bool
Whether the activity can be joined by others via a party code.
var supportsUnlimitedPlayers: Bool
True if the activity supports an unlimited number of players. False if maxPlayers is set to a
defined limit or if no player range is provided.
var playerRange: (any RangeExpression)?
The range of players supported by this type of game activity.
var playStyle: GKGameActivityPlayStyle
The play style of the game activity.
enum GKGameActivityPlayStyle
Play Style of the game activity. It can be either Asynchronous or Synchronous.
var fallbackURL: URL?
A fallback URL that can be used to construct a game-specific URL for players to share or join
if the joining device does not support the default URL.
var releaseState: GKReleaseState
The release state of the game activity definition in App Store Connect.
struct GKReleaseState
Describes the release state of an App Store Connect resource, such as an Achievement or
Leaderboard.
var identifier: String
The developer defined identifier for a given game activity.
var groupIdentifier: String?
The group identifier for the activity, if one exists.
Getting the fallback URL
Getting the release state
Getting the identifier properties
Loading activity definitions


## Page 3

class func loadGameActivityDefinitions(completionHandler: ([GKGame
ActivityDefinition]?, (any Error)?) -> Void)
Loads all the game activity definitions for the current game.
func loadAchievementDescriptions(completionHandler: ([GKAchievement
Description]?, (any Error)?) -> Void)
Loads all associated achievements that have defined deep links to this game activity
definition.
func loadLeaderboards(completionHandler: ([GKLeaderboard]?, (any Error
)?) -> Void)
Loads all associated leaderboards that have defined deep links to this game activity definitio
class func loadGameActivityDefinitions(IDs: [String]?, completionHandle
: ([GKGameActivityDefinition]?, (any Error)?) -> Void)
Loads game activity definitions with the supplied App Store Connect identifiers.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
Loading achievement descriptions
Loading leaderboards
Type Methods
Relationships
Inherits From
Conforms To


## Page 4

SendableMetatype
Creating activities for your game
Use activities to surface game content to players and encourage them to connect with each
other.
class GKGameActivity
An object that represents a single instance of a game activity for the current game.
protocol GKGameActivityListener
An object that responds to activity events.
See Also
Activities


