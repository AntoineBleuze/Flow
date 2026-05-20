# 000_Blur Filters.pdf

## Page 1

class func bokehBlur() -> any CIFilter & CIBokehBlur
Applies a bokeh effect to an image.
class func boxBlur() -> any CIFilter & CIBoxBlur
Applies a square-shaped blur to an area of an image.
class func discBlur() -> any CIFilter & CIDiscBlur
Applies a circle-shaped blur to an area of an image.
class func gaussianBlur() -> any CIFilter & CIGaussianBlur
Blurs an image with a Gaussian distribution pattern.
class func maskedVariableBlur() -> any CIFilter & CIMaskedVariableBlur
Blurs a specified portion of an image.
class func median() -> any CIFilter & CIMedian
Calculates the median of an image to refine detail.
class func morphologyGradient() -> any CIFilter & CIMorphologyGradient
Detects and highlights edges of objects.
class func morphologyMaximum() -> any CIFilter & CIMorphologyMaximum
Blurs a circular area by enlarging contrasting pixels.
Topics
Filters
Core Image / Blur Filters
API Collection
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate
image regions.


## Page 2

class func morphologyMinimum() -> any CIFilter & CIMorphologyMinimum
Blurs a circular area by reducing contrasting pixels.
class func morphologyRectangleMaximum() -> any CIFilter & CIMorphology
RectangleMaximum
Blurs a rectangular area by enlarging contrasting pixels.
class func morphologyRectangleMinimum() -> any CIFilter & CIMorphology
RectangleMinimum
Blurs a rectangular area by reducing contrasting pixels.
class func motionBlur() -> any CIFilter & CIMotionBlur
Creates motion blur on an image.
class func noiseReduction() -> any CIFilter & CINoiseReduction
Reduces noise by sharpening the edges of objects.
class func zoomBlur() -> any CIFilter & CIZoomBlur
Creates a zoom blur centered around a single point on the image.
protocol CIBokehBlur
The properties you use to configure a bokeh blur filter.
protocol CIBoxBlur
The properties you use to configure a box blur filter.
protocol CIDiscBlur
The properties you use to configure a disc blur filter.
protocol CIGaussianBlur
The properties you use to configure a Gaussian blur filter.
protocol CIMaskedVariableBlur
The properties you use to configure a masked variable blur filter.
protocol CIMedian
The properties you use to configure a median filter.
protocol CIMorphologyGradient
The properties you use to configure a morphology gradient filter.
Protocols


## Page 3

protocol CIMorphologyMaximum
The properties you use to configure a morphology maximum filter.
protocol CIMorphologyMinimum
The properties you use to configure a morphology minimum filter.
protocol CIMorphologyRectangleMaximum
The properties you use to configure a morphology rectangle maximum filter.
protocol CIMorphologyRectangleMinimum
The properties you use to configure a morphology rectangle minimum filter.
protocol CIMotionBlur
The properties you use to configure a motion blur filter.
protocol CINoiseReduction
The properties you use to configure a noise reduction filter.
protocol CIZoomBlur
The properties you use to configure a zoom blur filter.
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
See Also
Filter Catalog


## Page 4

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
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


