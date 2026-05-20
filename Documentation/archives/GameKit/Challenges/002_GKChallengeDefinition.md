# 002_GKChallengeDefinition.pdf

## Page 1

Creating engaging challenges from leaderboards
var title: String
A short title for the challenge definition.
var details: String?
A more detailed description of the challenge definition.
func loadImage(completionHandler: (UIImage?, (any Error)?) -> Void)
Loads the image set on the challenge definition, which may be nil if none was set.
var durationOptions: [DateComponents]
The duration options for the challenge, like 1 day or 1 week.
Mentioned in
Topics
Getting the display properties and image
Getting the challenge rules
GameKit / GKChallengeDefinition
Class
GKChallengeDefinition
An object that represents the static metadata you define for the challenge.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

var isRepeatable: Bool
Indicates if a challenge can be attempted more than once.
var leaderboard: GKLeaderboard?
Scores submitted to this leaderboard will also be submitted as scores in this challenge.
var releaseState: GKReleaseState
The release state of the challenge definition in App Store Connect.
struct GKReleaseState
Describes the release state of an App Store Connect resource, such as an Achievement or
Leaderboard.
var groupIdentifier: String?
The group identifier for the challenge definition, if one exists.
var identifier: String
The developer defined identifier for a given challenge definition.
class func loadChallengeDefinitions(completionHandler: ([GKChallenge
Definition]?, (any Error)?) -> Void)
Loads all the challenge definitions for the current game, returns an empty array if none exist
func hasActiveChallenges(completionHandler: (Bool, (any Error)?) -> Voi
)
Indicates if this definition has active challenges associated with it.
Getting the leaderboard
Getting the release state
Getting the identifier properties
Loading challenge definitions
Checking for active challenges


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Creating engaging challenges from leaderboards
Encourage friendly competition by adding challenges to your game.
Choosing a leaderboard for your challenges
Understand what gameplay works well when configuring challenges in your game.
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Relationships
Inherits From
Conforms To
See Also
Challenges


