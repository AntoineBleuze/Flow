# Rule Systems.pdf

## Page 1

Evaluating a GKRuleSystem object tests each of its rules, which typically examine the state or
facts associated with the rule system, and executes the actions specified by each rule whose test
passes, such as asserting or retracting facts in the rule system or modifying its state.
A rule has two parts: a predicate and an action.
The rule’s predicate determines whether the rule has been satisfied, within the context of a giv
rule system. Evaluating a rule’s predicate typically involves examining information in the rule
sytem’s state dictionary or testing the membership grade of facts claimed by the system (see
the facts property in GKRuleSystem for details).
The rule’s action is executed if and only if the rule’s predicate is satisfied. Rule actions typically
involve asserting or retracting facts in the system (see the GKRuleSystem methods listed in
Asserting and Retracting Facts) or modifying information in the system’s state dictionary.
There are multiple ways to create rules for use in a rule system, each with its own advantages.
Typical rule predicates involve conditional logic tests on the properties of the containing rule
system, and typical rule actions assert or retract facts. If your rules fit this pattern, you can use
the init(predicate:assertingFact:grade:) and init(predicate:retracting
Fact:grade:) methods to create rules that are entirely data-driven—that is, they can be eas
archived for later reuse, edited without compiling source code, and created at runtime.
To create rules with entirely custom logic for both predicate and action, use the init(block
Predicate:action:) method. This method creates rules that are very flexible, but that
Overview
GameplayKit / GKRule
Class
GKRule
A rule to be used in the context of a rule system, with a predicate to be tested and
an action to be executed when the test succeeds.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

cannot be archived for reuse.
To create rules with more complex custom logic, implement your own rule classes: subclass
GKRule to build custom logic for both the rule’s predicate and its action, or subclass
GKNSPredicateRule to use an NSPredicate object for the rule’s predicate and build custo
logic only for the rule’s action. The reusability of custom rule classes depends on your
implementation of such classes.
For more information about rules and rule systems, read Rule Systems in GameplayKit
Programming Guide.
GameplayKit evaluates rules in the context of a GKRuleSystem object, so custom rule classes
should be functional—that is, they generally should not carry independent state that affects their
predicate or action.
Subclasses of GKRule must implement both of the following methods:
Override the evaluatePredicate(in:) method to evaluate your rule in the context of the
provided rule system.
Override the performAction(in:) method to perform whatever actions should result when
your rule is satisfied (that is, when your evaluatePredicate(in:) implementation returns
true) in the context of the provided rule system.
Use the init(predicate:assertingFact:grade:) or init(predicate:retracting
Fact:grade:) to create a rule that uses an NSPredicate object for evaluation and whose
action asserts or retracts a fact in the containing rule system.
Subclass GKNSPredicateRule instead to use an NSPredicate object for evaluating the rul
and write custom logic only for the rule’s action.
Use the init(blockPredicate:action:) method to quickly create a rule whose custom
logic is contained in block objects.
Subclassing Notes
Methods to Override
Alternatives to Subclassing
Topics
Creating Data-Driven Rules


## Page 3

convenience init(predicate: NSPredicate, assertingFact: any NSObject
Protocol, grade: Float)
Creates a data-driven rule with the specified predicate, whose action asserts a fact in the ru
system evaluating the rule.
convenience init(predicate: NSPredicate, retractingFact: any NSObject
Protocol, grade: Float)
Creates a data-driven rule with the specified predicate, whose action retracts a fact in the ru
system evaluating the rule.
convenience init(blockPredicate: (GKRuleSystem) -> Bool, action: (GKRul
System) -> Void)
Creates a rule whose predicate is evaluated and action is executed through the specified
blocks.
var salience: Int
The importance of the rule relative to others in a rule system’s agenda.
func evaluatePredicate(in: GKRuleSystem) -> Bool
Returns a Boolean value indicating whether the rule has been satisfied in the context of the
specified rule system.
func performAction(in: GKRuleSystem)
Performs actions that should result when the rule is satisfied in the context of the specified
rule system.
NSObject
Creating Block-Based Rules
Setting the Order of Rules in a Rule System
Evaluating a Rule
Relationships
Inherits From


## Page 4

GKNSPredicateRule
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKNSPredicateRule
A rule for use in a rule system that uses a Foundation NSPredicate object to evaluate itsel
class GKRuleSystem
A list of rules, together with a context for evaluating them and interpreting results, for use in
constructing data-driven logic or fuzzy logic systems.
Inherited By
Conforms To
See Also
Rule Systems


## Page 5

The GKNSPredicateRule class is a specialized subclass of the GKRule class (which represent
rules to be used by GKRuleSystem objects). Custom subclasses of GKNSPredicateRule use 
NSPredicate object to evaluate a rule, rather than requiring custom logic for evaluation as is the
case with custom GKRule subclasses.
For more information about rules and rule systems, read Rule Systems in GameplayKit
Programming Guide.
GameplayKit evaluates rules in the context of a GKRuleSystem object, so custom rule classes
should be functional—that is, they generally should not carry independent state that affects their
predicate or action.
Override the performAction(in:) method to perform whatever actions should result when yo
rule is satisfied (that is, when its predicate property evaluates to true in the context of the
provided rule system).
Overview
Subclassing Notes
Methods to Override
Alternatives to Subclassing
GameplayKit / GKNSPredicateRule
Class
GKNSPredicateRule
A rule for use in a rule system that uses a Foundation NSPredicate object to
evaluate itself.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 6

Use the GKRule method init(predicate:assertingFact:grade:) or
init(predicate:retractingFact:grade:) to create a rule that uses an NSPredicate
object for evaluation and whose action asserts or retracts a fact in the containing rule system.
Use the GKRule method init(blockPredicate:action:) method to quickly create a rul
whose custom logic is contained in block objects.
init(predicate: NSPredicate)
Initializes a rule with the specified predicate.
var predicate: NSPredicate
A predicate to be tested when evaluating the rule.
func evaluatePredicate(in: GKRuleSystem) -> Bool
Returns a Boolean value indicating whether the rule’s predicate has been satisfied in the
context of the specified rule system.
GKRule
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Creating a Predicate-Based Rule
Evaluating a Rule
Relationships
Inherits From
Conforms To


## Page 7

class GKRule
A rule to be used in the context of a rule system, with a predicate to be tested and an action 
be executed when the test succeeds.
class GKRuleSystem
A list of rules, together with a context for evaluating them and interpreting results, for use in
constructing data-driven logic or fuzzy logic systems.
See Also
Rule Systems


## Page 8

A GKRuleSystem object manages a list of rules (GKRule objects). A rule system also offers
methods for evaluating its list of rules in a context defined by two features: a state dictionary
containing information to be tested by rules, and a set of facts representing the conclusions
drawn as a result of rule evaluation. You can evaluate facts based on a binary truth state—that is, 
fact either is or is not in the set—or on a continuously variable membership grade, representing
different levels of veracity, confidence, or strength for use in fuzzy logic.
You construct a rule system by creating GKRule objects and adding them to the system’s list of
rules. There are multiple ways to construct rules: for greater reusability, use the methods listed in
Creating Data-Driven Rules; or for greater flexibility, use the init(blockPredicate:action:
method or create a custom subclass of GKRule or GKNSPredicateRule. Then, add rules to the
system with the methods listed in Managing a System’s List of Rules below.
To evaluate a system, call the evaluate() method. This method processes each rule in the
system in the order it appears in the system’s agenda list. You set this order with the salience
property of each rule, or with the order in which you add rules to the system. As the system
processes each rule, it tests the rule’s evaluatePredicate(in:) method to determine wheth
the rule is satisfied in the context of the system. If the rule’s predicate is satisfied, the system
executes the rule’s performAction(in:) method and moves the rule to the executed list (so
the further evaluation of the agenda doesn’t repeatedly trigger the rule’s action).
Rules typically use the system’s state dictionary as input and its set of facts as output.
(However, more complex systems can include sets of rules whose predicates test facts or whose
Overview
GameplayKit / GKRuleSystem
Class
GKRuleSystem
A list of rules, together with a context for evaluating them and interpreting results,
for use in constructing data-driven logic or fuzzy logic systems.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 9

actions mutate the system’s state.) After evaluating a rule system, you can examine the set of fac
it has produced using the methods listed in Drawing Conclusions from Facts below. You can then
use the presence of a fact in the set, the value of its membership grade, or the combined
membership grades of a group of facts to influence the behaviors in your game.
For more information about rules and rule systems, read Rule Systems in GameplayKit
Programming Guide.
init()
Initializes a new, empty rule system.
var state: NSMutableDictionary
A dictionary of state information to be evaluated by the system’s rules.
var rules: [GKRule]
The list of rules to be executed when evaluating the system.
func add(GKRule)
Adds the specified rule to the system.
func add([GKRule])
Adds the specified list of rules to the system.
func removeAllRules()
Removes all rules from the system.
func evaluate()
Evaluates the rule system, executing the list of rules in its agenda.
var agenda: [GKRule]
Topics
Creating a Rule System
Managing State Information
Managing a System’s List of Rules
Evaluating a Rule System


## Page 10

The list of rules to be considered when evaluating the system.
var executed: [GKRule]
The list of rules whose actions have been performed during evaluation of the system.
func reset()
Returns the rule system to its original agenda and clears all facts.
var facts: [Any]
The list of facts claimed by the rule system.
func assertFact(any NSObjectProtocol)
Adds the specified fact to the fact set with a membership grade of 1.0, and reevaluates the
rules in the system’s agenda.
func assertFact(any NSObjectProtocol, grade: Float)
Increases the membership grade of the specified fact by the specified amount, adding it to
the fact set if necessary, and reevaluates the rules in the system’s agenda.
func retractFact(any NSObjectProtocol)
Removes the specified fact from the fact set, and reevaluates the rules in the system’s
agenda.
func retractFact(any NSObjectProtocol, grade: Float)
Reduces the membership grade of the specified fact by the specified amount, removing it
from the fact set if necessary, and reevaluates the rules in the system’s agenda.
func grade(forFact: any NSObjectProtocol) -> Float
Returns the membership grade of the specified fact.
func minimumGrade(forFacts: [Any]) -> Float
Returns the lowest membership grade among the specified facts.
func maximumGrade(forFacts: [Any]) -> Float
Returns the highest membership grade among the specified facts.
Asserting and Retracting Facts
Drawing Conclusions from Facts


## Page 11

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GKRule
A rule to be used in the context of a rule system, with a predicate to be tested and an action 
be executed when the test succeeds.
class GKNSPredicateRule
A rule for use in a rule system that uses a Foundation NSPredicate object to evaluate itsel
Relationships
Inherits From
Conforms To
See Also
Rule Systems


