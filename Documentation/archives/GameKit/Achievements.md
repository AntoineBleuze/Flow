# Achievements.pdf

## Page 1

An achievement is a collectible item that a player receives as a reward for successfully reaching a
particular goal in your game. Achievements provide players an additional way of engaging with yo
game, tracking gameplay progress, and sharing that progress with friends. You define the
achievements available to players in your game, and Game Center saves the progress players ma
toward earning them. Players can view your game achievements and track their progress in the
dashboard.
Your game can have a maximum of 100 achievements, 100 points per achievement, and 1000
points total for all achievements. To keep players engaged, you can progressively add
achievements to each version of your game until you reach the limit.
For design guidance, see Human Interface Guidelines > Technologies > Game Center >
Achievements.
Overview
GameKit / Rewarding players with achievements
Article
Rewarding players with achievements
Use achievements to motivate players and engage them more in your game.


## Page 2

Configure achievements in Xcode before accessing them in your code and testing locally with
Game Progress Manager. When you’re ready to deploy your configuration, sync your updates with
App Store Connect. For more information about configuring and testing Game Center features, se
Initializing and configuring Game Center.
When you configure an achievement in Xcode, you specify details like how many points the playe
earn for it, and whether they can earn the achievement more than once.
You also localize the user-facing text and assets in each language and region you support, and
specify whether to hide the achievement from players before they reach a goal in your game. If yo
don’t hide the achievement, Game Center shows it immediately in the locked state. Players can
browse all the achievements in your game, including locked achievements, to learn more about
them.
If you add an achievement to an unreleased version of your game or sign the game with a
development certificate, Game Center annotates the achievement with a prerelease indicator. For
example, if you run your game in Xcode, a prerelease indicator appears next to the achievement
name and a message appears in the detail view. To change an achievement’s app version, see Ad
achievements to an app version.
Use the Game Progress Manager to test achievements on your local device before you push the
configuration update to App Store Connect. After selecting an achievement, update the progress
for it in the detail panel on the right. When the progress updates, the system sends an update to
your app so you can verify that the achievement changes.
Configure and test achievements


## Page 3

For more information about the achievement properties you can configure, see Achievement
properties.
To start or continue reporting progress toward an achievement, you need a GKAchievement
object that represents the achievement.
Load the in-progress achievements for the player using the loadAchievements(completion
Handler:) method. Use the identifier you enter in Xcode to find the corresponding
GKAchievement object in the array that GameKit passes to the completion handler.
Get the object that represents the achievement


## Page 4

If the achievement isn’t in the array, your game hasn’t reported any progress toward this
achievement for this player yet, and the dashboard shows it in the locked state. You must create a
new GKAchievement object using the identifier from App Store Connect. For the local player, us
the init(identifier:) method to create the GKAchievement object. For another player,
when ending a turn-based match, use the init(identifier:player:) method.
Initially, the percentage complete is 0 and the dashboard shows the achievement in the locked
state. As the player progresses toward earning an achievement, you report the percentage the
player completes for the achievement to Game Center.
Set the achievement’s percentComplete property to a value between 0 and 100. For example,
increase the percentage complete by 10%.
Then report the progress to Game Center by passing the achievement in an array to the
report(_:withCompletionHandler:) method.
When reporting a percentage greater than 0 and less than 100, the dashboard shows the
achievement as in-progress. When you report that the player completes the achievement 100%,
the dashboard shows the image for the achievement, and Game Center adds it to the player’s
completed achievements.
GameKit also displays a banner notifying the player when they complete an achievement. If you
want to display your own interface, set the showsCompletionBanner property to false befor
reporting the player’s progress so the default banner doesn’t appear.
You can also hide an achievement in Xcode when you configure it, and not report on the progress
until the player completes it. For example, use a hidden achievement if an achievement descriptio
reveals aspects of your game’s plot, or if you want to surprise the player with awards.
If the player completes all achievements in your game or if you want to clear all progress the local
player makes toward all their achievements, you can reset them using the reset
Achievements(completionHandler:) class method.
Report the player’s progress


## Page 5

If you prefer to report progress through your own server, see Game Center player achievements.
Players can view their achievements in the dashboard, which provides a familiar and consistent
experience for users. You can add the access point to your game so players can open the
dashboard and navigate to their achievements. The access point displays achievements in the
highlights, and on the dashboard when the player opens it. You can also display the dashboard in
the state that shows the achievements so players can drill down and navigate to their other Game
Center data.
If you want to display the data directly in your interface, you can load details of all the
achievements, including their identifiers and artwork, using the loadAchievement
Descriptions(completionHandler:) class method. GameKit returns the localized
achievement titles and descriptions, which you provide when you configure the achievements in
App Store Connect. To load the artwork for an achievement, use the loadImage(completion
Handler:) method.
class GKAchievement
An achievement you can award a player as they make progress toward and reach a goal in
your game.
class GKAchievementDescription
An object containing the text and artwork used to present an achievement to a player.
Show achievements to players
See Also
Achievements


## Page 6

Rewarding players with achievements
Before using this class, configure your game achievements in App Store Connect. Then the
dashboard shows the achievements initially locked and you can access them in your code.
Use the loadAchievements(completionHandler:) method to load all the achievements th
the local player is progressing toward. If an achievement doesn’t load, then it’s the first time you’r
reporting the player’s progress toward it, and you must create a GKAchievement object to
represent it. Next, set the percentage complete of the achievement using the percentComplet
property.
You can report the player’s progress for one or more achievements to Game Center using the
report(_:withCompletionHandler:) method. The dashboard changes the appearance of
the achievements to show the current percentages. If you set the percentage of an achievement t
100, the dashboard shows it as completed.
To reset the player’s progress on all achievements, use the resetAchievements(completion
Handler:) class method.
Mentioned in
Overview
GameKit / GKAchievement
Class
GKAchievement
An achievement you can award a player as they make progress toward and reach 
goal in your game.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 7

class func loadAchievements(completionHandler: (([GKAchievement]?, (any
Error)?) -> Void)?)
Loads the achievements that you previously reported the player making progress toward.
init(identifier: String)
Initializes an achievement for the local player.
init(identifier: String, player: GKPlayer)
Initializes an achievement for a player.
var identifier: String
The identifier for the achievement that you enter in App Store Connect.
var player: GKPlayer
The player who earned the achievement.
var percentComplete: Double
A percentage value that states how far the player has progressed on the achievement.
var isCompleted: Bool
A Boolean value that states whether the player has completed the achievement.
var lastReportedDate: Date
The last time your game reported progress on the achievement for the player.
class func report([GKAchievement], withCompletionHandler: (((any Error
)?) -> Void)?)
Reports the player’s progress of players toward one or more achievements.
class func report([GKAchievement], withEligibleChallenges: [GKChallenge
], withCompletionHandler: (((any Error)?) -> Void)?)
Topics
Loading and Initializing Achievements
Accessing Achievement Properties
Reporting Progress on Achievements


## Page 8

Reports the player’s progress on achievements and limits the challenges, associated with
those achievements, that the player may complete.
Deprecated
var showsCompletionBanner: Bool
A Boolean value that indicates whether GameKit displays a banner when the player complete
the achievement.
class func resetAchievements(completionHandler: (((any Error)?) -> Void
)?)
Resets the percentage completed for all of the player’s achievements.
func selectChallengeablePlayers([GKPlayer], withCompletionHandler: (([
GKPlayer]?, (any Error)?) -> Void)?)
Finds the subset of players who can earn an achievement.
Deprecated
func challengeComposeController(withMessage: String?, players: [GKPlaye
], completion: GKChallengeComposeHandler?) -> UIViewController
Provides a view controller that you present to the player to issue an achievement challenge.
Deprecated
typealias GKChallengeComposeHandler
A completion block that provides information about the player who issues a challenge and th
players who receive it.
Deprecated
func challengeComposeController(withMessage: String?, players: [GKPlaye
], completionHandler: GKChallengeComposeCompletionBlock?) -> UIView
Controller
Provides a view controller that you present to the player to issue an achievement challenge.
Deprecated
func challengeComposeController(withPlayers: [String]?, message: String
?, completionHandler: GKChallengeComposeCompletionBlock?) -> UIView
Controller?
Provides a challenge compose view controller with preselected player identifiers and a
message.
Deprecated
Issuing Achievement Challenges


## Page 9

Deprecated Symbols
Review unsupported symbols and their replacements.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Rewarding players with achievements
Use achievements to motivate players and engage them more in your game.
class GKAchievementDescription
An object containing the text and artwork used to present an achievement to a player.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Achievements


## Page 10

To present an achievement to the player in your interface, you can download the localized text an
artwork for the achievements that you enter in App Store Connect. To get the localized text, use t
loadAchievementDescriptions(completionHandler:) class method. GameKit passes a
array of GKAchievementDescription objects to the completion handler that contains the text
To get the artwork for an achievement, use the loadImage(completionHandler:) method.
To get standard images your game can use to present achievement progress to the player, use th
incompleteAchievementImage() and placeholderCompletedAchievementImage())
class methods.
Alternatively, either add the access point or display the dashboard so that the player can view
achievements and navigate to their other Game Center data.
class func loadAchievementDescriptions(completionHandler: (([
GKAchievementDescription]?, (any Error)?) -> Void)?)
Downloads the localized descriptions of achievements from Game Center.
Overview
Topics
Retrieving Achievement Descriptions
GameKit / GKAchievementDescription
Class
GKAchievementDescription
An object containing the text and artwork used to present an achievement to a
player.
iOS 4.1+
iPadOS 4.1+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 11

var identifier: String
The string you enter in App Store Connect that uniquely identifies the achievement.
var title: String
A localized title for the achievement.
var unachievedDescription: String
A localized description of the achievement that you display when the player hasn’t complete
the achievement.
var achievedDescription: String
A localized description of the achievement that you display when the player completes the
achievement.
var maximumPoints: Int
The number of points that the player earns when completing the achievement.
var image: NSImage?
The achievement’s artwork that you display when the player completes the achievement.
Deprecated
var isHidden: Bool
A Boolean value that states whether the achievement is initially visible to players.
var isReplayable: Bool
A Boolean value that states whether the player can earn the achievement multiple times.
var rarityPercent: Double?
The percentage of players of this game that earned the achievement.
class func incompleteAchievementImage() -> UIImage
A common image that you can display when the player hasn’t completed the achievement.
class func placeholderCompletedAchievementImage() -> UIImage
A placeholder image that you can display when the player completes the achievement.
func loadImage(completionHandler: ((UIImage?, (any Error)?) -> Void)?)
Reading and Writing Achievement Properties
Working with Achievement Images


## Page 12

Loads the image to display when the player completes the achievement.
var groupIdentifier: String?
The identifier for the group that the achievement description is part of.
var activityIdentifier: String
The identifier of the game activity associated with this achievement, as configured by the
developer in App Store Connect.
var activityProperties: [String : String]
The properties when associating this achievement with a game activity, as configured by the
developer in App Store Connect.
var releaseState: GKReleaseState
The release state of the achievement in App Store Connect.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Retrieving Group Information
Instance Properties
Relationships
Inherits From
Conforms To


## Page 13

Rewarding players with achievements
Use achievements to motivate players and engage them more in your game.
class GKAchievement
An achievement you can award a player as they make progress toward and reach a goal in
your game.
See Also
Achievements


