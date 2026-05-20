# Classes.pdf

## Page 1

Deprecated
Use PHAsset from the Photos framework instead
Important
The Assets Library framework is deprecated as of iOS 9.0. Instead, use the Photos framework
instead, which in iOS 8.0 and later provides more features and better performance for working
with a user’s photo library. For more information, see Photos.
In the Photos framework, the PHAsset class provides functionality for fetching and working
with photo and video assets.
Assets can have multiple representations, for example a photo which was captured in RAW and
JPG. Different representations of the same asset may have different dimensions.
Overview
Topics
Assets Library / ALAsset Deprecated
Class
ALAsset Deprecated
An ALAsset object represents a photo or a video managed by the Photo
application.


## Page 2

func value(forProperty: String!) -> Any!
Returns the value for a given property.
var isEditable: Bool
Indicates whether the asset is editable.
var original: ALAsset!
The original version of the asset.
func defaultRepresentation() -> ALAssetRepresentation!
Returns an asset representation object for the default representation.
func representation(forUTI: String!) -> ALAssetRepresentation!
Returns an asset representation object for a given representation UTI.
func thumbnail() -> Unmanaged<CGImage>!
Returns a thumbnail representation of the asset.
func aspectRatioThumbnail() -> Unmanaged<CGImage>!
Returns an aspect ratio thumbnail of the asset.
func setImageData(Data!, metadata: [AnyHashable : Any]!, completionBloc
: ((URL?, (any Error)?) -> Void)!)
Replaces the image data in the receiver with given image data
func setVideoAtPath(URL!, completionBlock: ((URL?, (any Error)?) -> Voi
)!)
Replaces the video data in receiver with the video at a given URL.
func writeModifiedImageData(toSavedPhotosAlbum: Data!, metadata: [Any
Hashable : Any]!, completionBlock: ((URL?, (any Error)?) -> Void)!)
Saves image data to the Saved Photos album.
Asset Properties
Accessing Representations
Setting New Image and Video Data
Saving to the Saved Photos Album


## Page 3

func writeModifiedVideoAtPath(toSavedPhotosAlbum: URL!, completionBlock
((URL?, (any Error)?) -> Void)!)
Saves the video at a specified path to the Saved Photos album.
Property Keys
Constants for the keys for the properties you can get from an asset.
Invalid Property Value
A constant to indicate that a property accessed by value(forProperty:) is invalid.
Asset Types
Constants that specify the type of an asset.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ALAssetRepresentation
Constants
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 4

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
class ALAssetsLibrary
An instance of ALAssetsLibrary provides access to the videos and photos that are unde
the control of the Photos application.
Deprecated


## Page 5

Deprecated
Use PHImageRequestOptions with the PHImageManager from the Photos framework instead
Important
The Assets Library framework is deprecated as of iOS 9.0. Instead, use the Photos framework
instead, which in iOS 8.0 and later provides more features and better performance for working
with a user’s photo library. For more information, see Photos.
In the Photos framework, the PHAsset and PHImageManager classes provide functionality
for fetching an asset’s image or video data.
A given asset in the library may have more than one representation. For example, if a camera
provides RAW and JPEG versions of an image, the resulting asset will have two representations—
one for the RAW file and one for the JPEG file.
Overview
Topics
Assets Library / ALAssetRepresentation Deprecated
Class
ALAssetRepresentation Deprecated
An ALAssetRepresentation object encapsulates one of the representations
of a given ALAsset object.


## Page 6

func cgImage(options: [AnyHashable : Any]!) -> Unmanaged<CGImage>!
Returns a full resolution CGImage of the representation.
func fullResolutionImage() -> Unmanaged<CGImage>!
Returns a CGImage representation of the asset.
func fullScreenImage() -> Unmanaged<CGImage>!
Returns a CGImage of the representation that is appropriate for displaying full screen.
func orientation() -> ALAssetOrientation
Returns the representation’s orientation.
func scale() -> Float
Returns the representation’s scale.
func dimensions() -> CGSize
Returns the representation’s dimensions.
func filename() -> String!
Returns a string representing the filename of the representation on disk.
func size() -> Int64
Returns the size in bytes of the file for the representation.
func getBytes(UnsafeMutablePointer<UInt8>!, fromOffset: Int64, length:
Int, error: NSErrorPointer) -> Int
Copies a specified range of bytes into a given buffer.
func uti() -> String!
Returns the representation’s UTI.
func metadata() -> [AnyHashable : Any]!
Getting Image Representations
Getting Image Attributes
Getting Raw Data
Getting Metadata


## Page 7

Returns a dictionary of dictionaries of metadata for the representation.
func url() -> URL!
Returns a persistent URL uniquely identifying the representation.
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
class ALAssetsFilter
ALAssetsFilter encapsulates filtering criteria to be used when retrieving assets from a
group.
Deprecated
class ALAssetsGroup
Getting an URL
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 8

An ALAssetsGroup object represents an ordered set of the assets managed by the Photos
application. The order of the elements is the same as the user sees in the Photos application
An asset can belong to multiple assets groups.
Deprecated
class ALAssetsLibrary
An instance of ALAssetsLibrary provides access to the videos and photos that are unde
the control of the Photos application.
Deprecated


## Page 9

Deprecated
Use fetchAssetsInAssetCollection:options: on PHAsset and set a mediaType predicate on the
PHFetchOptions from the Photos framework instead
Important
The Assets Library framework is deprecated as of iOS 9.0. Instead, use the Photos framework
instead, which in iOS 8.0 and later provides more features and better performance for working
with a user’s photo library. For more information, see Photos.
In the Photos framework, the PHFetchOptions class provides functionality for filtering
requests for assets or collections.
You use filters with the setAssetsFilter(_:) method in ALAssetsGroup.
Overview
Topics
Assets Library / ALAssetsFilter Deprecated
Class
ALAssetsFilter Deprecated
ALAssetsFilter encapsulates filtering criteria to be used when retrieving
assets from a group.


## Page 10

class func allAssets() -> ALAssetsFilter!
Returns a filter that gets all assets in the assets group.
class func allPhotos() -> ALAssetsFilter!
Returns a filter that gets all photos in the assets group.
class func allVideos() -> ALAssetsFilter!
Returns a filter that gets all videos in the assets group.
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
Creating Filters
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 11

An ALAssetRepresentation object encapsulates one of the representations of a given
ALAsset object.
Deprecated
class ALAssetsGroup
An ALAssetsGroup object represents an ordered set of the assets managed by the Photos
application. The order of the elements is the same as the user sees in the Photos application
An asset can belong to multiple assets groups.
Deprecated
class ALAssetsLibrary
An instance of ALAssetsLibrary provides access to the videos and photos that are unde
the control of the Photos application.
Deprecated


## Page 12

Deprecated
Use PHAssetCollection from the Photos framework instead
Important
The Assets Library framework is deprecated as of iOS 9.0. Instead, use the Photos framework
instead, which in iOS 8.0 and later provides more features and better performance for working
with a user’s photo library. For more information, see Photos.
In the Photos framework, the PHCollection and PHCollectionList classes and their
subclasses provide functionality for working with collections of assets.
Assets groups themselves are synced via iTunes, created to hold the user’s saved photos or
created during camera import. You can indirectly modify the Saved Photos group by saving image
or videos into it using the ALAssetsLibrary class.
Overview
Assets Library / ALAssetsGroup Deprecated
Class
ALAssetsGroup Deprecated
An ALAssetsGroup object represents an ordered set of the assets managed by
the Photos application. The order of the elements is the same as the user sees in
the Photos application. An asset can belong to multiple assets groups.


## Page 13

func enumerateAssets(ALAssetsGroupEnumerationResultsBlock!)
Invokes a given block using each of the assets in the group.
func enumerateAssets(options: NSEnumerationOptions, using: ALAssetsGrou
EnumerationResultsBlock!)
Invokes a given block using each of the assets in the group.
func enumerateAssets(at: IndexSet!, options: NSEnumerationOptions, usin
: ALAssetsGroupEnumerationResultsBlock!)
Invokes a given block using each of the assets in the group at specified indexes.
func add(ALAsset!) -> Bool
Adds an existing asset to the receiver.
var isEditable: Bool
Indicates whether the application can edit the group.
func numberOfAssets() -> Int
Returns the number of assets in the group that match the current filter.
func setAssetsFilter(ALAssetsFilter!)
Sets the filter for the group.
func value(forProperty: String!) -> Any!
Returns the group’s value for a given property.
func posterImage() -> Unmanaged<CGImage>!
Returns the group’s poster image
Topics
Enumerating Assets
Adding Assets
Filtering
Accessing Properties


## Page 14

typealias ALAssetsGroupEnumerationResultsBlock
Signature for the block executed during enumeration of assets.
Group Property Names
Constants for the names of group properties, used by value(forProperty:).
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
Constants
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 15

class ALAssetsFilter
ALAssetsFilter encapsulates filtering criteria to be used when retrieving assets from a
group.
Deprecated
class ALAssetsLibrary
An instance of ALAssetsLibrary provides access to the videos and photos that are unde
the control of the Photos application.
Deprecated


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


