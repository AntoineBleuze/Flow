# 002_Performing Key-Value Observing with Combine.pdf

## Page 1

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


## Page 2

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


## Page 3

Replacing Foundation Timers with Timer Publishers
Publish elements periodically by using a timer.
Using Combine for Your App’s Asynchronous Code
Apply common patterns to migrate your closure-based, event-handling code.


