# Subscribers.pdf

## Page 1

In Combine, a Publisher produces elements, and a Subscriber acts on the elements it
receives. However, a publisher can’t send elements until the subscriber attaches and asks for the
The subscriber also controls the rate at which the publisher delivers elements, by using the
Subscribers.Demand type to indicate how many elements it can receive. A subscriber can
indicate demand in either of two ways:
By calling request(_:) on the Subscription instance that the publisher provided when th
subscriber first subscribed.
By returning a new demand when the publisher calls the subscriber’s receive(_:) method t
deliver an element.
Demand is additive: If a subscriber has demanded two elements, and then requests Subscriber
.Demand(.max(3)), the publisher’s unsatisfied demand is now five elements. If the publisher
then sends an element, the unsatisfied demand decreases to four. Publishing elements is the only
way to reduce unsatisfied demand; subscribers can’t request negative demand.
Many apps just use the operators sink(receiveValue:) and assign(to:on:) to create the
convenience subscriber types Subscribers.Sink and Subscribers.Assign, respectively.
These two subscribers issue a demand for unlimited when they first attach to the publisher.
Once a publisher has unlimited demand, there can be no further negotiation of demand between
subscriber and publisher.
When a publisher has high or unlimited demand, it could send elements faster than a subscriber
can process them. This scenario could lead to elements being dropped, or rapidly increasing
Overview
Consume Elements as the Publisher Produces Them
Combine / Processing Published Elements with Subscribers
Article
Processing Published Elements with
Subscribers
Apply back pressure to precisely control when publishers produce elements.


## Page 2

memory pressure as elements fill a buffer while they await processing.
This scenario can occur if you use the convenience subscribers, because they demand an
unlimited number of elements. Ensure that the closure you provide to sink(receiveValue:)
and the side-effects of assign(to:on:) adhere to the following traits:
Don’t block the publisher.
Don’t consume excessive memory by buffering elements.
Don’t get overwhelmed and fail to process elements.
Fortunately, many commonly used publishers, such as publishers associated with user-interface
elements, publish at a manageable rate. Other common publishers only produce a single element
like the URL Loading System’s URLSession.DataTaskPublisher. It’s perfectly safe to use sin
and assign subscribers with these publishers.
To control the rate at which the publisher sends elements to your subscriber, create a custom
implementation of the Subscriber protocol. Use your implementation to specify demands that
you know your subscriber can keep up with. As the subscriber receives elements, it can request
more by returning a new demand value to receive(_:), or by calling request(_:) on the
subscription. With either, your subscriber can then fine-tune the number of elements the publishe
can send it at any given time.
This concept of controlling flow by signaling a subscriber’s readiness to receive elements is called
back pressure.
Each publisher keeps track of its current unsatisfied demand, meaning how many more elements 
subscriber has requested. Even automated sources like Foundation’s Timer.TimerPublisher
only produce elements when they have pending demand. The following example code illustrates
this behavior.
Apply Back Pressure with a Custom Subscriber


## Page 3

The subscriber’s receive(subscription:) implementation uses a five-second delay before 
requests any elements from the publisher. During this period, the publisher exists and has a valid
subscriber, but has zero demand, so it doesn’t produce elements. It only starts publishing elemen
after the delay expires and the subscriber gives it a nonzero demand, as seen in the following
output:
This example only requests three elements, issuing the demand after the five-second delay
expires. As a result, the publisher sends no further elements after the third, but also doesn’t
complete publishing by sending a Subscribers.Completion.finished value either, becaus
the publisher is just waiting for more demand. To continue to receive elements, the subscriber
could store the subscription and periodically request more elements. It could also indicate new
demand as the return value from its receive(_:) implementation.


## Page 4

Even without writing a custom Subscriber, you can still apply back pressure by using one of
Combine’s buffering or timing operators:
buffer(size:prefetch:whenFull:) holds onto a fixed number of items from an upstrea
publisher. When full, the buffer either drops elements or throws an error.
debounce(for:scheduler:options:) publishes only when the upstream publisher stops
publishing for a specified interval of time.
throttle(for:scheduler:latest:) produces elements at a given maximum rate. If it
receives multiple elements during an interval, it sends only the newest or oldest.
collect(_:) and collect(_:options:) bundle elements until they exceed a given coun
or time interval, sending you an array of elements. This option is good if your subscriber can
process multiple elements at the same time.
Because these operators control the number of elements your subscriber receives, you can attac
a subscriber that requests unlimited elements, such as sink(receiveValue:) and
assign(to:on:).
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
enum Subscribers
A namespace for types that serve as subscribers.
struct AnySubscriber
A type-erasing subscriber.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.
enum Subscriptions
A namespace for symbols related to subscriptions.
Manage Unlimited Demand by Using Back-Pressure
Operators
See Also
Subscribers


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

struct Demand
A requested number of items, sent to a publisher from a subscriber through the subscription
enum Completion
A signal that a publisher doesn’t produce additional elements, either due to normal completi
or an error.
class Sink
A simple subscriber that requests an unlimited number of values upon subscription.
class Assign
A simple subscriber that assigns received elements to a property indicated by a key path.
Topics
Requesting elements
Receiving life cycle events
Using convenience subscribers
Combine / Subscribers
Enumeration
Subscribers
A namespace for types that serve as subscribers.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 9

Processing Published Elements with Subscribers
Apply back pressure to precisely control when publishers produce elements.
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
struct AnySubscriber
A type-erasing subscriber.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.
enum Subscriptions
A namespace for symbols related to subscriptions.
See Also
Subscribers


## Page 10

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


## Page 11

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


## Page 12

Processing Published Elements with Subscribers
Receiving and Handling Events with Combine
Subscriptions are class constrained because a Subscription has identity, defined by the
moment in time a particular subscriber attached to a publisher. Canceling a Subscription mus
be thread-safe.
You can only cancel a Subscription once.
Canceling a subscription frees up any resources previously allocated by attaching the
Subscriber.
func request(Subscribers.Demand)
Tells a publisher that it may send more values to the subscriber.
Mentioned in
Overview
Topics
Requesting elements
Combine / Subscription
Protocol
Subscription
A protocol representing the connection of a subscriber to a publisher.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 13

Required
struct Demand
A requested number of items, sent to a publisher from a subscriber through the subscription
Cancellable, CustomCombineIdentifierConvertible
Processing Published Elements with Subscribers
Apply back pressure to precisely control when publishers produce elements.
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
enum Subscribers
A namespace for types that serve as subscribers.
struct AnySubscriber
A type-erasing subscriber.
enum Subscriptions
A namespace for symbols related to subscriptions.
Relationships
Inherits From
See Also
Subscribers


## Page 14

static var empty: any Subscription
Returns the “empty” subscription.
Processing Published Elements with Subscribers
Apply back pressure to precisely control when publishers produce elements.
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
enum Subscribers
A namespace for types that serve as subscribers.
struct AnySubscriber
Topics
Using convenience subscriptions
See Also
Subscribers
Combine / Subscriptions
Enumeration
Subscriptions
A namespace for symbols related to subscriptions.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 15

A type-erasing subscriber.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.


