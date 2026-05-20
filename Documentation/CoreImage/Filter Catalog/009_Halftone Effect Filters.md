# 009_Halftone Effect Filters.pdf

## Page 1

class func circularScreen() -> any CIFilter & CICircularScreen
Adds a circular overlay to an image.
class func cmykHalftone() -> any CIFilter & CICMYKHalftone
Adds a series of colorful dots to an image.
class func dotScreen() -> any CIFilter & CIDotScreen
Creates a monochrome image with a series of dots to add detail.
class func hatchedScreen() -> any CIFilter & CIHatchedScreen
Creates a monochrome image with a series of lines to add detail.
class func lineScreen() -> any CIFilter & CILineScreen
Creates a monochrome image with a series of small lines to add detail.
protocol CICircularScreen
The properties you use to configure a circular screen filter.
protocol CICMYKHalftone
The properties you use to configure a CMYK halftone filter.
protocol CIDotScreen
Topics
Filters
Protocols
Core Image / Halftone Effect Filters
API Collection
Halftone Effect Filters
Simulate monochrome and CMYK halftone screens.


## Page 2

The properties you use to configure a dot screen filter.
protocol CIHatchedScreen
The properties you use to configure a hatched screen filter.
protocol CILineScreen
The properties you use to configure a line screen filter.
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
Gradient Filters
Generate linear and radial gradients.
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


