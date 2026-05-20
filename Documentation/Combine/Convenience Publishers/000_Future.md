# 000_Future.pdf

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


