# 000_AssetPack.pdf

## Page 1

Downloading Apple-hosted asset packs
An instance of this structure can be invalidated when the asset pack that it represents is updated
on the server.
let id: String
A unique ID for the asset pack.
let version: Int
The asset pack’s version number.
Mentioned in
Overview
Topics
Identifying assets
Accessing asset details
Background Assets / AssetPack
Structure
AssetPack
An archive of assets that the system downloads together.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

struct Status
The status of an asset pack.
let userInfo: Data?
JSON-encoded custom information that’s associated with the asset pack.
func download(for: BAContentRequest?) -> BADownload
Creates a download object for the asset pack that you schedule using a download manager.
let downloadSize: Int
The size of the download file containing the asset pack in bytes.
CustomStringConvertible
DecodableWithConfiguration
Encodable
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
actor AssetPackManager
An actor that manages asset packs.
protocol ManagedDownloaderExtension
Downloading assets
Relationships
Conforms To
See Also
Managed asset packs


## Page 3

An app extension that uses the system implementation to schedule asset-pack downloads
automatically.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.


