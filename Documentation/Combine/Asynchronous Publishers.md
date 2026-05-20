# Asynchronous Publishers.pdf

## Page 1

AsyncPublisher conforms to AsyncSequence, which allows callers to receive values with the
for-await-in syntax, rather than attaching a Subscriber.
Use the values property of the Publisher protocol to wrap an existing publisher with an
instance of this type.
init(P)
Creates a publisher that exposes elements received from an upstream publisher as an
asynchronous sequence.
func makeAsyncIterator() -> AsyncPublisher<P>.Iterator
Creates the asynchronous iterator that produces elements of this asynchronous sequence.
struct Iterator
Overview
Topics
Creating an asynchronous publisher
Creating an iterator
Combine / AsyncPublisher
Structure
AsyncPublisher
A publisher that exposes its elements as an asynchronous sequence.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

The iterator that produces elements of the asynchronous publisher sequence.
typealias Element
The type of element produced by this asynchronous sequence.
AsyncSequence
struct AsyncThrowingPublisher
A publisher that exposes its elements as a throwing asynchronous sequence.
Supporting types
Relationships
Conforms To
See Also
Asynchronous Publishers


## Page 3

AsyncThrowingPublisher conforms to AsyncSequence, which allows callers to receive
values with the for-await-in syntax, rather than attaching a Subscriber. If the upstream
publisher terminates with an error, AsyncThrowingPublisher throws the error to the awaiting
caller.
Use the values property of the Publisher protocol to wrap an existing publisher with an
instance of this type.
init(P)
Creates a publisher that exposes elements received from an upstream publisher as a throwin
asynchronous sequence.
func makeAsyncIterator() -> AsyncThrowingPublisher<P>.Iterator
Creates the asynchronous iterator that produces elements of this asynchronous sequence.
Overview
Topics
Creating an asynchronous publisher
Creating an iterator
Combine / AsyncThrowingPublisher
Structure
AsyncThrowingPublisher
A publisher that exposes its elements as a throwing asynchronous sequence.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 4

struct Iterator
The iterator that produces elements of the asynchronous publisher sequence.
typealias Element
The type of element produced by this asynchronous sequence.
AsyncSequence
struct AsyncPublisher
A publisher that exposes its elements as an asynchronous sequence.
Supporting types
Relationships
Conforms To
See Also
Asynchronous Publishers


