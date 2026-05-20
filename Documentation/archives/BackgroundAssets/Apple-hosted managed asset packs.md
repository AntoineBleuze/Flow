# Apple-hosted managed asset packs.pdf

## Page 1

Type
Boolean
Use this key if you set the BAHasManagedAssetPacks key to YES. Then, if you set this key to
YES, use the StoreKit StoreDownloaderExtension protocol in your extension; otherwise, use
the Background Assets ManagedDownloaderExtension protocol.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
Details
Discussion
See Also
Background downloads
Bundle Resources / Information Property List / BAUsesAppleHosting
Property List Key
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset
packs.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 16.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

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


