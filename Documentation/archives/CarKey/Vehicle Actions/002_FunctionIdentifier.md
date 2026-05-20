# 002_FunctionIdentifier.pdf

## Page 1

A FunctionIdentifier type wraps a vehicle-specific code you define. This code — known as
the function identifier — corresponds to a particular feature of your vehicle. For example, one
function identifier might represent the vehicle’s door locks and another represent the vehicle’s
window system. Use this type in conjunction with an ActionIdentifier type to specify the
complete action you want to perform on a vehicle.
init(rawValue: Int)
Creates and returns a new function identifier with the specified value.
init(Int)
Creates and returns a new function identifier with the specified value.
let rawValue: Int
Overview
Topics
Creating a Function Identifier
Getting the Value
CarKey / FunctionIdentifier
Structure
FunctionIdentifier
A type that stores the designation code for one of your vehicle’s features.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 2

The raw value that corresponds to the specific feature of your vehicle.
Equatable, Hashable, RawRepresentable
struct RemoteKeylessEntryAction
An automatically ending action that you want to perform on a vehicle.
struct RemoteKeylessEntryEnduringAction
An action with an optional stopping point that you want to perform on a vehicle.
Deprecated
struct ActionIdentifier
A type that stores the designation code for one of the actions that a vehicle feature supports
Relationships
Conforms To
See Also
Vehicle Actions


