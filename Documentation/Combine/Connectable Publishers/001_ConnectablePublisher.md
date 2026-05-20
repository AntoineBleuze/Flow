# 001_ConnectablePublisher.pdf

## Page 1

Controlling Publishing with Connectable Publishers
Replacing Foundation Timers with Timer Publishers
Use a ConnectablePublisher when you need to perform additional configuration or setup pri
to producing any elements.
This publisher doesn’t produce any elements until you call its connect() method.
Use makeConnectable() to create a ConnectablePublisher from any publisher whose
failure type is Never.
func connect() -> any Cancellable
Mentioned in
Overview
Topics
Performing explicit connections
Combine / ConnectablePublisher
Protocol
ConnectablePublisher
A publisher that provides an explicit means of connecting and canceling
publication.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Connects to the publisher, allowing it to produce elements, and returns an instance with whi
to cancel publishing.
Required
func autoconnect() -> Publishers.Autoconnect<Self>
Automates the process of connecting or disconnecting from this connectable publisher.
Publisher
Publishers.MakeConnectable, Publishers.Multicast
Controlling Publishing with Connectable Publishers
Coordinate when publishers start sending elements to subscribers.
Connecting automatically
Relationships
Inherits From
Conforming Types
See Also
Connectable Publishers


