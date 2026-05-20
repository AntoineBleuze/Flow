# 005_GKLeaderboardScore.pdf

## Page 1

A GKLeaderboardScore object represents a score on a leaderboard for scores you report for
challenges or turn-based games.
When you create a GKLeaderboardScore object, set the leaderboardID property to the
associated leaderboard, the player property to the player who earns the score, and the value
property to the score. Make sure the score is compatible with the score format that you configure
in App Store Connect.
Then use either the report(_:withEligibleChallenges:withCompletionHandler:) o
endMatchInTurn(withMatch:leaderboardScores:achievements:completion
Handler:) GKTurnBasedMatch method to report one or more scores.
For details about the score format, see Configure leaderboards in App Store Connect Help.
var context: Int
An integer value that your game uses.
Overview
Topics
Accessing Properties
GameKit / GKLeaderboardScore
Class
GKLeaderboardScore
Information about a player’s score on a leaderboard.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 2

var leaderboardID: String
The ID that Game Center uses for the leaderboard.
var player: GKPlayer
The player who earns the score.
var value: Int
The score that the player earns.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Encourage progress and competition with leaderboards
Let players measure their own progress and compare their skills with friends and others.
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule.
Adding Recurring Leaderboards to Your Game
Relationships
Inherits From
Conforms To
See Also
Leaderboards


## Page 3

Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.


