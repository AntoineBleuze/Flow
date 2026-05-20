# 005_GKGameModelUpdate.pdf

## Page 1

You adopt this protocol in a custom class that describes a move in your game. You use that class,
along with another custom class implementing the GKGameModel protocol, to describe your
gameplay to a GKStrategist object. You can then use the strategist to find optimal moves duri
gameplay—for example, to create a computer-controlled player, or to offer hints to a human playe
Your implementation of this protocol should add properties or methods that describe a move in
terms of your game. For example, in a Tic-Tac-Toe game, a move class might record which of the
nine spaces gets marked in that move. In a chess game, a move class might describe the piece
being moved, its original location, and its destination.
You then use your move class in three places:
In the gameModelUpdates(for:) method of your game model class, you create instances o
your move class representing each of the possible moves for the specified player. GameplayKit
calls this method to determine what moves are possible and speculate about the effects of
possible moves on the game’s outcome.
In the apply(_:) method of your game model class, you use the information in the specified
move object to update the state of the game model. GameplayKit calls this method when
evaluating the effects of possible moves in order to select the best move.
When you call the strategist’s bestMove(for:) or randomMove(for:fromNumberOfBest
Moves:) method to find an optimal move, the return value is one of the move objects you
created in your gameModelUpdates(for:) method. Use the information in that object to
Overview
GameplayKit / GKGameModelUpdate
Protocol
GKGameModelUpdate
Implement this protocol to describe a move in your turn-based game so that a
strategist object can plan game moves.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

perform the move (if creating a computer-controlled player) or indicate the move in your game
user interface (if offering hints to a human player).
For more information about describing your gameplay model and using a strategist, see The
Minmax Strategist in GameplayKit Programming Guide.
var value: Int
A value assigned and read by GameplayKit to rate the desirability of a move in your game.
Required
NSObjectProtocol
protocol GKStrategist
A general interface for objects that provide artificial intelligence for use in turn-based (and
similar) games.
class GKMinmaxStrategist
An AI that chooses moves in turn-based games using a deterministic strategy.
class GKMonteCarloStrategist
An AI that chooses moves in turn-based games using a probabilistic strategy.
protocol GKGameModel
Topics
Storing a Move Value
Relationships
Inherits From
See Also
Strategists


## Page 3

Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.


