# 007_HMMediaSourceDisplayOrderProfile.pdf

## Page 1

This class represents a media source display that orders functionality for the HMServiceType
Television service contained in the services array of the profile.
func writeOrder([Int]) async throws
Writes the display order of the media sources to the accessory.
var delegate: (any HMMediaSourceDisplayOrderProfile.Delegate)?
The property that handles updates to the display order.
var order: [Int]
The display order of input media sources.
let canModifyOrder: Bool
A Boolean that indicates if the display order of the input media sources can be modified.
Overview
Topics
Managing input source order
HomeKit / HMMediaSourceDisplayOrderProfile
Class
HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the
ordering of input sources.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

protocol Delegate
The protocol through which a delegate receives updates on the order of input media sources
HMAccessoryProfile
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
Relationships
Inherits From
Conforms To
See Also
Accessories


## Page 3

A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.


