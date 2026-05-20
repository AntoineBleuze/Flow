# 002_ASAccessory_AccessoryState.pdf

## Page 1

init?(rawValue: Int)
case unauthorized
The accessory is invalid or unauthorized.
case awaitingAuthorization
The accessory is selected, but full authorization is still pending.
case authorized
The accessory is authorized and available.
Topics
Creating a state instance
Accessory states
Relationships
Conforms To
AccessorySetupKit / ASAccessory / ASAccessory.AccessoryState
Enumeration
ASAccessory.AccessoryState
An enumeration of possible authorization states of an accessory.
iOS 18.0+
iPadOS 18.0+


## Page 2

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class ASAccessory
An accessory discovered by the accessory session.
class ASDiscoveredAccessory
A discovered accessory, for use in creating a customized picker display item.
See Also
Accessory description


