# 003_GKGameActivityListener.pdf

## Page 1

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


## Page 2

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


