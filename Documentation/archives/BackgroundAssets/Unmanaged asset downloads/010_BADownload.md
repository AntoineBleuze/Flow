# 010_BADownload.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

An object that represents a remote asset to download.


