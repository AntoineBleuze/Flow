# 002_HMHomeManager.pdf

## Page 1

Enabling HomeKit in your app
HomeKit stores the user’s home automation information in a database that’s shared among Apple
built-in iOS Home app, your HomeKit-enabled app, and apps from other developers. All these app
access the database as peers using the HomeKit framework.
Mentioned in
Overview
HomeKit / HMHomeManager
Class
HMHomeManager
The manager for a collection of one or more of a user’s homes.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

Each app creates a single HMHomeManager instance to coordinate its HomeKit-related activities.
The manager’s homes array gives your app access to a collection of HMHome instances that
represent the user’s homes. These in turn contain references to the home automation accessorie
that your app can inspect and control.
Adopt the HMHomeManagerDelegate protocol in your app to stay informed of any changes to th
set of homes made outside your app.
var authorizationStatus: HMHomeManagerAuthorizationStatus
The current state of the app’s access to home data.
struct HMHomeManagerAuthorizationStatus
The possible home-access states.
var homes: [HMHome]
An array of all homes managed by this home manager.
Topics
Inspecting authorization status
Working with the home layout


## Page 3

class HMHome
The primary unit of living space, typically composed of rooms organized into zones.
var delegate: (any HMHomeManagerDelegate)?
A delegate that receives updates on the collection of homes.
protocol HMHomeManagerDelegate
An interface the home manager uses to communicate changes to the state of the home
network.
func addHome(withName: String, completionHandler: (HMHome?, (any Error
)?) -> Void)
Adds a new home to this home manager.
func removeHome(HMHome, completionHandler: ((any Error)?) -> Void)
Removes a home from this home manager.
var primaryHome: HMHome?
The primary home managed by this home manager.
Deprecated
func updatePrimaryHome(HMHome, completionHandler: ((any Error)?) -> Voi
)
Updates the primary home of this home manager.
Deprecated
init()
Keeping track of connected homes
Adding and removing homes
Managing the primary home
Initializers
Instance Methods


## Page 4

func findVendorAccessory(hapPublicKey: Data, completionHandler: (
HMAccessory?, (any Error)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Configuring a home automation device
Give users a familiar experience when they manage HomeKit accessories.
Testing your app with the HomeKit Accessory Simulator
Install the HomeKit Accessory Simulator to help you debug your HomeKit-enabled app.
Relationships
Inherits From
Conforms To
See Also
Home Manager


