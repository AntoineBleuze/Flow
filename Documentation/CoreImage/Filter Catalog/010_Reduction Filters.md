# 010_Reduction Filters.pdf

## Page 1

class func areaAverage() -> any CIFilter & CIAreaAverage
Returns a 1 x 1 pixel image that contains the average color for the region of interest.
class func areaHistogram() -> any CIFilter & CIAreaHistogram
Returns a histogram of a specified area of the image.
class func areaLogarithmicHistogram() -> any CIFilter & CIArea
LogarithmicHistogram
Returns a logarithmic histogram of a specified area of the image.
class func areaMaximum() -> any CIFilter & CIAreaMaximum
Calculates the maximum color components of a specified area of the image.
class func areaMaximumAlpha() -> any CIFilter & CIAreaMaximumAlpha
Finds the pixel with the highest alpha value.
class func areaMinimum() -> any CIFilter & CIAreaMinimum
Calculates the minimum color component values for a specified area of the image.
class func areaMinimumAlpha() -> any CIFilter & CIAreaMinimumAlpha
Calculates the pixel within a specified area that has the smallest alpha value.
class func areaMinMax() -> any CIFilter & CIAreaMinMax
Calculates minimum and maximum color components for a specified area of the image.
Topics
Filters
Core Image / Reduction Filters
API Collection
Reduction Filters
Create statistical information about an image.


## Page 2

class func areaMinMaxRed() -> any CIFilter & CIAreaMinMaxRed
Calculates the minimum and maximum red component value.
class func columnAverage() -> any CIFilter & CIColumnAverage
Calculates the average color for a specified column of an image.
class func histogramDisplay() -> any CIFilter & CIHistogramDisplay
Generates a histogram map from the image.
class func kMeans() -> any CIFilter & CIKMeans
Applies the k-means algorithm to find the most common colors in an image.
class func rowAverage() -> any CIFilter & CIRowAverage
Calculates the average color for the specified row of pixels in an image.
protocol CIAreaAverage
protocol CIAreaHistogram
protocol CIAreaLogarithmicHistogram
protocol CIAreaMaximum
protocol CIAreaMaximumAlpha
protocol CIAreaMinMax
protocol CIAreaMinMaxRed
protocol CIAreaMinimum
protocol CIAreaMinimumAlpha
protocol CIAreaReductionFilter
protocol CIColumnAverage
protocol CIHistogramDisplay
protocol CIKMeans
protocol CIRowAverage
Protocols
See Also


## Page 3

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
Halftone Effect Filters
Simulate monochrome and CMYK halftone screens.
Sharpening Filters
Apply sharpening to images.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Filter Catalog


## Page 4

Transition Filters
Transition between two images by using effects including page curl and swipe.


