# Configuration Profiles.pdf

## Page 1

Configuration profiles streamline the process of setting up a large number of devices. Custom
calendar and email settings, network settings (like WiFi and VPN settings), certificates, and devic
restrictions, are some of the properties you can configure using configuration profiles.
You have several options for deploying configuration profiles:
Using Apple Configurator 2, available in the App Store.
In an email message.
On a webpage.
Using over-the-air configuration as described in Over-the-Air Profile Delivery and Configuratio
Over the air using a Mobile Device Management server.
Important
Configuration profiles are for enterprise use only. With the exceptions of the APN, VPN, and
WiFi profiles, don’t use configuration profiles with consumer apps.
Configuration profiles are in a property list format, which any XML tool can read and write.
The configuration property list contains the properties listed in the TopLevel object. These
properties describe the profile and the rules for deploying it. Specific configuration values are
stored in an array of payloads in the PayloadContent property.
Overview
Define a Profile
Device Management / Configuring Multiple Devices Using Profiles
Article
Configuring Multiple Devices Using
Profiles
Create and deploy configuration profiles to users within your organization.


## Page 2

Each payload’s contents contain profile-specific keys (see Profile-Specific Payload Keys) and key
that are common to all payloads (see the following list of key definitions).
PayloadType (String)
The payload type, specified on each payload domain’s reference page.
PayloadVersion (Integer)
The version of this specific payload.
PayloadIdentifier (String)
The reverse-DNS-style identifier for the payload. This identifier is usually the same as the To
Level value, with an additional component appended.
PayloadUUID (String)
The globally unique identifier for the payload. The actual content is unimportant, but must be
globally unique. In macOS, use uuidgen to generate UUIDs.
PayloadDisplayName (String)
The human-readable name for the profile payload. The name is displayed on the Detail scree
and doesn’t have to be unique.
PayloadDescription (String)
The human-readable description of this payload. This description is shown on the Detail
screen.
PayloadOrganization (String)
The human-readable string containing the name of the organization that provided the profile
This value doesn’t need to match the organization payload value in the enclosing dictionary.
Encrypting a profile protects its contents from unauthorized access. The encrypted profile can on
be decrypted using a private key previously installed on a device. To encrypt a profile:
1. Remove the PayloadContent array and serialize it as a property list. Note that the top-level
object in this property list is an array, not a dictionary.
2. CMS-encrypt the serialized property list as enveloped data.
3. Serialize the encrypted data in DER (Distinguished Encoding Rules) format.
4. Set the serialized data as the value of the EncryptedPayloadContent key in the profile.
Signing a profile guarantees data integrity. To sign a profile, place the XML property list in a DER-
encoded, CMS Signed Data structure. When replacing a signed configuration profile, if you don’t
sign the replacement using the exact same signing identity, the device rejects the replacement,
unless installing the replacement through MDM or OTA.
Encrypt and Sign a Profile
Example SCEP Configuration Profile


## Page 3

The listing below shows the contents of an example profile, containing a Simple Certificate
Enrollment Protocol (SCEP) payload.


## Page 4

Profile-Specific Payload Keys
Use the appropriate payload for your configuration needs.
See Also
Configuration Profiles


## Page 5

In addition to the standard payload keys (described in Define a Profile) each payload can contain
keys specific to a payload type. These payload specific keys are described in detail, below.
For profiles that use paths, consider them to be case sensitive.
object TopLevel
The top-level payload properties for all profiles.
object CommonPayloadKeys
The properties common to all payloads.
object Accounts
The payload that configures guest accounts.
object CalDAV
The payload that configures a Calendar account.
object CardDAV
Overview
Topics
Top Level
Accounts
Device Management / Profile-Specific Payload Keys
API Collection
Profile-Specific Payload Keys
Use the appropriate payload for your configuration needs.


## Page 6

The payload that configures a Contacts account.
object GoogleAccount
The payload that configures a Google account.
object LDAP
The payload that configures a Lightweight Directory Access Protocol (LDAP) account.
object MobileAccounts
The payload that configures mobile accounts on the device.
object SubscribedCalendars
The payload that configures subscribed calendars.
object AirPlay
The payload that configures AirPlay settings.
object AirPlaySecurity
The payload that configures Apple TV for a particular style of AirPlay security.
object AppLock
The payload that configures a device to run a single app.
object AssociatedDomains
The payload that configures associated domains.
object AutonomousSingleAppMode
The payload that configures Autonomous Single App mode.
object NSExtensionManagement
The payload that configures the extensions that the system allows or disallows to run on the
device.
object AppStore
The payload that configures macOS App Store restrictions.
AirPlay
App Management
App Store


## Page 7

object ConferenceRoomDisplay
The payload that configures Conference Room Display mode for Apple TV.
object TVRemote
The payload that configures the Apple TV remote.
object DirectoryService
The payload that configures an Active Directory (AD) domain.
object ExtensibleSingleSignOn
The payload that configures an app extension that performs single sign-on (SSO).
object ExtensibleSingleSignOnKerberos
The payload that configures an app extension that performs single sign-on with the Kerbero
extension.
object Identification
The payload that configures the names of the account user.
object IdentityPreference
The payload that configures the user’s identity on the device.
object SingleSignOn
The payload that configures single sign-on (SSO).
object ACMECertificate
The payload that configures Automated Certificate Management Environment (ACME)
settings.
object ActiveDirectoryCertificate
The payload that configures Active Directory Certificate settings.
object CertificatePEM
The payload that configures a PEM-formatted certificate.
Apple TV
Authentication
Certificates


## Page 8

object CertificatePKCS1
The payload that configures a PKCS #1-formatted certificate.
object CertificatePKCS12
The payload that configures a PKCS #12-formatted certificate.
object CertificateRoot
The payload that configures a root certificate.
object CertificatePreference
The payload that configures a certificate preference.
object CertificateRevocation
The payload that configures certificate revocation checking.
object CertificateTransparency
The payload that configures certificate transparency enforcement.
object SCEP
The payload that configures Simple Certificate Enrollment Protocol (SCEP) settings.
object 8021XGlobalEthernet
The payload that configures the default fallback global Ethernet interface.
type 8021XFirstActiveEthernet
The payload that configures the first wired, active Ethernet interface.
type 8021XFirstEthernet
The payload that configures the first wired Ethernet interface.
type 8021XSecondActiveEthernet
The payload that configures the second wired, active Ethernet interface.
type 8021XSecondEthernet
The payload that configures the second wired Ethernet interface.
type 8021XThirdActiveEthernet
The payload that configures the third wired, active Ethernet interface.
type 8021XThirdEthernet
The payload that configures the third wired Ethernet interface.
Ethernet


## Page 9

object FDEFileVault
The payload that configures FileVault.
object FDEFileVaultOptions
The payload that configures FileVault options.
object FDERecoveryKeyEscrow
The payload that configures FileVault recovery key escrow.
object LoginItemsManagedItems
The payload that configures a device’s login items.
object LoginWindowLoginItems
The payload that configures login behavior.
object LoginWindow
The payload that configures Login Window behavior.
object LoginWindowScripts
The payload that configures scripts to run at login and logout.
object ServiceManagementManagedLoginItems
This payload that configures managed login items, which auto-enables and auto-allows
matched items.
object ExchangeActiveSync
The payload that configures Exchange ActiveSync accounts.
object ExchangeWebServices
The payload that configures an Exchange Web Services accounts.
object Mail
The payload that configures a Mail account.
Full Disk Encryption
Login
Mail


## Page 10

object EducationConfiguration
The payload that configures the users, groups, and departments within an educational
organization.
object LightsOutManagementLOM
The payload that configures lights-out management (LOM) settings.
object ManagedPreferences
The payload that configures managed preferences.
object MDM
The payload that configures mobile device management (MDM) settings.
object ProfileRemovalPassword
The payload that configures profile removal.
object MediaManagementDiscBurning
The payload that configures disc-burning settings.
object Cellular
The payload that configures cellular settings.
object CellularPrivateNetwork
The payload that provides device info on private network deployments, including geographic
location, preference over Wi-Fi, and network deployment type.
object ContentCaching
The payload that configures the Content Caching service.
object DNSSettings
The payload that configures encrypted DNS settings.
object Domains
The payload that configures the domains under an organization’s management.
Managed Devices
Media Management
Networking


## Page 11

object Firewall
The payload that configures the firewall.
object NetworkUsageRules
The payload that configures network-usage rules.
object Relay
The payload that configures relay settings.
object WiFi
The payload that configures Wi-Fi settings.
object WiFiManagedSettings
The payload that configures managed Wi-Fi settings.
object ParentalControlsApplicationRestrictions
The payload that configures parental controls for apps.
object ParentalControlsContentFilter
The payload that configures the parental control web content filters.
object ParentalControlsDictionary
The payload that configures parental control dictionary restrictions.
object ParentalControlsGameCenter
The payload that configures Game Center parental controls.
object ParentalControlsTimeLimits
The payload that configures parental control time limits.
object GlobalPreferences
The payload to configure global preferences.
object UserPreferences
The payload that configures iCloud password preferences.
Parental Controls
Preferences
Printing


## Page 12

object AirPrint
The payload that configures AirPrint printer discoverability in the user’s printer list.
object Printing
The payload that configures printers.
object PrivacyPreferencesPolicyControl
The payload that configures privacy preferences.
object DNSProxy
The payload that configures DNS proxies.
object GlobalHTTPProxy
The payload that configures a global HTTP proxy.
object NetworkProxyConfiguration
The payload that configures network proxies for a device.
object Restrictions
The payload that configures restrictions on a device.
object Passcode
The payload that configures a passcode policy.
object SecurityPreferences
The payload that configures security preferences.
object SmartCard
The payload that configures a smart card.
Privacy
Proxies
Restrictions
Security
System Configuration


## Page 13

object Declarations
The payload that applies a set of declarations to the device through the Settings app.
object EnergySaver
The payload that configures Energy Saver settings.
object FileProvider
The payload that configures file provider settings.
object Font
The payload that configures fonts.
object LockScreenMessage
The payload that configures a Lock Screen message.
object Screensaver
The payload that configures the screen saver.
object SystemExtensions
The payload that configures system extensions.
object SystemLogging
The payload that configures system logging.
object TimeServer
The payload that configures the time server.
object SystemPolicyControl
The payload that configures the system policy for assessments.
object SystemPolicyKernelExtensions
The payload that configures the kernel extension policies.
object SystemPolicyManaged
The payload that configures the Finder’s contextual menu to bypass the system policy.
object SystemPolicyRule
The payload that configures the system policy.
System Policy
System Updates


## Page 14

object SoftwareUpdate
The payload that configures the software update policy.
object SystemMigration
The payload that configures system migration.
object Accessibility
The payload that configures the accessibility features of the device.
object Desktop
The payload that configures the desktop wallpaper.
object Dock
The payload that configures the Dock.
object Finder
The payload that configures Finder settings.
object HomeScreenLayout
The payload that configures the Home Screen layout.
object ManagedMenuExtras
The payload that configures menu extras.
object Notifications
The payload that configures notifications.
object ScreensaverUser
The payload that configures a user’s screen saver settings.
object SetupAssistant
The payload that configures Setup Assistant settings.
object TimeMachine
The payload that configures Time Machine.
object AppLayerVPN
The payload that configures a per-app VPN.
User Experience
VPN


## Page 15

object AppToAppLayerVPNMapping
The payload that configures per-app VPN settings.
object VPN
The payload that configures a VPN.
object WebClip
The profile that configures web clips on the device.
object WebContentFilter
The payload that configures web content filters.
object Xsan
The payload that configures an Xsan client system.
object XsanPreferences
The payload that configures the Xsan preferences that define the volumes that automatically
mount at startup.
object AIMAccount
The payload that configures an AIM account on the device.
object APN
The payload that configures access point names.
object FDERecoveryKeyRedirection
The payload that configures FileVault recovery key redirection.
object JabberAccount
The payload that configures a Jabber account.
object MacOSServerAccount
The payload that configures a macOS Server account.
object MediaManagementAllowedMedia
Web
Xsan
Deprecated


## Page 16

The payload that configures media management.
object ParentalControlsDashboardWidgetRestrictions
The payload that configures allowed dashboard widgets.
object ParentalControlDictationAndProfanity
The payload that configures parental control for dictation and profanity.
object ShareKit
The payload that configures ShareKit.
object SystemPreferences
The payload that configures the preference panes.
Configuring Multiple Devices Using Profiles
Create and deploy configuration profiles to users within your organization.
See Also
Configuration Profiles


