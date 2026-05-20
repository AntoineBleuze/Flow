# 000_RemoteKeylessEntryAction.pdf

## Page 1

Use a RemoteKeylessEntryAction object to store details about an action that runs to
completion after you start it. For example, you might use this type of action to unlock the door
locks of the vehicle. The object stores information about the feature you want to control and the
action to take on that feature. It also stores the identifier for the vehicle itself.
After you create a RemoteKeylessEntryAction object, call your session’s perform(_:)
method to execute the action. Use the returned RemoteKeylessEntryAction.Execution
Request object to determine the success or failure of the request.
init(functionID: FunctionIdentifier, actionID: ActionIdentifier, vehicl
ID: String)
Creates a new action object with the specified action-specific details and vehicle ID.
class ExecutionRequest
Overview
Topics
Creating the Action Request
Receiving the Action’s Response
CarKey / RemoteKeylessEntryAction
Structure
RemoteKeylessEntryAction
An automatically ending action that you want to perform on a vehicle.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 2

An object that reports the results of an automatically ending action asynchronously.
let functionID: FunctionIdentifier
The vehicle-specific code that identifies which feature you want to control.
let actionID: ActionIdentifier
The vehicle-specific code that identifies what action to take on the targeted feature.
let recipientVehicleID: String
The vehicle to receive the action request.
struct RemoteKeylessEntryEnduringAction
An action with an optional stopping point that you want to perform on a vehicle.
Deprecated
struct FunctionIdentifier
A type that stores the designation code for one of your vehicle’s features.
struct ActionIdentifier
A type that stores the designation code for one of the actions that a vehicle feature supports
Getting the Action Details
See Also
Vehicle Actions


