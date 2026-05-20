# 000_Subject.pdf

## Page 1

Using Combine for Your App’s Asynchronous Code
A subject is a publisher that you can use to ”inject” values into a stream, by calling its send(_:)
method. This can be useful for adapting existing imperative code to the Combine model.
func send(Self.Output)
Sends a value to the subscriber.
Required
func send()
Sends a void value to the subscriber.
Mentioned in
Overview
Topics
Delivering elements to subscribers
Delivering life cycle events to subscribers
Combine / Subject
Protocol
Subject
A publisher that exposes a method for outside callers to publish elements.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

func send(subscription: any Subscription)
Sends a subscription to the subscriber.
Required
func send(completion: Subscribers.Completion<Self.Failure>)
Sends a completion signal to the subscriber.
Required
Publisher
CurrentValueSubject, PassthroughSubject
class CurrentValueSubject
A subject that wraps a single value and publishes a new element whenever the value change
class PassthroughSubject
A subject that broadcasts elements to downstream subscribers.
Relationships
Inherits From
Conforming Types
See Also
Subjects


