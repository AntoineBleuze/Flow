# 000_HMAccessorySetupManager.pdf

## Page 1

Use this class to provides steps for the user to add one or more accessories to a particular home,
and follow up with additional setup. These APIs don’t require that the current app has home data
authorization.
func performAccessorySetup(using: HMAccessorySetupRequest, completion
Handler: (HMAccessorySetupResult?, (any Error)?) -> Void)
Performs the process of setting up accessories with Apple Home.
init()
Overview
Topics
Adding accessories
Initializers
Relationships
HomeKit / HMAccessorySetupManager
Class
HMAccessorySetupManager
An object that setups up new accessories.
iOS 15.0+
iPadOS 15.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
Inherits From
Conforms To
See Also
Accessories


## Page 3

An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.


