# 001_DispatchPredicate.pdf

## Page 1

You use dispatch predicates with the dispatchPrecondition(condition:) method.
case onQueue(DispatchQueue)
A predicate that indicates the evaluated context is the associated dispatch queue.
case onQueueAsBarrier(DispatchQueue)
A predicate that indicates the evaluated context is the associated dispatch queue as part of 
barrier operation.
case notOnQueue(DispatchQueue)
A predicate that indicates the evaluated context is not the associated dispatch queue.
Overview
Topics
Predicates
Relationships
Dispatch / DispatchPredicate
Enumeration
DispatchPredicate
Logical conditions to evaluate within a given execution context.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst
macOS 10.12+
tvOS 10.0+
visionOS
watchOS 3.0+


## Page 2

Sendable, SendableMetatype
class DispatchObject
The base class for most dispatch types.
func dispatchPrecondition(condition: @autoclosure () -> Dispatch
Predicate)
Checks a dispatch condition necessary for further execution.
Dispatch Objects
The basic behaviors supported by all dispatch types.
Conforms To
See Also
Dispatch Objects


