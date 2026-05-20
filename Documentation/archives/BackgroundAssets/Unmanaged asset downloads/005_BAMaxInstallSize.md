# 005_BAMaxInstallSize.pdf

## Page 1

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


## Page 2

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


