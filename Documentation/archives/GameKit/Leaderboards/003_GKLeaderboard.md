# 003_GKLeaderboard.pdf

## Page 1

Creating recurring leaderboards
Leaderboards allow players to compare their scores against other players in your game. You
configure a classic or recurring leaderboard in App Store Connect and then access the localized
information for a leaderboard in your code using GKLeaderboard objects.
A classic leaderboard is persistent, that is, the scores never reset unless you delete the
leaderboard. A recurring leaderboard contains scores for a period of time useful for competitions
and encouraging players to try for higher scores. You configure the duration, frequency, and delay
between occurrences that Game Center uses to automatically restart the leaderboard in App Stor
Connect.
In your code, you use the identifier you set for the leaderboard in App Store Connect to submit
scores or load leaderboards. Use the submitScore(_:context:player:leaderboardIDs
completionHandler:) class method to submit a score to one or more leaderboards.
Alternatively, load a recurring leaderboard using the loadLeaderboards(IDs:completion
Handler:) class method and then submit a score using the submitScore(_:context:
player:completionHandler:) method. To learn more about recurring leaderboards, see
Creating recurring leaderboards.
To retrieve information about all leaderboards in your game, use the loadLeaderboards(IDs:
completionHandler:) class method. To fetch the scores for a leaderboard, use the load
Mentioned in
Overview
GameKit / GKLeaderboard
Class
GKLeaderboard
A leaderboard for a game that Game Center stores.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

Entries(for:timeScope:range:completionHandler:) or loadEntries(for:time
Scope:completionHandler:) method. Use the parameters of these methods to filter the
scores to the player’s friends, a rank, and time period when the score occurs.
You must create leaderboard objects using one of the load methods above. If the request is
successful, GameKit passes corresponding GKLeaderboard objects to the handler. GameKit
doesn’t load the images you add to App Store Connect when it loads the leaderboards. Use the
loadImage(completionHandler:) method to get the image for a leaderboard.
var baseLeaderboardID: String
The ID that Game Center uses to identify this leaderboard.
var title: String?
The localized title for the leaderboard.
var type: GKLeaderboard.LeaderboardType
The type of leaderboard, classic or recurring.
enum LeaderboardType
Specifies whether a leaderboard is recurring.
var groupIdentifier: String?
The identifier for the group the leaderboard belongs to.
var startDate: Date?
The date and time a recurring leaderboard occurrence starts accepting scores.
var nextStartDate: Date?
The date and time the next recurring leaderboard occurrence starts accepting scores.
var duration: TimeInterval
The duration from the start date that a recurring leaderboard occurrence accepts scores.
Topics
Accessing Identifier and Type Properties
Accessing Recurring Leaderboard Properties
Loading Leaderboards


## Page 3

class func loadLeaderboards(IDs: [String]?, completionHandler: ([
GKLeaderboard]?, (any Error)?) -> Void)
Loads leaderboards for the specified leaderboard IDs that Game Center uses.
func loadPreviousOccurrence(completionHandler: (GKLeaderboard?, (any
Error)?) -> Void)
Loads the previous recurring leaderboard occurrence that the player submits a score to.
func loadImage(completionHandler: ((UIImage?, (any Error)?) -> Void)?)
Loads the image for the leaderboard.
class func submitScore(Int, context: Int, player: GKPlayer, leaderboard
IDs: [String], completionHandler: ((any Error)?) -> Void)
Submits a score to multiple leaderboards.
func submitScore(Int, context: Int, player: GKPlayer, completionHandler
((any Error)?) -> Void)
Submits a score to the leaderboard.
func loadEntries(for: GKLeaderboard.PlayerScope, timeScope:
GKLeaderboard.TimeScope, range: NSRange, completionHandler: (
GKLeaderboard.Entry?, [GKLeaderboard.Entry]?, Int, (any Error)?) -> Voi
)
Returns the scores for the local player and other players for the specified type of player, time
period, and ranks.
func loadEntries(for: [GKPlayer], timeScope: GKLeaderboard.TimeScope,
completionHandler: (GKLeaderboard.Entry?, [GKLeaderboard.Entry]?, (any
Error)?) -> Void)
Returns the scores for the local player and other players for the specified time period.
enum PlayerScope
Specifies the type of players for filtering data.
enum TimeScope
Loading Leaderboard Images
Submitting Scores
Loading Scores


## Page 4

Specifies the time period for filtering data.
class Entry
Information about a single score by a player on a leaderboard.
Deprecated symbols
Review unsupported symbols and their replacements.
var activityIdentifier: String
The identifier of the game activity associated with this leaderboard, as configured by the
developer in App Store Connect.
var activityProperties: [String : String]
The properties when associating this leaderboard with a game activity, as configured by the
developer in App Store Connect.
var isHidden: Bool
A Boolean value that indicates whether the current leaderboard isn’t visible in Game Center
views.
var leaderboardDescription: String
The description of this Leaderboard as configured by the developer in App Store Connect.
var releaseState: GKReleaseState
The release state of the leaderboard in App Store Connect.
NSObject
CVarArg
Deprecated
Instance Properties
Relationships
Inherits From
Conforms To


## Page 5

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Encourage progress and competition with leaderboards
Let players measure their own progress and compare their skills with friends and others.
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule.
Adding Recurring Leaderboards to Your Game
Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.
class GKLeaderboardScore
Information about a player’s score on a leaderboard.
See Also
Leaderboards


