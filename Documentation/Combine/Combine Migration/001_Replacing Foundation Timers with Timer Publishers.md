# 001_Replacing Foundation Timers with Timer Publishers.pdf

## Page 1

If your app uses Foundation’s Timer class to repeatedly receive a callback or invoke a closure on
specified interval, you can convert these instances to Combine to simplify your code.
Consider the following snippet, which uses scheduledTimer(withTimeInterval:repeats
block:) to update the lastUpdated property of a data model once a second, on a specific
dispatch queue:
To migrate this code to Combine, replace the Timer that is returned by scheduledTimer(wit
TimeInterval:repeats:block:) with a Timer.TimerPublisher. You create this publish
with the Timer method publish(every:tolerance:on:in:options:). Every time the
Overview
Performing Periodic Work with a Timer
Converting to a Timer Publisher
Combine / Replacing Foundation Timers with Timer Publishers
Article
Replacing Foundation Timers with Timer
Publishers
Publish elements periodically by using a timer.


## Page 2

underyling Timer fires, the publisher emits a new Date that represents the instant the timer fired
You then apply Combine operators to the Date, eventually connecting the publisher to a
subscriber like sink(receiveValue:) or assign(to:on:).
Tip
Because Timer.TimerPublisher conforms to the ConnectablePublisher protocol, it
won’t produce elements until you explicitly connect to it. Do this by either calling connect(),
or using an autoconnect() operator to connect automatically when a subscriber attaches.
The next example shows how to use a Timer.TimerPublisher to replace the previous examp
It uses Combine’s operators to perform the tasks that were in the previous example’s closure:
In this example, Combine operators replace all the behavior inside the closure of the earlier
example:
The receive(on:options:) operator ensures that its subsequent operators run on the
specified dispatch queue. This replaces the async() call from before.
The assign(to:on:) operator updates the data model, by using a key path to set the last
Update property.
Another advantage you’ll find when using Combine to simplify your code is that the Timer.Time
Publisher produces new Date instances as its output type. The first example’s closure receive
the Timer itself as its parameter, so it has to create new Date instances manually.
Routing Notifications to Combine Subscribers
Deliver notifications to subscribers by using notification centers’ publishers.
See Also
Combine Migration


## Page 3

Performing Key-Value Observing with Combine
Expose KVO changes with a Combine publisher.
Using Combine for Your App’s Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.


