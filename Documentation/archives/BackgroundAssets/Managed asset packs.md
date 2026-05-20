# Managed asset packs.pdf

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


## Page 4

The first time that your code refers to the shared manager, Background Assets considers that you
app is opting into automatic system management of your asset packs.
Important
When using the asset-pack manager, make sure that you also adopt the corresponding
managed extension protocol, ManagedDownloaderExtension (for self-hosted asset packs)
or StoreDownloaderExtension from StoreKit (for Apple-hosted asset packs). Not doing
so is a programmer error.
static let shared: AssetPackManager
The shared manager.
Overview
Topics
Getting the shared manager
Tracking downloads
Background Assets / AssetPackManager
Class
AssetPackManager
An actor that manages asset packs.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 5

let statusUpdates: some Sendable & AsyncSequence<AssetPackManager.
DownloadStatusUpdate, Never>
An asynchronous sequence of download-status updates for all asset packs.
func statusUpdates(forAssetPackWithID: String) -> some Sendable & Async
Sequence<AssetPackManager.DownloadStatusUpdate, Never>
Gets an asynchronous sequence of download-status updates for the asset pack with the
specified ID.
enum DownloadStatusUpdate
Statuses of an asset-pack download.
func status(ofAssetPackWithID: String) async throws -> AssetPack.Status
Returns an asynchronous sequence of download-status updates for the specified asset pac
var allAssetPacks: Set<AssetPack>
The asset packs that are available to download.
func assetPack(withID: String) async throws -> AssetPack
Returns the asset pack with the given ID.
func contents(at: FilePath, searchingInAssetPackWithID: String?, option
: Data.ReadingOptions) throws -> Data
Returns the contents of an asset file at the specified relative path.
func descriptor(for: FilePath, searchingInAssetPackWithID: String?)
throws -> FileDescriptor
Opens and returns a file descriptor for an asset file at the specified relative path.
func url(for: FilePath) throws -> URL
Returns a URL for the specified relative path.
func checkForUpdates() async throws -> (updatingIDs: Set<String>,
removedIDs: Set<String>)
Gets the latest asset-pack information from the server, updates outdated asset packs, and
removes obsolete asset packs.
func ensureLocalAvailability(of: AssetPack) async throws
Accessing asset packs
Managing asset packs


## Page 6

Ensures that the specified asset pack be available locally.
func remove(assetPackWithID: String) async throws
Removes the specified asset pack from the device.
Actor, Sendable, SendableMetatype
struct AssetPack
An archive of assets that the system downloads together.
protocol ManagedDownloaderExtension
An app extension that uses the system implementation to schedule asset-pack downloads
automatically.
BAAppGroupID
The app group identifier that you share between your app and the extension that uses asset
packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
Relationships
Conforms To
See Also
Managed asset packs


## Page 7

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


## Page 8

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


## Page 9

Type
String
BAUsesAppleHosting
A Boolean value that indicates whether you use Apple’s service to host your asset packs.
BAHasManagedAssetPacks
A Boolean value that indicates whether you let the system automatically manage your asset
packs.
BAInitialDownloadRestrictions
The restrictions that apply to the set of assets that download immediately after app
installation.
BAMaxInstallSize
The combined, maximum size, in bytes, of the non-essential assets that download
immediately after app installation.
Details
See Also
Background downloads
Bundle Resources / Information Property List / BAAppGroupID
Property List Key
BAAppGroupID
The app group identifier that you share between your app and the extension that
uses asset packs.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 16.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 10

BAManifestURL
The location URL of the app’s manifest file that contains the names and sizes of assets.
BAEssentialMaxInstallSize
The combined, maximum size of the essential assets that the system downloads before it
launches your app in bytes.


## Page 11

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


## Page 12

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


