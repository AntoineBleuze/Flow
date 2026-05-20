# 002_Color Effect Filters.pdf

## Page 1

class func colorCrossPolynomial() -> any CIFilter & CIColorCross
Polynomial
Adjusts an image’s color by applying polynomial cross-products.
class func colorCube() -> any CIFilter & CIColorCube
Adjusts an image’s pixels using a three-dimensional color table.
class func colorCubeWithColorSpace() -> any CIFilter & CIColorCubeWith
ColorSpace
Adjusts an image’s pixels using a three-dimensional color table in specified color space.
class func colorCubesMixedWithMask() -> any CIFilter & CIColorCubesMixe
WithMask
Alters an image’s pixels using a three-dimensional color tables and a mask image.
class func colorCurves() -> any CIFilter & CIColorCurves
Adjusts an image’s color curves.
class func colorInvert() -> any CIFilter & CIColorInvert
Inverts an image’s colors.
class func colorMap() -> any CIFilter & CIColorMap
Performs a transformation of the input image colors to colors from a gradient image.
class func colorMonochrome() -> any CIFilter & CIColorMonochrome
Topics
Color Effect Filters
Core Image / Color Effect Filters
API Collection
Color Effect Filters
Apply color effects, including photo effects, dithering, and color maps.


## Page 2

Adjusts an image’s colors to shades of a single color.
class func colorPosterize() -> any CIFilter & CIColorPosterize
Flattens an image’s colors.
class func convertLabToRGB() -> any CIFilter & CIConvertLab
Converts an image from CIELAB to RGB color space.
class func convertRGBtoLab() -> any CIFilter & CIConvertLab
Converts an image from RGB to CIELAB color space.
class func dither() -> any CIFilter & CIDither
Applies randomized noise to produce a processed look.
class func documentEnhancer() -> any CIFilter & CIDocumentEnhancer
Adjusts an image’s shadows and contrast.
class func falseColor() -> any CIFilter & CIFalseColor
Replaces an image’s colors with specified colors.
class func labDeltaE() -> any CIFilter & CILabDeltaE
Compares an image’s color values.
class func maskToAlpha() -> any CIFilter & CIMaskToAlpha
Converts an image to a white image with an alpha component.
class func maximumComponent() -> any CIFilter & CIMaximumComponent
Creates a maximum RGB grayscale image.
class func minimumComponent() -> any CIFilter & CIMinimumComponent
Creates a minimum RGB grayscale image.
class func paletteCentroid() -> any CIFilter & CIPaletteCentroid
Calculates the location of an image’s colors.
class func palettize() -> any CIFilter & CIPalettize
Replaces colors with colors from a palette image.
class func photoEffectChrome() -> any CIFilter & CIPhotoEffect
Exaggerates an image’s colors.
class func photoEffectFade() -> any CIFilter & CIPhotoEffect
Diminishes an image’s colors.


## Page 3

class func photoEffectInstant() -> any CIFilter & CIPhotoEffect
Desaturates an image’s colors.
class func photoEffectMono() -> any CIFilter & CIPhotoEffect
Adjust an image’s colors to black and white.
class func photoEffectNoir() -> any CIFilter & CIPhotoEffect
Adjusts an image’s colors to black and white and intensifies the contrast.
class func photoEffectProcess() -> any CIFilter & CIPhotoEffect
Lowers the contrast of the input image.
class func photoEffectTonal() -> any CIFilter & CIPhotoEffect
Adjusts an image’s colors to black and white.
class func photoEffectTransfer() -> any CIFilter & CIPhotoEffect
Brightens an image’s colors.
class func sepiaTone() -> any CIFilter & CISepiaTone
Adjusts an image’s colors to shades of brown.
class func thermal() -> any CIFilter & CIThermal
Alters the image to make it look like it was taken by a thermal camera.
class func vignette() -> any CIFilter & CIVignette
Gradually darkens an image’s edges.
class func vignetteEffect() -> any CIFilter & CIVignetteEffect
Gradually darkens a specified area of an image.
class func xRay() -> any CIFilter & CIXRay
Alters an image to make it look like an X-ray image.
protocol CIColorCrossPolynomial
The properties you use to configure a color cross-polynomial filter.
protocol CIColorCube
The properties you use to configure a color cube filter.
protocol CIColorCubeWithColorSpace
The properties you use to configure a color cube with color space filter.
Protocols


## Page 4

protocol CIColorCubesMixedWithMask
The properties you use to configure a color cube mixed with mask filter.
protocol CIColorCurves
The properties you use to configure a color curves filter.
protocol CIColorInvert
The properties you use to configure a color invert filter.
protocol CIColorMap
The properties you use to configure a color map filter.
protocol CIColorMonochrome
The properties you use to configure a color monochrome filter.
protocol CIConvertLab
protocol CIDither
The properties you use to configure a dither filter.
protocol CIColorPosterize
The properties you use to configure a color posterize filter.
protocol CIDocumentEnhancer
The properties you use to configure a document enhancer filter.
protocol CIFalseColor
The properties you use to configure a false color filter.
protocol CILabDeltaE
The properties you use to configure a Lab Delta E filter.
protocol CIMaskToAlpha
The properties you use to configure a mask-to-alpha filter.
protocol CIMaximumComponent
The properties you use to configure a maximum component filter.
protocol CIMinimumComponent
The properties you use to configure a minimum component filter.
protocol CIPaletteCentroid
The properties you use to configure a palette centroid filter.


## Page 5

protocol CIPalettize
The properties you use to configure a palettize filter.
protocol CIPhotoEffect
The properties you use to configure a photo-effect filter.
protocol CISepiaTone
The properties you use to configure a sepia-tone filter.
protocol CIThermal
The properties you use to configure a thermal filter.
protocol CIVignette
The properties you use to configure a vignette filter.
protocol CIVignetteEffect
The properties you use to configure a vignette-effect filter.
protocol CIXRay
The properties you use to configure an X-ray filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
Color Adjustment Filters
Apply color transformations, including exposure, hue, and tint adjustments.
Composite Operations
Composite images by using a range of blend modes and compositing operators.
Convolution Filters
Produce effects such as blurring, sharpening, edge detection, translation, and embossing.
Distortion Filters
Apply distortion to images.
See Also
Filter Catalog


## Page 6

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


