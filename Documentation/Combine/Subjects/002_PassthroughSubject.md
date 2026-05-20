# 002_PassthroughSubject.pdf

## Page 1

Using Combine for Your App’s Asynchronous Code
As a concrete implementation of Subject, the PassthroughSubject provides a convenient w
to adapt existing imperative code to the Combine model.
Unlike CurrentValueSubject, a PassthroughSubject doesn’t have an initial value or a
buffer of the most recently-published element. A PassthroughSubject drops values if there a
no subscribers, or its current demand is zero.
init()
Mentioned in
Overview
Topics
Creating a passthrough subject
Combine / PassthroughSubject
Class
PassthroughSubject
A subject that broadcasts elements to downstream subscribers.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Publisher, Subject
protocol Subject
A publisher that exposes a method for outside callers to publish elements.
class CurrentValueSubject
A subject that wraps a single value and publishes a new element whenever the value change
Relationships
Conforms To
See Also
Subjects


