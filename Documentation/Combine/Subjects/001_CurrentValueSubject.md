# 001_CurrentValueSubject.pdf

## Page 1

Using Combine for Your App’s Asynchronous Code
Unlike PassthroughSubject, CurrentValueSubject maintains a buffer of the most recentl
published element.
Calling send(_:) on a CurrentValueSubject also updates the current value, making it
equivalent to updating the value directly.
init(Output)
Creates a current value subject with the given initial value.
Mentioned in
Overview
Topics
Creating a current value subject
Accessing the current value
Combine / CurrentValueSubject
Class
CurrentValueSubject
A subject that wraps a single value and publishes a new element whenever the
value changes.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

var value: Output
The value wrapped by this subject, published as a new element whenever it changes.
Publisher, Subject
protocol Subject
A publisher that exposes a method for outside callers to publish elements.
class PassthroughSubject
A subject that broadcasts elements to downstream subscribers.
Relationships
Conforms To
See Also
Subjects


