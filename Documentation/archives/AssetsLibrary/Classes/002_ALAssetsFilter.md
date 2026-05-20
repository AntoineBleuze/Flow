# 002_ALAssetsFilter.pdf

## Page 1

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


## Page 2

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


## Page 3

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


