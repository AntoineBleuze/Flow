# Declarative Management.pdf

## Page 1

Declarative Device Management, introduced in iOS 15, uses a declarative data model paradigm.
This paradigm allows servers to avoid the common performance and scalability issues typically
associated with serializing commands and polling devices over MDM.
While declarative management is a new paradigm, it’s not a new protocol: the protocol has been
added to the existing MDM protocol to make adoption simpler.
The declarative management data model has three key components: declarations, that support
device functionality, status, used to track changes in device state, and extensibility, allowing
devices and servers to advertise the changes in their capabilities over time.
Declarations are payloads the server defines and synchronizes to the device with the declarative
management protocol. They represent policies the organization wants to enforce on the device,
and other items such as management metadata.
Declarations are a schema-driven data model, serialized as JSON objects. Each declaration has a
common set of keys, each one of them required.
Key
Type
Content
Type
String
The declaration type. A dot-separated sequence of tokens.
Overview
Use declarations to define policies, specify assets, and
store organizational information
Device Management / Leveraging the declarative management data model to scale devices
Article
Leveraging the declarative management
data model to scale devices
Use declarative management to make devices more autonomous and proactive.


## Page 2

Key
Type
Content
Identifier
String
The unique identifier within the set of all declarations sent to a
device. This is typically a UUID string.
Server
Token
String
An identifier for a unique revision of the declaration.
Payload
Dictionary
A data-specific piece of the declaration, containing the keys and
values for the declaration type.
The Type defines the type of the declaration. Standard types have a com.apple. prefix. The ne
component of the type is either activation, asset, configuration, or management. Each
declaration type has its own additional components that group together similar items. For exampl
configurations representing different types of accounts have a com.apple.configuration
.account. prefix.
The Identifier uniquely identifies a single declaration within the set of all declarations sent to 
device. This is typically a UUID value. When synchronizing declarations between server and devic
this value is the primary key used to match the set of declarations sent by the server with the set
the device previously received.
The ServerToken key represents a revision of a specific declaration. For example, a declaration
with Identifier set to A and ServerToken set to 2, is an update to a declaration with
Identifier set to A and ServerToken set to 1. The value of this key could be a UUID or a
simple counter. When any part of the declaration Payload changes, update this value for correct
synchronization to occur.
The combination of Identifier and ServerToken allows the device to determine which
declarations are new, changed, or removed, during a synchronization operation.
The Payload key is an object representing the data pertinent to the declaration type. A formal
schema defines the necessary and optional data for each declaration type. Values can be strings,
numbers, booleans, arrays, or dictionaries, and may be constrained in range, such as numbers 1
through 10, or to a specific set of values like a string enumeration.
Every declaration has an associated active and valid state that the device shares with the
server through the status channel. There are four types of declarations, Configurations, Assets,
Activations, and Management.
Configurations represent the policy applied to a device. For example, accounts, settings and
restrictions, network setup, fonts, and so on. Configurations are similar to MDM’s profile payloads
Use configuration declarations to define the policies


## Page 3

A configuration has an active state which is true if the device is implementing the policy defin
by the configuration, and false otherwise.
A configuration has a valid state which can have 3 values:
valid: The system has checked the configuration and it’s valid.
invalid: The system has checked the configuration and it’s not valid.
unknown: The system hasn’t checked the configuration.
A configuration is valid if it meets the following conditions:
The configuration was successfully synchronized from the server.
The configuration is a valid JSON object conforming to the schema defined by the configuratio
type.
All referenced assets are valid.
The device can apply the policy when the configuration is active.
Assets represent ancillary data needed by configurations. There are two main use cases for asset
Large data: a large item of data, such as an image, a font, or entire font suite. In this case, the
asset’s Payload contains a key with a URL value pointing to the actual data. This allows shifting
the distribution of large data items from the management server to a server more suited to
handling such traffic (for example, a content delivery network). The data for the asset is only
downloaded when needed.
Personal data: user specific data such as a name, email address, passwords for accounts, or
certificates. This takes the per-user customized data out of configurations, and moves it into
smaller, dedicated objects.
Assets have a one-to-many relationship with configurations: one asset may be referenced by man
configurations. The reference takes the form of a specific key in a configuration payload whose
value is the Identifier key value of the asset.
The data for an asset can be independently updated, without needing to update the configuration
that references it. The system can make small, incremental updates to per-user data, or large dat
items, shared across many configurations.
An asset has an active state which is true if at least one active configuration references the
asset, and false otherwise.
An asset has a valid state which can have 3 values:
valid: The system has checked the asset and it’s valid.
Use asset declarations to specify additional data


## Page 4

invalid: The system has checked the asset and it’s not valid.
unknown: The system hasn’t checked the asset.
An asset is valid if it meets the following conditions:
The asset was successfully synchronized from the server.
The asset is a valid JSON object conforming to the schema defined by the asset type.
All referenced asset data is successfully downloaded when the asset is active.
Activations specify the logic that determines how and when, the system applies the policies
defined by configurations to the device. Activations contain a set of configurations that the system
applies atomically to the device, such that the system applies all referenced configurations
together, or none. Therefore all of the configurations, and assets referenced by those
configurations, must be valid in order for the system to apply the activation.
An activation has an active state which is true if the activation will attempt to apply the policie
defined by its configurations, and false otherwise.
An activation has a valid state which can have 3 values:
valid: The system has checked the activation and it’s valid.
invalid: The system has checked the activation and it’s not valid.
unknown: The system hasn’t checked the activation.
An activation is valid if it meets the following conditions:
The activation was successfully synchronized from the server.
The activation is a valid JSON object conforming to the schema defined by the activation type.
Activations have a many-to-many relationship with configurations: one activation can reference
many configurations, and many activations can reference the same configuration.
If at least one activation that references a configuration is active, the system applies the policies
defined by the configuration.
An activation can include a predicate defining an expression that the system evaluates, and the
result used to determine whether the activation should be active or inactive, subject to other rules
governing activations (as described above).
A predicate is a string conforming to Apple’s Predicate Programming Guide. A string value that
doesn’t conform to the predicate syntax is an error, and the activation isn’t activated.
The predicate expression can include references to declarative device management data such as
status items and management properties, that conform to Apple’s Key-Value protocol (see About
Use activation declarations to apply logic to your configurations


## Page 5

Key-Value Coding for more information). Referenced items must appear in the predicate inside of
an extension term to correctly delineate them from other predicate terms and allow use of
characters not typically allowed in predicate tokens.
@status
The key used to reference an entire status item.
@key
The key used to reference a status item object property.
@property
The key used to reference a management property.
This is an example of a predicate that checks whether the device is an iPad:
Management declarations convey management metadata such as information about the
organization managing the device, as well as details about the server’s supported features.
A management declaration has an active state which is always false and not part of the
activation process.
A management declaration has a valid state which can have 3 values:
valid: The system has checked the management declaration and it’s valid.
invalid: The system has checked the management declaration and it’s not valid.
unknown: The system hasn’t checked the management declaration.
A management declaration is valid if it meets the following conditions:
The management declaration was successfully synchronized from the server.
The management declaration is a valid JSON object conforming to the schema defined by the
management declaration type.
Devices report changes in device state back to the server as JSON status items, using a status
report. There are several categories of device states:
Management states - the valid and active states for all declarations on the device, and any erro
details describing why a declaration is invalid or inactive.
Device properties - properties of the device (for example, device model, OS version, etc).
Use management declarations to define organizational data
Use status to report device state


## Page 6

Other properties (accounts, passcode, and MDM installed apps).
A status item contains a status name (similar to a “key path”) and an associated value. A status
name is a string containing a dot-separated sequence of tokens (for example,
device.identifier.serial-number). Each segment of the name defines a key in the overall hierarchic
status dictionary.
Consider the following three status items: device.identifier.serial-number, device
.identifier.udid, and management.push-token. The status reported by the device would
be:
A status item’s value can be a string, number, boolean, null, or array.
Status item arrays have values containing JSON objects with a well-defined schema, with the sam
schema used for all items in an array. The schemas are specific to the type of item the status
represents. Devices report changes to array status items incrementally (see StatusReport for
additional details).
To receive updates for status items as they change, the server must subscribe to each status item
by sending a ManagementStatusSubscriptions declaration to the device. All management
status items (those that begin with the management. name prefix) are automatically reported to
the server, and don’t need to be referenced in a status subscription.
When the status of a device changes or a status subscription declaration becomes active, the
device sends a StatusReport to the server.
The set of capabilities and features supported by declarative management can vary over time as
the system adds, modifies and deprecates items. Devices and servers advertise their capabilities
and features to each other, so they can adopt new behaviors even as the server and device are
independently upgraded, without the need to keep them in lock-step.
Use client and server capabilities to match feature sets


## Page 7

The device advertises the set of declaration types and status items it supports with the Status
ManagementClientCapabilities status item. When the device enables declarative
management, the device sends this status item to the server. Servers need to persist this on a pe
enrollment basis as the set of capabilities might vary by more than just device type or operating
system version. The server shouldn’t send declarations to the device that it hasn’t advertised as
supported.
The server advertises the set of protocol features it supports through the ManagementServer
Capabilities declaration that it sends to the device when it enables declarative management.
the server capabilities change any time after enablement, then the server should use the normal
declaration synchronization process to update the device with the new values.
Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as device
enrollment and un-enrollment and device and user authentication.
Deploying apps with declarative management
Use declarative app configurations to deploy managed apps to devices.
Declarations
The available declarations for device management.
Status Reports
Reports from the device about its current state.
See Also
Declarative Management


## Page 8

The declarations and the status channels of declarative management can co-exist with MDM
commands and profiles, which means you can gradually adopt the new features, without having t
update all MDM work flows at once. For example, a server might just implement status
subscriptions to effectively add a status channel to the MDM protocol without having to adopt all 
declarative management.
Importantly, this integration doesn’t interfere with existing MDM behavior. Declarative manageme
has to be explicitly enabled with a new MDM command, before you can use any of its features.
Without that enablement, the MDM protocol functions exactly as before.
The server enables declarative management by sending a DeclarativeManagementCommand 
the device through the usual MDM command processing flow. This command serves two purpose
It enables the declarative management features.
It signals to the device that the server has updated declarations and the device needs
synchronize the declarations with the server. In this case, the command can include a payload
containing synchronization tokens to allow for an efficient synchronization flow.
Once your MDM has enabled declarative management, it can’t disable it. However, the server can
remove all declarations from the device to effectively disable any declarative management
behavior.
If you unenroll a device, the device removes all declarative management state, including all policie
applied through declarations.
Overview
Enable declarative management
Device Management / Integrating Declarative Management
Article
Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as
device enrollment and un-enrollment and device and user authentication.


## Page 9

Note, that on macOS and Shared iPad, you must send the management commands separately on
the device and user channels to turn on declarative management on each channel. Similarly, each
channel reports declarative management status separately.
Synchronize declarations by following these steps:
1. The server sends an MDM push notification to the device.
2. The device responds to the MDM push in the usual manner by requesting the next MDM
command from the server.
3. The server responds with a DeclarativeManagementCommand that should include the
SynchronizationTokens JSON data.
4. The device checks the DeclarationsToken in the SyncTokens sent in the server’s
command.
5. The device fetches the declarations manifest from the server.
6. The device synchronizes changes.
The next sections describe the synchronization details in steps 4-6 in more detail.
The server maintains a token that represents the current state of the declarations to synchronize
with a particular device. The server must persist this token on a per-device and per-user basis
because declarations may be different for some devices and some users. Whenever the set of
declarations changes (new ones added or existing ones changed or removed), the server must
change the value of the token. The token value is an opaque string that the client uses for
comparisons, so the server is free to use whatever format it prefers, but needs to limit the size to
no more that 256 octets.
The server can send the token to the device as the DeclarationsToken item in the command’s
Data key. The server also sends the token to the device in the server’s declarations manifest
response, along with the data for the set of declarations it applies to.
When the client processes the server’s declarations manifest, it persists the declarations token th
the server sends. The device uses that value to determine whether it needs to update the
declarations manifest. When the device receives a DeclarativeManagementCommand
command, it triggers a synchronization operation that uses the following rules to determine what
steps to take:
If the DeclarativeManagementCommand doesn’t contain a Data key, the device fetches th
current set of synchronization tokens from the server with a Declarative Management
Synchronize declarative management
Check synchronization tokens


## Page 10

tokens Endpoint request. It then uses the DeclarationsToken key extracted from the
server’s response.
If the DeclarativeManagementCommand contains a Data key, the device extracts the value
of the DeclarationsToken.
The device compares the new declaration token to the last declaration token received from the
server:
If the new and existing tokens match, the device assumes the declarations on the server
identical since the last synchronization, and the current synchronization operation ends.
If the new and existing tokens don’t match, the device continues the synchronization operation
by fetching the declarations manifest from the server with a Declarative Management
declaration-items Endpoint request. The declaration manifest is a JSON object with key
for each declaration type, whose values are an array of declaration item descriptors. Those
descriptors contain the Identifier and ServerToken values for each declaration for the device to
synchronize.
The device uses the declaration manifest’s declaration items to synchronize its state with the
server using the following logic:
If the declaration manifest contains a declaration item with an Identifier that doesn’t match
the Identifier of any declaration present on the device, the device considers that to be a
new declaration, and fetches it with a Declarative Management declaration Endpoint
request.
If the declaration manifest contains a declaration item with an Identifier that does match th
Identifier of a declaration present on the device and the ServerToken items don’t match
the device considers that to be an updated declaration, and fetches it with a Declarative
Management declaration Endpoint request.
After processing the entire declaration manifest, if there are declarations present on the device
with an Identifier that isn’t present in the declaration manifest, the device marks those
declarations for removal.
After processing the declaration manifest, and fetching any new or changed declarations, the
device removes all declarations marked for removal, and then updates its state by applying the ne
and changed declarations, and un-applying the removed declarations.
Some asset declarations contain a Reference which in turn contains a DataURL that specifies
the URL where the corresponding asset data resides. The device treats this URL as hosted by the
MDM server and applies normal MDM protocol rules to the request. There are additional keys in th
Synchronize device state
Download asset data


## Page 11

Reference key that the system uses to verify the integrity of the downloaded asset data. The
device procedure for fetching and verifying the data is:
1. The device uses a TLS connection with a client certificate set to the MDM device identity
certificate.
2. The device verifies the TLS connection server cert by evaluating trust with any CheckIn
URLPinningCertificateUUIDs specified in the MDM enrollment profile payload. In this
case, the device honors the PinningRevocationCheckRequired specified in the MDM
enrollment profile payload.
3. The device verifies that the HTTP response Content-Type header specifies a media type tha
matches the value of the ContentType in the Reference of the asset. If the media type
values don’t match, the asset data download fails.
4. The device verifies that the size of the downloaded data in bytes, matches the value of the Siz
in the Reference of the asset. If the sizes don’t match, the asset data download fails.
5. The device verifies that the SHA-256 hash of the downloaded data, matches the value of the
Hash-SHA-256 key in the Reference of the asset. If the hash values don’t match, the asset
data download fails.
The com.apple.configuration.legacy and com.apple.configuration.legacy
.interactive configurations both contain a ProfileURL key that specifies the URL where th
corresponding profile data resides. The device considers this URL hosted by the MDM server and
applies normal MDM protocol rules to the request. In particular:
1. The device uses a TLS connection with a client certificate set to the MDM device identity
certificate.
2. The device verifies the TLS connection server cert by evaluating trust with any CheckIn
URLPinningCertificateUUIDs specified in the MDM enrollment profile payload. In this
case, the device honors the PinningRevocationCheckRequired specified in the MDM
enrollment profile payload.
Leveraging the declarative management data model to scale devices
Use declarative management to make devices more autonomous and proactive.
Deploying apps with declarative management
Use declarative app configurations to deploy managed apps to devices.
Declarations
See Also
Declarative Management


## Page 12

The available declarations for device management.
Status Reports
Reports from the device about its current state.


## Page 13

Device management services can install, manage, update, configure, and remove apps using the
AppManaged configuration. Devices can report managed app status using the StatusApp
ManagedList status item.
If a device management service already manages an app using the Install Application or
Install Enterprise Application commands, it can convert the app to declarative app
management.
In macOS, device management services can install, update, and remove packages using the
Package configuration. They can then manage apps that a package installs using an AppManage
configuration targeting the app. Devices can report package status using the StatusPackage
List status item.
Installing, managing, updating, and removing apps
Use declarative management to handle all aspects of managing apps on devices.
Displaying managed apps and packages
Use a management app to display managed apps and packages to the user.
Configuring managed apps and extensions
Provide managed apps and extensions with app configuration and secrets.
Overview
Topics
Supporting managed apps
Device Management / Deploying apps with declarative management
Deploying apps with declarative
management
Use declarative app configurations to deploy managed apps to devices.


## Page 14

Transferring management of apps to declarative management
Seamlessly transition apps to declarative management without needing to reinstall.
Processing status for managed apps
Process the status that declarative management reports for managed apps.
Installing packages
Use declarative package management to install and remove packages in macOS.
Leveraging the declarative management data model to scale devices
Use declarative management to make devices more autonomous and proactive.
Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as device
enrollment and un-enrollment and device and user authentication.
Declarations
The available declarations for device management.
Status Reports
Reports from the device about its current state.
See Also
Declarative Management


## Page 15

object AccountCalDAV
The declaration to configure a Calendar account.
object AccountCardDAV
The declaration to configure a Contacts account.
object AccountExchange
The declaration to configure an Exchange account.
object AccountGoogle
The declaration to configure a Google account.
object AccountLDAP
The declaration to configure a Lightweight Directory Access Protocol (LDAP) account.
object AccountMail
The declaration to configure a Mail account.
object AccountSubscribedCalendar
The declaration to configure a subscribed calendar.
object AppManaged
The declaration to configure a managed app.
object AudioAccessorySettings
Topics
Configurations
Device Management / Declarations
API Collection
Declarations
The available declarations for device management.


## Page 16

The declaration to configure audio accessory settings.
object DiskManagementSettings
The declaration to configure disk management settings on the device.
object LegacyInteractiveProfile
The declaration to configure an interactive legacy profile.
object LegacyProfile
The declaration to configure a legacy profile.
object ManagementStatusSubscriptions
The declaration to configure status subscriptions.
object ManagementTest
The declaration to test declarative device management.
object MathSettings
The declaration to configure the math and calculator apps.
object Package
The declaration to install a package.
object PasscodeSettings
The declaration to configure passcode policy settings.
object SafariBookmarks
The declaration to configure managed bookmarks in Safari.
object SafariExtensionSettings
The declaration to configure Safari Extensions.
object SafariSettings
The declaration to configure Safari settings.
object ScreenSharingConnection
The declaration to configure a connection to a screen-sharing host.
object ScreenSharingConnectionGroup
The declaration to configure a group of screen-sharing connections.
object ScreenSharingHostSettings
The declaration to configure screen-sharing host settings and restrictions.


## Page 17

object SecurityCertificate
The declaration to add a certificate to the device.
object SecurityIdentity
The declaration to install an identity on the device.
object SecurityPasskeyAttestation
The declaration to configure the device to allow WebAuthn enterprise attestation for certain
passkeys.
object ServicesBackgroundTasks
The declaration to configure background tasks.
object ServicesConfigurationFiles
The managed configuration files for services.
object SoftwareUpdateEnforcementSpecific
A software update enforcement policy for a specific OS release.
object SoftwareUpdateSettings
The declaration to configure software updates.
object WatchEnrollment
The declaration to configure an MDMv1 profile for Apple Watch enrollment.
object ActivationSimple
The declaration to activate a set of configurations.
object AssetCredentialACME
A reference to an ACME identity.
object AssetCredentialCertificate
A reference to a PKCS #1 or PEM encoded certificate.
object AssetCredentialIdentity
A reference to a PKCS #12 password-protected identity.
object AssetCredentialSCEP
Activations
Assets


## Page 18

A reference to a SCEP identity.
object AssetCredentialUserNameAndPassword
A reference to data that describes a credential that represents a user name and password.
object AssetData
A reference to arbitrary data with a specific media type.
object AssetUserIdentity
The user-identity data.
object ACMECredential
An ACME identity that the device generates.
object IdentityCredential
The data for a PKCS #12 password-protected identity.
object SCEPCredential
A SCEP identity that the device generates.
object UserNameAndPasswordCredential
Data that describes a credential that represents a user name and password.
object ManagementOrganizationInformation
The declaration to configure the managing organization’s contact information.
object ManagementProperties
The declaration to configure the properties on the device.
object ManagementServerCapabilities
The declaration to configure the server’s feature set.
object DeclarationBase
Keys common to all declarations used with the Remote Management protocol.
Credentials
Management
Base Declaration


## Page 19

Leveraging the declarative management data model to scale devices
Use declarative management to make devices more autonomous and proactive.
Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as device
enrollment and un-enrollment and device and user authentication.
Deploying apps with declarative management
Use declarative app configurations to deploy managed apps to devices.
Status Reports
Reports from the device about its current state.
See Also
Declarative Management


## Page 20

object StatusReport
object StatusAppManagedList
The device’s declarative managed apps.
object StatusDeviceBatteryHealth
The device’s battery health.
object StatusDeviceModelFamily
A status report of the device’s hardware family.
object StatusDeviceModelIdentifier
A status report of the device’s hardware identifier.
object StatusDeviceModelMarketingName
A status report of the device’s marketing name.
object StatusDeviceModelNumber
A status report of the device’s hardware number.
object StatusDeviceOperatingSystemBuildVersion
A status report of the device’s software build identifier.
object StatusDeviceOperatingSystemFamily
A status report of the device’s operating system family.
Topics
Status Reports and Elements
Device Management / Status Reports
API Collection
Status Reports
Reports from the device about its current state.


## Page 21

object StatusDeviceOperatingSystemSupplementalBuildVersion
A status report of the device’s operating system supplemental build identifier.
object StatusDeviceOperatingSystemSupplementalExtraVersion
A status report of the device’s operating system’s Background Security Improvement
identifier.
object StatusDeviceOperatingSystemVersion
A status report of the device’s operating system version.
object StatusDeviceSerialNumber
A status report of the device’s serial number.
object StatusDeviceUDID
A status report of the device’s UDID.
object StatusDiskManagementFileVaultEnabled
The enabled status of the File Vault.
object StatusManagementClientCapabilities
A status report of the client’s protocol capabilities.
object StatusManagementDeclarations
A status report of the client’s processed declarations.
object StatusDeviceOperatingSystemMarketingName
A status report of the device’s operating system marketing name.
object StatusMDMApp
A status report of the client’s MDM-installed apps.
object StatusPackageList
The client’s declarative packages.
object StatusPasscodeCompliance
A status report of passcode compliance.
object StatusPasscodeIsPresent
A status report of the passcode on the device.
object StatusReason
Provides details about an error for an item in a status report.


## Page 22

object StatusScreenSharingConnectionGroupUnresolvedConnections
Information about connection groups with member connection references that the system
couldn’t resolve.
object StatusSecurityCertificateList
A status report of the client’s managed certificates.
object StatusServicesBackgroundTask
A status report of the device’s background task details.
object StatusSoftwareUpdateBetaEnrollment
A status report of the device’s enrolled beta program.
object StatusSoftwareUpdateDeviceID
A status report of the device’s update device ID.
object StatusSoftwareUpdateFailureReason
A status report of a software update failure reason.
object StatusSoftwareUpdateInstallReason
A status report of the reason for a pending software update on the device.
object StatusSoftwareUpdateInstallState
A status report of the software update install state.
object StatusSoftwareUpdatePendingVersion
A status report of the pending software update version.
object StatusAccountListCalDAV
A status report of the client’s Calendar accounts.
object StatusAccountListCardDAV
A status report of the client’s Contacts accounts.
object StatusAccountListExchange
A status report of the client’s Exchange accounts.
object StatusAccountListGoogle
A status report of the client’s Google accounts.
object StatusAccountListLDAP
Status Account List Elements


## Page 23

A status report of the client’s Lightweight Directory Access Protocol (LDAP) accounts.
object StatusAccountListMailIncoming
A status report of the client’s incoming Mail accounts.
object StatusAccountListMailOutgoing
A status report of the client’s outgoing Mail accounts.
object StatusAccountListSubscribedCalendar
A status report of the client’s subscribed calendars.
object StatusTestArrayValue
A test status item for an array.
object StatusTestBooleanValue
A test status item for a Boolean value.
object StatusTestDictionaryValue
A test status item for a dictionary.
object StatusTestErrorValue
A test status item for an error.
object StatusTestIntegerValue
A test status item for an integer.
object StatusTestRealValue
A test status item for a real value.
object StatusTestStringValue
A test status item for a string.
Leveraging the declarative management data model to scale devices
Use declarative management to make devices more autonomous and proactive.
Status Test Elements
See Also
Declarative Management


## Page 24

Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as device
enrollment and un-enrollment and device and user authentication.
Deploying apps with declarative management
Use declarative app configurations to deploy managed apps to devices.
Declarations
The available declarations for device management.


