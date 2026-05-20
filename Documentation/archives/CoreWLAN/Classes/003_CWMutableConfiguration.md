# 003_CWMutableConfiguration.pdf

## Page 1

Use this class to change configuration settings or the preferred networks list. To commit
configuration changes, use commitConfiguration(_:authorization:).
var networkProfiles: NSOrderedSet
The preferred networks list.
var rememberJoinedNetworks: Bool
A Boolean value that determines whether to remember all joined Wi-Fi networks unless the
user specifies otherwise when joining a particular Wi-Fi network.
var requireAdministratorForAssociation: Bool
A Boolean value that determines whether to require an administrator password to change
networks.
Overview
Topics
Configuring Preferred Networks
Configuring Settings
Core WLAN / CWMutableConfiguration
Class
CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
macOS 10.6+


## Page 2

var requireAdministratorForPower: Bool
A Boolean value that determines whether to require an administrator password to change th
interface power state.
var requireAdministratorForIBSSMode: Bool
A Boolean value that determines whether to require an administrator password to create a
computer-to-computer network.
Deprecated
CWConfiguration
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSMutableCopying
NSObjectProtocol
NSSecureCoding
class CWChannel
Encapsulates an IEEE 802.11 channel.
class CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 3

class CWInterface
Encapsulates an IEEE 802.11 interface.
class CWMutableNetworkProfile
Encapsulates a mutable network profile entry.
class CWNetwork
Encapsulates an IEEE 802.11 network, providing read-only accessors to various properties of
the network.
class CWNetworkProfile
Encapsulates an immutable network profile entry.
class CWWiFiClient
A wrapper around the entire Wi-Fi subsystem that you use to access interfaces and set up
event notifications.


