# 000_Entitlements.pdf

## Page 1

Type
Object
An entitlement is a right or privilege that grants particular capabilities to an executable. For
example, an app needs the HomeKit Entitlement — along with explicit user consent — to access a
user’s home automation network. An app stores its entitlements as key-value pairs embedded in
the code signature of its binary executable.
You configure entitlements for your app by declaring capabilities for a target in Xcode; see
Capabilities. Xcode records capabilities that you add in a property list file with the
.entitlements extension. When code signing your app, Xcode combines the entitlements file,
information from your developer account, and other project information to apply a final set of
entitlements to your app.
You typically let Xcode manage the entitlements file for you. For information on manually editing
the file, see Editing property list files.
Details
Discussion
Topics
Essentials
Bundle Resources / Entitlements
Property List
Entitlements
Key-value pairs that grant an executable permission to use a service or
technology.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

Adding capabilities to your app
Configure your target to include and customize capabilities that provide access to Apple’s ap
services.
Diagnosing Issues with Entitlements
Verify your app’s entitlements at every stage of development to track down errors during
distribution.
Signing a daemon with a restricted entitlement
Wrap a daemon in an app-like structure to use an entitlement thatʼs authorized by a
provisioning profile.
com.apple.developer.accessibility.merchant-api-control
com.apple.developer.accessory-setup-discovery-extension
An entitlement that lets an app extension discover and set up accessories.
com.apple.developer.accessory-transport-extension
A Boolean value that indicates whether your app can exchange sensitive information with a
connected accessory.
Embedded Browser Engine Entitlement
An entitlement that enables an app to embed an alternative browser engine.
Key: com.apple.developer.embedded-web-browser-engine
Embedded Browser Engine Association Entitlement
An entitlement that indicates whether you own the alternative browser engine that your app
embeds.
Key: com.apple.developer.embedded-web-browser-engine.engine-association
Web Browser Engine Entitlement
An entitlement that enables your browser app to implement an alternative browser engine.
Key: com.apple.developer.web-browser-engine.host
Accessibility
AccessorySetupKit
Accessory Transport Extension
Alternative browser engines


## Page 3

com.apple.developer.web-browser-engine.networking
An entitlement that grants an alternative browser engine’s extension the ability to use the
network.
com.apple.developer.web-browser-engine.webcontent
An entitlement that grants an alternative browser engine’s extension the ability to manage w
content.
com.apple.developer.web-browser-engine.rendering
An entitlement that grants an alternative browser engine’s extension the ability to render web
content.
com.apple.developer.memory.transfer_accept
An entitlement that grants an alternative browser engine’s web-content extension the ability
increase memory.
com.apple.developer.memory.transfer_send
An entitlement that grants an alternative browser engine’s rendering extension the ability to
transfer memory.
com.apple.developer.web-browser-engine.restrict.notifyd
An entitlement that restricts access to system notifications to enhance the security of your
browser app.
com.apple.developer.marketplace.app-installation
An entitlement that enables an app to vend other apps as an alternative app marketplace.
Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
Key: com.apple.developer.parent-application-identifiers
com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
com.apple.developer.on-demand-install-capable
A Boolean value that indicates whether a bundle represents an App Clip.
Alternative app marketplaces
App Clips


## Page 4

Side Button Access
A Boolean value that indicates whether a person in Japan can configure the side button of
iPhone to launch your voice-based conversational app.
Key: com.apple.developer.side-button-access.allow
com.apple.developer.app-migration.data-container-access
An entitlement required for app extensions to perform a one-time transfer of on-device data
to or from another platform.
Name: App Identifier for OS Data Transfer
Account Creation Requires Phone Number
A Boolean value that indicates whether an app requires someone to provide a phone numbe
to create an account.
Key: com.apple.developer.authentication-services.account-creation-requires-phone-numbe
AutoFill Credential Provider Entitlement
A Boolean value that indicates whether the app may, with user permission, provide user
names and passwords for AutoFill in Safari and other apps.
Key: com.apple.developer.authentication-services.autofill-credential-provider
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
Key: com.apple.developer.applesignin
Background GPU Access
The entitlement the system requires for a continuous background task to use the GPU.
Key: com.apple.developer.background-tasks.continued-processing.gpu
Default Calling App
AppIntents
AppMigrationKit
Authentication
Background tasks
CallKit


## Page 5

A Boolean value that indicates whether an app can be the default calling app on someone’s
device.
Key: com.apple.developer.calling-app
com.apple.developer.carplay-audio
com.apple.developer.carplay-charging
com.apple.developer.carplay-communication
com.apple.developer.carplay-maps
com.apple.developer.carplay-parking
com.apple.developer.carplay-quick-ordering
com.apple.developer.carplay-messaging
Deprecated
com.apple.developer.playable-content
Deprecated
com.apple.developer.icloud-extended-share-access
An array of strings that represent the types of information an app can request about a
CloudKit share.
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact entries.
com.apple.CommCenter.fine-grained
An entitlement that grants access to CoreTelephony services.
com.apple.developer.declared-age-range
A Boolean value indicating whether your app may request a person’s age range.
CarPlay
CloudKit
Contacts
CoreTelephony
Declared Age Range


## Page 6

com.apple.developer.automated-device-enrollment.add-devices
A Boolean value that indicates whether an app may add a device to Automated Device
Enrollment.
Enrollment Single Sign On
An entitlement that indicates the app participates in single sign-on (SSO) during enrollment
into device management.
Key: com.apple.developer.enrollment-sso-capable
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
Key: com.apple.developer.ClassKit-environment
com.apple.developer.automatic-assessment-configuration
A Boolean value that indicates whether an app may create an assessment session.
com.apple.developer.mail-client
A Boolean that indicates whether the app can act as a user’s default email client.
com.apple.developer.energykit
The entitlement the system requires for an app to use the EnergyKit framework.
Increased performance headroom
An entitlement that allows an app to adjust thresholds that balance thermal dissipation and
performance against fan noise and other factors.
Key: com.apple.developer.app-compute-category
Passthrough in screen capture
Device Management
Education
Email clients
EnergyKit
Enterprise


## Page 7

A Boolean value that indicates whether an app can include passthrough in screen capture.
Key: com.apple.developer.screen-capture.include-passthrough
Main camera access
A Boolean value that indicates whether an app can use ARKit to access the main cameras on
Apple Vision Pro.
Key: com.apple.developer.arkit.main-camera-access.allow
Object-tracking parameter adjustment
A Boolean value that allows an app to use ARKit to track more objects with a higher frequenc
Key: com.apple.developer.arkit.object-tracking-parameter-adjustment.allow
Spatial barcode and QR code scanning
A Boolean value that indicates whether an app can use ARKit to detect, position, and decode
barcode and QR codes.
Key: com.apple.developer.arkit.barcode-detection.allow
Camera Region access
A Boolean value indicating whether your app may access the camera region.
Key: com.apple.developer.arkit.camera-region.allow
Shared Coordinate Space access
A Boolean value indicating whether your app may use a shared coordinate space.
Key: com.apple.developer.arkit.shared-coordinate-space.allow
App-Protected Content
A Boolean value indicating whether the system prohibits capturing your app’s content.
Key: com.apple.developer.protected-content
Window Follow Mode
A Boolean value indicating whether your app’s windows will follow the person.
Key: com.apple.developer.window-body-follow
Apple Neural Engine access
A Boolean value that indicates whether an app can use the Apple Neural Engine to speed up
CoreML.
Key: com.apple.developer.coreml.neural-engine-access
Deprecated
UVC Device Access on visionOS
A Boolean value that indicates whether the app can stream USB UVC devices connected to
the Developer strap.
Key: com.apple.developer.avfoundation.uvc-device-access


## Page 8

Deprecated
com.apple.developer.exposure-notification
A Boolean value that indicates whether the app may use exposure notification.
Family Controls
A Boolean value that indicates whether the app can request or revoke authorization to provid
parental controls.
Key: com.apple.developer.family-controls
com.apple.developer.fileprovider.testing-mode
A Boolean value that indicates whether you can place domains in testing mode.
FinanceKit
An entitlement that allows an app to access financial data in FinanceKit.
Key: com.apple.developer.financekit
com.apple.developer.foundation-model-adapter
A Boolean value that indicates whether the app can enable custom adapters for the
Foundation Models framework.
com.apple.developer.fskit.fsmodule
An entitlement that indicates an extension provides an FSKit filesystem.
Name: FSKit Module
Exposure notification
Family controls
File provider
FinanceKit
Foundation Models
FSKit
Games


## Page 9

Game Center Entitlement
A Boolean value that indicates whether users of the app may see and compare achievement
on a leaderboard, invite friends, and start multiplayer games.
Key: com.apple.developer.game-center
com.apple.developer.group-session
A Boolean value that indicates whether the app may implement shared group experiences.
HealthKit Entitlement
A Boolean value that indicates whether the app may request user authorization to access
health and activity data that appears in the Health app.
Key: com.apple.developer.healthkit
HealthKit Capabilities Entitlement
Health data types that require additional permission.
Key: com.apple.developer.healthkit.access
com.apple.developer.healthkit.background-delivery
A Boolean value that indicates whether observer queries receive updates while running in th
background.
Fall Detection Notifications
An entitlement that permits an app to receive fall-detection notifications from Apple Watch.
Key: com.apple.developer.health.fall-detection
com.apple.developer.healthkit.recalibrate-estimates
A Boolean value that determines whether your app can recalibrate the prediction algorithm
used to calculate supported sample types.
HomeKit Entitlement
A Boolean value that indicates whether users of the app may manage HomeKit-compatible
accessories.
Key: com.apple.developer.homekit
Matter Allow Setup Payload
Group activities
Health
Home automation


## Page 10

A Boolean value that allows an app to provide an optional Matter Setup payload while setting
up a Matter device in an ecosystem.
Key: com.apple.developer.matter.allow-setup-payload
com.apple.security.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
com.apple.vm.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
Deprecated
com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses them in the
guest-operating system.
com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces without
escalating privileges to the root user.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.
com.apple.developer.icloud-container-development-container-identifiers
The container identifiers for the iCloud development environment.
com.apple.developer.icloud-container-environment
The development or production environment to use for the iCloud containers.
iCloud Container Identifiers Entitlement
The container identifiers for the iCloud production environment.
Key: com.apple.developer.icloud-container-identifiers
iCloud Services Entitlement
The iCloud services used by the app.
Key: com.apple.developer.icloud-services
iCloud Key-Value Store Entitlement
The container identifier to use for iCloud key-value storage.
Hypervisor
iCloud


## Page 11

Key: com.apple.developer.ubiquity-kvstore-identifier
Digital Credentials API - Mobile Document Provider
An array of strings that represent the types of mobile documents (mdoc) that an identity
document provider app can provide during an online web presentment.
Key: com.apple.developer.identity-document-services.document-provider.mobile-documen
types
com.apple.developer.journal.allow
An entitlement that enables an app to present the journaling suggestions picker.
Default Calling App
A Boolean value that indicates whether an app can be the default calling app on someone’s
device.
Key: com.apple.developer.calling-app
Default Dialer App
A Boolean value that indicates whether an app can be the default dialer app on someone’s
device.
Key: com.apple.developer.dialing-app
Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in response to 
push notification.
Key: com.apple.developer.location.push
Managed App Installation UI
An entitlement you enable so your app can use Managed App Distribution.
Key: com.apple.developer.managed-app-distribution.install-ui
IdentityDocumentServices
Journaling Suggestions
LiveCommunicationKit
Location
Managed App Distribution


## Page 12

Media Device Discovery Extension
An entitlement for an app extension that adds a specific third-party media receiver to a
system device-picker UI.
Key: com.apple.developer.media-device-discovery-extension
com.apple.developer.coremotion.head-pose
An entitlement that enables someone’s head movement to determine the orientation of
spatialized sound output.
com.apple.developer.spatial-audio.profile-access
An entitlement that enables your app to use the personalized spatial audio profile.
com.apple.developer.avfoundation.multitasking-camera-access
A Boolean value that indicates whether an app may continue using the camera at the same
time as another foreground app.
Deprecated
com.apple.developer.kernel.increased-memory-limit
A Boolean value that indicates whether core features of your app may perform better with a
higher memory limit on supported devices.
Extended Virtual Addressing Entitlement
A Boolean value that indicates whether the app may access an extended address space.
Key: com.apple.developer.kernel.extended-virtual-addressing
com.apple.developer.sustained-execution
A Boolean value that indicates whether your app performs consistently when the
system constrains it to a sustainable performance level.
Critical Messaging
A Boolean value that indicates whether an app can use the Critical Messaging API to send
SMS messages.
Media
Memory
Metal
Messages


## Page 13

Key: com.apple.developer.messages.critical-messaging
Default Messaging App
A Boolean value that indicates whether an app can be the default messaging app on
someone’s device.
Key: com.apple.developer.messaging-app
com.apple.developer.upi-device-validation
A Boolean value that indicates whether the app can use Unified Payments Interface (UPI)
device enrollment.
Default Navigation
A Boolean value that indicates whether an app can be the default navigation app on
someone’s device.
Key: com.apple.developer.navigation-app
Nearby Interaction NI DL-TDOA API (development)
A Boolean value that indicates whether your app can enable Downlink Time-Difference-of-
Arrival (DL-DTOA) ranging.
Key: com.apple.developer.nearbyinteraction.dltdoa
Network Extensions Entitlement
The APIs an app can use to customize networking features.
Key: com.apple.developer.networking.networkextension
Personal VPN Entitlement
The API an app can use to create and control a custom system VPN configuration.
Key: com.apple.developer.networking.vpn.api
Associated Domains Entitlement
The associated domains for specific services, such as shared web credentials, universal link
and App Clips.
Key: com.apple.developer.associated-domains
MessageUI
Navigation
NearbyInteraction
Networking


## Page 14

com.apple.developer.networking.multicast
A Boolean value that indicates whether an app can send or receive IP multicast traffic.
com.apple.developer.associated-domains.applinks.read-write
A Boolean value that indicates whether the app can use universal links.
com.apple.developer.networking.manage-thread-network-credentials
A Boolean value that indicates whether the app can use ThreadNetwork.
5G Network Slicing App Category
The key that defines the app category entitlement to enable Cellular Network Slicing.
Key: com.apple.developer.networking.slicing.appcategory
5G Network Slicing Traffic Category
The key that defines the traffic category entitlement to enable Cellular Network Slicing.
Key: com.apple.developer.networking.slicing.trafficcategory
com.apple.developer.networking.vmnet
Configuring your app for ultra-constrained networks
Prepare to deliver data over resource-limited data networks.
com.apple.developer.networking.carrier-constrained.appcategory
The key that defines an app’s category for accessing a carrier-provided satellite network.
com.apple.developer.networking.carrier-constrained.app-optimized
A Boolean value that indicates whether your app is optimized for a carrier-provided satellite
network.
APS Environment Entitlement
The environment for push notifications.
Key: aps-environment
APS Environment (macOS) Entitlement
The environment for push notifications in macOS apps.
Key: com.apple.developer.aps-environment
Critical Alerts
An entitlement that permits an app to receive critical alert notifications.
Key: com.apple.developer.usernotifications.critical-alerts
Notifications


## Page 15

com.apple.developer.usernotifications.filtering
Enable receiving notifications without displaying the notification to the user.
Pass Presentation Suppression
An entitlement that prevents the system from initiating Apple Pay while the app is in the
foreground.
Key: com.apple.developer.passkit.pass-presentation-suppression
com.apple.developer.device-information.user-assigned-device-name
The entitlement for accessing the user-assigned device name instead of a generic device
name.
Push to Talk Entitlement
com.apple.developer.severe-vehicular-crash-event
The entitlement for accessing Crash Detection events.
com.apple.developer.secure-element-credential
A Boolean value that indicates whether your app can use the SecureElementCredential
framework.
com.apple.developer.secure-element-credential.default-contactless-app
A Boolean value that indicates whether your app that uses the SecureElementCredential
framework can become the default contactless app.
Security entitlements
Key-value pairs that grant an executable access to secure resources, or enable hardening
checks.
PassKit
Privacy
Push to Talk
SafetyKit
SecureElementCredential
Security


## Page 16

App Sandbox
Restrict access to system resources and user data in macOS apps to contain damage if an
app becomes compromised.
Hardened Runtime
Manage security protections and resource access for your macOS apps.
Enabling enhanced security for your app
Detect out-of-bounds memory access, use of freed memory, and other potential
vulnerabilities.
com.apple.developer.sensitivecontentanalysis.client
A code-signing entitlement that enables an app to detect nudity in images and video.
com.apple.developer.sensorkit.reader.allow
The necessary entitlement to access sensor data that’s required by your app’s preapproved
research study.
Siri Entitlement
A Boolean value that indicates whether the app handles Siri requests.
Key: com.apple.developer.siri
com.apple.developer.storekit.custom-purchase-link.allowed-regions
An entitlement that enables a qualifying app to offer external purchases within app or at a
website, in specific regions.
Key: com.apple.developer.storekit.custom-purchase-link.allowed-regions
com.apple.developer.storekit.external-link.account
A Boolean value that indicates whether your app can link to an external website for account
creation or management.
com.apple.developer.storekit.external-purchase
A Boolean value that indicates whether your app can offer external purchases.
Sensitive Content Analysis
Sensors
Siri
StoreKit


## Page 17

com.apple.developer.storekit.external-purchase-link
A Boolean value that indicates whether your app can include a link that directs people to a
website to make an external purchase.
com.apple.developer.storekit.external-purchase-link-streaming
An entitlement that grants a qualifying music-streaming app the ability to communicate and
promote offers.
DriverKit
Develop device drivers in macOS and iPadOS.
System Extensions
Extend the capabilities of macOS from user space.
Default Carrier Messaging App
A Boolean value that indicates whether the app can use the TelephonyMessagingKit
framework to serve as the default carrier messaging app.
Key: com.apple.developer.carrier-messaging-app
Translation
A Boolean value that indicates whether an app can be the default translation app on
someone’s device.
Key: com.apple.developer.translation-app
User Management Entitlement
The entitlement for distinguishing between multiple user accounts on Apple TV.
Key: com.apple.developer.user-management
com.apple.developer.video-subscriber-single-sign-on
A Boolean value that indicates whether your app can use the TV Provider Authentication
service.
com.apple.smoot.subscriptionservice
System
TelephonyMessagingKit
Translation
TV


## Page 18

A Boolean value that indicates whether your app meets the requirements of the video-partne
program.
Low-Latency Streaming
A Boolean value indicating whether your app may use low-latency wireless networking.
Key: com.apple.developer.low-latency-streaming
Pass Type IDs Entitlement
A list of identifiers that specify pass types that your app can access in Wallet.
Key: com.apple.developer.pass-type-identifiers
Merchant IDs Entitlement
A list of merchant IDs your app uses for Apple Pay support.
Key: com.apple.developer.in-app-payments
com.apple.developer.in-app-identity-presentment
An entitlement that verifies age or identity.
com.apple.developer.in-app-identity-presentment.merchant-identifiers
An entitlement for the merchant identifier associated with the in-app identity presentment
entitlement.
ID Verifier - Display Only
ID Verifier - Data Transfer
WeatherKit Entitlement
A Boolean value that indicates whether the app may use WeatherKit.
Key: com.apple.developer.weatherkit
com.apple.developer.web-browser
An entitlement that indicates whether the app can act as the user’s default web browser.
com.apple.developer.web-browser.public-key-credential
Vision
Wallet
WeatherKit
Web browsers


## Page 19

An entitlement that lets your app make registration and assertion requests for passkeys and
security keys for any relying party identifier.
com.apple.developer.browser.app-installation
An entitlement that enables a browser to install alternative distribution apps from a website.
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
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
Key: com.apple.developer.nfc.readersession.formats
ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
Key: com.apple.developer.nfc.readersession.iso7816.select-identifiers
Wireless interfaces


## Page 20

com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.
Wireless Insights Service Predictions
A Boolean value that indicates whether the app can use the WirelessInsights framework to
obtain wireless service predictions.
Key: com.apple.developer.wireless-insights.service-predictions
Maps Entitlement
A Boolean value that indicates whether the app may provide directions beyond what Maps
supports, such as subway routes, hiking trails, and bike paths.
Key: com.apple.developer.maps
Deprecated
Inter-App Audio Entitlement
A Boolean value that indicates whether the app may exchange audio with other Inter-App
Audio-enabled apps.
Key: inter-app-audio
Deprecated
All files entitlement
A Boolean value that indicates whether the app may have access to all files.
Key: com.apple.security.files.all
Deprecated
Persistent Content Capture
A Boolean value that indicates whether a Virtual Network Computing (VNC) app needs
persistent access to screen capture.
Wireless insights
Deprecated entitlements
ScreenCaptureKit


## Page 21

Key: com.apple.developer.persistent-content-capture
com.apple.developer.wifi-aware
The entitlement the system requires for an app to use the Wi-Fi Aware framework.
com.apple.developer.wifi-infrastructure
The entitlement the system requires for an app to use the Wi-Fi Infrastructure framework.
Key: com.apple.developer.wifi-infrastructure
Information Property List
A resource containing key-value pairs that identify and configure a bundle.
Privacy manifest files
Describe the data your app or third-party SDK collects and the required reasons APIs it uses
Wi-Fi Aware
Wi-Fi Infrastructure
See Also
Property Lists


