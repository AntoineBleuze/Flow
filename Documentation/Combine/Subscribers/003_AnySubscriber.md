# 003_AnySubscriber.pdf

## Page 1

Use an AnySubscriber to wrap an existing subscriber whose details you don’t want to expose.
You can also use AnySubscriber to create a custom subscriber by providing closures for the
methods defined in Subscriber, rather than implementing Subscriber directly.
init<S>(S)
Creates a type-erasing subscriber to wrap an existing subscriber.
init<S>(S)
Creates a type-erasing subscriber to wrap an existing subscriber.
init(receiveSubscription: ((any Subscription) -> Void)?, receiveValue:
((Input) -> Subscribers.Demand)?, receiveCompletion: ((Subscribers.
Completion<Failure>) -> Void)?)
Overview
Topics
Creating a type-erased subscriber
Combine / AnySubscriber
Structure
AnySubscriber
A type-erasing subscriber.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Creates a type-erasing subscriber that executes the provided closures.
CustomCombineIdentifierConvertible
CustomPlaygroundDisplayConvertible
CustomReflectable
CustomStringConvertible
Subscriber
Processing Published Elements with Subscribers
Apply back pressure to precisely control when publishers produce elements.
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
enum Subscribers
A namespace for types that serve as subscribers.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.
enum Subscriptions
A namespace for symbols related to subscriptions.
Relationships
Conforms To
See Also
Subscribers


