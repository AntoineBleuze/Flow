# Subjects.pdf

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


## Page 3

Using Combine for Your App’s Asynchronous Code
Unlike PassthroughSubject, CurrentValueSubject maintains a buffer of the most recentl
published element.
Calling send(_:) on a CurrentValueSubject also updates the current value, making it
equivalent to updating the value directly.
init(Output)
Creates a current value subject with the given initial value.
Mentioned in
Overview
Topics
Creating a current value subject
Accessing the current value
Combine / CurrentValueSubject
Class
CurrentValueSubject
A subject that wraps a single value and publishes a new element whenever the
value changes.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 4

var value: Output
The value wrapped by this subject, published as a new element whenever it changes.
Publisher, Subject
protocol Subject
A publisher that exposes a method for outside callers to publish elements.
class PassthroughSubject
A subject that broadcasts elements to downstream subscribers.
Relationships
Conforms To
See Also
Subjects


## Page 5

Using Combine for Your App’s Asynchronous Code
As a concrete implementation of Subject, the PassthroughSubject provides a convenient w
to adapt existing imperative code to the Combine model.
Unlike CurrentValueSubject, a PassthroughSubject doesn’t have an initial value or a
buffer of the most recently-published element. A PassthroughSubject drops values if there a
no subscribers, or its current demand is zero.
init()
Mentioned in
Overview
Topics
Creating a passthrough subject
Combine / PassthroughSubject
Class
PassthroughSubject
A subject that broadcasts elements to downstream subscribers.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 6

Publisher, Subject
protocol Subject
A publisher that exposes a method for outside callers to publish elements.
class CurrentValueSubject
A subject that wraps a single value and publishes a new element whenever the value change
Relationships
Conforms To
See Also
Subjects


