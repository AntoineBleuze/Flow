# 001_Color Adjustment Filters.pdf

## Page 1

class func colorAbsoluteDifference() -> any CIFilter & CIColorAbsolute
Difference
Calculates the absolute difference between each color component in the input images.
class func colorClamp() -> any CIFilter & CIColorClamp
Alters the colors in an image based on color components.
class func colorControls() -> any CIFilter & CIColorControls
Alters the brightness, contrast, and saturation of an image’s colors.
class func colorMatrix() -> any CIFilter & CIColorMatrix
Alters the colors in an image based on vectors provided.
class func colorPolynomial() -> any CIFilter & CIColorPolynomial
Alters an image’s colors.
class func colorThreshold() -> any CIFilter & CIColorThreshold
Compares the red, green, and blue components of the input image to a threshold and sets
them to 1 or 0.
class func colorThresholdOtsu() -> any CIFilter & CIColorThresholdOtsu
Compares the red, green, and blue components of the input image against a threshold
calculated using Otsu’s algorithm.
class func depthToDisparity() -> any CIFilter & CIDepthToDisparity
Topics
Filters
Core Image / Color Adjustment Filters
API Collection
Color Adjustment Filters
Apply color transformations, including exposure, hue, and tint adjustments.


## Page 2

Converts from an image containing depth data to an image containing disparity data.
class func disparityToDepth() -> any CIFilter & CIDisparityToDepth
Creates depth data from an image containing disparity data.
class func exposureAdjust() -> any CIFilter & CIExposureAdjust
Adjusts an image’s exposure.
class func gammaAdjust() -> any CIFilter & CIGammaAdjust
Alters an image’s transition between black and white.
class func hueAdjust() -> any CIFilter & CIHueAdjust
Modifies an image’s hue.
class func linearToSRGBToneCurve() -> any CIFilter & CILinearToSRGBTone
Curve
Alters an image’s color intensity.
class func sRGBToneCurveToLinear() -> any CIFilter & CISRGBToneCurveTo
Linear
Converts the colors in an image from sRGB to linear.
class func temperatureAndTint() -> any CIFilter & CITemperatureAndTint
Alters an image’s temperature and tint.
class func toneCurve() -> any CIFilter & CIToneCurve
Alters an image’s tone curve according to a series of data points.
class func vibrance() -> any CIFilter & CIVibrance
Adjusts an image’s vibrancy.
class func whitePointAdjust() -> any CIFilter & CIWhitePointAdjust
Adjusts the image’s white-point.
protocol CIColorAbsoluteDifference
protocol CIColorClamp
The properties you use to configure a color clamp filter.
protocol CIColorControls
The properties you use to configure a color controls filter.
Protocols


## Page 3

protocol CIColorMatrix
The properties you use to configure a color matrix filter.
protocol CIColorPolynomial
The properties you use to configure a color polynomial filter.
protocol CIColorThreshold
protocol CIColorThresholdOtsu
protocol CIDepthToDisparity
The properties you use to configure a depth-to-disparity filter.
protocol CIDisparityToDepth
The properties you use to configure a disparity-to-depth filter.
protocol CIExposureAdjust
The properties you use to configure an exposure adjust filter.
protocol CIGammaAdjust
The properties you use to configure a gamma adjust filter.
protocol CIHueAdjust
The properties you use to configure a hue adjust filter.
protocol CILinearToSRGBToneCurve
The properties you use to configure a linear-to-sRGB filter.
protocol CISRGBToneCurveToLinear
The properties you use to configure an sRGB-to-linear filter.
protocol CISystemToneMap
The protocol for the System Tone Map filter.
protocol CITemperatureAndTint
The properties you use to configure a temperature and tint filter.
protocol CIToneCurve
The properties you use to configure a tone curve filter.
protocol CIVibrance
The properties you use to configure a vibrance filter.
protocol CIWhitePointAdjust


## Page 4

The properties you use to configure a white-point adjust filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
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
Gradient Filters
Generate linear and radial gradients.
Halftone Effect Filters
Simulate monochrome and CMYK halftone screens.
Reduction Filters
Create statistical information about an image.
Sharpening Filters
Apply sharpening to images.
See Also
Filter Catalog


## Page 5

Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


