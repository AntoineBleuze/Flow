# 004_Fail.pdf

## Page 1

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


## Page 2

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


