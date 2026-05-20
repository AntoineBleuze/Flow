# 001_kCVImageBufferDisplayMaskRectangleStereoLeftKey.pdf

## Page 1

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


