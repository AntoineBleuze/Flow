# 007_BADownloaderExtension.pdf

## Page 1

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


## Page 2

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


## Page 3

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


