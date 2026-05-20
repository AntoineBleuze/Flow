# Activities.pdf

## Page 1

Players discover and engage with games — along with connecting with friends and other players —
through Game Center. Game activities present players with challenges in your game, like collectin
pieces of a puzzle. They offer a way to keep people engaged with your game, and with each othe
By regularly adding new activities — like finding parts of a map and piecing them together to find
buried treasure — you encourage people to explore your game, or play as a team to accomplish a
goal.
Overview
GameKit / Creating activities for your game
Article
Creating activities for your game
Use activities to surface game content to players and encourage them to connect
with each other.


## Page 2

Activities provide a way to link players directly to your content. By describing your gameplay with
activities, you can link the player to that part of your game when they engage with the activity. Fo
example, when a player wants to complete your daily puzzle, you can send the player directly to
that part of your game.
They also provide the Games app with information about what’s happening in your game. The
Games app uses the activity configuration you specify to help drive engagement by deep linking t
your content. You can configure activities with achievements, leaderboards, and challenges. To
learn more about the Games app, see Engage players with the Games app. To learn more about
challenges, see Creating engaging challenges from leaderboards.
Configure activities in Xcode before accessing them in your code and testing locally with Game
Progress Manager. When you’re ready to deploy your configuration, sync your updates with App
Store Connect. For more information about configuring and testing Game Center features, see
Initializing and configuring Game Center.
For each activity you configure, you specify details like how many players it supports, and what
achievement, leaderboard, or challenge to associate the activity with.
The capabilities you choose for an activity depends on the design of your game. For multiplayer
activities, configure whether it supports party codes — a way players invite each other to activitie
You also specify the number of players the activity supports. A challenge supports up to 16 playe
Configure and test game activities


## Page 3

When you configure your activity, you can provide an optional collection of properties that are
specific to your game. For example, you can add custom details about which level an activity is fo
and the difficulty.
Note
Use App Store Connect when you need to remove an activity that you sync. If you already
pushed your configuration changes to App Store Connect, removing an activity from the local
configuration file doesn’t remove it from App Store Connect.
Use the Game Progress Manager to test your activities on your local device before you push the
configuration update to App Store Connect. After selecting a resource that you associate with an
activity, you can open a deep link to verify the behavior of your activity.
For design guidance on game activities, see Human Interface Guidelines > Technologies > Game
Center. To learn more about the information you enter in App Store Connect, see Game Activities
properties.
To retrieve the details of the activities you define you use a GKGameActivityDefinition
object. A definition represents the static metadata that you configure in Xcode or App Store
Connect. You use GKGameActivityDefinition.all to load all of the activities your game
Get the object that represents the activity


## Page 4

defines. If you want to load individual activities, use loadGameActivityDefinitions(IDs:
completionHandler:) and provide the list of activities to load.
After fetching the description of an activity, you can load the associated leaderboards or
achievements that you configure to use with the activity:
A GKGameActivity object represents a single instance of an activity in your game. The GKGame
ActivityListener delegate provides the ability to observe and receive activities from the
system. The delegate provides a single callback that provides the identifier of the activity so you
can route the player to the correct experience.
Handle deep linking through activity listener


## Page 5

When an app receives a deep link, it can contain a party code field on the activity instance. If the
activity supports party codes, check partyCode to retrieve the code players share to join the
activity. When you receive a GKGameActivity from GameKit, the party code you get is valid an
ready to use.
When the framework provides an activity object it contains a party code that’s ready for use. If yo
want to supply your own party code, create an activity description and call start(definition
partyCode:) with the party code.
If your app generates party codes — or your app receives a code from player input — use isVali
PartyCode(_:) to verify that the code is in a valid format.
You can use party codes with either GameKit multiplayer technologies or any alternative
multiplayer solution. If your game adopts GKMatch for Game Center multiplayer matchmaking an
networking, call findMatch(completionHandler:) on the activity object to start the
matchmaking process with the activity’s information. If you use Game Center matchmaking with
your own networking, call findPlayersForHostedMatch(completionHandler:). When
matchmaking, the system matches players together that receive the same party code:
Note
The matchmaking process is similar to using GKMatchmaker directly. If too many people try to
join a game using the same party code, there’s a chance that friends of the inviter might join
different games when exceeding the maximum number of players you set for the match.
Support older operating systems and other platforms by adding a fallbackURL. If the game
activity API isn’t available on the system, players are directed to an invite page on the web when
they open an invite they receive. When the player chooses to join an activity, the system invokes
the fallbackURL you specify for it with the following URL pattern:
startActivityURL
A URL that you provide and host.
activityIdentifier
Add universal link support


## Page 6

The value you specify in your activity definition.
partyCode
A party code you use for matchmaking.
To learn more about universal links, see Supporting universal links in your app.
Use the game activity object to start, pause, and end the activity. When you start a new game
activity, you can start it with a valid party code or just an activity definition. Starting an activity
begins tracking its state.
During gameplay for a round-based activity, you can call end() when players complete the round
to submit score submissions. You associate leaderboards and achievements with the activity by
calling the appropriate methods setScore(on:to:context:) or setProgress(on:to:).
When you set the score on a leaderboard instance, or update the progress on an achievement, th
framework tracks it in real time but doesn’t submit it as an attempt until the player completes the
activity. This is helpful for games that frequently update score or achievement progress and avoid
performing frequent network requests. It’s also helpful to avoid tracking incomplete scores or
attempts. Instead, GameKit queues scores or progress until the player completes the activity.
To complete an activity, call end(). Similarly, when you update the progress of an achievement,
complete the activity for the system to the progress on your behalf.
Start a game activity life cycle
Report progress for an activity


## Page 7

class GKGameActivity
An object that represents a single instance of a game activity for the current game.
class GKGameActivityDefinition
An object that represents the static metadata you define for the activity.
protocol GKGameActivityListener
An object that responds to activity events.
See Also
Activities


## Page 8

Creating activities for your game
init(definition: GKGameActivityDefinition)
Creates a game activity with definition.
class func start(definition: GKGameActivityDefinition) throws -> GKGame
Activity
Creates and starts a game activity with a definition.
class func start(definition: GKGameActivityDefinition, partyCode: Strin
) throws -> GKGameActivity
Creates and starts a new game activity with a custom party code.
Mentioned in
Topics
Creating an activity
Getting the activity definition
GameKit / GKGameActivity
Class
GKGameActivity
An object that represents a single instance of a game activity for the current game
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 9

var activityDefinition: GKGameActivityDefinition
The activity definition that this activity instance is based on.
var state: GKGameActivity.State
The state of the game activity.
enum State
The state of a game activity.
func start()
Starts the game activity if it’s not already started.
func pause()
Pauses the game activity if it’s not already paused.
func resume()
Resumes the game activity if it was paused.
func end()
Ends the game activity if it’s not already ended.
var achievements: Set<GKAchievement>
All achievements that have been associated with this activity.
func removeAchievements([GKAchievement])
Removes all achievements if they exist.
func progress(on: GKAchievement) -> Double
Get the achievement progress from a specific achievement of the local player if previously se
func setProgress(on: GKAchievement, to: Double)
Set a progress for an achievement for a player.
func setAchievementCompleted(GKAchievement)
Set progress to 100% for an achievement for a player.
Getting the activity state
Updating the activity state
Getting and removing achievements


## Page 10

var leaderboardScores: Set<GKLeaderboardScore>
All leaderboard scores that have been associated with this activity.
func score(on: GKLeaderboard) -> GKLeaderboardScore?
Get the leaderboard score from a specific leaderboard of the local player if previously set.
func setScore(on: GKLeaderboard, to: Int)
Set a score of a leaderboard for a player.
func setScore(on: GKLeaderboard, to: Int, context: Int)
Set a score of a leaderboard with a context for a player.
func removeScores(from: [GKLeaderboard])
Removes all scores from leaderboards for a player if exist.
var partyCode: String?
If the game supports party code, this is the party code that can be shared among players to
join the party.
var partyURL: URL?
If the game supports party code, this is the URL that can be shared among players to join the
party.
class var validPartyCodeAlphabet: [String]
Allowed characters for the party code to be used to share this activity.
class func isValidPartyCode(String) -> Bool
Checks whether a party code is in valid format.
var duration: TimeInterval
The total time elapsed while in active state.
var startDate: Date?
The date when the activity was initially started.
Getting and removing leaderboard scores
Getting and verifying the party code
Getting the activity properties


## Page 11

var endDate: Date?
The date when the activity was officially ended.
var creationDate: Date
The date when the activity was created.
var lastResumeDate: Date?
The date when the activity was last resumed.
var properties: [String : String]
Properties that contain additional information about the activity.
var identifier: String
The identifier of this activity instance.
class func checkPendingGameActivityExistence(completionHandler: (Bool) 
> Void)
Checks whether there is a pending activity to handle for the current game.
func makeMatchRequest() -> GKMatchRequest?
Makes a match request object with information from the activity, which you can use to find
matches for the local player.
func findMatch(completionHandler: (GKMatch?, (any Error)?) -> Void)
Use information from the activity to find matches for the local player.
func findPlayersForHostedMatch(completionHandler: ([GKPlayer]?, (any
Error)?) -> Void)
Getting the custom user data
Getting the activity identifiers
Checking for an activity
Creating a matchmaking request
Performing a matchmaking request


## Page 12

Use information from the activity to find server hosted players for the local player.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Creating activities for your game
Use activities to surface game content to players and encourage them to connect with each
other.
class GKGameActivityDefinition
An object that represents the static metadata you define for the activity.
protocol GKGameActivityListener
An object that responds to activity events.
Relationships
Inherits From
Conforms To
See Also
Activities


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

Creating activities for your game
Creating engaging challenges from leaderboards
func player(GKPlayer, wantsToPlay: GKGameActivity, completionHandler: (
Bool) -> Void)
Called when a player intends to play for a specific game activity. A completion handler block
provided to indicate whether the activity was successfully handled.
Mentioned in
Topics
Responding to an activity
Relationships
Inherited By
GameKit / GKGameActivityListener
Protocol
GKGameActivityListener
An object that responds to activity events.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 18

GKLocalPlayerListener
Creating activities for your game
Use activities to surface game content to players and encourage them to connect with each
other.
class GKGameActivity
An object that represents a single instance of a game activity for the current game.
class GKGameActivityDefinition
An object that represents the static metadata you define for the activity.
See Also
Activities


