# 003_GKGameModel.pdf

## Page 1

You adopt this protocol to describe the gameplay of your turn-based game for use by a
GKStrategist object. The strategist uses your game model class (that is, the class you create t
adopt this protocol), along with other custom classes you create (adopting the GKGameModel
Player and GKGameModelUpdate protocols), to find optimal moves.
GameplayKit relies on your game model class for several parts of its strategy algorithm.
Identifying possible changes to the game state. Your gameModelUpdates(for:) method an
your move class (a custom class implementing the GKGameModelUpdate protocol) describe
the set of moves available during a given player’s turn.
Simulating future moves on a copy of the game. Your setGameModel(_:) method allows
GameplayKit to work with a separate instance of the game model—that is, not the one
representing the actual game in play—and your apply(_:) uses the information in your move
class to perform hypothetical moves on that separate copy of the game.
Rating the desirability of possible future states of the game. Each time GameplayKit performs a
hypothetical move in its copy of the game model, it calls your isWin(for:), isLoss(for:)
or score(for:) method to evaluate that state of the game from the perspective of a particul
player.
When you use a strategist to plan moves in your game, it uses your game model to combine these
parts into a strategy: By identifying, performing, and rating the success of possible future moves,
the strategist can choose a move most likely to result in a future win. This process involves using
Overview
GameplayKit / GKGameModel
Protocol
GKGameModel
Implement this protocol to describe your gameplay model so that a strategist
object can plan game moves.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

the copy(with:) and setGameModel(_:) methods to evaluate many possible states of a gam
model—for best results, ensure that your game model class contains only the information critical t
describing your game and that it can copy that state quickly.
For more information about describing your gameplay model and using a strategist, see The
Minmax Strategist in GameplayKit Programming Guide.
var players: [any GKGameModelPlayer]?
The players currently in the game.
Required
var activePlayer: (any GKGameModelPlayer)?
The player whose turn it currently is in the game.
Required
func gameModelUpdates(for: any GKGameModelPlayer) -> [any GKGameModel
Update]?
Returns the set of moves available to the specified player.
Required
func score(for: any GKGameModelPlayer) -> Int
Returns a number rating the desirability of the game model’s current state from the
perspective of the specified player.
func isLoss(for: any GKGameModelPlayer) -> Bool
Returns a Boolean value indicating whether the specified player has lost the game.
func isWin(for: any GKGameModelPlayer) -> Bool
Returns a Boolean value indicating whether the current state of the game model reflects a w
for the specified player.
func apply(any GKGameModelUpdate)
Updates the internal state of the game model to reflect the specified changes.
Topics
Keeping Track of Players
Evaluating a Game Model
Modifying a Game Model


## Page 3

Required
func unapplyGameModelUpdate(any GKGameModelUpdate)
Updates the internal state of the game model to remove the effect of the specified changes.
func setGameModel(any GKGameModel)
Sets the game model’s internal state to that of the specified game model.
Required
Game Model Score Limits
Limits to values returned by the score(for:) method.
NSCopying, NSObjectProtocol
protocol GKStrategist
A general interface for objects that provide artificial intelligence for use in turn-based (and
similar) games.
class GKMinmaxStrategist
An AI that chooses moves in turn-based games using a deterministic strategy.
class GKMonteCarloStrategist
An AI that chooses moves in turn-based games using a probabilistic strategy.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.
Constants
Relationships
Inherits From
See Also
Strategists


## Page 4

protocol GKGameModelUpdate
Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.


