# Structures.pdf

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


## Page 3

Use a RemoteKeylessEntryConfigurableEnduringAction object to store details about a
action that you can stop or let run to completion. For example, you might use this type of action to
lower or raise the top of a convertible vehicle. The object stores information about the vehicle
feature to control and the action to take on that feature. It also stores the identifier for the vehicle
itself.
After you create a RemoteKeylessEntryConfigurableEnduringAction object, call your
session’s perform(_:) method to execute the action. Use the returned RemoteKeylessEntr
Action.ExecutionRequest object to determine the success or failure of the request.
class EnduringExecutionRequest
An object that reports the results of an action with an optional stopping point.
Overview
Topics
Classes
Initializers
CarKey / RemoteKeylessEntryConfigurableEnduringAction
Structure
RemoteKeylessEntryConfigurable
EnduringAction
An action with an optional stopping point that you want to perform on a vehicle.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
watchOS 11.0+


## Page 4

init(functionID: FunctionIdentifier, actionID: ActionIdentifier, vehicl
ID: String)
Creates a new action object with the specified action-specific details and vehicle ID.
let actionID: ActionIdentifier
The vehicle-specific code that identifies what action to take on the targeted feature.
let functionID: FunctionIdentifier
The vehicle-specific code that identifies which feature you want to control.
let recipientVehicleID: String
The vehicle to receive the action request.
Instance Properties


