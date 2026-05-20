# 001_Downloading essential assets in the background.pdf

## Page 1

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


## Page 2

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


