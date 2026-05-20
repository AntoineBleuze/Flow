# Reference.pdf

## Page 1

enum ALAssetOrientation
Constants to indicate the orientation of an asset.
Deprecated
enum ALAuthorizationStatus
Constants to indicate authorization status.
Deprecated
Error Codes
AssetsLibrary-related error codes
Types of Asset
Constants to identify types of asset.
AssetsLibrary Constants
AssetsLibrary Data Types
Topics
Enumerations
See Also
Reference
Assets Library / AssetsLibrary Enumerations
API Collection
AssetsLibrary Enumerations


## Page 2

let ALAssetLibraryDeletedAssetGroupsKey: String
Value is a set of NSURL objects identifying the asset groups that were deleted.
Deprecated
let ALAssetLibraryInsertedAssetGroupsKey: String
Value is a set of NSURL objects identifying the assets that were inserted.
Deprecated
let ALAssetLibraryUpdatedAssetGroupsKey: String
Value is a set of NSURL objects identifying the asset groups that were updated.
Deprecated
let ALAssetLibraryUpdatedAssetsKey: String
Value is a set of NSURL objects identifying the assets that were updated.
Deprecated
let ALAssetPropertyAssetURL: String
The key to retrieve a URL identifier for the asset.
Deprecated
let ALAssetPropertyDate: String
The key to retrieve the creation date of the asset.
Deprecated
let ALAssetPropertyDuration: String
Topics
Constants
Assets Library / AssetsLibrary Constants
API Collection
AssetsLibrary Constants


## Page 3

The key to retrieve the play time duration of a video asset.
Deprecated
let ALAssetPropertyLocation: String
The key to retrieve the location information of the asset.
Deprecated
let ALAssetPropertyOrientation: String
The key to retrieve the orientation of the asset.
Deprecated
let ALAssetPropertyRepresentations: String
The key to retrieve the representations available for a given asset (for example RAW, JPEG).
Deprecated
let ALAssetPropertyType: String
A key to retrieve the type of the asset.
Deprecated
let ALAssetPropertyURLs: String
The key to retrieve a dictionary that maps asset representations UTIs to URLs that uniquely
identify the asset.
Deprecated
let ALAssetTypePhoto: String
Specifies that the asset is a photo.
Deprecated
let ALAssetTypeUnknown: String
Specifies that the asset’s type cannot be determined.
Deprecated
let ALAssetTypeVideo: String
Specifies that the asset is a video.
Deprecated
let ALAssetsGroupPropertyName: String
Key to retrieve the name of the group.
Deprecated
let ALAssetsGroupPropertyPersistentID: String
Key to retrieve the group’s persistent ID.


## Page 4

Deprecated
let ALAssetsGroupPropertyType: String
Key to retrieve the group type.
Deprecated
let ALAssetsGroupPropertyURL: String
Key to retrieve a URL that uniquely identifies the group.
Deprecated
let ALAssetsLibraryErrorDomain: String
Constant used by NSError to distinguish errors belonging to the AssetsLibrary domain.
Deprecated
let ALErrorInvalidProperty: String
Value returned by value(forProperty:) if the property you tried to access is invalid.
Deprecated
AssetsLibrary Enumerations
AssetsLibrary Data Types
See Also
Reference


## Page 5

typealias ALAssetsGroupEnumerationResultsBlock
Signature for the block executed during enumeration of assets.
Deprecated
typealias ALAssetsGroupType
A bitfield to identify types of asset.
Deprecated
typealias ALAssetsLibraryAccessFailureBlock
Signature for the block executed if the user does not grant access to the caller to access the
data managed by the framework.
Deprecated
typealias ALAssetsLibraryAssetForURLResultBlock
Signature for the block executed if the user has granted access to the caller to access the
data managed by the framework in asset(for:resultBlock:failureBlock:).
Deprecated
typealias ALAssetsLibraryGroupResultBlock
Signature for the block executed if the user grants access to the caller to access the data
managed by the framework..
Deprecated
typealias ALAssetsLibraryGroupsEnumerationResultsBlock
Topics
Data Types
Assets Library / AssetsLibrary Data Types
API Collection
AssetsLibrary Data Types


## Page 6

Signature for the block executed when a match is found during enumeration using
enumerateGroups(withTypes:using:failureBlock:).
Deprecated
typealias ALAssetsLibraryWriteImageCompletionBlock
Signature for the block executed when writeImage(toSavedPhotosAlbum:
orientation:completionBlock:) completes.
Deprecated
typealias ALAssetsLibraryWriteVideoCompletionBlock
Signature for the block executed when writeVideoAtPath(toSavedPhotosAlbum:
completionBlock:) completes.
Deprecated
AssetsLibrary Enumerations
AssetsLibrary Constants
See Also
Reference


