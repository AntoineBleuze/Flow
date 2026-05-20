# Classes.pdf

## Page 1

func isEqual(to: CWChannel) -> Bool
Determine CWChannel object equality.
var channelBand: CWChannelBand
The channel band.
var channelNumber: Int
The channel number.
var channelWidth: CWChannelWidth
The channel width.
Topics
Comparing channels
Instance Properties
Relationships
Core WLAN / CWChannel
Class
CWChannel
Encapsulates an IEEE 802.11 channel.
macOS 10.7+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
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
Inherits From
Conforms To
See Also
Classes


## Page 3

class CWWiFiClient
A wrapper around the entire Wi-Fi subsystem that you use to access interfaces and set up
event notifications.


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Provides access to various WLAN interface parameters, and operations such as scanning for
networks, association, and creating computer-to-computer (ad-hoc) networks.
Important
Do not instantiate interface objects directly. Instead, use interface objects vended by a CWWi
FiClient instance via the interface() method or one of its relatives. This enables your
app to adopt App Sandbox even when it uses CoreWLAN without the need for any special
exceptions. Directly instantiating interface objects causes low level access to system sockets,
which by default is not allowed in a sandboxed environment.
func setPairwiseMasterKey(Data?) throws
Sets the interface pairwise primary key (PMK).
func setPower(Bool) throws
Overview
Topics
Setting interface parameters
Core WLAN / CWInterface
Class
CWInterface
Encapsulates an IEEE 802.11 interface.
macOS 10.6+


## Page 8

Sets the interface power state.
func setWEPKey(Data?, flags: CWCipherKeyFlags, index: Int) throws
Sets the interface WEP key.
func setWLANChannel(CWChannel) throws
Sets the interface channel.
func scanForNetworks(withName: String?) throws -> Set<CWNetwork>
Scans for networks.
func scanForNetworks(withSSID: Data?) throws -> Set<CWNetwork>
Scans for networks.
init(interfaceName: String?)
Convenience method for getting an CWInterface object with the specified name.
Deprecated
convenience init(name: String?)
An instance method for obtaining an CWInterface object.
Deprecated
class func interfaceNames() -> Set<String>?
Returns the list of BSD names for WLAN interfaces available on the current system.
Deprecated
func disassociate()
Disassociates from the current network.
Scanning for networks
Getting an interface
Getting all attached interfaces
Disassociating from a network
Creating computer-to-computer networks


## Page 9

func startIBSSMode(withSSID: Data, security: CWIBSSModeSecurity, channe
: Int, password: String?) throws
Creates a computer-to-computer (ad-hoc) network with the given network name, security
type, and password on the specified channel.
Deprecated
func commitConfiguration(CWConfiguration, authorization: SFAuthorizatio
?) throws
Commit a configuration for the given WLAN interface.
func associate(toEnterpriseNetwork: CWNetwork, identity: SecIdentity?,
username: String?, password: String?) throws
Connects to the given enterprise network.
func associate(to: CWNetwork, password: String?) throws
Associates to a given network using the given network passphrase.
var interfaceName: String?
The BSD name of the interface.
func activePHYMode() -> CWPHYMode
The current active PHY modes for the interface.
func bssid() -> String?
The current basic service set identifier (BSSID) for the interface, returned as a UTF-8 string.
func cachedScanResults() -> Set<CWNetwork>?
The networks currently in the scan cache for the WLAN interface.
func configuration() -> CWConfiguration?
The current configuration for the given WLAN interface.
Committing a configuration
Associating to a network
Instance Properties
Instance Methods


## Page 10

func countryCode() -> String?
The current country code (ISO/IEC 3166-1:1997) for the interface.
func hardwareAddress() -> String?
The hardware media access control (MAC) address for the interface, returned as a UTF-8
string.
func interfaceMode() -> CWInterfaceMode
The current mode for the interface.
func noiseMeasurement() -> Int
The current aggregate noise measurement (dBm) for the interface.
func powerOn() -> Bool
The interface power state is set to “ON”.
func rssiValue() -> Int
The current aggregate received signal strength indication (RSSI) measurement (dBm) for the
interface.
func scanForNetworks(withName: String?, includeHidden: Bool) throws ->
Set<CWNetwork>
Scans for networks with the name you specify, optionally including hidden networks.
func scanForNetworks(withSSID: Data?, includeHidden: Bool) throws -> Se
<CWNetwork>
Scans for networks with the SSID you specify, optionally including hidden networks.
func security() -> CWSecurity
The current security mode for the interface.
func serviceActive() -> Bool
The interface has its corresponding network service enabled.
func ssid() -> String?
The current service set identifier (SSID) for the interface, encoded as a string.
func ssidData() -> Data?
The current service set identifier (SSID) for the interface, returned as data.
func supportedWLANChannels() -> Set<CWChannel>?
An array of channels supported by the interface for the active country code.


## Page 11

func transmitPower() -> Int
The current transmit power (mW) for the interface.
func transmitRate() -> Double
The current transmit rate (Mbps) for the interface.
func wlanChannel() -> CWChannel?
The current channel for the interface.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CWChannel
Encapsulates an IEEE 802.11 channel.
class CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
class CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

Use this class to change profile properties. To commit Wi-Fi network profile changes, use netwo
Profiles and commitConfiguration(_:authorization:).
var ssidData: Data?
The service set identifier (SSID).
var security: CWSecurity
The security type.
Overview
Topics
Configuring Network Profiles
Relationships
Inherits From
Core WLAN / CWMutableNetworkProfile
Class
CWMutableNetworkProfile
Encapsulates a mutable network profile entry.
macOS 10.7+


## Page 17

CWNetworkProfile
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
class CWInterface
Encapsulates an IEEE 802.11 interface.
class CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
class CWNetwork
Encapsulates an IEEE 802.11 network, providing read-only accessors to various properties of
the network.
class CWNetworkProfile
Encapsulates an immutable network profile entry.
class CWWiFiClient
Conforms To
See Also
Classes


## Page 18

A wrapper around the entire Wi-Fi subsystem that you use to access interfaces and set up
event notifications.


## Page 19

func supportsSecurity(CWSecurity) -> Bool
Method for determining which security types a network supports.
func supportsPHYMode(CWPHYMode) -> Bool
Method for determining which PHY modes a network supports.
func isEqual(to: CWNetwork) -> Bool
Method for determining CWNetwork object equality.
var beaconInterval: Int
The beacon interval (ms) for the network.
Topics
Getting supported security types
Getting supported PHY modes
Comparing wireless networks
Instance Properties
Core WLAN / CWNetwork
Class
CWNetwork
Encapsulates an IEEE 802.11 network, providing read-only accessors to various
properties of the network.
macOS 10.6+


## Page 20

var bssid: String?
The basic service set identifier (BSSID) for the network, returned as UTF-8 string.
var countryCode: String?
The country code (ISO/IEC 3166-1:1997) for the network.
var ibss: Bool
The network is an IBSS network.
var informationElementData: Data?
Information element data included in beacon or probe response frames.
var noiseMeasurement: Int
The aggregate noise measurement (dBm) for the network.
var rssiValue: Int
The aggregate received signal strength indication (RSSI) measurement (dBm) for the networ
var ssid: String?
The service set identifier (SSID) for the network, encoded as a string.
var ssidData: Data?
The service set identifier (SSID) for the network, returned as data.
var wlanChannel: CWChannel?
The channel for the network.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Relationships
Inherits From
Conforms To


## Page 21

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CWChannel
Encapsulates an IEEE 802.11 channel.
class CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
class CWInterface
Encapsulates an IEEE 802.11 interface.
class CWMutableConfiguration
Encapsulates a mutable configuration for an AirPort WLAN interface.
class CWMutableNetworkProfile
Encapsulates a mutable network profile entry.
class CWNetworkProfile
Encapsulates an immutable network profile entry.
class CWWiFiClient
A wrapper around the entire Wi-Fi subsystem that you use to access interfaces and set up
event notifications.
See Also
Classes


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

Wi-Fi client objects are heavy. Therefore, it’s more efficient to use a single, long-running client
instance, rather than creating several short-lived instances. For convenience, you can use the
singleton instance returned by the shared() class method.
Instead of instantiating CWInterface objects directly, use the ones provided by the instance
methods of this class. For example, the interface() method returns the default Wi-Fi interface
class func shared() -> CWWiFiClient
The shared Wi-Fi client object.
init()
Initializes a Wi-Fi client object.
Overview
Topics
Getting the Shared Instance
Initializing a Wi-Fi Client
Core WLAN / CWWiFiClient
Class
CWWiFiClient
A wrapper around the entire Wi-Fi subsystem that you use to access interfaces
and set up event notifications.
macOS 10.10+


## Page 26

var delegate: AnyObject?
An object that provides Wi-Fi event handling.
func interface() -> CWInterface?
Returns the default Wi-Fi interface.
func interface(withName: String?) -> CWInterface?
Returns the Wi-Fi interface with the given name.
func interfaces() -> [CWInterface]?
Returns all available Wi-Fi interfaces.
class func interfaceNames() -> [String]?
Returns the list of the names of available Wi-Fi interfaces.
Deprecated
func startMonitoringEvent(with: CWEventType) throws
Register for specific Wi-Fi event notifications.
func stopMonitoringAllEvents() throws
Unregister for all Wi-Fi event notifications.
func stopMonitoringEvent(with: CWEventType) throws
Unregister for specific Wi-Fi event notifications.
func interfaceNames() -> [String]?
Setting a Delegate
Getting Interfaces
Monitoring Events
Instance Methods
Relationships


## Page 27

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CWChannel
Encapsulates an IEEE 802.11 channel.
class CWConfiguration
Encapsulates an immutable configuration for an AirPort WLAN interface.
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
Inherits From
Conforms To
See Also
Classes


## Page 28

Encapsulates an immutable network profile entry.


