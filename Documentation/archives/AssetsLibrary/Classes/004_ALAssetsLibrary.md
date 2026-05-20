# 004_ALAssetsLibrary.pdf

## Page 1

Deprecated
Use PHPhotoLibrary from the Photos framework instead
Important
The Assets Library framework is deprecated as of iOS 9.0. Instead, use the Photos framework
instead, which in iOS 8.0 and later provides more features and better performance for working
with a user’s photo library. For more information, see Photos.
In the Photos framework, the PHPhotoLibrary class manages access to and changes in the
photo library, and class methods on the PHAsset and PHCollection classes and related
classes provide functionality for finding photo and video assets.
The library includes those that are in the Saved Photos album, those coming from iTunes, and
those that were directly imported into the device. You use it to retrieve the list of all asset groups
and to save images and videos into the Saved Photos album.
You create an instance of ALAssetsLibrary using alloc and init:
Overview
Assets Library / ALAssetsLibrary Deprecated
Class
ALAssetsLibrary Deprecated
An instance of ALAssetsLibrary provides access to the videos and photos th
are under the control of the Photos application.


## Page 2

The lifetimes of objects you get back from a library instance are tied to the lifetime of the library
instance.
Many of the methods declared by ALAssetsLibrary take blocks for failure and success as
arguments. These methods are all asynchronous because the user may need to be asked to grant
access to the data.
class func authorizationStatus() -> ALAuthorizationStatus
Returns photo data authorization status for this application.
class func disableSharedPhotoStreamsSupport()
Disables shared photo streams notifications and asset retrieval.
func asset(for: URL!, resultBlock: ALAssetsLibraryAssetForURLResultBloc
!, failureBlock: ALAssetsLibraryAccessFailureBlock!)
Invokes a given block passing as a parameter an asset identified by a specified file URL.
func enumerateGroups(withTypes: ALAssetsGroupType, using: ALAssets
LibraryGroupsEnumerationResultsBlock!, failureBlock: ALAssetsLibrary
AccessFailureBlock!)
Invokes a given block passing as a parameter each of the asset groups that match the given
asset group type.
func writeVideoAtPath(toSavedPhotosAlbum: URL!, completionBlock: ((URL?
(any Error)?) -> Void)!)
Saves a video identified by a given URL to the Saved Photos album.
func videoAtPathIs(compatibleWithSavedPhotosAlbum: URL!) -> Bool
Topics
Accessing Assets
Managing Notifications
Finding Assets
Enumerating Assets
Saving Assets


## Page 3

Returns a Boolean value that indicates whether a video identified by a given URL is compatib
with the Saved Photos album.
func writeImage(toSavedPhotosAlbum: CGImage!, orientation: ALAsset
Orientation, completionBlock: ((URL?, (any Error)?) -> Void)!)
Saves a given image to the Saved Photos album.
func writeImageData(toSavedPhotosAlbum: Data!, metadata: [AnyHashable :
Any]!, completionBlock: ((URL?, (any Error)?) -> Void)!)
Writes given image data and metadata to the Photos Album.
func writeImage(toSavedPhotosAlbum: CGImage!, metadata: [AnyHashable :
Any]!, completionBlock: ((URL?, (any Error)?) -> Void)!)
Writes a given image and metadata to the Photos Album.
func addAssetsGroupAlbum(withName: String!, resultBlock: ALAssetsLibrar
GroupResultBlock!, failureBlock: ALAssetsLibraryAccessFailureBlock!)
Adds a new assets group to the library.
func group(for: URL!, resultBlock: ALAssetsLibraryGroupResultBlock!,
failureBlock: ALAssetsLibraryAccessFailureBlock!)
Returns an assets group in the result block for a URL previously retrieved from an ALAssets
Group object.
typealias ALAssetsGroupType
A bitfield to identify types of asset.
Types of Asset
Constants to identify types of asset.
enum ALAssetOrientation
Constants to indicate the orientation of an asset.
typealias ALAssetsLibraryGroupsEnumerationResultsBlock
Signature for the block executed when a match is found during enumeration using
enumerateGroups(withTypes:using:failureBlock:).
typealias ALAssetsLibraryAssetForURLResultBlock
Managing Asset Groups
Constants


## Page 4

Signature for the block executed if the user has granted access to the caller to access the
data managed by the framework in asset(for:resultBlock:failureBlock:).
typealias ALAssetsLibraryWriteImageCompletionBlock
Signature for the block executed when writeImage(toSavedPhotosAlbum:
orientation:completionBlock:) completes.
typealias ALAssetsLibraryWriteVideoCompletionBlock
Signature for the block executed when writeVideoAtPath(toSavedPhotosAlbum:
completionBlock:) completes.
typealias ALAssetsLibraryAccessFailureBlock
Signature for the block executed if the user does not grant access to the caller to access the
data managed by the framework.
typealias ALAssetsLibraryGroupResultBlock
Signature for the block executed if the user grants access to the caller to access the data
managed by the framework..
enum ALAuthorizationStatus
Constants to indicate authorization status.
Notification Keys
Keys used to get values from the user information dictionary of the ALAssetsLibrary
ChangedNotification notification.
Error Domain
Constant for the AssetsLibrary domain.
Error Codes
AssetsLibrary-related error codes
static let ALAssetsLibraryChanged: NSNotification.Name
Sent when the contents of the assets library have changed from under the app that is using
the data.
Notifications
Relationships


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ALAsset
An ALAsset object represents a photo or a video managed by the Photo application.
Deprecated
class ALAssetRepresentation
An ALAssetRepresentation object encapsulates one of the representations of a given
ALAsset object.
Deprecated
class ALAssetsFilter
ALAssetsFilter encapsulates filtering criteria to be used when retrieving assets from a
group.
Deprecated
class ALAssetsGroup
An ALAssetsGroup object represents an ordered set of the assets managed by the Photos
application. The order of the elements is the same as the user sees in the Photos application
An asset can belong to multiple assets groups.
Deprecated
Inherits From
Conforms To
See Also
Classes


