# 001_Just.pdf

## Page 1

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


## Page 2

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


## Page 3

struct Record
A publisher that allows for recording a series of inputs and a completion, for later playback to
each subscriber.


