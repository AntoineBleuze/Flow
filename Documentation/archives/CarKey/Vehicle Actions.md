# Vehicle Actions.pdf

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


## Page 3

Deprecated
Use perform(enduringAction:continuationStrategy:) instead
Use a RemoteKeylessEntryEnduringAction object to store details about an action that you
can stop or let run to completion. For example, you might use this type of action to lower or raise
the top of a convertible vehicle. The object stores information about the vehicle feature to control
and the action to take on that feature. It also stores the identifier for the vehicle itself.
After you create a RemoteKeylessEntryEnduringAction object, call your session’s
perform(_:) method to execute the action. Use the returned RemoteKeylessEntryAction
.ExecutionRequest object to determine the success or failure of the request.
Overview
Topics
Creating the Action Request
CarKey / RemoteKeylessEntryEnduringAction Deprecated
Structure
RemoteKeylessEntryEnduring
Action Deprecated
An action with an optional stopping point that you want to perform on a vehicle.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.3–15.0 Deprecated
watchOS 9.0–11.0 Deprecated


## Page 4

init(functionID: FunctionIdentifier, actionID: ActionIdentifier, vehicl
ID: String)
Creates a new action object with the specified action-specific details and vehicle ID.
class EnduringExecutionRequest
An object that reports the results of an action with an optional stopping point.
let functionID: FunctionIdentifier
The vehicle-specific code that identifies which feature you want to control.
let actionID: ActionIdentifier
The vehicle-specific code that identifies what action to take on the targeted feature.
let recipientVehicleID: String
The vehicle to receive the action request.
struct RemoteKeylessEntryAction
An automatically ending action that you want to perform on a vehicle.
struct FunctionIdentifier
A type that stores the designation code for one of your vehicle’s features.
struct ActionIdentifier
A type that stores the designation code for one of the actions that a vehicle feature supports
Receiving the Action’s Response
Getting the Action Details
See Also
Vehicle Actions


## Page 5

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


## Page 6

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


## Page 7

An ActionIdentifier type wraps a vehicle-specific code you define. This code — known as th
action identifier — corresponds to an action your vehicle can take for a particular feature. For
example, you might define actions to lock or unlock the vehicle’s doors. Use this type in
conjunction with a specific FunctionIdentifier type to specify the complete action you want
to perform on a vehicle.
init(rawValue: Int)
Creates and returns a new action identifier with the specified value.
init(Int)
Creates and returns a new action identifier with the specified value.
Overview
Topics
Creating the Action Identifier
Getting the Value
CarKey / ActionIdentifier
Structure
ActionIdentifier
A type that stores the designation code for one of the actions that a vehicle featur
supports.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 8

let rawValue: Int
The raw value that corresponds to the feature-specific action.
Equatable, Hashable, RawRepresentable
struct RemoteKeylessEntryAction
An automatically ending action that you want to perform on a vehicle.
struct RemoteKeylessEntryEnduringAction
An action with an optional stopping point that you want to perform on a vehicle.
Deprecated
struct FunctionIdentifier
A type that stores the designation code for one of your vehicle’s features.
Relationships
Conforms To
See Also
Vehicle Actions


