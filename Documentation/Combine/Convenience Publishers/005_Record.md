# 005_Record.pdf

## Page 1

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


## Page 2

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


