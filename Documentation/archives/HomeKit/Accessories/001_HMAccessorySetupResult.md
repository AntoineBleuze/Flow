# 001_HMAccessorySetupResult.pdf

## Page 1

var accessoryUniqueIdentifiers: [UUID]
The values corresponding to accessories that are set up.
var homeUniqueIdentifier: UUID
The home that accessories were added to.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting results
Relationships
Inherits From
Conforms To
HomeKit / HMAccessorySetupResult
Class
HMAccessorySetupResult
A result object describing information about a successful accessory setup reques
iOS 15.4+
iPadOS 15.4+


## Page 2

Equatable
Hashable
NSCopying
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupManager
An object that setups up new accessories.
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
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.
See Also
Accessories


