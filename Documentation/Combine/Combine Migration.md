# Combine Migration.pdf

## Page 1

Many frameworks deliver asynchronous events to your app with the NotificationCenter API
Your app may already have places where it receives and processes these notifications in callback
methods or closures. For example, the following code uses addObserver(forName:object:
queue:using:) to print a message every time an iOS device rotates to portrait orientation.
Using notification center callbacks and closures requires you to do all your work inside the callbac
method or closure. By migrating to Combine, you can use operators to perform common tasks lik
filtering.
Overview
Migrate Notification-Handling Code to Use Combine
Combine / Routing Notifications to Combine Subscribers
Article
Routing Notifications to Combine
Subscribers
Deliver notifications to subscribers by using notification centers’ publishers.


## Page 2

To take advantage of Combine, use the NotificationCenter.Publisher to migrate your
NSNotification handling code to the Combine idiom. You create this publisher with the
NotificationCenter method publisher(for:object:), passing in the notification name
which you’re interested and a source object, if any.
Rewrite the above code in Combine as shown in the following listing. This code uses the default
notification center to create a publisher for the orientationDidChangeNotification
notification. When the code receives notifications from this publisher, it applies a filter operator to
only act on portrait orientation notifications, and prints a message.
Note that in this case, the orientationDidChangeNotification doesn’t contain the new
orientation in its userInfo dictionary, so the filter(_:) operator queries the UIDevice
directly.
Replacing Foundation Timers with Timer Publishers
Publish elements periodically by using a timer.
Performing Key-Value Observing with Combine
Expose KVO changes with a Combine publisher.
Using Combine for Your App’s Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.
See Also
Combine Migration


## Page 3

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


## Page 4

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


## Page 5

Performing Key-Value Observing with Combine
Expose KVO changes with a Combine publisher.
Using Combine for Your App’s Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.


## Page 6

Several frameworks use key-value observing to notify your app of asynchronous changes. By
converting your use of KVO from callbacks and closures to Combine, you can make your code mo
elegant and maintainable.
In the following example, the type UserInfo supports KVO for its lastLogin property, as
described in Using Key-Value Observing in Swift. The viewDidLoad() method uses the
observe(_:options:changeHandler:) method to set up a closure that handles any change
to the property. The closure receives an NSKeyValueObservedChange object that describes th
change event, retrieves the newValue property, and prints it. The viewDidAppear(_:) metho
changes the value, which calls the closure and prints the message.
Overview
Monitoring Changes with KVO
Combine / Performing Key-Value Observing with Combine
Article
Performing Key-Value Observing with
Combine
Expose KVO changes with a Combine publisher.


## Page 7

To convert KVO code to Combine, replace the observe(_:options:changeHandler:)
method with an NSObject.KeyValueObservingPublisher. You get an instance of this
publisher by calling publisher(for:) on the parent object, as shown in the following example’
viewDidLoad() method:
The KVO publisher produces elements of the observed type — in this case, Date — rather than
NSKeyValueObservedChange. This saves you a step, because you don’t have to unpack the
newValue from the change object, as in the first example.
Routing Notifications to Combine Subscribers
Deliver notifications to subscribers by using notification centers’ publishers.
Converting KVO Code to Use Combine
See Also
Combine Migration


## Page 8

Replacing Foundation Timers with Timer Publishers
Publish elements periodically by using a timer.
Using Combine for Your App’s Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.


## Page 9

Your app may use common patterns to handle asynchronous events, such as:
Completion handlers, in which a caller provides a closure to execute once, after a potentially
long-running task completes.
Closure properties, in which a caller provides a closure to invoke every time a given
asynchronous event occurs.
Combine provides compelling equivalents to these patterns, which allow you to eliminate
boilerplate implementations, and leverage its many operators. As you adopt Combine elsewhere i
your app, converting your asynchronous call points to Combine improves your code’s consistency
and readability.
Tip
You don’t need closure-based asychronicity patterns if you’re using the async-await
features in Swift 5.5 and later. Instead, your code can await an asynchronous call, and then
execute the code that would have been in the closure. This eliminates the need for both
conventional completion handlers and Combine futures. For more information, see
Concurrency in The Swift Programming Language.
A completion handler is a closure accepted by a function that executes after the function
completes its work. You typically implement this by invoking the completion handler directly when
Overview
Replace Completion-Handler Closures with Futures
Combine / Using Combine for Your App’s Asynchronous Code
Article
Using Combine for Your App’s
Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.


## Page 10

the function finishes its work, storing the closure outside the function if necessary. For example,
the following function accepts a closure and then executes it after a two-second delay:
You can replace this pattern with a Combine Future, a publisher that performs some work and
then asynchronously signals success or failure. If it succeeds, the future executes a Future
.Promise, a closure that receives the element produced by the future. You can replace the
previous function as follows:
Rather than explicitly invoking a closure when the work completes, the future invokes the promise
passed to it, passing in a Result that indicates success or failure. The caller receives this result
asynchronously from the future. Because Future is a Combine Publisher, the caller attaches 
to an optional chain of operators, ending with a Subscriber, like sink(receiveValue:):
Sometimes, a long-running task generates a value that it passes to a completion handler as a
parameter. To replicate this functionality in Combine, declare the parameter as the output type
published by the future. The following example produces a randomly-generated integer, and
passes it to the promise by declaring Int as the future’s output type:
Use Output Types to Represent a Future’s Parameters


## Page 11

By declaring that the future produces Int elements, the future can use the Result type to pass
an Int value to the promise. When the promise executes, the future publishes the value, which a
caller can receive with a subscriber like sink(receiveValue:):
Your app may also have the common pattern of using a closure as a property to invoke when
certain events happen. These properties often have names starting with on, and their call points
look like the following:
With Combine, you can replace this pattern by using a Subject. A subject allows you to
imperatively publish a new element at any time by calling the send() method. Adopt this pattern
by using a private PassthroughSubject or CurrentValueSubject, then expose this
publicly as an AnyPublisher:
With this arrangement, instead of setting a closure property, callers perform their work in a
subscriber, such as sink(receiveValue:):
One advantage to using Combine is that the subject can call send(completion:) to tell the
subscriber that no further events are forthcoming, or that an error occurred.
Replace Repeatedly Invoked Closures with Subjects


## Page 12

Tip
If you are using async-await concurrency in Swift 5.5 or later, you can use a AsyncStream,
instead of a Combine Subject, to asynchronously produce new elements. With this
arrangement, the call point performs a for-await-in loop to iterate over the stream rather
than subscribing to the subject. The code that would go in the subscriber’s receiveValue
closure instead becomes the contents of the for-await-in loop.
Routing Notifications to Combine Subscribers
Deliver notifications to subscribers by using notification centers’ publishers.
Replacing Foundation Timers with Timer Publishers
Publish elements periodically by using a timer.
Performing Key-Value Observing with Combine
Expose KVO changes with a Combine publisher.
See Also
Combine Migration


