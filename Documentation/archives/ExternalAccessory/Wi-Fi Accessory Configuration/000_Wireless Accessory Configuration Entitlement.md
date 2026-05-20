# 000_Wireless Accessory Configuration Entitlement.pdf

## Page 1

Key
com.apple.external-accessory.wireless-configuration
Type
Boolean
This key indicates whether your app may configure third-party hardware accessories that use
Apple’s MFi licensed technology to connect to Apple devices.
To add this entitlement to your app, enable the Wireless Accessory Configuration capability in
Xcode.
External Accessory
Details
Discussion
See Also
Related Documentation
Bundle Resources / Entitlements / Wireless Accessory Configuration Entitlement
Property List Key
Wireless Accessory Configuration
Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi
accessories.
iOS 3.0+
iPadOS 3.0+


## Page 2

Communicate with accessories that connect to a device with the Apple Lightning connector,
or with Bluetooth wireless technology.
Access Wi-Fi Information Entitlement
A Boolean value indicating whether your app can access information about the connected W
Fi network.
Key: com.apple.developer.networking.wifi-info
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
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
Key: com.apple.developer.nfc.readersession.formats
ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
Key: com.apple.developer.nfc.readersession.iso7816.select-identifiers
com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
Wireless interfaces


## Page 3

A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.


