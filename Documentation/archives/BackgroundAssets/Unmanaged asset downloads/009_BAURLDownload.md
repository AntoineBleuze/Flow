# 009_BAURLDownload.pdf

## Page 1

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


## Page 2

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


## Page 3

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


