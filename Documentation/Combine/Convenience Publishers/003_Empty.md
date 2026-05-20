# 003_Empty.pdf

## Page 1

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


## Page 2

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


