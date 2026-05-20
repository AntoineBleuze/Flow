# 003_Published.pdf

## Page 1

Publishing a property with the @Published attribute creates a publisher of this type. You access
the publisher with the $ operator, as shown here:
Overview
Combine / Published
Structure
Published
A type that publishes a property marked with an attribute.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

When the property changes, publishing occurs in the property’s willSet block, meaning
subscribers receive the new value before it’s actually set on the property. In the above example, t
second time the sink executes its closure, it receives the parameter value 25. However, if the
closure evaluated weather.temperature, the value returned would be 20.
Important
The @Published attribute is class constrained. Use it with properties of classes, not with
non-class types like structures.
assign(to:)
init(initialValue: Value)
Creates the published instance with an initial value.
init(wrappedValue: Value)
Creates the published instance with an initial wrapped value.
var projectedValue: Published<Value>.Publisher
The property for which this instance exposes a publisher.
struct Publisher
A publisher for properties marked with the @Published attribute.
protocol Publisher
See Also
Topics
Creating a published instance
Publishing the value
See Also
Publishers


## Page 3

Declares that a type can transmit a sequence of values over time.
enum Publishers
A namespace for types that serve as publishers.
struct AnyPublisher
A publisher that performs type erasure by wrapping another publisher.
protocol Cancellable
A protocol indicating that an activity or action supports cancellation.
class AnyCancellable
A type-erasing cancellable object that executes a provided closure when canceled.


