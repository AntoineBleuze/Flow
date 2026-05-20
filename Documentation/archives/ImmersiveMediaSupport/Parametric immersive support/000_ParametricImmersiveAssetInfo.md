# 000_ParametricImmersiveAssetInfo.pdf

## Page 1

struct Error
An error that occurs during the conversion process of the parametric immersive asset.
init(asset: AVURLAsset, computeFormatDescription: Bool) async throws
Creates an instance using the passed asset and computes the format description for
converting the asset to parametric immersive asset, if requested. Use Parametric
ImmersiveAssetInfo.isParametricImmersive to check whether the asset is alread
parametric immersive.
var requiredFormatDescription: CMFormatDescription?
A result format descriptor for overriding a mutable video track that’s used to convert the ass
to parametric immersive asset. Use replaceFormatDescription to replace the format
description on the AVMutableMovieTrack.
Topics
Structures
Initializers
Instance Properties
Immersive Media Support / ParametricImmersiveAssetInfo
Class
ParametricImmersiveAssetInfo
An object that helps convert the original wide field of view video asset to
parametric immersive asset.
macOS 26.0+
visionOS 26.0+


## Page 2

var conversionResult: Result<CMFormatDescription, ParametricImmersive
AssetInfo.Error>?
The result object of the parametric immersive format conversion.
var isAssetConvertible: Bool
A result Boolean value that indicates whether the asset can be converted to parametric
immersive. If opt-out computeFormatDescription in the initializer, this Boolean indicate
whether the asset is convertible.
class func isParametricImmersive(asset: AVURLAsset) async -> Bool
Checks asynchronously whether the asset is already in the parametric immersive format.
Type Methods


