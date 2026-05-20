# Structures.pdf

## Page 1

var params: FinancialConnectionExtensionAuthorizationParams
func complete(authorizationResult: FinancialConnectionExtension
AuthorizationResult)
func complete(error: any Error)
typealias CompletionHandler
typealias CompletionHandlerResult
Topics
Instance Properties
Instance Methods -
Type Aliases
FinanceKitUI / FinancialConnectionExtensionAuthorizationRequest
Structure
FinancialConnectionExtension
AuthorizationRequest
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+


## Page 2

init(params: FinancialConnectionExtensionAuthorizationParams)
let params: FinancialConnectionExtensionAuthorizationParams
Decodable
Encodable
Sendable
SendableMetatype
Topics
Initializers
Instance Properties
Relationships
Conforms To
FinanceKitUI / FinancialConnectionExtensionAuthorizationResult
Structure
FinancialConnectionExtension
AuthorizationResult
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+


## Page 3

Your scene will be provided a FinancialConnectionExtensionAuthorizationRequest.
Use this request to query parameters necessary for authentication, and callback when complete.
init(content: () -> Content)
AppExtensionScene
Overview
Topics
Initializers
Relationships
Conforms To
FinanceKitUI / FinancialConnectionUIExtensionAuthorizationScene
Structure
FinancialConnectionUIExtension
AuthorizationScene
Implement this scene to authorize your app’s Financial Connection
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+


## Page 4

FinancialConnectionUIExtensionScene
Sendable
SendableMetatype


## Page 5

init(selection: Binding<[Transaction]>, label: () -> Label)
Creates a picker that selects a collection of transactions.
Sendable, SendableMetatype, View
Topics
Initializers
Relationships
Conforms To
FinanceKitUI / TransactionPicker
Structure
TransactionPicker
A view that displays a transaction picker for choosing transactions from
FinanceKit.
iOS 18.0+
iPadOS 18.0+


