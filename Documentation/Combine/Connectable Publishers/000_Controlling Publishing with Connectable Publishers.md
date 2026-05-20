# 000_Controlling Publishing with Connectable Publishers.pdf

## Page 1

Sometimes, you want to configure a publisher before it starts producing elements, such as when 
publisher has properties that affect its behavior. But commonly used subscribers like
sink(receiveValue:) demand unlimited elements immediately, which might prevent you from
setting up the publisher the way you like. A publisher that produces values before you’re ready fo
them can also be a problem when the publisher has two or more subscribers. This multi-subscrib
scenario creates a race condition: the publisher can send elements to the first subscriber before
the second even exists.
Consider the scenario in the following figure. You create a URLSession.DataTaskPublisher
and attach a sink subscriber to it (Subscriber 1) which causes the data task to start fetching the
URL’s data. At some later point, you attach a second subscriber (Subscriber 2). If the data task
completes its download before the second subscriber attaches, the second subscriber misses the
data and only sees the completion.
Overview
Combine / Controlling Publishing with Connectable Publishers
Article
Controlling Publishing with Connectable
Publishers
Coordinate when publishers start sending elements to subscribers.


## Page 2

To prevent a publisher from sending elements before you’re ready, Combine provides the
ConnectablePublisher protocol. A connectable publisher produces no elements until you ca
its connect() method. Even if it’s ready to produce elements and has unsatisfied demand, a
connectable publisher doesn’t deliver any elements to subscribers until you explicitly call
connect().
The following figure shows the URLSession.DataTaskPublisher scenario from above, but
with a ConnectablePublisher ahead of the subscribers. By waiting to call connect() until
both subscribers attach, the data task doesn’t start downloading until then. This eliminates the
race condition and guarantees both subscribers can receive the data.
To use a ConnectablePublisher in your own Combine code, use the makeConnectable()
operator to wrap an existing publisher with a Publishers.MakeConnectable instance. The
following code shows how makeConnectable() fixes the data task publisher race condition
described above. Typically, attaching a sink — identified here by the AnyCancellable it returns
cancellable1 — would cause the data task to start immediately. In this scenario, the second
sink, identified as cancellable2, doesn’t attach until one second later, and the data task
publisher might complete before the second sink attaches. Instead, explicitly using a
ConnectablePublisher causes the data task to start only after the app calls connect(),
which it does after a two-second delay.
Hold Publishing by Using a Connectable Publisher


## Page 3

Important
connect() returns a Cancellable instance that you need to retain. You can use this
instance to cancel publishing, either by explicitly calling cancel() or allowing it to deinitialize.
Some Combine publishers already implement ConnectablePublisher, such as Publishers
.Multicast and Timer.TimerPublisher. Using these publishers can cause the opposite
problem: having to explicitly connect() could be burdensome if you don’t need to configure the
publisher or attach multiple subscribers.
For cases like these, ConnectablePublisher provides the autoconnect() operator. This
operator immediately calls connect() when a Subscriber attaches to the publisher with the
subscribe(_:) method.
The following example uses autoconnect(), so a subscriber immediately receives elements fro
a once-a-second Timer.TimerPublisher. Without autoconnect(), the example would nee
to explicitly start the timer publisher by calling connect() at some point.
Use the Autoconnect Operator If You Don’t Need to
Explicitly Connect
See Also
Connectable Publishers


## Page 4

protocol ConnectablePublisher
A publisher that provides an explicit means of connecting and canceling publication.


