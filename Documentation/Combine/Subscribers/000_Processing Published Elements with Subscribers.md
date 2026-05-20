# 000_Processing Published Elements with Subscribers.pdf

## Page 1

In Combine, a Publisher produces elements, and a Subscriber acts on the elements it
receives. However, a publisher can’t send elements until the subscriber attaches and asks for the
The subscriber also controls the rate at which the publisher delivers elements, by using the
Subscribers.Demand type to indicate how many elements it can receive. A subscriber can
indicate demand in either of two ways:
By calling request(_:) on the Subscription instance that the publisher provided when th
subscriber first subscribed.
By returning a new demand when the publisher calls the subscriber’s receive(_:) method t
deliver an element.
Demand is additive: If a subscriber has demanded two elements, and then requests Subscriber
.Demand(.max(3)), the publisher’s unsatisfied demand is now five elements. If the publisher
then sends an element, the unsatisfied demand decreases to four. Publishing elements is the only
way to reduce unsatisfied demand; subscribers can’t request negative demand.
Many apps just use the operators sink(receiveValue:) and assign(to:on:) to create the
convenience subscriber types Subscribers.Sink and Subscribers.Assign, respectively.
These two subscribers issue a demand for unlimited when they first attach to the publisher.
Once a publisher has unlimited demand, there can be no further negotiation of demand between
subscriber and publisher.
When a publisher has high or unlimited demand, it could send elements faster than a subscriber
can process them. This scenario could lead to elements being dropped, or rapidly increasing
Overview
Consume Elements as the Publisher Produces Them
Combine / Processing Published Elements with Subscribers
Article
Processing Published Elements with
Subscribers
Apply back pressure to precisely control when publishers produce elements.


## Page 2

memory pressure as elements fill a buffer while they await processing.
This scenario can occur if you use the convenience subscribers, because they demand an
unlimited number of elements. Ensure that the closure you provide to sink(receiveValue:)
and the side-effects of assign(to:on:) adhere to the following traits:
Don’t block the publisher.
Don’t consume excessive memory by buffering elements.
Don’t get overwhelmed and fail to process elements.
Fortunately, many commonly used publishers, such as publishers associated with user-interface
elements, publish at a manageable rate. Other common publishers only produce a single element
like the URL Loading System’s URLSession.DataTaskPublisher. It’s perfectly safe to use sin
and assign subscribers with these publishers.
To control the rate at which the publisher sends elements to your subscriber, create a custom
implementation of the Subscriber protocol. Use your implementation to specify demands that
you know your subscriber can keep up with. As the subscriber receives elements, it can request
more by returning a new demand value to receive(_:), or by calling request(_:) on the
subscription. With either, your subscriber can then fine-tune the number of elements the publishe
can send it at any given time.
This concept of controlling flow by signaling a subscriber’s readiness to receive elements is called
back pressure.
Each publisher keeps track of its current unsatisfied demand, meaning how many more elements 
subscriber has requested. Even automated sources like Foundation’s Timer.TimerPublisher
only produce elements when they have pending demand. The following example code illustrates
this behavior.
Apply Back Pressure with a Custom Subscriber


## Page 3

The subscriber’s receive(subscription:) implementation uses a five-second delay before 
requests any elements from the publisher. During this period, the publisher exists and has a valid
subscriber, but has zero demand, so it doesn’t produce elements. It only starts publishing elemen
after the delay expires and the subscriber gives it a nonzero demand, as seen in the following
output:
This example only requests three elements, issuing the demand after the five-second delay
expires. As a result, the publisher sends no further elements after the third, but also doesn’t
complete publishing by sending a Subscribers.Completion.finished value either, becaus
the publisher is just waiting for more demand. To continue to receive elements, the subscriber
could store the subscription and periodically request more elements. It could also indicate new
demand as the return value from its receive(_:) implementation.


## Page 4

Even without writing a custom Subscriber, you can still apply back pressure by using one of
Combine’s buffering or timing operators:
buffer(size:prefetch:whenFull:) holds onto a fixed number of items from an upstrea
publisher. When full, the buffer either drops elements or throws an error.
debounce(for:scheduler:options:) publishes only when the upstream publisher stops
publishing for a specified interval of time.
throttle(for:scheduler:latest:) produces elements at a given maximum rate. If it
receives multiple elements during an interval, it sends only the newest or oldest.
collect(_:) and collect(_:options:) bundle elements until they exceed a given coun
or time interval, sending you an array of elements. This option is good if your subscriber can
process multiple elements at the same time.
Because these operators control the number of elements your subscriber receives, you can attac
a subscriber that requests unlimited elements, such as sink(receiveValue:) and
assign(to:on:).
protocol Subscriber
A protocol that declares a type that can receive input from a publisher.
enum Subscribers
A namespace for types that serve as subscribers.
struct AnySubscriber
A type-erasing subscriber.
protocol Subscription
A protocol representing the connection of a subscriber to a publisher.
enum Subscriptions
A namespace for symbols related to subscriptions.
Manage Unlimited Demand by Using Back-Pressure
Operators
See Also
Subscribers


