# 002_Deferred.pdf

## Page 1

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


## Page 2

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


