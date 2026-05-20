# 000_CarKeyRemoteControl.pdf

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


