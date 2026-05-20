# 000_Routing Notifications to Combine Subscribers.pdf

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


