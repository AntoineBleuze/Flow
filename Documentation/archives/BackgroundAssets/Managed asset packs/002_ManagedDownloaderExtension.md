# 002_ManagedDownloaderExtension.pdf

## Page 1

The protocol provides default implementations for all of the inherited BADownloaderExtensio
requirements.
Warning
Don’t implement any of the inherited BADownloaderExtension requirements aside from,
optionally, backgroundDownload(_:didReceive:).
func shouldDownload(AssetPack) -> Bool
Determines whether to download an asset pack.
Required Default implementation provided.
Overview
Topics
Downloading assets
Background Assets / ManagedDownloaderExtension
Protocol
ManagedDownloaderExtension
An app extension that uses the system implementation to schedule asset-pack
downloads automatically.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

AppExtension, BADownloaderExtension
struct AssetPack
An archive of assets that the system downloads together.
actor AssetPackManager
An actor that manages asset packs.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
Relationships
Inherits From
See Also
Managed asset packs


