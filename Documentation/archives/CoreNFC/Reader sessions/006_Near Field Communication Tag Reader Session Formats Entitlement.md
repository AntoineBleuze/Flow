# 006_Near Field Communication Tag Reader Session Formats Entitlement.pdf

## Page 1

Key
com.apple.developer.nfc.readersession.formats
Type
Array of strings
TAG
Allows read and write access to a tag using NFCTagReaderSession.
To add this entitlement to your app, enable the Near Field Communication Tag Reading capability 
Xcode.
Details
Possible Values
Discussion
See Also
Wireless interfaces
Bundle Resources / Entitlements / Near Field Communication Tag Reader Session Formats Entitlement
Property List Key
Near Field Communication Tag Reader
Session Formats Entitlement
The Near Field Communication data formats an app can read.
iOS 11.0+
iPadOS 11.0+


## Page 2

Access Wi-Fi Information Entitlement
A Boolean value indicating whether your app can access information about the connected W
Fi network.
Key: com.apple.developer.networking.wifi-info
Wireless Accessory Configuration Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi accessories.
Key: com.apple.external-accessory.wireless-configuration
Multipath Entitlement
A Boolean value indicating whether your app may use Multipath protocols to seamlessly
transition between Wi-Fi and cellular networks.
Key: com.apple.developer.networking.multipath
Hotspot Configuration Entitlement
A Boolean value indicating whether your app can use the hotspot manager to configure Wi-F
networks.
Key: com.apple.developer.networking.HotspotConfiguration
HotSpot Helper
An entitlement that permits an app to participate in navigating Wi-Fi network hotspots.
Key: com.apple.developer.networking.HotspotHelper
ISO18092 system codes for NFC Tag Reader Session
A list of FeliCa system codes that the app supports.
Key: com.apple.developer.nfc.readersession.felica.systemcodes
ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
Key: com.apple.developer.nfc.readersession.iso7816.select-identifiers
com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.


