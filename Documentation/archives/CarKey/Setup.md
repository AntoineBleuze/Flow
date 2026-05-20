# Setup.pdf

## Page 1

Use a CarKeyRemoteControl object to create the session your app uses to communicate with
the vehicles your company manufactures. You don’t create an instance of this object. Instead, cal
the start(delegate:subscriptionRange:with:) class method to request a new session
object. The system retrieves the relevant vehicle information from person’s Apple Wallet and adds
vehicles that match your company’s make to the session.
Start a new session only when your app is running in the foreground. If your app enters the
background, end the current session and start a new one when your app returns to the foregroun
class func start(delegate: any CarKeyRemoteControlSessionDelegate,
subscriptionRange: ClosedRange<Int>?, with: DispatchQueue?) async throw
-> CarKeyRemoteControlSession
Creates and returns a new session object to access the provisioned vehicles.
Overview
Topics
Creating the Session Object
Type Methods
CarKey / CarKeyRemoteControl
Class
CarKeyRemoteControl
The object you use to start a new vehicle-related session.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 2

class func registerForLaunchOnCarKeyEvent() throws
Register your app to be relaunched in the background on CarKey events. Under certain
conditions the system will not relaunch the app regardless of CarKey events.
class func unregisterForLaunchOnCarKeyEvent() throws
Unregister your app so it’s no longer relaunched in the background on CarKey events.
class CarKeyRemoteControlSession
The object that manages communication with the vehicles you manufacture.
protocol CarKeyRemoteControlSessionDelegate
An interface you use to receive session- and vehicle-related information from the system.
struct VehicleReport
A type that contains information about a vehicle configured for remote keyless entry in the
user’s Apple Wallet.
See Also
Setup


## Page 3

A CarKeyRemoteControlSession object coordinates interactions between your app and your
company’s make of vehicles. This object works with the system to transmit data securely to and
from a vehicle, and to report results back to your app. Use this object to send commands or data
directly to a vehicle, and to get information about the available vehicles and their current
configuration.
Don’t create this object directly. Instead, call the start(delegate:subscriptionRange:
with:) method to create a new session object. When you finish interacting with the vehicle, call
the session’s end() method to close out the session and prevent further access. You can have
only one active session at a time. If you try to start a second session, start(delegate:
subscriptionRange:with:) doesn’t return until the currently active session becomes invalid
When you configure a new session, provide a delegate object to receive data from vehicle-initiate
transfers. The system also uses your delegate notify you when the configuration of a vehicle
changes. For example, it lets you know when connectivity to the vehicle changes. The delegate
must adopt the CarKeyRemoteControlSessionDelegate protocol.
Note
If your app has an active session, the system automatically ends that session when your app
enters the background. Upon reentering the foreground, you must create a new session to
communicate with your vehicle again.
Overview
CarKey / CarKeyRemoteControlSession
Class
CarKeyRemoteControlSession
The object that manages communication with the vehicles you manufacture.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 4

func perform(RemoteKeylessEntryAction) throws -> RemoteKeylessEntry
Action.ExecutionRequest
Sends a request to the vehicle to perform a one-time action.
func perform(RemoteKeylessEntryEnduringAction) throws -> RemoteKeyless
EntryEnduringAction.EnduringExecutionRequest
Sends a request to the vehicle to start an action that has a separate stopping point.
Deprecated
func sendPassthroughData(Data, toVehicle: String) throws
Sends the specified custom data to the vehicle.
func end() throws
Ends the session and stops the delivery of notifications for all vehicles in the session.
var vehicleReports: [VehicleReport]
The configuration details of the provisioned vehicles that match your company’s make.
func isPassiveEntryAvailable(forVehicle: String) throws -> Bool
Returns a Boolean value that indicates whether passive entry is currently available for the
specified vehicle.
struct Attestation
Object representing an attestation and related data
Topics
Performing Vehicle-Related Actions
Sending Data to the Vehicle
Closing the Session
Getting Vehicle Information
Structures


## Page 5

func perform(RemoteKeylessEntryConfigurableEnduringAction, continuation
Strategy: CarKeyRemoteControlSession.ContinuationStrategy) throws ->
RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest
Sends a request to the vehicle to start an action that has a separate stopping point, and
optionally allows your app to have control over incoming continuation requests and to
exchange data during the execution of the action.
func sign(data: Data, forVehicle: String) throws -> CarKeyRemoteControl
Session.Attestation
Sign data with the endpoint.SK identified by vehicleIdentifier as described in the section “OE
App Data Attestation” of the Car Connectivity Consortium Digital Key Release 3.0
specification.
enum ContinuationStrategy
Strategy to use on reception of a continuation request.
class CarKeyRemoteControl
The object you use to start a new vehicle-related session.
protocol CarKeyRemoteControlSessionDelegate
An interface you use to receive session- and vehicle-related information from the system.
struct VehicleReport
A type that contains information about a vehicle configured for remote keyless entry in the
user’s Apple Wallet.
Instance Methods
Enumerations
See Also
Setup


## Page 6

The system uses the CarKeyRemoteControlSessionDelegate protocol to notify your app
asynchronously when something happens. Adopt this protocol in one of your objects and detect
when the system invalidates the session. If your vehicle is capable of sending data to your app, yo
also use this protocol to receive any data the vehicle sends.
func remoteControlSession(CarKeyRemoteControlSession, vehicleDidUpdate
Report: VehicleReport)
Notifies your delegate object that the status of the specified vehicle changed.
Required
func remoteControlSession(CarKeyRemoteControlSession, didReceive
PassthroughData: Data, fromVehicle: String)
Notifies the delegate object that the vehicle sent passthrough data for you to handle.
Required
Overview
Topics
Receiving Data from the Vehicle
CarKey / CarKeyRemoteControlSessionDelegate
Protocol
CarKeyRemoteControlSessionDelegate
An interface you use to receive session- and vehicle-related information from the
system.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 7

func remoteControlSession(CarKeyRemoteControlSession, didInvalidateWith
Error: CarKeyErrorCode)
Notifies your delegate object that the session become invalid for the specified reason.
Required
func remoteControlSession(CarKeyRemoteControlSession, didCreateKey:
String, forVehicle: String)
Called to notify your app when a new key has been created.
Required Default implementation provided.
class CarKeyRemoteControl
The object you use to start a new vehicle-related session.
class CarKeyRemoteControlSession
The object that manages communication with the vehicles you manufacture.
struct VehicleReport
A type that contains information about a vehicle configured for remote keyless entry in the
user’s Apple Wallet.
Handling Session Invalidation
Instance Methods
See Also
Setup


## Page 8

A VehicleReport type provides information about a vehicle you manufacture. The system
generates a vehicle report for each vehicle that matches your company’s make, and that the owne
configured in their Apple Wallet. Use a vehicle report to get information about the vehicle, such as
whether it’s currently connected and able to receive commands. You can also use the report to
determine which vehicle features you can operate from your app.
A vehicle can optionally attach proprietary data to one of its function identifiers. You might use th
data to support additional features related to that vehicle feature. For example, you might want to
attach a unique security code to the door lock function. Use the vehicle report to retrieve any data
your vehicle sends. If the vehicle sends new data, the system updates the report and notifies you
session delegate.
let identifier: String
The string you use to identify the vehicle when making requests.
Overview
Topics
Getting the Vehicle Details
CarKey / VehicleReport
Structure
VehicleReport
A type that contains information about a vehicle configured for remote keyless
entry in the user’s Apple Wallet.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.3+
watchOS 9.0+


## Page 9

var isConnected: Bool
A Boolean value that indicates whether the vehicle is currently connected over Bluetooth.
var supportedFunctions: [FunctionIdentifier]
An array of function identifiers that indicates the features the vehicle supports, populated on
after the first BLE connection with the vehicle.
func status(for: FunctionIdentifier) throws -> FunctionStatus?
Returns the current status of the specified vehicle function.
struct FunctionStatus
A value that the vehicle can return to indicate the status of a particular vehicle feature.
func proprietaryData(for: FunctionIdentifier) throws -> Data?
Retrieves the proprietary data associated with one of the vehicle’s functions.
class CarKeyRemoteControl
The object you use to start a new vehicle-related session.
class CarKeyRemoteControlSession
The object that manages communication with the vehicles you manufacture.
protocol CarKeyRemoteControlSessionDelegate
An interface you use to receive session- and vehicle-related information from the system.
Getting the Vehicle’s Supported Functions
Fetching Data Sent by the Vehicle
See Also
Setup


