# 002_AnyPublisher.pdf

## Page 1

Using Combine for Your App’s Asynchronous Code
AnyPublisher is a concrete implementation of Publisher that has no significant properties o
its own, and passes through elements and completion values from its upstream publisher.
Use AnyPublisher to wrap a publisher whose type has details you don’t want to expose across
API boundaries, such as different modules. Wrapping a Subject with AnyPublisher also
prevents callers from accessing its send(_:) method. When you use type erasure this way, you
can change the underlying publisher implementation over time without affecting existing clients.
You can use Combine’s eraseToAnyPublisher() operator to wrap a publisher with Any
Publisher.
Mentioned in
Overview
Topics
Creating a type-erased publisher
Combine / AnyPublisher
Structure
AnyPublisher
A publisher that performs type erasure by wrapping another publisher.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

init<P>(P)
Creates a type-erasing publisher to wrap the provided publisher.
Copyable
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Publisher
Conforms when Output conforms to Copyable, Output conforms to Escapable, and Failure conforms to
Error.
protocol Publisher
Declares that a type can transmit a sequence of values over time.
enum Publishers
A namespace for types that serve as publishers.
struct Published
A type that publishes a property marked with an attribute.
protocol Cancellable
A protocol indicating that an activity or action supports cancellation.
class AnyCancellable
A type-erasing cancellable object that executes a provided closure when canceled.
Relationships
Conforms To
See Also
Publishers


