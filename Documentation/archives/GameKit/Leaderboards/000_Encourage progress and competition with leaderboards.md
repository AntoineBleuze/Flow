# 000_Encourage progress and competition with leaderboards.pdf

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


