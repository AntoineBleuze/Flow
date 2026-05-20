# 001_GKNSPredicateRule.pdf

## Page 1

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


## Page 2

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


## Page 3

class GKRule
A rule to be used in the context of a rule system, with a predicate to be tested and an action 
be executed when the test succeeds.
class GKRuleSystem
A list of rules, together with a context for evaluating them and interpreting results, for use in
constructing data-driven logic or fuzzy logic systems.
See Also
Rule Systems


