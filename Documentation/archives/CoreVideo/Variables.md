# Variables.pdf

## Page 1

Specify the left, width, top, and height metrics relative to a reference raster width and height scal
to the image buffer dimensions.
The value is a dictionary containing these keys for the raster rectangle:
kCVImageBufferDisplayMaskRectangle_ReferenceRasterWidthKey
kCVImageBufferDisplayMaskRectangle_ReferenceRasterHeightKey
kCVImageBufferDisplayMaskRectangle_RectangleLeftKey
kCVImageBufferDisplayMaskRectangle_RectangleWidthKey
kCVImageBufferDisplayMaskRectangle_RectangleTopKey
kCVImageBufferDisplayMaskRectangle_RectangleHeightKey
Discussion
Core Video / kCVImageBufferDisplayMaskRectangleKey
Global Variable
kCVImageBufferDisplayMaskRectangle
Key
Specifies the rectangular display area within the image.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

To address window violations in stereo video, the system supports points insetting the left and rig
edges of the rectangle through additional keys, allowing the description of the extended raster
rectangle.
Value is a dictionary containing these keys for the extended raster rectangle:
kCVImageBufferDisplayMaskRectangle_ReferenceRasterWidthKey
kCVImageBufferDisplayMaskRectangle_ReferenceRasterHeightKey
kCVImageBufferDisplayMaskRectangle_RectangleLeftKey
kCVImageBufferDisplayMaskRectangle_RectangleWidthKey
kCVImageBufferDisplayMaskRectangle_RectangleTopKey
kCVImageBufferDisplayMaskRectangle_RectangleHeightKey
kCVImageBufferDisplayMaskRectangle_LeftEdgePointsKey
kCVImageBufferDisplayMaskRectangle_RightEdgePointsKey
Discussion
Core Video / kCVImageBufferDisplayMaskRectangleStereoLeftKey
Global Variable
kCVImageBufferDisplayMaskRectangle
StereoLeftKey
Specifies the rectangular display area within the left-eye view of stereo images,
using the same keys as kCVImageBufferDisplayMaskRectangleKey.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 3

To address window violations in stereo video, the system supports points insetting the left and rig
edges of the rectangle through additional keys, allowing the description of the extended raster
rectangle.
The value is a dictionary containing these keys for the extended raster rectangle:
kCVImageBufferDisplayMaskRectangle_ReferenceRasterWidthKey
kCVImageBufferDisplayMaskRectangle_ReferenceRasterHeightKey
kCVImageBufferDisplayMaskRectangle_RectangleLeftKey
kCVImageBufferDisplayMaskRectangle_RectangleWidthKey
kCVImageBufferDisplayMaskRectangle_RectangleTopKey
kCVImageBufferDisplayMaskRectangle_RectangleHeightKey
kCVImageBufferDisplayMaskRectangle_LeftEdgePointsKey
kCVImageBufferDisplayMaskRectangle_RightEdgePointsKey
Discussion
Core Video / kCVImageBufferDisplayMaskRectangleStereoRightKey
Global Variable
kCVImageBufferDisplayMaskRectangle
StereoRightKey
Specifies the rectangular display area within the right-eye view of stereo images,
using the same keys as kCVImageBufferDisplayMaskRectangleKey.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 4

Core Video / kCVImageBufferLogTransferFunction_AppleLog2
Global Variable
kCVImageBufferLogTransferFunction
_AppleLog2
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 5

Core Video / kCVImageBufferPostDecodeProcessingFrameMetadataKey
Global Variable
kCVImageBufferPostDecodeProcessing
FrameMetadataKey
macOS 15.0+


## Page 6

Core Video / kCVImageBufferPostDecodeProcessingSequenceMetadataKey
Global Variable
kCVImageBufferPostDecodeProcessing
SequenceMetadataKey
macOS 15.0+


## Page 7

Core Video / kCVImageBufferSceneIlluminationKey
Global Variable
kCVImageBufferSceneIlluminationKey
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 8

Core Video / kCVMetalBufferCacheMaximumBufferAgeKey
Global Variable
kCVMetalBufferCacheMaximumBuffer
AgeKey
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 9

Key sets the IOSurface backed memory allocation for CVPixelBuffer as purgable and volatile.
A purgeable IOSurface is capable of being switched between non-volatile, volatile and empty
states using IOSurfaceSetPurgeable. When in the volatile state, the OS is permitted to instantly
change its state to empty and remove all its memory pages. Clients should set the IOSurfaces to
the non-volatile state while they are in use and the volatile state when their need and contents is
optional/speculative and OK to discard in response to system memory demand. See
IOSurfaceSetPurgeable for more details. This key is only effective for CVPixelBuffers that are
backed by IOSurface.
Discussion
Core Video / kCVPixelBufferIOSurfacePurgeableKey
Global Variable
kCVPixelBufferIOSurfacePurgeableKey
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 26.0+
watchOS 8.0+


## Page 10

Core Video / kCVPixelFormatBitsPerComponent
Global Variable
kCVPixelFormatBitsPerComponent
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 11

Core Video / kCVPixelFormatType_30RGBLE_8A_BiPlanar
Global Variable
kCVPixelFormatType_30RGBLE_8A_Bi
Planar
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 12

Core Video / kCVPixelFormatType_30RGB_r210
Global Variable
kCVPixelFormatType_30RGB_r210
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 13

Core Video / kCVPixelFormatType_96VersatileBayerPacked12
Global Variable
kCVPixelFormatType_96VersatileBayer
Packed12
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 14

Core Video / kCVPixelFormatType_Lossless_30RGBLEPackedWideGamut
Global Variable
kCVPixelFormatType_Lossless
_30RGBLEPackedWideGamut
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 15

Core Video / kCVPixelFormatType_Lossless_30RGBLE_8A_BiPlanar
Global Variable
kCVPixelFormatType_Lossless_30RGBLE
_8A_BiPlanar
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 16

Core Video / kCVPixelFormatType_Lossless_420YpCbCr10PackedBiPlanarFullRange
Global Variable
kCVPixelFormatType_Lossless_420YpCb
Cr10PackedBiPlanarFullRange
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 17

Core Video / kCVPixelFormatType_Lossless_64RGBAHalf
Global Variable
kCVPixelFormatType_Lossless
_64RGBAHalf
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


