# Challenges.pdf

## Page 1

Challenges encourage your players to invite their friends into your game for friendly competitions
score-based rounds. Players see your challenges promoted throughout the Games app and other
places around the OS as suggestions for enjoying their games with friends. They can invite their
Game Center friends and anyone from their contacts, see scores appear in real-time, receive
notifications at key moments until the game crowns a winner, and have a rematch. GameKit builds
challenges on top of leaderboards, turning single-player game activities into a social experience
players can share with their friends.
Overview
GameKit / Creating engaging challenges from leaderboards
Article
Creating engaging challenges from
leaderboards
Encourage friendly competition by adding challenges to your game.


## Page 2

To adopt challenges, you just need an active Game Center leaderboard. When you associate a
leaderboard with a challenge, for players participating in the challenge, the system automatically
submits the same scores submitted for that leaderboard.
To learn more about the Games app, see Engage players with the Games app. To learn more abou
leaderboards that work well for challenges, see Choosing a leaderboard for your challenges.
Configure challenges in Xcode before accessing them in your code. When you’re ready to deploy
your configuration, sync your updates with App Store Connect. For more information about
configuring and testing Game Center features, see Initializing and configuring Game Center.
When you configure a challenge, you specify details like the leaderboard with which to associate 
and whether it’s repeatable. You also configure localization details for the challenge, like the displ
name.
If you make changes to your game, like adding a new leaderboard or adding a deep link using
activities, you can configure a minimum version for a challenge. When you do, the Games app
prompts a person to upgrade to the appropriate version of your game to participate in the
challenge. For more information, see the “Set challenges minimum version” section in Manage
Challenges.
To learn more about the information you enter in App Store Connect, see Challenge properties.
Configure challenges


## Page 3

Players can use the Games app to create challenges and invite their friends to play. After a player
creates a challenge, you use the standard reporting methods — submitScore(_:context:
player:completionHandler:) — for reporting updates to the leaderboard you associate wit
the challenge. For more information about getting and submitting leaderboard scores, see
Encourage progress and competition with leaderboards.
If you have a leaderboard that only tracks a player’s personal best or all-time score, you can still
use it for a challenge. Submit the most recent score with every attempt, but set the leaderboard’s
Score Submission Type to Best Score. This setting only displays the player’s best score on the
leaderboard, but also allows challenges to count the player’s most recent score submissions durin
the course of the challenge.
To help players navigate to the correct place when exploring your game, check your challenge
definition to apply UI decorations.
Use GameKit when you want to help facilitate challenge creation through your game. A
GKChallengeDefinition class contains the static metadata you configure in Xcode or App
Store Connect. Use GKChallengeDefinition.all to load all of the challenges that you defin
for a game:
Report challenge progress
Get the object that represents the challenge
Create a challenge


## Page 4

If you don’t need to create a custom UI for challenge selection, use triggerForPlay
Together(handler:) to present the default system UI that shows the available challenges for
your game. After a player selects a challenge from the list, the view to create a challenge appears
You can display the available challenges in your UI by fetching all of the challenge definitions. Afte
a player selects the challenge they want to create, call trigger(challengeDefinitionID:
handler:) with the challenge identifier. This UI gives the player a familiar experience to create a
challenge from. When determining where to present the system UI for a challenge, consider placi
entry points at contextually relevant locations in your game.
When you create an activity, you can associate it with a leaderboard that you use for challenges.
When a player receives a challenge notification on their device, the system uses a deep link to he
you navigate them into the experience. Use GKGameActivityListener to observe and receive
activity events from the system.
When a player chooses to engage with your challenge, the system navigates them directly to it w
your help. For example, to configure a daily mini crossword challenge, perform the following steps
1. Create a recurring leaderboard that restarts daily, specifying a start time and daily duration.
2. Create a game activity with a deep link to the crossword that you associate with the recurring
leaderboard.
3. Configure the challenge with the recurring leaderboard and set it as not repeatable.
4. Handle the activity event in your game to navigate the player to the right place when they
engage with the challenge.
To learn more about adding activities to your game, and deep-linking to them, see Creating
activities for your game
When you submit a score to a challenge leaderboard, it consumes a challenge attempt, so it’s
important to handle score submissions with care and perform score submissions at the right
Integrate your challenge with activities
Validate your challenge integration


## Page 5

moments in your code. When you use the leaderboard APIs, consider the following when validatin
your integration:
Submit scores at the end of the gameplay, like after a player finishes a race or scores their
highest point value after a limited amount of time.
Submit the most recent score the player earns at the end of an attempt.
Submit a score if the player doesn’t beat their best score on the leaderboard.
Submit a score if a player exits the challenge attempt early or when they close the game.
For games that use a revive game mechanic, submit a score after a player accepts or declines
the revive.
Rely on your leaderboard configuration to resolve a player’s personal best score instead of
submitting their personal best.
Use leaderboards to track attempts — not real-time scores — instead of submitting scores for
each point a player earns.
Make sure to call submitScore(_:context:player:completionHandler:) during releva
moments of gameplay instead of when the player starts the game or navigates menus. Game
Center handles error recovery and offline score submission, so don’t submit cores during your
game’s startup.
When a player wants to engage with a challenge that you associate with an activity:
Route the player to the correct destination, whether they previously launched the game (warm
launch) or after a force quit (cold launch).
When loading a challenge, avoid interrupting the player with content that’s not relevant to the
challenge, like showing a message about an unrelated event.
If your game involves a tutorial, start the challenge after the player learns more about how to pl
the game.
If the challenge content requires additional player progression, provide the player with context
on what to do to access the content.
Choosing a leaderboard for your challenges
Understand what gameplay works well when configuring challenges in your game.
class GKChallengeDefinition
See Also
Challenges


## Page 6

An object that represents the static metadata you define for the challenge.
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.


## Page 7

One feature of most games is the leaderboard; a place where players can compare scores and
check their rankings. Some leaderboards work better for challenges than others. When you choos
a leaderboard, it’s important to factor in the type of gameplay your game provides, whether your
challenge is repeatable, and whether you need a leaderboard that resets after a certain period of
time.
Before you can configure a challenge, your game needs to have a leaderboard — using either Gam
Center, or a leaderboard service outside of Game Center. For more information on creating
leaderboards, see Encourage progress and competition with leaderboards.
Note
You can still adopt challenges if you use a custom service to power your leaderboards. You
configure a hidden leaderboard in Game Center and report scores to both Game Center and
your server. Hidden leaderboards don’t appear in the Game Center UI.
With your leaderboard in place, you need to assess how well suited it is for challenges, including
whether:
It suits the scoring submission style and type
A challenge is repeatable
Scores from the challenge post to a classic or recurring leaderboard
Leaderboards are grouped
Overview
GameKit / Choosing a leaderboard for your challenges
Article
Choosing a leaderboard for your
challenges
Understand what gameplay works well when configuring challenges in your game


## Page 8

You want to adopt challenges when you have a custom built leaderboard service outside of
Game Center.
Challenges are ideal for games with a tight gameplay loop and a clear metric to gauge skill or
accomplishment, like:
A racing game, where the leaderboard ranks players by fastest lap time on a particular track.
A puzzle game, where a leaderboard refreshes daily as players compete to finish a daily puzzle
in the fastest time.
A bubble popping game, where the leaderboard lists the number of bubbles players pop within
limited time frame.
When reporting challenge scores to the leaderboard, only submit scores when gameplay ends. Fo
example, with the bubble popping game, submit the total number of bubbles popped when the
clock runs out, rather than reporting a person’s progress along the way.
Challenges aren’t ideal for games that give an unfair advantage to regular players. If you configure
a challenge that tracks the all-time total bubbles popped by a player, new players are put in a no-
win scenario when they’re invited to the challenge.
A challenge is a competition where players compete for the top spot, so set your leaderboard’s
Score Submission Type to Best Score for the optimal challenge experience. For more information
about the properties you configure with a leaderboard, see Leaderboard properties.
Choose a leaderboard game mode by identifying whether your gameplay is repeatable. For
example, if your racing game encourages players to compete for the fastest lap time, then it’s
repeatable. Conversely, if your puzzle game offers a daily challenge puzzle, then it’s nonrepeatab
With the racing challenge, players can keep racing to get the fastest lap, while the puzzle challeng
limits players to a single attempt.
For repeatable gameplay, players can choose one of three options: one attempt, three attempts, o
unlimited attempts. For nonrepeatable gameplay, players can only configure a challenge with one
attempt.
For nonrepeatable challenges, the current score on the leaderboard carries forward for the player
and counts toward the challenge. Otherwise, for repeatable gameplay, the player’s existing score
on the leaderboard won’t count toward the challenge.
Determine a score submission style and type
Decide whether challenges are repeatable


## Page 9

Note
To provide a repeatable challenge you need to configure the challenge to use a recurring
leaderboard.
When configuring a challenge, you can select a leaderboard that’s either classic or recurring:
Classic leaderboards don’t reset the scores.
Recurring leaderboards reset the scores at a specific interval.
For more information on classic leaderboards, see Encourage progress and competition with
leaderboards. For more information on recurring leaderboards, see Creating recurring
leaderboards.
If you associate a challenge with a classic leaderboard, players can choose a duration that indicat
how long other players may participate in the challenge. For a classic leaderboard, the allowed
durations are one day, three days, and one week.
You don’t select a duration if you associate a challenge with a recurring leaderboard. The duration
of the challenge is implicitly as long as the remainder of the leaderboard’s current recurrence
duration. For example, if your game has a daily recurring leaderboard that resets at at midnight (1
a.m.), and your player creates a recurring leaderboard-based challenge at noon (12 p.m.), the
duration on the challenge is 12 hours.
Make sure you give your players time to compete. Because the challenge duration inherits from th
recurring leaderboard’s remaining duration, don’t configure a challenge on a recurring leaderboar
that has a short duration.
A Game Center group allow you to share leaderboard data between two or more games. You can
associate a leaderboard group with your challenges to share the progress across the games that
are within the group. At the time of gameplay, all participants need to use the game that initiates
the challenge to compete. This is to ensure all players are on an even playing field for a fair
competition as the gameplay experience may differ between the games.
Choose between a classic and recurring
leaderboard
Add a grouped leaderboard for challenges
Adopt challenges with hidden leaderboards


## Page 10

The system can drive engagement to your game whether you use Game Center leaderboards or
your own leaderboard system. To do so, you need to enable Game Center and configure a
leaderboard in Xcode that shadows a leaderboard you already provide through your own system.
When you configure the leaderboard in Xcode, set the leaderboard as hidden. A hidden
leaderboard won’t show up in any list of leaderboards a person accesses through the Game Cent
dashboard, Games app, or other game events.
After creating a hidden leaderboard, configure your challenge to submit scores to it by calling
submitScore(_:context:player:completionHandler:). You can use the hidden
leaderboard to track the player’s progress and outcome for the challenge. Submit the score to yo
custom leaderboard service and Game Center:


## Page 11

If you prefer to submit scores through your own server, see
Game Center leaderboards scores.
For more information on enabling Game Center, see Initializing and configuring Game Center. To
learn more about configuring leaderboard, see Encourage progress and competition with
leaderboards.
Creating engaging challenges from leaderboards
Encourage friendly competition by adding challenges to your game.
class GKChallengeDefinition
An object that represents the static metadata you define for the challenge.
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
See Also
Challenges


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

Deprecated
The system no longer uses this key.
Type
Boolean
AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
Name: Supported game controller types
Details
See Also
Games
Bundle Resources
/ GKShowChallengeBanners Deprecated
Property List Key
GKShowChallengeBanners Deprecated
A Boolean value that indicates whether GameKit can display challenge banners in
a game.
iOS 7.0–26.0 Deprecated
iPadOS 7.0–26.0 Deprecated
visionOS 1.0–26.0 Deprecated
/


## Page 16

GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
Name: Supports Controller User Interaction
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated


