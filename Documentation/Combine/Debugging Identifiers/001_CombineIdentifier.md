# 001_CombineIdentifier.pdf

## Page 1

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


## Page 2

A textual representation of this instance.
CustomStringConvertible, Equatable, Hashable
protocol CustomCombineIdentifierConvertible
A protocol for uniquely identifying publisher streams.
Relationships
Conforms To
See Also
Debugging Identifiers


