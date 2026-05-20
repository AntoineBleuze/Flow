# Convenience Publishers.pdf

## Page 1

Using Combine for Your App’s Asynchronous Code
Use a future to perform some work and then asynchronously publish a single element. You initializ
the future with a closure that takes a Future.Promise; the closure calls the promise with a
Result that indicates either success or failure. In the success case, the future’s downstream
subscriber receives the element prior to the publishing stream finishing normally. If the result is an
error, publishing terminates with that error.
The following example shows a method that uses a future to asynchronously publish a random
number after a brief delay:
Mentioned in
Overview
Combine / Future
Class
Future
A publisher that eventually produces a single value and then finishes or fails.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

To receive the published value, you use any Combine subscriber, such as a Subscribers.Sink
like this:
To integrate with the async-await syntax in Swift 5.5, Future can provide its value to an
awaiting caller. This is particularly useful because unlike other types that conform to Publisher
and potentially publish many elements, a Future only publishes one element (or fails). By using
the value property, the above call point looks like this:
The async-await syntax in Swift can also replace the use of a future entirely, for the case where
you want to perform some operation after an asynchronous task completes.
You do this with the function withCheckedContinuation(isolation:function:_:) and
its throwing equivalent, withCheckedThrowingContinuation(isolation:function:_:
The following example performs the same asynchronous random number generation as the
Future example above, but as an async method:
The call point for this method doesn’t use a closure like the future’s sink subscriber does; it simpl
awaits and assigns the result:
Integrating with Swift Concurrency
Alternatives to Futures


## Page 3

For more information on continuations, see the Concurrency topic in the Swift standard library.
init((Future<Output, Failure>.Promise) -> Void)
Creates a publisher that invokes a promise closure when the publisher emits an element.
typealias Promise
A type that represents a closure to invoke in the future, when an element or error is available
var value: Output
The published value of the future, delivered asynchronously.
var value: Output
The published value of the future or an error, delivered asynchronously.
Publisher
struct Just
A publisher that emits an output to each subscriber just once, and then finishes.
struct Deferred
Topics
Creating a future
Accessing the value asynchronously
Relationships
Conforms To
See Also
Convenience Publishers


## Page 4

A publisher that awaits subscription before running the supplied closure to create a publishe
for the new subscriber.
struct Empty
A publisher that never publishes any values, and optionally finishes immediately.
struct Fail
A publisher that immediately terminates with the specified error.
struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.


## Page 5

You can use a Just publisher to start a chain of publishers. A Just publisher is also useful when
replacing a value with Publishers.Catch.
In contrast with Result.Publisher, a Just publisher can’t fail with an error. And unlike
Optional.Publisher, a Just publisher always produces a value.
init(Output)
Initializes a publisher that emits the specified output just once.
let output: Output
The one element that the publisher emits.
Overview
Topics
Creating a just ublisher
Inspecting publisher properties
Comparing publishers
Combine / Just
Structure
Just
A publisher that emits an output to each subscriber just once, and then finishes.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 6

static func == (Just<Output>, Just<Output>) -> Bool
Returns a Boolean value that indicates whether two publishers are equivalent.
Publisher Operators
Methods that create downstream publishers or subscribers to act on the elements they
receive.
Equatable Implementations
Copyable, Equatable, Publisher
class Future
A publisher that eventually produces a single value and then finishes or fails.
struct Deferred
A publisher that awaits subscription before running the supplied closure to create a publishe
for the new subscriber.
struct Empty
A publisher that never publishes any values, and optionally finishes immediately.
struct Fail
A publisher that immediately terminates with the specified error.
Applying operators
Default Implementations
Relationships
Conforms To
See Also
Convenience Publishers


## Page 7

struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.


## Page 8

init(createPublisher: () -> DeferredPublisher)
Creates a deferred publisher.
typealias Output
The kind of values published by this publisher.
typealias Failure
The kind of errors this publisher might publish.
let createPublisher: () -> DeferredPublisher
The closure to execute when this deferred publisher receives a subscription.
Topics
Creating a deferred publisher
Declaring supporting types
Inspecting publisher properties
Combine / Deferred
Structure
Deferred
A publisher that awaits subscription before running the supplied closure to create
a publisher for the new subscriber.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 9

Publisher
class Future
A publisher that eventually produces a single value and then finishes or fails.
struct Just
A publisher that emits an output to each subscriber just once, and then finishes.
struct Empty
A publisher that never publishes any values, and optionally finishes immediately.
struct Fail
A publisher that immediately terminates with the specified error.
struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.
Relationships
Conforms To
See Also
Convenience Publishers


## Page 10

You can create a ”Never” publisher — one which never sends values and never finishes or fails —
with the initializer Empty(completeImmediately: false).
init(completeImmediately: Bool)
Creates an empty publisher.
init(completeImmediately: Bool, outputType: Output.Type, failureType:
Failure.Type)
Creates an empty publisher with the given completion behavior and output and failure types
let completeImmediately: Bool
A Boolean value that indicates whether the publisher immediately sends a completion.
Overview
Topics
Creating an empty publisher
Inspecting publisher properties
Combine / Empty
Structure
Empty
A publisher that never publishes any values, and optionally finishes immediately.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 11

static func == (Empty<Output, Failure>, Empty<Output, Failure>) -> Bool
Returns a Boolean value that indicates whether two publishers are equivalent.
Equatable, Publisher
class Future
A publisher that eventually produces a single value and then finishes or fails.
struct Just
A publisher that emits an output to each subscriber just once, and then finishes.
struct Deferred
A publisher that awaits subscription before running the supplied closure to create a publishe
for the new subscriber.
struct Fail
A publisher that immediately terminates with the specified error.
struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.
Comparing publishers
Relationships
Conforms To
See Also
Convenience Publishers


## Page 12

init(error: Failure)
Creates a publisher that immediately terminates with the specified failure.
init(outputType: Output.Type, failure: Failure)
Creates publisher with the given output type, that immediately terminates with the specified
failure.
let error: Failure
The failure to send when terminating the publisher.
static func == (Fail<Output, Failure>, Fail<Output, Failure>) -> Bool
Returns a Boolean value that indicates whether two publishers are equivalent.
Topics
Creating a fail publisher
Inspecting publisher properties
Comparing publishers
Default Implementations
Combine / Fail
Structure
Fail
A publisher that immediately terminates with the specified error.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 13

Equatable Implementations
Copyable, Equatable, Publisher
class Future
A publisher that eventually produces a single value and then finishes or fails.
struct Just
A publisher that emits an output to each subscriber just once, and then finishes.
struct Deferred
A publisher that awaits subscription before running the supplied closure to create a publishe
for the new subscriber.
struct Empty
A publisher that never publishes any values, and optionally finishes immediately.
struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.
Relationships
Conforms To
See Also
Convenience Publishers


## Page 14

init(output: [Output], completion: Subscribers.Completion<Failure>)
Creates a record publisher to publish the provided elements, followed by the provided
completion value.
init(record: (inout Record<Output, Failure>.Recording) -> Void)
Creates a publisher to interactively record a series of outputs and a completion.
init(recording: Record<Output, Failure>.Recording)
Creates a record publisher from an existing recording.
let recording: Record<Output, Failure>.Recording
The recorded output and completion.
struct Recording
A recorded sequence of outputs, followed by a completion value.
Topics
Creating a record publisher
Inspecting publisher properties
Combine / Record
Structure
Record
A publisher that allows for recording a series of inputs and a completion, for later
playback to each subscriber.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 15

Copyable
Decodable
Encodable
Publisher
class Future
A publisher that eventually produces a single value and then finishes or fails.
struct Just
A publisher that emits an output to each subscriber just once, and then finishes.
struct Deferred
A publisher that awaits subscription before running the supplied closure to create a publishe
for the new subscriber.
struct Empty
A publisher that never publishes any values, and optionally finishes immediately.
struct Fail
A publisher that immediately terminates with the specified error.
Relationships
Conforms To
See Also
Convenience Publishers


