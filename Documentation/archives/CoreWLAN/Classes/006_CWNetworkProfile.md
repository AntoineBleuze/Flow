# 006_CWNetworkProfile.pdf

## Page 1

init()
Creates and returns a CWNetworkProfile object.
init(networkProfile: CWNetworkProfile)
Creates and returns a CWNetworkProfile object initialized with the given CWNetworkProfile
object.
func isEqual(to: CWNetworkProfile) -> Bool
Determine CWNetworkProfile object equality.
var security: CWSecurity
The security mode for the network profile.
var ssid: String?
The service set identifier (SSID) for the network profile, encoded as a string.
Topics
Getting a network profile
Comparing network profiles
Instance Properties
Core WLAN / CWNetworkProfile
Class
CWNetworkProfile
Encapsulates an immutable network profile entry.
macOS 10.7+


## Page 2

var ssidData: Data?
The service set identifier (SSID) for the network profile, returned as data.
NSObject
CWMutableNetworkProfile
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
Inherited By
Conforms To
See Also
Classes


## Page 3

class CWInterface
Encapsulates an IEEE 802.11 interface.
class CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
class CWMutableNetworkProfile
Encapsulates a mutable network profile entry.
class CWNetwork
Encapsulates an IEEE 802.11 network, providing read-only accessors to various properties of
the network.
class CWWiFiClient
A wrapper around the entire Wi-Fi subsystem that you use to access interfaces and set up
event notifications.


