# 002_GKAchievementDescription.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Rewarding players with achievements
Use achievements to motivate players and engage them more in your game.
class GKAchievement
An achievement you can award a player as they make progress toward and reach a goal in
your game.
See Also
Achievements


