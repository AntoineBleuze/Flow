# 007_Geometry Adjustment Filters.pdf

## Page 1

class func bicubicScaleTransform() -> any CIFilter & CIBicubicScale
Transform
Produces a high-quality scaled version of an image.
class func edgePreserveUpsample() -> any CIFilter & CIEdgePreserve
Upsample
Creates a high-quality upscaled image.
class func keystoneCorrectionCombined() -> any CIFilter & CIKeystone
CorrectionCombined
Adjusts the image vertically and horizontally to remove distortion.
class func keystoneCorrectionHorizontal() -> any CIFilter & CIKeystone
CorrectionHorizontal
Horizontally adjusts an image to remove distortion.
class func keystoneCorrectionVertical() -> any CIFilter & CIKeystone
CorrectionVertical
Vertically adjusts an image to remove distortion.
class func lanczosScaleTransform() -> any CIFilter & CILanczosScale
Transform
Creates a high-quality, scaled version of a source image.
Topics
Filters
Core Image / Geometry Adjustment Filters
API Collection
Geometry Adjustment Filters
Translate, scale, and rotate images in 2D and 3D.


## Page 2

class func perspectiveCorrection() -> any CIFilter & CIPerspective
Correction
Transforms an image’s perspective.
class func perspectiveRotate() -> any CIFilter & CIPerspectiveRotate
Rotates an image in a 3D space.
class func perspectiveTransform() -> any CIFilter & CIPerspective
Transform
Alters an image’s geometry to adjust the perspective.
class func perspectiveTransformWithExtent() -> any CIFilter &
CIPerspectiveTransformWithExtent
Alters an image’s geometry to adjust the perspective while applying constraints.
class func straighten() -> any CIFilter & CIStraighten
Rotates and crops an image.
protocol CIBicubicScaleTransform
The properties you use to configure a bicubic scale transform filter.
protocol CIEdgePreserveUpsample
The properties you use to configure an edge preserve upsample filter.
protocol CIFourCoordinateGeometryFilter
The properties you use to configure a geometry adjustment filters that requires four
coordinates.
protocol CIKeystoneCorrectionCombined
The properties you use to configure a keystone correction combined filter.
protocol CIKeystoneCorrectionHorizontal
The properties you use to configure a keystone correction horizontal filter.
protocol CIKeystoneCorrectionVertical
The properties you use to configure a keystone correction vertical filter.
protocol CILanczosScaleTransform
The properties you use to configure a Lanczos scale transform filter.
protocol CIPerspectiveCorrection
Protocols


## Page 3

The properties you use to configure a perspective correction filter.
protocol CIPerspectiveRotate
The properties you use to configure a perspective rotate filter.
protocol CIPerspectiveTransform
The properties you use to configure a perspective transform filter.
protocol CIPerspectiveTransformWithExtent
The properties you use to configure a perspective transform with extent filter.
protocol CIStraighten
The properties you use to configure a straighten filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
Color Adjustment Filters
Apply color transformations, including exposure, hue, and tint adjustments.
Color Effect Filters
Apply color effects, including photo effects, dithering, and color maps.
Composite Operations
Composite images by using a range of blend modes and compositing operators.
Convolution Filters
Produce effects such as blurring, sharpening, edge detection, translation, and embossing.
Distortion Filters
Apply distortion to images.
Generator Filters
Generate barcode, geometric, and special-effect images.
See Also
Filter Catalog


## Page 4

Gradient Filters
Generate linear and radial gradients.
Halftone Effect Filters
Simulate monochrome and CMYK halftone screens.
Reduction Filters
Create statistical information about an image.
Sharpening Filters
Apply sharpening to images.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


