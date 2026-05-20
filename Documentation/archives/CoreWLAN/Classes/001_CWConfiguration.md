# 001_CWConfiguration.pdf

## Page 1

init()
Creates an empty CWConfiguration object.
init(configuration: CWConfiguration)
Creates and returns a CWConfiguration object initialized with the given CWConfiguration
object.
func isEqual(to: CWConfiguration) -> Bool
Determine CWConfiguration object equality.
var networkProfiles: NSOrderedSet
An array of remembered CWNetworkProfile objects.
var rememberJoinedNetworks: Bool
AirPort client will remember all joined networks.
Topics
Creating a configuration
Comparing configurations
Instance Properties
Core WLAN / CWConfiguration
Class
CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
macOS 10.6+


## Page 2

var requireAdministratorForAssociation: Bool
Require an administrator password to change networks.
var requireAdministratorForIBSSMode: Bool
Require an administrator password to create a computer-to-computer network.
var requireAdministratorForPower: Bool
Require an administrator password to change the interface power state.
NSObject
CWMutableConfiguration
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
Relationships
Inherits From
Inherited By
Conforms To
See Also
Classes


## Page 3

class CWChannel
Encapsulates an IEEE 802.11 channel.
class CWInterface
Encapsulates an IEEE 802.11 interface.
class CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
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


