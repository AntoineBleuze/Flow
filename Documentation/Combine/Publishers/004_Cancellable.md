# 004_Cancellable.pdf

## Page 1

Receiving and Handling Events with Combine
Controlling Publishing with Connectable Publishers
Calling cancel() frees up any allocated resources. It also stops side effects such as timers,
network access, or disk I/O.
func cancel()
Cancel the activity.
Required
Mentioned in
Overview
Topics
Canceling actions
Storing instances
Combine / Cancellable
Protocol
Cancellable
A protocol indicating that an activity or action supports cancellation.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

func store<C>(in: inout C)
Stores this cancellable instance in the specified collection.
func store(in: inout Set<AnyCancellable>)
Stores this cancellable instance in the specified set.
func storeWhileEntityActive(Entity)
Retains the Cancellable as long as the entity is active (see Entity.isActive). If the
entity is deactivated, the Cancellable is released.
Subscription
AnyCancellable, Subscribers.Assign, Subscribers.Sink
protocol Publisher
Declares that a type can transmit a sequence of values over time.
enum Publishers
A namespace for types that serve as publishers.
struct AnyPublisher
A publisher that performs type erasure by wrapping another publisher.
struct Published
Instance Methods
Relationships
Inherited By
Conforming Types
See Also
Publishers


## Page 3

A type that publishes a property marked with an attribute.
class AnyCancellable
A type-erasing cancellable object that executes a provided closure when canceled.


