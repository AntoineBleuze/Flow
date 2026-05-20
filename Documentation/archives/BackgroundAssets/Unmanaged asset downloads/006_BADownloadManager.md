# 006_BADownloadManager.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

An object that represents an in-progress or concluded asset download.


