# 000_Publisher.pdf

## Page 1

Processing Published Elements with Subscribers
Receiving and Handling Events with Combine
Using Combine for Your App’s Asynchronous Code
A publisher delivers elements to one or more Subscriber instances. The subscriber’s Input an
Failure associated types must match the Output and Failure types declared by the publish
The publisher implements the receive(subscriber:)method to accept a subscriber.
After this, the publisher can call the following methods on the subscriber:
receive(subscription:): Acknowledges the subscribe request and returns a
Subscription instance. The subscriber uses the subscription to demand elements from the
publisher and can use it to cancel publishing.
receive(_:): Delivers one element from the publisher to the subscriber.
receive(completion:): Informs the subscriber that publishing has ended, either normally 
with an error.
Every Publisher must adhere to this contract for downstream subscribers to function correctly
Mentioned in
Overview
Combine / Publisher
Protocol
Publisher
Declares that a type can transmit a sequence of values over time.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Tip
A Combine publisher fills a role similar to, but distinct from, the AsyncSequence in the Swift
standard library. A Publisher and an AsyncSequence both produce elements over time.
However, the pull model in Combine uses a Subscriber to request elements from a
publisher, while Swift concurrency uses the for-await-in syntax to iterate over elements
published by an AsyncSequence. Both APIs offer methods to modify the sequence by
mapping or filtering elements, while only Combine provides time-based operations like
debounce(for:scheduler:options:) and throttle(for:scheduler:latest:),
and combining operations like merge(with:) and combineLatest(_:_:). To bridge the
two approaches, the property values exposes a publisher’s elements as an Async
Sequence, allowing you to iterate over them with for-await-in rather than attaching a
Subscriber.
Extensions on Publisher define a wide variety of operators that you compose to create
sophisticated event-processing chains. Each operator returns a type that implements the
Publisher protocol Most of these types exist as extensions on the Publishers enumeration.
For example, the map(_:) operator returns an instance of Publishers.Map.
Use operators to assemble a chain of republishers, optionally ending with a subscriber, that
processes elements produced by upstream publishers. Each operator creates and configures an
instance of a Publisher or Subscriber, and subscribes it to the publisher that you call the
method on.
In the following example, a sequence publisher emits the integers 1, 2, 3, 4, and 5. A filter(_:
operator creates a Publishers.Filter publisher to only republish even values. A second
operator creates a Subscribers.Sink subscriber to print out each value received. The sink
subscriber automatically subscribes to the filter publisher, at which point the filter publisher
subscribes to its upstream publisher, the sequence publisher.
Using operators


## Page 3

Rather than implementing the Publisher protocol yourself, you can create your own publisher b
using one of several types provided by the Combine framework:
Use a concrete subclass of Subject, such as PassthroughSubject, to publish values on-
demand by calling its send(_:) method.
Use a CurrentValueSubject to publish whenever you update the subject’s underlying valu
Add the @Published annotation to a property of one of your own types. In doing so, the
property gains a publisher that emits an event whenever the property’s value changes. See the
Published type for an example of this approach.
associatedtype Output
The kind of values published by this publisher.
Required
associatedtype Failure : Error
The kind of errors this publisher might publish.
Required
func receive<S>(subscriber: S)
Attaches the specified subscriber to this publisher.
Required
func subscribe<S>(S)
Attaches the specified subscriber to this publisher.
func subscribe<S>(S) -> AnyCancellable
Attaches the specified subject to this publisher.
func map<T>((Self.Output) -> T) -> Publishers.Map<Self, T>
Transforms all elements from the upstream publisher with a provided closure.
Creating Your Own Publishers
Topics
Declaring supporting types
Working with subscribers
Mapping elements


## Page 4

func tryMap<T>((Self.Output) throws -> T) -> Publishers.TryMap<Self, T>
Transforms all elements from the upstream publisher with a provided error-throwing closure
func mapError<E>((Self.Failure) -> E) -> Publishers.MapError<Self, E>
Converts any failure from the upstream publisher into a new error.
func replaceNil<T>(with: T) -> Publishers.Map<Self, T>
Replaces nil elements in the stream with the provided element.
func scan<T>(T, (T, Self.Output) -> T) -> Publishers.Scan<Self, T>
Transforms elements from the upstream publisher by providing the current element to a
closure along with the last value returned by the closure.
func tryScan<T>(T, (T, Self.Output) throws -> T) -> Publishers.TryScan<
Self, T>
Transforms elements from the upstream publisher by providing the current element to an
error-throwing closure along with the last value returned by the closure.
func setFailureType<E>(to: E.Type) -> Publishers.SetFailureType<Self, E
Changes the failure type declared by the upstream publisher.
func filter((Self.Output) -> Bool) -> Publishers.Filter<Self>
Republishes all elements that match a provided closure.
func tryFilter((Self.Output) throws -> Bool) -> Publishers.TryFilter<
Self>
Republishes all elements that match a provided error-throwing closure.
func compactMap<T>((Self.Output) -> T?) -> Publishers.CompactMap<Self, 
>
Calls a closure with each received element and publishes any returned optional that has a
value.
func tryCompactMap<T>((Self.Output) throws -> T?) -> Publishers.Try
CompactMap<Self, T>
Calls an error-throwing closure with each received element and publishes any returned
optional that has a value.
func removeDuplicates() -> Publishers.RemoveDuplicates<Self>
Publishes only elements that don’t match the previous element.
Filtering elements


## Page 5

func removeDuplicates(by: (Self.Output, Self.Output) -> Bool) ->
Publishers.RemoveDuplicates<Self>
Publishes only elements that don’t match the previous element, as evaluated by a provided
closure.
func tryRemoveDuplicates(by: (Self.Output, Self.Output) throws -> Bool)
-> Publishers.TryRemoveDuplicates<Self>
Publishes only elements that don’t match the previous element, as evaluated by a provided
error-throwing closure.
func replaceEmpty(with: Self.Output) -> Publishers.ReplaceEmpty<Self>
Replaces an empty stream with the provided element.
func replaceError(with: Self.Output) -> Publishers.ReplaceError<Self>
Replaces any errors in the stream with the provided element.
func collect() -> Publishers.Collect<Self>
Collects all received elements, and emits a single array of the collection when the upstream
publisher finishes.
func collect(Int) -> Publishers.CollectByCount<Self>
Collects up to the specified number of elements, and then emits a single array of the
collection.
func collect<S>(Publishers.TimeGroupingStrategy<S>, options: S.Schedule
Options?) -> Publishers.CollectByTime<Self, S>
Collects elements by a given time-grouping strategy, and emits a single array of the
collection.
enum TimeGroupingStrategy
A strategy for collecting received elements.
func ignoreOutput() -> Publishers.IgnoreOutput<Self>
Ignores all upstream elements, but passes along the upstream publisher’s completion state
(finished or failed).
func reduce<T>(T, (T, Self.Output) -> T) -> Publishers.Reduce<Self, T>
Applies a closure that collects each element of a stream and publishes a final result upon
completion.
Reducing elements


## Page 6

func tryReduce<T>(T, (T, Self.Output) throws -> T) -> Publishers.Try
Reduce<Self, T>
Applies an error-throwing closure that collects each element of a stream and publishes a fina
result upon completion.
func count() -> Publishers.Count<Self>
Publishes the number of elements received from the upstream publisher.
func max() -> Publishers.Comparison<Self>
Publishes the maximum value received from the upstream publisher, after it finishes.
func max(by: (Self.Output, Self.Output) -> Bool) -> Publishers.
Comparison<Self>
Publishes the maximum value received from the upstream publisher, using the provided
ordering closure.
func tryMax(by: (Self.Output, Self.Output) throws -> Bool) -> Publisher
.TryComparison<Self>
Publishes the maximum value received from the upstream publisher, using the provided erro
throwing closure to order the items.
func min() -> Publishers.Comparison<Self>
Publishes the minimum value received from the upstream publisher, after it finishes.
func min(by: (Self.Output, Self.Output) -> Bool) -> Publishers.
Comparison<Self>
Publishes the minimum value received from the upstream publisher, after it finishes.
func tryMin(by: (Self.Output, Self.Output) throws -> Bool) -> Publisher
.TryComparison<Self>
Publishes the minimum value received from the upstream publisher, using the provided error
throwing closure to order the items.
func contains(Self.Output) -> Publishers.Contains<Self>
Publishes a Boolean value upon receiving an element equal to the argument.
func contains(where: (Self.Output) -> Bool) -> Publishers.ContainsWhere
Self>
Applying mathematical operations on elements
Applying matching criteria to elements


## Page 7

Publishes a Boolean value upon receiving an element that satisfies the predicate closure.
func tryContains(where: (Self.Output) throws -> Bool) -> Publishers.Try
ContainsWhere<Self>
Publishes a Boolean value upon receiving an element that satisfies the throwing predicate
closure.
func allSatisfy((Self.Output) -> Bool) -> Publishers.AllSatisfy<Self>
Publishes a single Boolean value that indicates whether all received elements pass a given
predicate.
func tryAllSatisfy((Self.Output) throws -> Bool) -> Publishers.TryAll
Satisfy<Self>
Publishes a single Boolean value that indicates whether all received elements pass a given
error-throwing predicate.
func drop<P>(untilOutputFrom: P) -> Publishers.DropUntilOutput<Self, P>
Ignores elements from the upstream publisher until it receives an element from a second
publisher.
func dropFirst(Int) -> Publishers.Drop<Self>
Omits the specified number of elements before republishing subsequent elements.
func drop(while: (Self.Output) -> Bool) -> Publishers.DropWhile<Self>
Omits elements from the upstream publisher until a given closure returns false, before
republishing all remaining elements.
func tryDrop(while: (Self.Output) throws -> Bool) -> Publishers.TryDrop
While<Self>
Omits elements from the upstream publisher until an error-throwing closure returns false,
before republishing all remaining elements.
func append(Self.Output...) -> Publishers.Concatenate<Self, Publishers.
Sequence<[Self.Output], Self.Failure>>
Appends a publisher’s output with the specified elements.
func append<S>(S) -> Publishers.Concatenate<Self, Publishers.Sequence<S
Self.Failure>>
Appends a publisher’s output with the specified sequence.
func append<P>(P) -> Publishers.Concatenate<Self, P>
Applying sequence operations to elements


## Page 8

Appends the output of this publisher with the elements emitted by the given publisher.
func prepend(Self.Output...) -> Publishers.Concatenate<Publishers.
Sequence<[Self.Output], Self.Failure>, Self>
Prefixes a publisher’s output with the specified values.
func prepend<S>(S) -> Publishers.Concatenate<Publishers.Sequence<S, Sel
.Failure>, Self>
Prefixes a publisher’s output with the specified sequence.
func prepend<P>(P) -> Publishers.Concatenate<P, Self>
Prefixes the output of this publisher with the elements emitted by the given publisher.
func prefix(Int) -> Publishers.Output<Self>
Republishes elements up to the specified maximum count.
func prefix(while: (Self.Output) -> Bool) -> Publishers.PrefixWhile<Sel
>
Republishes elements while a predicate closure indicates publishing should continue.
func tryPrefix(while: (Self.Output) throws -> Bool) -> Publishers.Try
PrefixWhile<Self>
Republishes elements while an error-throwing predicate closure indicates publishing should
continue.
func prefix<P>(untilOutputFrom: P) -> Publishers.PrefixUntilOutput<Self
P>
Republishes elements until another publisher emits an element.
func first() -> Publishers.First<Self>
Publishes the first element of a stream, then finishes.
func first(where: (Self.Output) -> Bool) -> Publishers.FirstWhere<Self>
Publishes the first element of a stream to satisfy a predicate closure, then finishes normally.
func tryFirst(where: (Self.Output) throws -> Bool) -> Publishers.Try
FirstWhere<Self>
Publishes the first element of a stream to satisfy a throwing predicate closure, then finishes
normally.
func last() -> Publishers.Last<Self>
Selecting specific elements


## Page 9

Publishes the last element of a stream, after the stream finishes.
func last(where: (Self.Output) -> Bool) -> Publishers.LastWhere<Self>
Publishes the last element of a stream that satisfies a predicate closure, after upstream
finishes.
func tryLast(where: (Self.Output) throws -> Bool) -> Publishers.TryLast
Where<Self>
Publishes the last element of a stream that satisfies an error-throwing predicate closure, afte
the stream finishes.
func output(at: Int) -> Publishers.Output<Self>
Publishes a specific element, indicated by its index in the sequence of published elements.
func output<R>(in: R) -> Publishers.Output<Self>
Publishes elements specified by their range in the sequence of published elements.
func combineLatest<P, T>(P, (Self.Output, P.Output) -> T) -> Publishers
Map<Publishers.CombineLatest<Self, P>, T>
Subscribes to an additional publisher and invokes a closure upon receiving output from eithe
publisher.
func combineLatest<P>(P) -> Publishers.CombineLatest<Self, P>
Subscribes to an additional publisher and publishes a tuple upon receiving output from eithe
publisher.
func combineLatest<P, Q, T>(P, Q, (Self.Output, P.Output, Q.Output) -> 
) -> Publishers.Map<Publishers.CombineLatest3<Self, P, Q>, T>
Subscribes to two additional publishers and invokes a closure upon receiving output from an
of the publishers.
func combineLatest<P, Q>(P, Q) -> Publishers.CombineLatest3<Self, P, Q>
Subscribes to two additional publishers and publishes a tuple upon receiving output from an
of the publishers.
func combineLatest<P, Q, R, T>(P, Q, R, (Self.Output, P.Output, Q.Outpu
, R.Output) -> T) -> Publishers.Map<Publishers.CombineLatest4<Self, P, 
, R>, T>
Subscribes to three additional publishers and invokes a closure upon receiving output from
any of the publishers.
Collecting and republishing the latest elements from multiple
publishers


## Page 10

func combineLatest<P, Q, R>(P, Q, R) -> Publishers.CombineLatest4<Self,
P, Q, R>
Subscribes to three additional publishers and publishes a tuple upon receiving output from
any of the publishers.
func merge(with: Self) -> Publishers.MergeMany<Self>
Combines elements from this publisher with those from another publisher of the same type,
delivering an interleaved sequence of elements.
func merge<P>(with: P) -> Publishers.Merge<Self, P>
Combines elements from this publisher with those from another publisher, delivering an
interleaved sequence of elements.
func merge<B, C>(with: B, C) -> Publishers.Merge3<Self, B, C>
Combines elements from this publisher with those from two other publishers, delivering an
interleaved sequence of elements.
func merge<B, C, D>(with: B, C, D) -> Publishers.Merge4<Self, B, C, D>
Combines elements from this publisher with those from three other publishers, delivering an
interleaved sequence of elements.
func merge<B, C, D, E>(with: B, C, D, E) -> Publishers.Merge5<Self, B, 
, D, E>
Combines elements from this publisher with those from four other publishers, delivering an
interleaved sequence of elements.
func merge<B, C, D, E, F>(with: B, C, D, E, F) -> Publishers.Merge6<Sel
, B, C, D, E, F>
Combines elements from this publisher with those from five other publishers, delivering an
interleaved sequence of elements.
func merge<B, C, D, E, F, G>(with: B, C, D, E, F, G) -> Publishers.
Merge7<Self, B, C, D, E, F, G>
Combines elements from this publisher with those from six other publishers, delivering an
interleaved sequence of elements.
func merge<B, C, D, E, F, G, H>(with: B, C, D, E, F, G, H) -> Publisher
.Merge8<Self, B, C, D, E, F, G, H>
Combines elements from this publisher with those from seven other publishers, delivering an
interleaved sequence of elements.
Republishing elements from multiple publishers as an interleaved
stream


## Page 11

func zip<P>(P) -> Publishers.Zip<Self, P>
Combines elements from another publisher and deliver pairs of elements as tuples.
func zip<P, T>(P, (Self.Output, P.Output) -> T) -> Publishers.Map<
Publishers.Zip<Self, P>, T>
Combines elements from another publisher and delivers a transformed output.
func zip<P, Q>(P, Q) -> Publishers.Zip3<Self, P, Q>
Combines elements from two other publishers and delivers groups of elements as tuples.
func zip<P, Q, T>(P, Q, (Self.Output, P.Output, Q.Output) -> T) ->
Publishers.Map<Publishers.Zip3<Self, P, Q>, T>
Combines elements from two other publishers and delivers a transformed output.
func zip<P, Q, R>(P, Q, R) -> Publishers.Zip4<Self, P, Q, R>
Combines elements from three other publishers and delivers groups of elements as tuples.
func zip<P, Q, R, T>(P, Q, R, (Self.Output, P.Output, Q.Output, R.Outpu
) -> T) -> Publishers.Map<Publishers.Zip4<Self, P, Q, R>, T>
Combines elements from three other publishers and delivers a transformed output.
func flatMap<T, P>(maxPublishers: Subscribers.Demand, (Self.Output) -> 
) -> Publishers.FlatMap<P, Self>
Transforms all elements from an upstream publisher into a new publisher up to a maximum
number of publishers you specify.
func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) 
> Publishers.FlatMap<P, Publishers.SetFailureType<Self, P.Failure>>
Transforms all elements from an upstream publisher into a new publisher up to a maximum
number of publishers you specify.
func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) 
> Publishers.FlatMap<P, Self>
Transforms all elements from an upstream publisher into a new publisher up to a maximum
number of publishers you specify.
Collecting and republishing the oldest unconsumed elements from
multiple publishers
Republishing elements by subscribing to new publishers


## Page 12

func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) 
> Publishers.FlatMap<Publishers.SetFailureType<P, Self.Failure>, Self>
Transforms all elements from an upstream publisher into a new publisher up to a maximum
number of publishers you specify.
func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Self>
Republishes elements sent by the most recently received publisher.
func switchToLatest() -> Publishers.SwitchToLatest<Self.Output,
Publishers.SetFailureType<Self, Self.Output.Failure>>
Republishes elements sent by the most recently received publisher.
func switchToLatest() -> Publishers.SwitchToLatest<Publishers.SetFailur
Type<Self.Output, Self.Failure>, Publishers.Map<Self, Publishers.Set
FailureType<Self.Output, Self.Failure>>>
Republishes elements sent by the most recently received publisher.
func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Self>
Republishes elements sent by the most recently received publisher.
func assertNoFailure(String, file: StaticString, line: UInt) ->
Publishers.AssertNoFailure<Self>
Raises a fatal error when its upstream publisher fails, and otherwise republishes all received
input.
func `catch`<P>((Self.Failure) -> P) -> Publishers.Catch<Self, P>
Handles errors from an upstream publisher by replacing it with another publisher.
func tryCatch<P>((Self.Failure) throws -> P) -> Publishers.TryCatch<Sel
, P>
Handles errors from an upstream publisher by either replacing it with another publisher or
throwing a new error.
func retry(Int) -> Publishers.Retry<Self>
Attempts to recreate a failed subscription with the upstream publisher up to the number of
times you specify.
Handling errors
Controlling timing


## Page 13

func measureInterval<S>(using: S, options: S.SchedulerOptions?) ->
Publishers.MeasureInterval<Self, S>
Measures and emits the time interval between events received from an upstream publisher.
func debounce<S>(for: S.SchedulerTimeType.Stride, scheduler: S, options
S.SchedulerOptions?) -> Publishers.Debounce<Self, S>
Publishes elements only after a specified time interval elapses between events.
func delay<S>(for: S.SchedulerTimeType.Stride, tolerance: S.Scheduler
TimeType.Stride?, scheduler: S, options: S.SchedulerOptions?) ->
Publishers.Delay<Self, S>
Delays delivery of all output to the downstream receiver by a specified amount of time on a
particular scheduler.
func throttle<S>(for: S.SchedulerTimeType.Stride, scheduler: S, latest:
Bool) -> Publishers.Throttle<Self, S>
Publishes either the most-recent or first element published by the upstream publisher in the
specified time interval.
func timeout<S>(S.SchedulerTimeType.Stride, scheduler: S, options: S.
SchedulerOptions?, customError: (() -> Self.Failure)?) -> Publishers.
Timeout<Self, S>
Terminates publishing if the upstream publisher exceeds the specified time interval without
producing an element.
func encode<Coder>(encoder: Coder) -> Publishers.Encode<Self, Coder>
Encodes the output from upstream using a specified encoder.
func decode<Item, Coder>(type: Item.Type, decoder: Coder) -> Publishers
Decode<Self, Item, Coder>
Decodes the output from the upstream using a specified decoder.
func map<T>(KeyPath<Self.Output, T>) -> Publishers.MapKeyPath<Self, T>
Publishes the value of a key path.
func map<T0, T1>(KeyPath<Self.Output, T0>, KeyPath<Self.Output, T1>) ->
Publishers.MapKeyPath2<Self, T0, T1>
Publishes the values of two key paths as a tuple.
Encoding and decoding
Identifying properties with key paths


## Page 14

func map<T0, T1, T2>(KeyPath<Self.Output, T0>, KeyPath<Self.Output, T1>
KeyPath<Self.Output, T2>) -> Publishers.MapKeyPath3<Self, T0, T1, T2>
Publishes the values of three key paths as a tuple.
func multicast<S>(() -> S) -> Publishers.Multicast<Self, S>
Applies a closure to create a subject that delivers elements to subscribers.
func multicast<S>(subject: S) -> Publishers.Multicast<Self, S>
Provides a subject to deliver elements to multiple subscribers.
func share() -> Publishers.Share<Self>
Shares the output of an upstream publisher with multiple subscribers.
func buffer(size: Int, prefetch: Publishers.PrefetchStrategy, whenFull:
Publishers.BufferingStrategy<Self.Failure>) -> Publishers.Buffer<Self>
Buffers elements received from an upstream publisher.
enum PrefetchStrategy
A strategy for filling a buffer.
enum BufferingStrategy
A strategy that handles exhaustion of a buffer’s capacity.
func eraseToAnyPublisher() -> AnyPublisher<Self.Output, Self.Failure>
Wraps this publisher with a type eraser.
func subscribe<S>(on: S, options: S.SchedulerOptions?) -> Publishers.
SubscribeOn<Self, S>
Specifies the scheduler on which to perform subscribe, cancel, and request operations.
func receive<S>(on: S, options: S.SchedulerOptions?) -> Publishers.
ReceiveOn<Self, S>
Specifies the scheduler on which to receive elements from the publisher.
Working with multiple subscribers
Buffering elements
Performing type erasure
Specifying schedulers


## Page 15

func makeConnectable() -> Publishers.MakeConnectable<Self>
Creates a connectable wrapper around the publisher.
func assign<Root>(to: ReferenceWritableKeyPath<Root, Self.Output>, on:
Root) -> AnyCancellable
Assigns each element from a publisher to a property on an object.
func assign(to: inout Published<Self.Output>.Publisher)
Republishes elements received from a publisher, by assigning them to a property marked as 
publisher.
func sink(receiveCompletion: (Subscribers.Completion<Self.Failure>) ->
Void, receiveValue: (Self.Output) -> Void) -> AnyCancellable
Attaches a subscriber with closure-based behavior.
func sink(receiveValue: (Self.Output) -> Void) -> AnyCancellable
Attaches a subscriber with closure-based behavior to a publisher that never fails.
var values: AsyncPublisher<Self>
The elements produced by the publisher, as an asynchronous sequence.
var values: AsyncThrowingPublisher<Self>
The elements produced by the publisher, as a throwing asynchronous sequence.
func breakpoint(receiveSubscription: ((any Subscription) -> Bool)?,
receiveOutput: ((Self.Output) -> Bool)?, receiveCompletion: ((
Subscribers.Completion<Self.Failure>) -> Bool)?) -> Publishers.
Breakpoint<Self>
Raises a debugger signal when a provided closure needs to stop the process in the debugge
func breakpointOnError() -> Publishers.Breakpoint<Self>
Raises a debugger signal upon receiving a failure.
Adding explicit connectability
Connecting simple subscribers
Accessing elements asynchronously
Debugging


## Page 16

func handleEvents(receiveSubscription: ((any Subscription) -> Void)?,
receiveOutput: ((Self.Output) -> Void)?, receiveCompletion: ((
Subscribers.Completion<Self.Failure>) -> Void)?, receiveCancel: (() ->
Void)?, receiveRequest: ((Subscribers.Demand) -> Void)?) -> Publishers.
HandleEvents<Self>
Performs the specified closures when publisher events occur.
func print(String, to: (any TextOutputStream)?) -> Publishers.Print<Sel
>
Prints log messages for all publishing events.
ConnectablePublisher, Subject
AnyPublisher
Conforms when Output conforms to Copyable, Output conforms to Escapable, and Failure conforms to
Error.
CurrentValueSubject
Deferred
Empty
Fail
Future
Just
ObservableObjectPublisher
PassthroughSubject
Published.Publisher
Publishers.AllSatisfy
Publishers.AssertNoFailure
Publishers.Autoconnect
Publishers.Breakpoint
Publishers.Buffer
Publishers.Catch
Publishers.Collect
Publishers.CollectByCount
Publishers.CollectByTime
Relationships
Inherited By
Conforming Types


## Page 17

Publishers.CombineLatest
Publishers.CombineLatest3
Publishers.CombineLatest4
Publishers.CompactMap
Publishers.Comparison
Publishers.Concatenate
Publishers.Contains
Publishers.ContainsWhere
Publishers.Count
Publishers.Debounce
Publishers.Decode
Publishers.Delay
Publishers.Drop
Publishers.DropUntilOutput
Publishers.DropWhile
Publishers.Encode
Publishers.Filter
Publishers.First
Publishers.FirstWhere
Publishers.FlatMap
Publishers.HandleEvents
Publishers.IgnoreOutput
Publishers.Last
Publishers.LastWhere
Publishers.MakeConnectable
Publishers.Map
Publishers.MapError
Publishers.MapKeyPath
Publishers.MapKeyPath2
Publishers.MapKeyPath3
Publishers.MeasureInterval
Publishers.Merge
Publishers.Merge3
Publishers.Merge4
Publishers.Merge5
Publishers.Merge6
Publishers.Merge7
Publishers.Merge8
Publishers.MergeMany
Publishers.Multicast
Publishers.Output
Publishers.PrefixUntilOutput
Publishers.PrefixWhile
Publishers.Print


## Page 18

Publishers.ReceiveOn
Publishers.Reduce
Publishers.RemoveDuplicates
Publishers.ReplaceEmpty
Publishers.ReplaceError
Publishers.Retry
Publishers.Scan
Publishers.Sequence
Publishers.SetFailureType
Publishers.Share
Publishers.SubscribeOn
Publishers.SwitchToLatest
Publishers.Throttle
Publishers.Timeout
Publishers.TryAllSatisfy
Publishers.TryCatch
Publishers.TryCompactMap
Publishers.TryComparison
Publishers.TryContainsWhere
Publishers.TryDropWhile
Publishers.TryFilter
Publishers.TryFirstWhere
Publishers.TryLastWhere
Publishers.TryMap
Publishers.TryPrefixWhile
Publishers.TryReduce
Publishers.TryRemoveDuplicates
Publishers.TryScan
Publishers.Zip
Publishers.Zip3
Publishers.Zip4
Record
enum Publishers
A namespace for types that serve as publishers.
See Also
Publishers


## Page 19

struct AnyPublisher
A publisher that performs type erasure by wrapping another publisher.
struct Published
A type that publishes a property marked with an attribute.
protocol Cancellable
A protocol indicating that an activity or action supports cancellation.
class AnyCancellable
A type-erasing cancellable object that executes a provided closure when canceled.


