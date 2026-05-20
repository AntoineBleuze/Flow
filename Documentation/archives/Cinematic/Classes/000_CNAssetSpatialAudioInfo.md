# 000_CNAssetSpatialAudioInfo.pdf

## Page 1

init(asset: AVAsset) async throws
Initializes an instance of CNAssetAudioInfo for an AVAsset object asynchronously if it
meets all requirements. .
var defaultEffectIntensity: Float32
default effect intensity value as provided by the system. Supported range is [0.0-1.0]
var defaultRenderingStyle: CNSpatialAudioRenderingStyle
default rendering style as provided by the system
var defaultSpatialAudioTrack: AVAssetTrack
default AVAssetTrack containing Spatial Audio
var spatialAudioMixMetadata: Data
The result of audio analysis during recording which contains metadata necessary to properly
configure the Audio Mix feature during playback or editing. Can be used with AUAudioUnit
instances that support AudioUnitPropertyID kProperty_SpatialAudioMixMetadata
Topics
Initializers
Instance Properties
Cinematic / CNAssetSpatialAudioInfo
Class
CNAssetSpatialAudioInfo
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+


## Page 2

func assetReaderOutputSettings(for: CNSpatialAudioContentType) ->
Dictionary<String, Any>
Returns a dictionary of settings and the source track that should be used to fetch LPCM
samples from this track with the effect applied
func assetWriterInputSettings(for: CNSpatialAudioContentType) ->
Dictionary<String, Any>
Returns a dictionary of settings that should be used to encode LPCM samples using AVAsse
WriterInput
func audioMix(effectIntensity: Float32, renderingStyle: CNSpatialAudio
RenderingStyle) -> AVAudioMix
Returns an instance of AVAudioMix encapsulating all spatial audio related data with
specified effect intesnsity and rendering style.
static var isSupported: Bool
Indicates whether the current device supports Audio Mix
class func assetContainsSpatialAudio(asset: AVAsset) async -> Bool
Check if asset meets all the requirements to operate with Spatial Audio and its accompanyin
effects
class func checkIfContainsSpatialAudio(asset: AVAsset, completionHandle
: (Bool) -> Void)
Check if asset meets all the requirements to operate with Spatial Audio and its accompanyin
effects
Instance Methods
Type Properties
Type Methods


