# 002_CarKeyRemoteControlSessionDelegate.pdf

## Page 1

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


## Page 2

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


