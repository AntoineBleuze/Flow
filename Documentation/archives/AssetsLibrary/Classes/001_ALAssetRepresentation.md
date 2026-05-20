# 001_ALAssetRepresentation.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

An ALAssetsGroup object represents an ordered set of the assets managed by the Photos
application. The order of the elements is the same as the user sees in the Photos application
An asset can belong to multiple assets groups.
Deprecated
class ALAssetsLibrary
An instance of ALAssetsLibrary provides access to the videos and photos that are unde
the control of the Photos application.
Deprecated


