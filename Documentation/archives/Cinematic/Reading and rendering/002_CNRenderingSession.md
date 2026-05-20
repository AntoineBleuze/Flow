# 002_CNRenderingSession.pdf

## Page 1

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


## Page 2

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


## Page 3

An object that enables you to add the appropriate number of tracks for a Cinematic asset.


