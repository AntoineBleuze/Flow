# Unmanaged asset downloads.pdf

## Page 1

To opt out of Managed Background Assets, add a Self-Hosted, Unmanaged extension target to
your project, configure the App Groups capability for both the app and extension target, and add
some Background Asset keys to the app’s information property list. Then the system notifies your
extension when system events occur so that your extension can initiate downloads.
Note
For information about Apple-Hosted Background Assets, see Downloading Apple-hosted asset
packs.
The system launches the extension during the first install and subsequent updates, before a pers
launches the app, and periodically in the background when the app isn’t running. The sequence o
events is:
1. A person installs or updates your app on the device.
2. The system prevents the app from launching and begins downloading your manifest file using
the URL you provide.
3. During the manifest download, the system reports progress to the App Store.
4. When the download completes, the system launches your app extension, sending it a content
request with the location of the manifest file on disk.
5. The extension uses the manifest file, which should contains the asset URLs and file sizes, to
return a set of download requests to the system.
Overview
Background Assets / Configuring an unmanaged Background Assets project
Article
Configuring an unmanaged Background
Assets project
Manage and download individual assets yourself by configuring your app and
extension targets.


## Page 2

6. The system pauses, or terminates, the extension and begins the downloads.
7. When the downloads complete, the system notifies the extension and allows the app to launch
The flow for periodic content requests is identical to the app install and updates, except the syste
determines when periodic events occur, depending on a person’s usage and their system settings
For example, the system factors in whether a person enables the Low Power Mode and Backgrou
App Refresh settings.
Note
It’s your responsibility to create manifest files for your self-hosted, unmanaged assets (using
your format of choice) that your code parses to get the URLs and file sizes to the system.
Choose New > Target, select the Background Download template under Application Extension, an
click Next. In the dialog, enter a product name, choose Self-Hosted, Unmanaged as the extension
type, and click Finish. In the next dialog, click Activate to use the extension scheme Xcode create
If you don’t have an Xcode project for your app, first create one from an Application template und
the platform you support, such as iOS or macOS. For more information, see Creating an Xcode
project for an app.
Add your app and extension targets to the same app group so that they can communicate and
share data.
Add the App Groups capability to both your app and extension target. For macOS apps, also add
the App Sandbox capability to both targets. For more information, see Adding capabilities to your
app.
Then, add both targets to the same app group. In the project editor, select the app target, and the
add a unique ID for the group under App Groups on the Signing & Capabilities pane. Xcode
automatically selects the new group ID. Select the extension target, then go to App Groups, click
Refresh, and select the same group ID.
The app and extension are now in the same app group and can share the asset files. For more
information on configuring app groups, and additional steps for macOS apps, see Configuring app
groups.
Add a Self-Hosted, Unmanaged extension to your project
Add the App Groups capability
Add required information property list keys


## Page 3

Configure Background Assets for your app target by setting information property list keys. In the
project editor, select the app target and click the Info tab. Then, add the following keys to the
information property list file:
BAManifestURL
Set this key to the URL for your manifest file. You provide the manifest file that contains the
URLs and file sizes for the assets you want to download. After installing your app on a device
the system uses the BAManifestURL key to download the manifest file before it launches
your extension.
BAInitialDownloadRestrictions
Use this dictionary to provide the constraints on your downloads that the system uses after it
installs your app on the device. Be as accurate as possible when setting these dictionary key
BADownloadAllowance
Set this key to the upper bounds of the download size of nonessential asset files
combined, not individual files, in bytes. If you compress the files, use the compressed file
sizes that the system downloads, not the uncompressed file sizes.
BADownloadDomainAllowList
Set this key to the domain names that you want the extension to download assets from in
DNS format. To use a wildcard domain name, prefix the string with an asterisk (*). For
example, the *.example.com wildcard matches assets.example.com and
download.example.com.
BAEssentialDownloadAllowance
Set this key to the upper bounds of the download size of the essential download files on
in bytes that download before the system launches your app. Use the compressed file
sizes, not the uncompressed file sizes.
BAEssentialMaxInstallSize
Set this key to the combined, maximum size of the essential assets only that download befor
the system launches your app. Use the uncompressed size of the files for this value.
BAMaxInstallSize
Set this key to the combined, maximum size of the nonessential assets that download after th
system downloads essential assets. Use the uncompressed size of the files for this value.
For more examples of these information property list keys, see the Downloading essential assets 
the background sample code project. For more information on editing the information property lis
file, see Managing your app’s information property list values.
See Also
Unmanaged asset downloads


## Page 4

Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
protocol BADownloaderExtensionConfiguration
class BAURLDownload
An object that represents a remote asset to download.
class BADownload
An object that represents an in-progress or concluded asset download.


## Page 5

Note
This sample code project is associated with WWDC23 session 10108: What’s new in
Background Assets.
Before you run the sample code project in Xcode:
Configure the WWDC Sessions and WWDC Sessions Background Assets Extension targets to
use your Developer team for signing.
See Assign a project to a team.
Overview
Configure the sample code project
See Also
Unmanaged asset downloads
Background Assets / Downloading essential assets in the background
Sample Code
Downloading essential assets in the
background
Fetch the assets your app requires before its first launch using an app extension
and the Background Assets framework.
Download
iOS 16.4+
iPadOS 16.4+
macOS 13.3+
tvOS 18.4+
visionOS 2.4+
Xcode 15.0+


## Page 6

Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
protocol BADownloaderExtensionConfiguration
class BAURLDownload
An object that represents a remote asset to download.
class BADownload
An object that represents an in-progress or concluded asset download.


## Page 7

Type
String
The manifest file contains information that your extension needs to schedule asset downloads,
such as the names, URLs, and sizes of the assets. The format and content of the manifest file is
your responsibility. The system uses this key to download the manifest file and pass it to your
extension. This key is required to use Background Assets.
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
Details
Discussion
See Also
Background downloads
Bundle Resources / Information Property List / BAManifestURL
Property List Key
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of
assets.
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 8

BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.


## Page 9

Type
Object
This key is required to use Background Assets.
BADownloadAllowance
The combined, maximum size of the initial, non-essential asset download files.
BADownloadDomainAllowList
The permitted list of domains the extension can use when scheduling the initial set of asset
downloads.
BAEssentialDownloadAllowance
The combined, maximum size of the essential asset download files.
Details
Discussion
Topics
Initial download restrictions
Bundle Resources / Information Property List / BAInitialDownloadRestrictions
Property List Key
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after
app installation.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 10

BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
See Also
Background downloads


## Page 11

Type
Integer
Important
The App Store uses this key to show the size of your app on the product page, so provide an
accurate value. If you compress the assets, use the uncompressed size of the files for this
value. Don’t overstate the disk space you require.
This key is required to use Background Assets.
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
Details
Discussion
See Also
Background downloads
Bundle Resources / Information Property List / BAEssentialMaxInstallSize
Property List Key
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads
before it launches your app in bytes.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.4+
visionOS 2.4+


## Page 12

BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.


## Page 13

Type
Integer
Important
The App Store uses this key to show the size of your app on the product page, so provide an
accurate value. If you compress the assets, use the uncompressed size of the files for this
value. Don’t overstate the disk space you require.
This key is required to use Background Assets.
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
Details
Discussion
See Also
Background downloads
Bundle Resources / Information Property List / BAMaxInstallSize
Property List Key
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 14

BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.


## Page 15

Use BADownloadManager to schedule and cancel asset downloads, monitor their progress, and
access the queue of pending downloads. You don’t create instances of this class directly; instead
use the shared property to access the framework’s singleton that it shares between your app an
the app’s extension. Because the download manager is a shared resource, prevent race condition
by using the withExclusiveControl(_:) and withExclusiveControl(beforeDate:
perform:) methods to assume absolute control of the manager before you schedule asset
downloads or manipulate those already in the manager’s queue. To respond to asset download
events and process concluded downloads, create a type that conforms to the BADownload
ManagerDelegate protocol and assign an instance of it to the download manager’s delegate
property.
The following example shows how to create an asset download, acquire exclusive control of the
shared download manager, and then use the manager to schedule the download:
Overview
Background Assets / BADownloadManager
Class
BADownloadManager
An object that manages the queue of scheduled asset downloads.
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 16

class var shared: BADownloadManager
The download manager that both the app and the extension share.
func scheduleDownload(BADownload) throws
Schedules an asset download to execute in the background at a nonspecific time in the futur
func startForegroundDownload(BADownload) throws
Schedules an asset download that executes immediately in the foreground.
func cancel(BADownload) throws
Cancels an asset download.
Topics
Accessing the download manager
Managing downloads


## Page 17

var delegate: (any BADownloadManagerDelegate)?
The download manager’s delegate.
protocol BADownloadManagerDelegate
An interface for reacting to asset download events and processing concluded downloads.
func fetchCurrentDownloads() throws -> [BADownload]
func fetchCurrentDownloads(completionHandler: ([BADownload], (any Error
)?) -> Void)
Fetches the contents of the manager’s download queue.
func withExclusiveControl((Bool, (any Error)?) -> Void)
Attempts to acquire immediate, exclusive access to the download manager.
func withExclusiveControl(beforeDate: Date, perform: (Bool, (any Error
)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Monitoring downloads
Fetching in-progress downloads
Synchronizing manager access
Relationships
Inherits From
Conforms To


## Page 18

NSObjectProtocol
Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
protocol BADownloaderExtensionConfiguration
class BAURLDownload
An object that represents a remote asset to download.
class BADownload
See Also
Unmanaged asset downloads


## Page 19

An object that represents an in-progress or concluded asset download.


## Page 20

func backgroundDownload(BADownload, didReceive: URLAuthentication
Challenge) async -> (URLSession.AuthChallengeDisposition, URLCredential
?)
Required Default implementations provided.
func backgroundDownload(BADownload, finishedWithFileURL: URL)
Required Default implementations provided.
func backgroundDownload(BADownload, failedWithError: any Error)
Required Default implementations provided.
func downloads(for: BAContentRequest, manifestURL: URL, extensionInfo:
BAAppExtensionInfo) -> Set<BADownload>
Required Default implementations provided.
enum BAContentRequest
Topics
Processing downloads
Checking for asset updates
Background Assets / BADownloaderExtension
Protocol
BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset
downloads while your app isn’t running.
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 21

class BAAppExtensionInfo
func extensionWillTerminate()
func extensionWillTerminate()
This method may be called shortly before the extension is terminated.
Required Default implementation provided.
AppExtension
ManagedDownloaderExtension
Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
Reacting to extension events
Instance Methods
Relationships
Inherits From
Inherited By
See Also
Unmanaged asset downloads


## Page 22

BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtensionConfiguration
class BAURLDownload
An object that represents a remote asset to download.
class BADownload
An object that represents an in-progress or concluded asset download.


## Page 23

AppExtensionConfiguration, Sendable, SendableMetatype
Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
Relationships
Inherits From
See Also
Unmanaged asset downloads
Background Assets / BADownloaderExtensionConfiguration
Protocol
BADownloaderExtensionConfiguration
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 24

The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
class BAURLDownload
An object that represents a remote asset to download.
class BADownload
An object that represents an in-progress or concluded asset download.


## Page 25

init(identifier: String, request: URLRequest, essential: Bool, fileSize
Int, applicationGroupIdentifier: String, priority: BADownload.Priority)
convenience init(identifier: String, request: URLRequest, fileSize: Int
applicationGroupIdentifier: String)
convenience init(identifier: String, request: URLRequest, application
GroupIdentifier: String)
Creates a download that uses the specified identifier and App Group.
Deprecated
convenience init(identifier: String, request: URLRequest, application
GroupIdentifier: String, priority: BADownload.Priority)
Creates a prioritized download that uses the specified identifier and App Group.
Deprecated
Topics
Creating a download
Relationships
Background Assets / BAURLDownload
Class
BAURLDownload
An object that represents a remote asset to download.
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 26

BADownload
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
Inherits From
Conforms To
See Also
Unmanaged asset downloads


## Page 27

The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
protocol BADownloaderExtensionConfiguration
class BADownload
An object that represents an in-progress or concluded asset download.


## Page 28

Note
You don’t create instances of this object directly. Instead, use an object that inherits from
BADownload, such as BAURLDownload.
var identifier: String
The app-specific string that uniquely identifies the downloadable asset.
var uniqueIdentifier: String
The system-provided string that uniquely identifies the download object.
var isEssential: Bool
Overview
Topics
Getting the identity
Determining the priority
Background Assets / BADownload
Class
BADownload
An object that represents an in-progress or concluded asset download.
iOS 16.1+
iPadOS 16.1+
Mac Catalyst 16.1+
macOS 13.0+
tvOS 18.4+
visionOS 2.4+


## Page 29

var priority: BADownload.Priority
The download’s execution priority.
struct Priority
A type that determines the execution priority of a scheduled asset download.
var state: BADownload.State
The current state of the download.
enum State
Constants that indicate the state of a download.
func removingEssential() -> Self
NSObject
BAURLDownload
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the current state
Downloading nonessential assets
Relationships
Inherits From
Inherited By
Conforms To


## Page 30

Sendable
SendableMetatype
Configuring an unmanaged Background Assets project
Manage and download individual assets yourself by configuring your app and extension
targets.
Downloading essential assets in the background
Fetch the assets your app requires before its first launch using an app extension and the
Background Assets framework.
BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
class BADownloadManager
An object that manages the queue of scheduled asset downloads.
protocol BADownloaderExtension
An interface for reacting to app life-cycle events and processing concluded asset downloads
while your app isn’t running.
protocol BADownloaderExtensionConfiguration
class BAURLDownload
See Also
Unmanaged asset downloads


## Page 31

An object that represents a remote asset to download.


