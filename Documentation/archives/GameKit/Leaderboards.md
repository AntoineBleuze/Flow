# Leaderboards.pdf

## Page 1

Use leaderboards to record player scores, which they can view in their Game Center account and
directly in your game using built-in Game Center or custom interfaces. Game Center even
encourages engagement by notifying players when their friends pass their scores.
Overview
GameKit / Encourage progress and competition with leaderboards
Article
Encourage progress and competition with
leaderboards
Let players measure their own progress and compare their skills with friends and
others.


## Page 2

You configure a classic or recurring leaderboard in Xcode and submit scores from your code. A
classic leaderboard retains the scores until you delete the leaderboard. A recurring leaderboard
automatically resets the board on the intervals you specify. For example, use a classic leaderboar
for the best all-time scores and a recurring leaderboard for periodic competitions.
You can also combine individual leaderboards into sets, creating a hierarchy of leaderboards. For
example, use leaderboard sets to aggregate the scores from different levels and configurations in
your game. However, once you add a leaderboard set, you need to organize all other individual
leaderboards into sets.
For design guidance on all types of leaderboards, see Human Interface Guidelines > Technologies
> Game Center > Leaderboards. For additional information on recurring leaderboards, see Creatin
recurring leaderboards.
Configure leaderboards in Xcode before accessing them in your code and testing locally with Gam
Progress Manager. When you’re ready to deploy your configuration, sync your updates with App
Store Connect. For more information about configuring and testing Game Center features, see
Initializing and configuring Game Center.
For each leaderboard you configure, you specify details like the score format, submission type, an
whether the data resets and starts again after a period of time. Decide on a style for your
leaderboard identifiers, because you won’t be able to change them at a later time. Before you
begin, have at least one localized name and image, which Game Center presents to the player,
ready to upload for a language.
Configure and test leaderboards and leaderboard
sets


## Page 3

A leaderboard set organizes many leaderboards into a single unit. For example, for a game with
many levels, use a leaderboard set to organize the leaderboards for each level. You can have up t
100 leaderboards without using leaderboard sets. When you use leaderboard sets, you can have 
to 500 leaderboards across 100 leaderboard sets.
Important
You must have at least one leaderboard for your app before you can create a leaderboard set.
If you choose to use leaderboard sets, you must include all future leaderboards in a
leaderboard set.
If you add a leaderboard to an unreleased version of your game or sign the game with a
development certificate, Game Center annotates the leaderboard with a prerelease indicator. To
change a leaderboard’s app version, see Add leaderboards to an app version.
Note
If you’ve already pushed your configuration changes to App Store Connect, removing a
leaderboard or leaderboard set from the local configuration file doesn’t remove the
leaderboard or leaderboard set from App Store Connect.
Use the Game Progress Manager to test leaderboards on your local device before you push the
configuration update to App Store Connect. After selecting a leaderboard, you can add players to


## Page 4

the leaderboard with score value. You can also test deep-linking behavior that you associate with 
leaderboard.
For more information about the leaderboard properties you can configure, see Leaderboard
properties.
Game Center formats the scores that you submit as integer values depending on the leaderboard
configuration you enter in Xcode. On the Add Leaderboard page, choose a score format — such a
fixed points, elapsed time, or money — that makes sense for your game. For example, if you choo
these formats, Game Center formats the values as follows:
Score format type
Score value
Format result
Fixed Point - To 1 Decimal
1234
123.4
Fixed Point - To 2 Decimals
5678
56.78
Fixed Point - To 3 Decimals
10,000
10.000
Elapsed Time - To the Minute
3623 (seconds)
60:23
Elapsed Time - To the Second
10,000 (seconds)
2:46:40
Elapsed Time - To the Hundredth of a Second
10,000 (centiseconds)
0:01:40:00
Choose a score format


## Page 5

Score format type
Score value
Format result
Money - Whole Numbers
123
$123
Money - To 2 Decimals
141
$1.41
Optionally, enter a range of allowable values in the Score Range fields that matches the score
format. For elapsed time values, enter a range in seconds or centiseconds (Elapsed Time - To the
Hundredth of a Second). For example, if you choose Elapsed Time - To the Minute and want the
maximum value to be 10 minutes, enter 600 seconds in the To field. Then check whether the
formatted range values that appear below the range text fields are in the score format you want.
Add a unit to the score format or choose a currency
symbol


## Page 6

You can further format the scores when you add a language to the leaderboard configuration in
Xcode. You need to add at least one language to save the leaderboard configuration.
On the Add Language page, append a unit to the score that Game Center formats, such as pts,
lbs, or meters, by entering the localized strings for the units in the Score Format Suffix text
fields. For money values, you can choose a localized currency symbol from the Score Format
menu.
To submit a score to one or more leaderboards, use the GKLeaderboard submitScore(_:
context:player:leaderboardIDs:completionHandler:) class method. Pass one or
more leaderboard IDs, as well as the score, context, and player.
If you load all leaderboards using the GKLeaderboard loadLeaderboards(IDs:completio
Handler:) class method, as the next section describes, you can submit the score to specific
leaderboards using the submitScore(_:context:player:completionHandler:) instanc
method.
Optionally, use the context parameter in both of these methods to store game-specific
information. For example, pass a flag that contains information about how the player earned the
score, such as the vehicle they drive in a racing game.
If you prefer to submit scores through your own server, see Game Center leaderboards scores.
To fetch one or more individual leaderboards, pass the leaderboard IDs to the GKLeaderboard
loadLeaderboards(IDs:completionHandler:) class method.
To fetch specific occurrences of a recurring leaderboard, use the loadPrevious
Occurrence(completionHandler:) instance method.
Submit scores to leaderboards
Fetch leaderboards and leaderboard sets


## Page 7

To fetch leaderboard sets, use the GKLeaderboardSet loadLeaderboardSets(completio
Handler:) class method. Then to fetch individual leaderboards in a set, use the load
Leaderboards(handler:) instance method.
To load the scores that the local player and others earn from a leaderboard, use the
GKLeaderboard loadEntries(for:timeScope:range:completionHandler:) method
Filter the scores using the playerScope, timeScope, and range parameters you pass to this
method. For example, to get scores that friends of the local player earned in the past week, pass
GKLeaderboard.PlayerScope.friendsOnly as the for parameter and GKLeaderboard
.TimeScope.week as the timeScope parameter.
To get all player scores in that time period, pass GKLeaderboard.PlayerScope.global as th
for parameter instead.
Then use the properties of the GKLeaderboard.Entry instances that this method returns to ge
details about the individual scores, including the players who earned them.
To display a leaderboard or leaderboard set in your custom game interface, load the leaderboard 
leaderboard set and use the title property to get the localized name. To get the image
representation that you upload to App Store Connect, use the loadImage(completion
Handler:) method.
Alternatively, display the leaderboard in the familiar Game Center interface. To learn more, see
Display a single leaderboard.
Get the scores from leaderboards
Display leaderboards
Set the default leaderboard


## Page 8

You can set the default leaderboard for an individual player during your game. For example, chang
the default leaderboard when the player advances to a different level in your game.
To change the local player’s default leaderboard, use the GKLocalPlayer setDefault
LeaderboardIdentifier(_:completionHandler:) method. To get the identifier for the
default leaderboard in your code, use the loadDefaultLeaderboard
Identifier(completionHandler:) method.
Otherwise, you set the default leaderboard for all players in App Store Connect when you configu
leaderboards. Xcode doesn’t support setting a default leaderboard. For the steps to change the
default leaderboard in App Store Connect, see Configure leaderboards and achievements > Set a
default leaderboard.
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule.
Adding Recurring Leaderboards to Your Game
Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.
class GKLeaderboardScore
Information about a player’s score on a leaderboard.
See Also
Leaderboards


## Page 9

Use a recurring leaderboard to organize regular competitions or encourage players to score highe
in your game. Unlike a classic leaderboard that never resets, a recurring leaderboard represents
score rankings during a period of time. Each leaderboard in the sequence is called an occurrence
For design guidance, see Human Interface Guidelines > Technologies > Game Center >
Leaderboards.
Configure recurring leaderboards in Xcode before accessing them in your code and testing locally
with Game Progress Manager. When you’re ready to deploy your configuration, sync your updates
with App Store Connect. For more information about configuring and testing Game Center feature
see Initializing and configuring Game Center.
You configure a recurring leaderboard like a classic leaderboard, but you also enable the Recurrin
setting, and configure time-related properties. Under the Recurring section, set a start date for th
first occurrence. Then, enter the duration for each occurrence to establish the period in which
players can earn scores. To specify the frequency of the occurrences, enter a restart interval.
Occurrences are sequential and don’t overlap, so the restart interval must be equal to or greater
than the duration. To create a time delay between occurrences, set the restart interval to a numbe
that is greater than the duration.
Overview
Configure and test recurring leaderboards
GameKit / Creating recurring leaderboards
Article
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule


## Page 10

For example, if the restart interval and duration are both 24 hours, the recurring leaderboard runs
daily with no gaps between occurrences. To create a 1-hour contest every Sunday at noon, set th
start date to Sunday at noon, then set the restart interval to 7 days and the duration to 60 minutes
To create a 15-minute competition every hour, set the restart interval to 60 minutes and the
duration to 15 minutes.
Note
If you’ve already pushed your configuration changes to App Store Connect, removing a
leaderboard or leaderboard set from the local configuration file doesn’t remove the
leaderboard or leaderboard set from App Store Connect.
Use the Game Progress Manager to test leaderboards on your local device before you push the
configuration update to App Store Connect. After selecting a leaderboard, you can add players to
the leaderboard with a score value. Click Reset Leaderboards to simulate what happens in your
game when the leaderboard occurrence ends. You can’t access previous occurrences of a
recurring leaderboard in Debug Mode.
To learn more about the information you enter in App Store Connect, see Leaderboard properties
Use the leaderboard ID you entered in Xcode to specify the current occurrence when submitting 
score. Don’t submit scores to past occurances leaderboards.
Submit a score to the current occurrence


## Page 11

To submit a score to one or more leaderboards, including recurring leaderboards, use the submit
Score(_:context:player:leaderboardIDs:completionHandler:) class method in
GKLeaderboard. Pass one or more leaderboard IDs, the score, context, and player. The contex
parameter is an optional value for game-specific data that you can store, and fetch later with the
score. If there’s an occurrence at the time you submit the score, the occurrence retains either the
best score or the most recent score.
Alternatively, submit the score to the recurring leaderboard by loading the leaderboard using the
loadLeaderboards(IDs:completionHandler:) method in GKLeaderboard. Then use th
submitScore(_:context:player:completionHandler:) instance method to submit the
score to the recurring leaderboard.
Note
You can only use the submitScore(_:context:player:completionHandler:)
instance method for recurring leaderboards.
However, submitting a score with this method fails if the leaderboard isn’t active, so check the sta
date and duration properties of the leaderboard before calling the submitScore(_:context:
player:completionHandler:) method. To get the start date of the next occurrence, use the
nextStartDate property.
Access the previous occurrence


## Page 12

If you want the scores and rankings from the previous occurrence, you can get the occurrence
using the loadPreviousOccurrence(completionHandler:) method in GKLeaderboard
First, load the current occurrence using the loadLeaderboards(IDs:completionHandler:
class method, then call loadPreviousOccurrence(completionHandler:) to load the
previous occurrence.
Note
Game Center keeps expired occurrences for up to 30 days. However, a player can view scores
only on the current occurrence and one previous occurrence. The previous occurrence is the
most recent expired occurrence in which the player submitted a score.
Encourage progress and competition with leaderboards
Let players measure their own progress and compare their skills with friends and others.
Adding Recurring Leaderboards to Your Game
Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.
class GKLeaderboardScore
See Also
Leaderboards


## Page 13

Information about a player’s score on a leaderboard.


## Page 14

Note
This sample code project is associated with WWDC21 session 10067: Bring Recurring
Leaderboards to Your Game.
Encourage progress and competition with leaderboards
Let players measure their own progress and compare their skills with friends and others.
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
Overview
See Also
Leaderboards
GameKit / Adding Recurring Leaderboards to Your Game
Sample Code
Adding Recurring Leaderboards to Your
Game
Encourage competition in your games by adding leaderboards that have a duratio
and repeat.
Download
iOS 15.0+
iPadOS 15.0+
Xcode 12.5+


## Page 15

class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.
class GKLeaderboardScore
Information about a player’s score on a leaderboard.


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

A GKLeaderboardSet object represents a group of leaderboards that you configure in App Stor
Connect. For example, if your game has different worlds or levels, you can organize the
leaderboards into sets for each world or level. In the Game Center dashboard, players navigate
from the leaderboard sets to the individual leaderboards. If you use leaderboard sets, you must
have one or more leaderboards and then place each leaderboard in a set, which can be a mix of
classic and recurring leaderboards.
To load all the leaderboard sets for your game, use the loadLeaderboardSets(completion
Handler:) class method. Then use the title, identifier, and groupIdentifier
properties to access the data for each leaderboard set. If you localize the leaderboard set in App
Store Connect, the title property localizes. GameKit only sets the groupIdentifier propert
when your game is in a game group. To load the images you add to App Store Connect for each s
use the loadImage(completionHandler:) method. Then use the load
Leaderboards(handler:) method to get the leaderboards in each set.
To organize leaderboards into sets, see Configure leaderboard sets in App Store Connect Help.
Overview
Topics
Accessing Properties
GameKit / GKLeaderboardSet
Class
GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 22

var title: String
The localized title for the leaderboard set.
var identifier: String?
The identifier for the leaderboard set.
var groupIdentifier: String?
The identifier for the group that the leaderboard set belongs to.
func loadImage(completionHandler: ((UIImage?, (any Error)?) -> Void)?)
Loads the localized image that you associate with the leaderboard set.
class func loadLeaderboardSets(completionHandler: (([GKLeaderboardSet]?
(any Error)?) -> Void)?)
Loads all of the leaderboard sets you configure for your game.
func loadLeaderboards(handler: ([GKLeaderboard]?, (any Error)?) -> Void
Loads the leaderboards in the leaderboard set.
func loadLeaderboards(completionHandler: (([GKLeaderboard]?, (any Error
)?) -> Void)?)
Loads all of the leaderboards for the current leaderboard set.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Loading Leaderboard Sets
Relationships
Inherits From
Conforms To


## Page 23

NSCoding
NSObjectProtocol
NSSecureCoding
Encourage progress and competition with leaderboards
Let players measure their own progress and compare their skills with friends and others.
Creating recurring leaderboards
Create a leaderboard for your game that ranks player scores based on a schedule.
Adding Recurring Leaderboards to Your Game
Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
class GKLeaderboardScore
Information about a player’s score on a leaderboard.
See Also
Leaderboards


## Page 24

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


## Page 25

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


## Page 26

Encourage competition in your games by adding leaderboards that have a duration and
repeat.
class GKLeaderboard
A leaderboard for a game that Game Center stores.
class GKLeaderboardSet
Organizes leaderboards into logical and coherent groups.


