# 001_AssetPackManager.pdf

## Page 1

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


## Page 2

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


## Page 3

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


