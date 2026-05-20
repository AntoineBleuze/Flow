# 000_ObservableObject.pdf

## Page 1

By default an ObservableObject synthesizes an objectWillChange publisher that emits the
changed value before any of its @Published properties changes.
Overview
Combine / ObservableObject
Protocol
ObservableObject
A type of object with a publisher that emits before the object has changed.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

var objectWillChange: Self.ObjectWillChangePublisher
A publisher that emits before the object has changed.
Required Default implementation provided.
associatedtype ObjectWillChangePublisher : Publisher = ObservableObject
Publisher
The type of publisher that emits before the object has changed.
Required
class ObservableObjectPublisher
A publisher that publishes changes from observable objects.
Topics
Publishing changes
See Also
Observable Objects


