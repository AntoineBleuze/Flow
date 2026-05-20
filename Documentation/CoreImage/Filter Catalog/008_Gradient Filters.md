# 008_Gradient Filters.pdf

## Page 1

class func gaussianGradient() -> any CIFilter & CIGaussianGradient
Generates a gradient that varies from one color to another using a Gaussian distribution.
class func hueSaturationValueGradient() -> any CIFilter & CIHue
SaturationValueGradient
Generates a gradient representing a specified color space.
class func linearGradient() -> any CIFilter & CILinearGradient
Generates a color gradient that varies along a linear axis between two defined endpoints.
class func radialGradient() -> any CIFilter & CIRadialGradient
Generates a gradient that varies radially between two circles having the same center.
class func smoothLinearGradient() -> any CIFilter & CISmoothLinear
Gradient
Generates a gradient that blends colors along a linear axis between two defined endpoints.
protocol CIGaussianGradient
The properties you use to configure a Gaussian gradient filter.
protocol CIHueSaturationValueGradient
The properties you use to configure a hue-saturation-value gradient filter.
Topics
Filters
Protocols
Core Image / Gradient Filters
API Collection
Gradient Filters
Generate linear and radial gradients.


## Page 2

protocol CILinearGradient
The properties you use to configure a linear gradient filter.
protocol CIRadialGradient
The properties you use to configure a radial gradient filter.
protocol CISmoothLinearGradient
The properties you use to configure a smooth linear gradient filter.
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
Geometry Adjustment Filters
Translate, scale, and rotate images in 2D and 3D.
Halftone Effect Filters
Simulate monochrome and CMYK halftone screens.
See Also
Filter Catalog


## Page 3

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


