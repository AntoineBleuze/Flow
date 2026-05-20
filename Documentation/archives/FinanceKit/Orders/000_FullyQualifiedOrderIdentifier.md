# 000_FullyQualifiedOrderIdentifier.pdf

## Page 1

init(orderTypeIdentifier: String, orderIdentifier: String)
Initializes the object with values that uniquely identify an order within an order type.
var orderIdentifier: String
A string the merchant uses to identify a specific customer order.
var orderTypeIdentifier: String
A string that describes the order type.
Copyable
Topics
Initializers
Instance Properties
Relationships
Conforms To
FinanceKit / FullyQualifiedOrderIdentifier
Structure
FullyQualifiedOrderIdentifier
A structure that specifies the characteristics of an order.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+


## Page 2

CustomStringConvertible
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
func saveOrder(signedArchive: Data) async throws -> FinanceStore.Save
OrderResult
Adds an order to the store or updates an existing order.
See Also
Orders


