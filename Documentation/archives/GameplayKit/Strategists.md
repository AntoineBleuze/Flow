# Strategists.pdf

## Page 1

GameplayKit provides two strategist classes, and you can also use this protocol to implement you
own. You provide information about your game model to a strategist by implementing the GKGame
Model, GKGameModelPlayer, and GKGameModelUpdate protocols in your custom classes, th
use the strategist’s methods to find optimal moves.
GameplayKit provides two strategist classes:
The GKMinmaxStrategist class uses a numeric score for each possible game model state,
and performs an exhaustive tree search to find moves that maximize the player’s score while
minimizing opponent scores. This strategy can result in optimal gameplay, but requires a scorin
method for game models and has a performance cost that increases greatly with game
complexity.
The GKMonteCarloStrategist class performs a randomized, probabilistic search for winni
end states. This strategy doesn’t always choose the best possible move, but is likely to choose
good moves, and has a low performance cost even for very complex games. In addition, the
Monte Carlo strategy is concerned only with whether a game model state represents a win, so
you don’t need to implement a scoring method.
Overview
Choosing a Strategist
GameplayKit / GKStrategist
Protocol
GKStrategist
A general interface for objects that provide artificial intelligence for use in turn-
based (and similar) games.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

Using a strategist in a game requires the following steps:
1. Create classes describing your gameplay model, adopting the GKGameModel, GKGameModel
Player, and GKGameModelUpdate protocols.
2. Choose a strategist class (one that adopts the GKStrategist protocol), create an instance o
that class, and configure its properties to determine its gameplay behavior.
3. Point the strategist’s gameModel property at the instance of your game model class
representing the current state of the game in play.
4. Use the bestMoveForActivePlayer() method to select the best possible move for the
current player. This method returns a move object (that is, an instance of the custom class you
create to adopt the GKGameModelUpdate protocol).
5. Examine the move object to make use of the move selected by the strategist. You created this
instance in the gameModelUpdates(for:) method of your game model class to describe a
possible move in your game, so examining the object gives you the information needed to
perform that move.
For more information about describing your gameplay model and using strategists, see The
Minmax Strategist in GameplayKit Programming Guide.
var gameModel: (any GKGameModel)?
The model representing the current state of the game.
Required
var randomSource: (any GKRandom)?
A randomizer object to be used when the strategist randomly selects a move.
Required
func bestMoveForActivePlayer() -> (any GKGameModelUpdate)?
Computes and returns the best possible move for the current player.
Using a Strategist
Topics
Specifying the Game Model
Configuring a Strategist
Planning Game Moves


## Page 3

Required
NSObjectProtocol
GKMinmaxStrategist, GKMonteCarloStrategist
class GKMinmaxStrategist
An AI that chooses moves in turn-based games using a deterministic strategy.
class GKMonteCarloStrategist
An AI that chooses moves in turn-based games using a probabilistic strategy.
protocol GKGameModel
Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.
protocol GKGameModelUpdate
Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.
Relationships
Inherits From
Conforming Types
See Also
Strategists


## Page 4

To use this strategy, you provide scores that rate possible states of your game model for their
desirability to a player, and the strategist exhaustively searches all possible game model states in
order to make choices that maximize the rating for its own moves and minimize the rating for an
opponent’s moves. You provide information about your game model to the strategist by
implementing the GKGameModel, GKGameModelPlayer, and GKGameModelUpdate protocols 
your custom classes, and then use the strategist’s methods to find optimal moves.
GameplayKit provides multiple strategist classes. The advantage of the GKMinmaxStrategist
class is its deterministic, exhaustive strategy: If allowed, the minmax strategist searches the entire
space of possible moves and the game states they lead to, so it can find the best possible move a
any time. The cost of this strategy is performance: searching every possible game state takes tim
especially for complex games where many moves are possible at any given time. Additionally, this
strategy requires that your game model implement the score(for:) method to rate the
desirability of each game state.
See the GKStrategist protocol for alternate strategies, as well as the methods and properties
supported by all strategist classes.
Overview
Choosing a Strategist
Using a Minmax Strategist
GameplayKit / GKMinmaxStrategist
Class
GKMinmaxStrategist
An AI that chooses moves in turn-based games using a deterministic strategy.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 5

Using the minmax strategist in a game requires the following steps:
1. Create classes describing your gameplay model, adopting the GKGameModel, GKGameModel
Player, and GKGameModelUpdate protocols.
2. Create GKMinmaxStrategist instance and configure its properties maxLookAheadDepth
and randomSource to determine its gameplay behavior.
3. Point the minmax strategist’s gameModel property at the instance of your game model class
(that is, your class that implements the GKGameModel protocol) representing the current state
of the game in play.
4. Use the bestMoveForActivePlayer() method to select the best possible move for the
current player. This method returns a move object (that is, an instance of the custom class you
create to adopt the GKGameModelUpdate protocol).
5. Examine the move object to make use of the move selected by the strategist. You created this
instance in the gameModelUpdates(for:) method of your game model class to describe a
possible move in your game, so examining the object gives you the information needed to
perform that move.
For more information about describing your gameplay model and using strategists, see The
Minmax Strategist in GameplayKit Programming Guide.
var maxLookAheadDepth: Int
The number of future turns for the strategist to consider when planning moves.
func bestMove(for: any GKGameModelPlayer) -> (any GKGameModelUpdate)?
Computes and returns the best possible move for the specified player.
func randomMove(for: any GKGameModelPlayer, fromNumberOfBestMoves: Int)
-> (any GKGameModelUpdate)?
Computes several of the best possible moves for the specified player, and returns a move
randomly selected from among them.
Topics
Configuring a Strategist
Planning Game Moves


## Page 6

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKStrategist
Hashable
NSObjectProtocol
protocol GKStrategist
A general interface for objects that provide artificial intelligence for use in turn-based (and
similar) games.
class GKMonteCarloStrategist
An AI that chooses moves in turn-based games using a probabilistic strategy.
protocol GKGameModel
Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.
protocol GKGameModelUpdate
Relationships
Inherits From
Conforms To
See Also
Strategists


## Page 7

Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.


## Page 8

To use this strategy, you indicate whether a possible states of your game model represents a win,
and the strategist randomly searches possible game model states in order to find moves that will
likely result in winning the game. You provide information about your game model to the strategis
by implementing the GKGameModel, GKGameModelPlayer, and GKGameModelUpdate
protocols in your custom classes, then use the strategist’s methods to find optimal moves.
The Monte Carlo strategist is one of several strategist classes that GameplayKit provides. The key
advantage of the GKMonteCarloStrategist class is performance. By using random sampling 
make educated guesses about which sequences of moves to simulate, this strategy can arrive at 
decision quickly even for games with large and complex state spaces. The cost of this strategy is
strength of gameplay: because the strategist randomly samples possible moves, it may miss the
best moves. Additionally, this strategy doesn’t need a scoring method to rate each game model
state—instead, your game model class needs to implement only the isWin(for:) method.
See the GKStrategist protocol for alternate strategies, as well as the methods and properties
supported by all strategist classes.
Using the Monte Carlo strategist in a game requires the following steps:
Overview
Choosing a Strategist
Using a Monte Carlo Strategist
GameplayKit / GKMonteCarloStrategist
Class
GKMonteCarloStrategist
An AI that chooses moves in turn-based games using a probabilistic strategy.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 9

1. Create classes describing your gameplay model, adopting the GKGameModel, GKGameModel
Player, and GKGameModelUpdate protocols.
2. Create a GKMonteCarloStrategist instance and configure its properties budget,
explorationParameter, and randomSource to determine its gameplay behavior.
3. Point the strategist’s gameModel property at the instance of your game model class (that is,
your class that implements the GKGameModel protocol) representing the current state of the
game in play.
4. Use the bestMoveForActivePlayer() method to select the best possible move for the
current player. This method returns a move object (that is, an instance of the custom class you
create to adopt the GKGameModelUpdate protocol).
5. Examine the move object to make use of the move selected by the strategist. You created this
instance in the gameModelUpdates(for:) method of your game model class to describe a
possible move in your game, so examining the object gives you the information needed to
perform that move.
For more information about describing your gameplay model and using strategists, see The
Minmax Strategist in GameplayKit Programming Guide.
var budget: Int
The maximum number of game model states the strategist will examine when searching for a
move.
var explorationParameter: Int
A value that influences whether the strategist searches more broadly or more deeply for
winning game model states.
NSObject
Topics
Configuring a Strategist
Relationships
Inherits From
Conforms To


## Page 10

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GKStrategist
Hashable
NSObjectProtocol
protocol GKStrategist
A general interface for objects that provide artificial intelligence for use in turn-based (and
similar) games.
class GKMinmaxStrategist
An AI that chooses moves in turn-based games using a deterministic strategy.
protocol GKGameModel
Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.
protocol GKGameModelUpdate
Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.
See Also
Strategists


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

protocol GKGameModelUpdate
Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.


## Page 15

You adopt this protocol to describe the gameplay of your turn-based game for use by a
GKStrategist object. The strategist uses your player class, along with other custom classes yo
implement (adopting the GKGameModel and GKGameModelUpdate protocols) to plan moves in
your game.
You use your custom class implementing this protocol in several places:
In the players and activePlayer properties of your game model class, to describe the set
of players in your game and indicate which player’s turn it currently is
In the gameModelUpdates(for:) method of your game model class, to describe the set of
moves currently valid for a specified player
In the isWin(for:), isLoss(for:), and score(for:) method of your game model class
to rate the desirability of that particular state of the game model to a specified player
When calling the bestMove(for:) or randomMove(for:fromNumberOfBestMoves:)
method to find an optimal move, to indicate the player for whom GameplayKit should plan move
Your class that implements this protocol can also contain properties and methods relevant to the
implementation of your game—for example, an identifying color or name.
For more information about describing your gameplay model and using a strategist, see The
Minmax Strategist in GameplayKit Programming Guide.
Overview
GameplayKit / GKGameModelPlayer
Protocol
GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a
strategist object can plan game moves.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 16

var playerId: Int
A number uniquely identifying the player.
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
Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelUpdate
Topics
Identifying a Player
Relationships
Inherits From
See Also
Strategists


## Page 17

Implement this protocol to describe a move in your turn-based game so that a strategist
object can plan game moves.


## Page 18

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


## Page 19

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


## Page 20

Implement this protocol to describe your gameplay model so that a strategist object can pla
game moves.
protocol GKGameModelPlayer
Implement this protocol to describe a player in your turn-based game so that a strategist
object can plan game moves.


