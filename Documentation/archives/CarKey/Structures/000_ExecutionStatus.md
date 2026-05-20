# 000_ExecutionStatus.pdf

## Page 1

An ExecutionStatus type wraps a code that indicates how your vehicle responded to a
particular request. The Car Connectivity Consortium specifications define the meaning of most
execution status codes, but you can define custom codes as needed for your vehicles.
init(rawValue: Int)
Creates and returns a new execution status with the specified value.
init(Int)
Creates and returns a new execution status with the specified value.
let rawValue: Int
Overview
Topics
Creating the Execution Status
Getting the Value
CarKey / ExecutionStatus
Structure
ExecutionStatus
A type that contains the status code a vehicle returns after executing an action.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 2

The raw value that corresponds to the feature-specific status.
RawRepresentable, Sendable, SendableMetatype
func results() async throws -> ExecutionStatus
Returns the results of a preceding action request.
Relationships
Conforms To
See Also
Getting the Vehicle’s Respose


