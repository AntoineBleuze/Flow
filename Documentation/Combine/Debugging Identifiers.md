# Debugging Identifiers.pdf

## Page 1

If you create a custom Subscription or Subscriber type, implement this protocol so that
development tools can uniquely identify publisher chains in your app. If your type is a class,
Combine provides an implementation of combineIdentifier for you. If your type is a structure
set up the identifier as follows:
var combineIdentifier: CombineIdentifier
A unique identifier for identifying publisher streams.
Required Default implementation provided.
Overview
Topics
Identifying publisher streams
Relationships
Combine / CustomCombineIdentifierConvertible
Protocol
CustomCombineIdentifierConvertible
A protocol for uniquely identifying publisher streams.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Subscriber, Subscription
AnySubscriber, Subscribers.Assign, Subscribers.Sink
struct CombineIdentifier
A unique identifier for identifying publisher streams.
Inherited By
Conforming Types
See Also
Debugging Identifiers


## Page 3

To conform to CustomCombineIdentifierConvertible in a Subscription or Subject
that you implement as a structure, create an instance of CombineIdentifier as follows:
init()
Creates a unique Combine identifier.
init(AnyObject)
Creates a Combine identifier, using the bit pattern of the provided object.
var description: String
Overview
Topics
Creating a Combine identifier
Providing a description
Combine / CombineIdentifier
Structure
CombineIdentifier
A unique identifier for identifying publisher streams.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 4

A textual representation of this instance.
CustomStringConvertible, Equatable, Hashable
protocol CustomCombineIdentifierConvertible
A protocol for uniquely identifying publisher streams.
Relationships
Conforms To
See Also
Debugging Identifiers


