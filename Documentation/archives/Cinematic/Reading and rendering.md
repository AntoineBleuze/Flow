# Reading and rendering.pdf

## Page 1

init(asset: AVAsset) async throws
Creates a Cinematic object from an asset.
var allCinematicTracks: [AVAssetTrack]
An array of the Cinematic asset tracks.
let asset: AVAsset
The original Cinematic source asset.
var cinematicDisparityTrack: AVAssetTrack
The Cinematic disparity track.
var cinematicMetadataTrack: AVAssetTrack
The Cinematic metadata track used.
var cinematicVideoTrack: AVAssetTrack
Topics
Initializers
Instance Properties
Cinematic / CNAssetInfo
Class
CNAssetInfo
An object that provides Cinematic-specific information about an asset, including
its tracks.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 2

Track used for Cinematic video.
var frameTimingTrack: AVAssetTrack
The track used for Cinematic frame timing.
var naturalSize: CGSize
The video size if rendered at its natural size.
var preferredSize: CGSize
The video size if rendered at its natural size with the preferred transform applied.
var preferredTransform: CGAffineTransform
The preferred transform of the rendered image for display purposes.
var sampleDataTrackIDs: [CMPersistentTrackID]
The source metadata track IDs required to implement the video composition instruction
protocol.
var timeRange: CMTimeRange
The time range over which all Cinematic tracks are valid.
var videoCompositionTrackIDs: [CMPersistentTrackID]
Source video track IDs required to implement the video composition instruction protocol.
var videoCompositionTracks: [AVAssetTrack]
Tracks required to construct the video composition output.
class func isCinematic(asset: AVAsset) async -> Bool
Determines if the asset is Cinematic asynchronously.
CNCompositionInfo
Type Methods
Relationships
Inherited By


## Page 3

class CNCompositionInfo
An object that enables you to add the appropriate number of tracks for a Cinematic asset.
class CNRenderingSession
An object representing the context in which rendering occurs.
See Also
Reading and rendering


## Page 4

func insertTimeRange(CMTimeRange, of: CNAssetInfo, at: CMTime) throws
Inserts a timeRange of Cinematic source asset into the corresponding tracks of a compositio
CNAssetInfo
Topics
Instance Methods
Relationships
Inherits From
See Also
Reading and rendering
Cinematic / CNCompositionInfo
Class
CNCompositionInfo
An object that enables you to add the appropriate number of tracks for a Cinemat
asset.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 5

class CNAssetInfo
An object that provides Cinematic-specific information about an asset, including its tracks.
class CNRenderingSession
An object representing the context in which rendering occurs.


## Page 6

struct Attributes
The rendering session asset attributes.
struct FrameAttributes
Controls the focus distance and aperture of the rendering for the frames.
init(commandQueue: any MTLCommandQueue, sessionAttributes: CNRendering
Session.Attributes, preferredTransform: CGAffineTransform, quality:
CNRenderingQuality)
Intializes an object for a rendering session.
let commandQueue: any MTLCommandQueue
The command queue of a Metal device that creates the command buffer.
let preferredTransform: CGAffineTransform
Topics
Structures
Initializers
Instance Properties
Cinematic / CNRenderingSession
Class
CNRenderingSession
An object representing the context in which rendering occurs.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 7

The preferred transform of the rendered image for display purposes.
let quality: CNRenderingQuality
The quality of rendering desired for a session.
let sessionAttributes: CNRenderingSession.Attributes
Rendering session attributes for a Cinematic asset.
func encodeRender(to: any MTLCommandBuffer, frameAttributes: CNRenderin
Session.FrameAttributes, sourceImage: CVPixelBuffer, sourceDisparity:
CVPixelBuffer, destinationImage: CVPixelBuffer) -> Bool
func encodeRender(to: any MTLCommandBuffer, frameAttributes: CNRenderin
Session.FrameAttributes, sourceImage: CVPixelBuffer, sourceDisparity:
CVPixelBuffer, destinationLuma: any MTLTexture, destinationChroma: any
MTLTexture) -> Bool
func encodeRender(to: any MTLCommandBuffer, frameAttributes: CNRenderin
Session.FrameAttributes, sourceImage: CVPixelBuffer, sourceDisparity:
CVPixelBuffer, destinationRGBA: any MTLTexture) -> Bool
static var destinationPixelFormatTypes: [OSType]
A static number representing the video compositor’s required pixel buffer attributes context
dictionary when implementing video compositing.
static var sourcePixelFormatTypes: [OSType]
The static pixel format types supported for the output destination.
class CNAssetInfo
An object that provides Cinematic-specific information about an asset, including its tracks.
class CNCompositionInfo
Instance Methods
Type Properties
See Also
Reading and rendering


## Page 8

An object that enables you to add the appropriate number of tracks for a Cinematic asset.


