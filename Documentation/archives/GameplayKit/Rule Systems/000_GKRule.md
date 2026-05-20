# 000_GKRule.pdf

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


