# 004_CoreWLAN Functions.pdf

## Page 1

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


## Page 2

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


