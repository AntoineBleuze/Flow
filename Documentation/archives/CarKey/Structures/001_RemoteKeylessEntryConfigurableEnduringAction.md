# 001_RemoteKeylessEntryConfigurableEnduringAction.pdf

## Page 1

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


## Page 2

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


