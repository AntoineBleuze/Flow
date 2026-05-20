# 001_Subscriber.pdf

## Page 1

Processing Published Elements with Subscribers
Receiving and Handling Events with Combine
Controlling Publishing with Connectable Publishers
Using Combine for Your App’s Asynchronous Code
A Subscriber instance receives a stream of elements from a Publisher, along with life cycle
events describing changes to their relationship. A given subscriber’s Input and Failure
associated types must match the Output and Failure of its corresponding publisher.
You connect a subscriber to a publisher by calling the publisher’s subscribe(_:) method. Afte
making this call, the publisher invokes the subscriber’s receive(subscription:) method. Th
gives the subscriber a Subscription instance, which it uses to demand elements from the
publisher, and to optionally cancel the subscription. After the subscriber makes an initial demand,
the publisher calls receive(_:), possibly asynchronously, to deliver newly-published elements
the publisher stops publishing, it calls receive(completion:), using a parameter of type
Subscribers.Completion to indicate whether publishing completes normally or with an error
Combine provides the following subscribers as operators on the Publisher type:
sink(receiveCompletion:receiveValue:) executes arbitrary closures when it receive
a completion signal and each time it receives a new element.
Mentioned in
Overview
Combine / Subscriber
Protocol
Subscriber
A protocol that declares a type that can receive input from a publisher.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

assign(to:on:) writes each newly-received value to a property identified by a key path on 
given instance.
associatedtype Input
The kind of values this subscriber receives.
Required
associatedtype Failure : Error
The kind of errors this subscriber might receive.
Required
func receive(Self.Input) -> Subscribers.Demand
Tells the subscriber that the publisher has produced an element.
Required
func receive() -> Subscribers.Demand
Tells the subscriber that a publisher of void elements is ready to receive further requests.
func receive(subscription: any Subscription)
Tells the subscriber that it has successfully subscribed to the publisher and may request
items.
Required
func receive(completion: Subscribers.Completion<Self.Failure>)
Tells the subscriber that the publisher has completed publishing, either normally or with an
error.
Required
enum Completion
A signal that a publisher doesn’t produce additional elements, either due to normal completi
or an error.
Topics
Declaring supporting types
Receiving elements
Receiving life cycle events


## Page 3

CustomCombineIdentifierConvertible
AnySubscriber, Subscribers.Assign, Subscribers.Sink
Processing Published Elements with Subscribers
Apply back pressure to precisely control when publishers produce elements.
enum Subscribers
A namespace for types that serve as subscribers.
struct AnySubscriber
A type-erasing subscriber.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.
enum Subscriptions
A namespace for symbols related to subscriptions.
Relationships
Inherits From
Conforming Types
See Also
Subscribers


