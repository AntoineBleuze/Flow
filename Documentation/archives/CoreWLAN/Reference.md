# Reference.pdf

## Page 1

<Foundation/Foundation.h>
Global Constants
CoreWLANTypes.h
CoreWLANUtil.h
CoreWLAN Enumerations
CoreWLAN Functions
Included Headers
Topics
Constants
See Also
Reference
Core WLAN / CoreWLANConstants.h
CoreWLANConstants.h


## Page 2

<Foundation/Foundation.h>
enum CWChannelBand
CoreWLAN channel bands.
enum CWChannelWidth
CoreWLAN channel widths.
struct CWCipherKeyFlags
Cipher key flags.
enum CWErr
enum CWIBSSModeSecurity
IBSS mode security types.
Deprecated
enum CWPHYMode
CoreWLAN physical layer modes.
enum CWSecurity
Included Headers
Topics
Constants
Core WLAN / CoreWLANTypes.h
API Collection
CoreWLANTypes.h


## Page 3

CoreWLAN security types.
CoreWLANConstants.h
CoreWLANUtil.h
CoreWLAN Enumerations
CoreWLAN Functions
See Also
Reference


## Page 4

<Foundation/Foundation.h>
func CWKeychainCopyEAPIdentityList(UnsafeMutablePointer<Unmanaged<
CFArray>?>?) -> OSStatus
Finds and returns the available identities stored in the keychain.
func CWMergeNetworks(Set<CWNetwork>) -> Set<CWNetwork>
Merges the specified set of CWNetwork objects.
CoreWLANConstants.h
CoreWLANTypes.h
CoreWLAN Enumerations
Included Headers
Topics
Utility Methods
See Also
Reference
Core WLAN / CoreWLANUtil.h
API Collection
CoreWLANUtil.h


## Page 5

CoreWLAN Functions


## Page 6

enum CWChannelBand
CoreWLAN channel bands.
enum CWChannelWidth
CoreWLAN channel widths.
struct CWCipherKeyFlags
Cipher key flags.
enum CWErr
enum CWEventType
Wi-Fi event types.
enum CWIBSSModeSecurity
IBSS mode security types.
Deprecated
enum CWInterfaceMode
Wi-Fi interface operating modes.
enum CWKeychainDomain
Keychain domain types that CoreWLAN keychain methods use.
enum CWPHYMode
CoreWLAN physical layer modes.
Topics
Enumerations
Core WLAN / CoreWLAN Enumerations
API Collection
CoreWLAN Enumerations


## Page 7

enum CWSecurity
CoreWLAN security types.
CoreWLANConstants.h
CoreWLANTypes.h
CoreWLANUtil.h
CoreWLAN Functions
See Also
Reference


## Page 8

func CWKeychainCopyWiFiEAPIdentity(CWKeychainDomain, Data, UnsafeMutabl
Pointer<Unmanaged<SecIdentity>?>?) -> OSStatus
Finds and returns the identity stored for the SSID and keychain domain you specify.
func CWKeychainDeleteWiFiEAPUsernameAndPassword(CWKeychainDomain, Data)
-> OSStatus
Deletes the 802.1X username and password for the SSID and keychain domain you specify.
func CWKeychainDeleteWiFiPassword(CWKeychainDomain, Data) -> OSStatus
Deletes the password for the SSID and keychain domain you specify.
func CWKeychainFindWiFiEAPUsernameAndPassword(CWKeychainDomain, Data,
AutoreleasingUnsafeMutablePointer<NSString?>?, AutoreleasingUnsafe
MutablePointer<NSString?>?) -> OSStatus
Finds and returns the 802.1X username and password stored for the SSID and keychain
domain you specify.
func CWKeychainFindWiFiPassword(CWKeychainDomain, Data, Autoreleasing
UnsafeMutablePointer<NSString?>?) -> OSStatus
Finds and returns, by reference, the password for the SSID and keychain domain you specify
func CWKeychainSetWiFiEAPIdentity(CWKeychainDomain, Data, SecIdentity?)
-> OSStatus
Associates an identity to the SSID and keychain domain you specify.
Topics
Functions
Core WLAN / CoreWLAN Functions
API Collection
CoreWLAN Functions


## Page 9

func CWKeychainSetWiFiEAPUsernameAndPassword(CWKeychainDomain, Data,
String?, String?) -> OSStatus
Sets the 802.1X username and password for the SSID and keychain domain you specify.
func CWKeychainSetWiFiPassword(CWKeychainDomain, Data, String) ->
OSStatus
Sets the Wi-Fi network keychain password for the SSID and keychain domain you specify.
CoreWLANConstants.h
CoreWLANTypes.h
CoreWLANUtil.h
CoreWLAN Enumerations
See Also
Reference


