# 001_TransferRepresentation.pdf

## Page 1

Combine multiple existing transfer representations to compose a single transfer representation th
describes how to transfer an item in multiple scenarios.
The following shows a Greeting type that transfers both as a Codable type and by proxy
through its message string.
Overview
Core Transferable / TransferRepresentation
Protocol
TransferRepresentation
A declarative description of the process of importing and exporting a transferable
item.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

var body: Self.Body
A builder expression that describes the process of importing and exporting an item.
Required
associatedtype Body : TransferRepresentation
The transfer representation for the item.
Required
associatedtype Item : Transferable
The type of the item that’s being transferred.
Required
func exportingCondition((Self.Item) -> Bool) -> _ConditionalTransfer
Representation<Self>
Prevents the system from exporting an item if it does not meet the supplied condition.
func visibility(TransferRepresentationVisibility) -> some Transfer
Representation<Self.Item>
Specifies the kinds of apps and processes that can see an item in transit.
func suggestedFileName(String) -> some TransferRepresentation<Self.Item
Provides a filename to use if the receiver chooses to write the item to disk.
func suggestedFileName((Self.Item) -> String?) -> some Transfer
Representation<Self.Item>
Provides a filename to use if the receiver chooses to write the item to disk.
Topics
Implementing a transfer representation
Configuring exports
Controlling visibility
Instance Methods


## Page 3

Sendable, SendableMetatype
CodableRepresentation
DataRepresentation
FileRepresentation
ProxyRepresentation
TupleTransferRepresentation
protocol Transferable
A protocol that describes how a type interacts with transport APIs such as drag and drop or
copy and paste.
Choosing a transfer representation for a model type
Define a custom representation for your data using a combination of built-in types.
Relationships
Inherits From
Conforming Types
See Also
Essentials


