# 004_BAHasManagedAssetPacks.pdf

## Page 1

Type
Boolean
Set this key to YES if you want the system to automatically download your asset packs and keep
them up to date in the background.
Then, in your app’s code, manage asset-pack downloads using the AssetPackManager actor. I
your extension code, use the StoreKit StoreDownloaderExtension protocol if you set the
BAUsesAppleHosting key to YES; otherwise, use the Background Assets Managed
DownloaderExtension protocol.
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
BAAppGroupID
Details
Discussion
See Also
Background downloads
Bundle Resources / Information Property List / BAHasManagedAssetPacks
Property List Key
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage
your asset packs.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 16.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

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
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.


