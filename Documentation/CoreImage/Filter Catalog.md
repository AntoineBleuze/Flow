# Filter Catalog.pdf

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

class func additionCompositing() -> any CIFilter & CICompositeOperation
Blends colors from two images by addition.
class func colorBlendMode() -> any CIFilter & CICompositeOperation
Blends color from two images using the luminance values from the background image and th
hue and saturation values from the input image.
class func colorBurnBlendMode() -> any CIFilter & CICompositeOperation
Blends color from two images while darkening the image.
class func colorDodgeBlendMode() -> any CIFilter & CICompositeOperation
Blends color from two images using dodging.
class func darkenBlendMode() -> any CIFilter & CICompositeOperation
Blends colors from two images while darkening lighter pixels.
class func differenceBlendMode() -> any CIFilter & CICompositeOperation
Subtracts color values to blend colors.
class func divideBlendMode() -> any CIFilter & CICompositeOperation
Divides color values to blend colors.
class func exclusionBlendMode() -> any CIFilter & CICompositeOperation
Subtracts color values to blend colors with less contrast.
Topics
Filters
Core Image / Composite Operations
API Collection
Composite Operations
Composite images by using a range of blend modes and compositing operators.


## Page 17

class func hardLightBlendMode() -> any CIFilter & CICompositeOperation
Blends colors of two images by screening and multiplying.
class func hueBlendMode() -> any CIFilter & CICompositeOperation
Blends colors of two images by computing the sum of image color values.
class func lightenBlendMode() -> any CIFilter & CICompositeOperation
Blends colors from two images by brightening colors.
class func linearBurnBlendMode() -> any CIFilter & CICompositeOperation
Blends color from two images while increasing contrast.
class func linearDodgeBlendMode() -> any CIFilter & CICompositeOperatio
Blends colors of two images with dodging.
class func linearLightBlendMode() -> any CIFilter & CICompositeOperatio
A combination of linear burn and linear dodge blend modes.
class func luminosityBlendMode() -> any CIFilter & CICompositeOperation
Blends color from two images by calculating the color, hue, and saturation.
class func minimumCompositing() -> any CIFilter & CICompositeOperation
Blends colors from two images by computing minimum values.
class func maximumCompositing() -> any CIFilter & CICompositeOperation
Applies a maximum compositing filter to an image.
class func multiplyBlendMode() -> any CIFilter & CICompositeOperation
Blends colors from two images by multiplying color components.
class func multiplyCompositing() -> any CIFilter & CICompositeOperation
Blurs the colors of two images by multiplying color components.
class func overlayBlendMode() -> any CIFilter & CICompositeOperation
Blends colors by overlaying images.
class func pinLightBlendMode() -> any CIFilter & CICompositeOperation
Blends colors of two images by replacing brighter colors.
class func saturationBlendMode() -> any CIFilter & CICompositeOperation
Blends the colors and saturation values of two images.
class func screenBlendMode() -> any CIFilter & CICompositeOperation


## Page 18

Blends colors of two images by multiplying colors.
class func softLightBlendMode() -> any CIFilter & CICompositeOperation
Blurs the colors of two images by calculating luminance.
class func sourceAtopCompositing() -> any CIFilter & CIComposite
Operation
Overlaps two images to create one cropped image.
class func sourceInCompositing() -> any CIFilter & CICompositeOperation
Subtracts non-overlapping areas of two images, resulting in one image.
class func sourceOutCompositing() -> any CIFilter & CICompositeOperatio
Subtracts overlapping area of two images to create the output image.
class func sourceOverCompositing() -> any CIFilter & CIComposite
Operation
Places one image over a second image.
class func subtractBlendMode() -> any CIFilter & CICompositeOperation
Blends colors by subtracting color values from two images.
class func vividLightBlendMode() -> any CIFilter & CICompositeOperation
A combination of color-burn and color-dodge blend modes.
protocol CICompositeOperation
The properties you use to configure a composite operation filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
Color Adjustment Filters
Apply color transformations, including exposure, hue, and tint adjustments.
Protocols
See Also
Filter Catalog


## Page 19

Color Effect Filters
Apply color effects, including photo effects, dithering, and color maps.
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
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 20

A convolution filter generates each output pixel by summing all elements in the element-wise
product of two matrices - the weight matrix and a matrix containing the neighbors of each input
pixel. A bias is added to this and the resulting value is clamped to between 0.0 and 1.0. This
operation is performed independently for each color component (including the alpha component)
You can create many types of image processing effects using different weight matrices, such as
blurring, sharpening, edge detection, translation, and embossing.
class func convolution3X3() -> any CIFilter & CIConvolution
Applies a convolution 3 x 3 filter to the RGBA components of an image.
class func convolution5X5() -> any CIFilter & CIConvolution
Applies a convolution 5 x 5 filter to the RGBA components image.
class func convolution7X7() -> any CIFilter & CIConvolution
Applies a convolution 7 x 7 filter to the RGBA color components of an image.
class func convolution9Horizontal() -> any CIFilter & CIConvolution
Applies a convolution-9 horizontal filter to the RGBA components of an image.
Overview
Topics
Filters
Core Image / Convolution Filters
API Collection
Convolution Filters
Produce effects such as blurring, sharpening, edge detection, translation, and
embossing.


## Page 21

class func convolution9Vertical() -> any CIFilter & CIConvolution
Applies a convolution-9 vertical filter to the RGBA components of an image.
class func convolutionRGB3X3() -> any CIFilter & CIConvolution
Applies a convolution 3 x 3 filter to the RGB components of an image.
class func convolutionRGB5X5() -> any CIFilter & CIConvolution
Applies a convolution 5 x 5 filter to the RGB components of an image.
class func convolutionRGB7X7() -> any CIFilter & CIConvolution
Applies a convolution 7 x 7 filter to the RGB components of an image.
class func convolutionRGB9Horizontal() -> any CIFilter & CIConvolution
Applies a convolution 9 x 1 filter to the RGB components of an image.
class func convolutionRGB9Vertical() -> any CIFilter & CIConvolution
Applies a convolution 1 x 9 filter to the RGB components of an image.
protocol CIConvolution
The properties you use to configure a convolution filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
Color Adjustment Filters
Apply color transformations, including exposure, hue, and tint adjustments.
Color Effect Filters
Apply color effects, including photo effects, dithering, and color maps.
Composite Operations
Composite images by using a range of blend modes and compositing operators.
Protocols
See Also
Filter Catalog


## Page 22

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
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 23

class func bumpDistortion() -> any CIFilter & CIBumpDistortion
Distorts an image with a concave or convex bump.
class func bumpDistortionLinear() -> any CIFilter & CIBumpDistortion
Linear
Linearly distorts an image with a concave or convex bump.
class func circleSplashDistortion() -> any CIFilter & CICircleSplash
Distortion
Distorts an image with radiating circles to the periphery of the image.
class func circularWrap() -> any CIFilter & CICircularWrap
Distorts an image by increasing the distance of the center of the image.
class func displacementDistortion() -> any CIFilter & CIDisplacement
Distortion
Applies the grayscale values of the second image to the first image.
class func droste() -> any CIFilter & CIDroste
Stylizes an image with the Droste effect.
class func glassDistortion() -> any CIFilter & CIGlassDistortion
Distorts an image by applying a glass-like texture.
class func glassLozenge() -> any CIFilter & CIGlassLozenge
Topics
Filters
Core Image / Distortion Filters
API Collection
Distortion Filters
Apply distortion to images.


## Page 24

Creates a lozenge-shaped lens and distorts the image.
class func holeDistortion() -> any CIFilter & CIHoleDistortion
Distorts an image with a circular area that pushes the image outward.
class func lightTunnel() -> any CIFilter & CILightTunnel
Distorts an image by generating a light tunnel.
class func ninePartStretched() -> any CIFilter & CINinePartStretched
Distorts an image by stretching it between two breakpoints.
class func ninePartTiled() -> any CIFilter & CINinePartTiled
Distorts an image by tiling portions of it.
class func pinchDistortion() -> any CIFilter & CIPinchDistortion
Distorts an image by creating a pinch effect with stronger distortion in the center.
class func stretchCrop() -> any CIFilter & CIStretchCrop
Distorts an image by stretching or cropping to fit a specified size.
class func torusLensDistortion() -> any CIFilter & CITorusLensDistortio
Creates a torus-shaped lens to distort the image.
class func twirlDistortion() -> any CIFilter & CITwirlDistortion
Distorts an image by rotating pixels around a center point.
class func vortexDistortion() -> any CIFilter & CIVortexDistortion
Distorts an image by using a vortex effect created by rotating pixels around a point.
protocol CIBumpDistortion
protocol CIBumpDistortionLinear
protocol CICircleSplashDistortion
protocol CICircularWrap
protocol CIDisplacementDistortion
protocol CIDroste
protocol CIGlassDistortion
protocol CIGlassLozenge
Protocols


## Page 25

protocol CIHoleDistortion
protocol CILightTunnel
protocol CINinePartStretched
protocol CINinePartTiled
protocol CIPinchDistortion
protocol CIStretchCrop
protocol CITorusLensDistortion
protocol CITwirlDistortion
protocol CIVortexDistortion
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
Generator Filters
Generate barcode, geometric, and special-effect images.
Geometry Adjustment Filters
Translate, scale, and rotate images in 2D and 3D.
See Also
Filter Catalog


## Page 26

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


## Page 27

class func attributedTextImageGenerator() -> any CIFilter & CIAttribute
TextImageGenerator
Generates an attributed-text image.
class func aztecCodeGenerator() -> any CIFilter & CIAztecCodeGenerator
Generates a low-density barcode.
class func barcodeGenerator() -> any CIFilter & CIBarcodeGenerator
Generates a barcode as an image from the descriptor.
class func blurredRectangleGenerator() -> any CIFilter & CIBlurred
RectangleGenerator
Generates a blurred rectangle.
class func checkerboardGenerator() -> any CIFilter & CICheckerboard
Generator
Generates a checkerboard image.
class func code128BarcodeGenerator() -> any CIFilter & CICode128Barcode
Generator
Generates a high-density, linear barcode.
class func lenticularHaloGenerator() -> any CIFilter & CILenticularHalo
Generator
Generates a lenticular halo image.
Topics
Filters
Core Image / Generator Filters
API Collection
Generator Filters
Generate barcode, geometric, and special-effect images.


## Page 28

class func meshGenerator() -> any CIFilter & CIMeshGenerator
Generates a pattern made from an array of line segments.
class func pdf417BarcodeGenerator() -> any CIFilter & CIPDF417Barcode
Generator
Generates a high-density linear barcode.
class func qrCodeGenerator() -> any CIFilter & CIQRCodeGenerator
Generates a quick response (QR) code image.
class func randomGenerator() -> any CIFilter & CIRandomGenerator
Generates a random filter image.
class func roundedRectangleGenerator() -> any CIFilter & CIRounded
RectangleGenerator
Generates a rounded rectangle image.
class func roundedRectangleStrokeGenerator() -> any CIFilter & CIRounde
RectangleStrokeGenerator
Creates an image containing the outline of a rounded rectangle.
class func starShineGenerator() -> any CIFilter & CIStarShineGenerator
Generates a star-shine image.
class func stripesGenerator() -> any CIFilter & CIStripesGenerator
Generates a line of stripes as an image
class func sunbeamsGenerator() -> any CIFilter & CISunbeamsGenerator
Generates an image resembling the sun.
class func textImageGenerator() -> any CIFilter & CITextImageGenerator
Generates a text image.
protocol CICode128BarcodeGenerator
The properties you use to configure a Code 128 barcode generator filter.
protocol CIAttributedTextImageGenerator
The properties you use to configure an attributed-text image generator filter.
protocol CIAztecCodeGenerator
The properties you use to configure an Aztec code generator filter.
Protocols


## Page 29

protocol CIBarcodeGenerator
The properties you use to configure a barcode generator filter.
protocol CIBlurredRectangleGenerator
protocol CIRoundedRectangleStrokeGenerator
protocol CICheckerboardGenerator
The properties you use to configure a checkerboard generator filter.
protocol CILenticularHaloGenerator
The properties you use to configure a lenticular halo generator filter.
protocol CIMeshGenerator
The properties you use to configure a mesh generator filter.
protocol CIPDF417BarcodeGenerator
The properties you use to configure a PDF417 barcode generator filter.
protocol CIQRCodeGenerator
The properties you use to configure a QR code generator filter.
protocol CIRandomGenerator
The properties you use to configure a random generator filter.
protocol CIRoundedRectangleGenerator
The properties you use to configure a rounded rectangle generator filter.
protocol CIRoundedRectangleStrokeGenerator
protocol CIStarShineGenerator
The properties you use to configure a star-shine generator filter.
protocol CIStripesGenerator
The properties you use to configure a stripes generator filter.
protocol CISunbeamsGenerator
The properties you use to configure a sunbeams generator filter.
protocol CITextImageGenerator
The properties you use to configure a text image generator filter.


## Page 30

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
See Also
Filter Catalog


## Page 31

Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 32

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


## Page 33

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


## Page 34

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


## Page 35

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


## Page 36

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


## Page 37

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


## Page 38

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


## Page 39

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


## Page 40

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


## Page 41

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


## Page 42

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


## Page 43

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


## Page 44

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


## Page 45

Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 46

class func sharpenLuminance() -> any CIFilter & CISharpenLuminance
Applies a sharpening effect to an image.
class func unsharpMask() -> any CIFilter & CIUnsharpMask
Increases an image’s contrast between two colors.
protocol CISharpenLuminance
The properties you use to configure a sharpen luminance filter.
protocol CIUnsharpMask
The properties you use to configure an unsharp mask filter.
Blur Filters
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image
regions.
Topics
Filters
Protocols
See Also
Filter Catalog
Core Image / Sharpening Filters
API Collection
Sharpening Filters
Apply sharpening to images.


## Page 47

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
Reduction Filters
Create statistical information about an image.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 48

class func blendWithAlphaMask() -> any CIFilter & CIBlendWithMask
Blends two images by using an alpha mask image.
class func blendWithBlueMask() -> any CIFilter & CIBlendWithMask
Blends two images by using a blue mask image.
class func blendWithMask() -> any CIFilter & CIBlendWithMask
Blends two images by using a mask image.
class func blendWithRedMask() -> any CIFilter & CIBlendWithMask
Blends two images by using a red mask image.
class func bloom() -> any CIFilter & CIBloom
Adjusts an image’s colors by applying a blur effect.
class func cannyEdgeDetector() -> any CIFilter & CICannyEdgeDetector
Applies the Canny edge-detection algorithm to an image.
class func comicEffect() -> any CIFilter & CIComicEffect
Creates an image with a comic book effect.
class func coreMLModel() -> any CIFilter & CICoreMLModel
Filters an image with a Core ML model.
Topics
Filters
Core Image / Stylizing Filters
API Collection
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and lin
overlays.


## Page 49

class func crystallize() -> any CIFilter & CICrystallize
Creates an image made with a series of colorful polygons.
class func depthOfField() -> any CIFilter & CIDepthOfField
Simulates a depth of field effect.
class func edges() -> any CIFilter & CIEdges
Hilghlights edges of objects found within an image.
class func edgeWork() -> any CIFilter & CIEdgeWork
Produces a black-and-white image that looks similar to a woodblock print.
class func gaborGradients() -> any CIFilter & CIGaborGradients
Highlights textures in an image.
class func gloom() -> any CIFilter & CIGloom
Adjusts an image’s color by applying a gloom filter.
class func heightFieldFromMask() -> any CIFilter & CIHeightFieldFromMas
Creates a realistic shaded height-field image.
class func hexagonalPixellate() -> any CIFilter & CIHexagonalPixellate
Creates an image made of a series of colorful hexagons.
class func highlightShadowAdjust() -> any CIFilter & CIHighlightShadow
Adjust
Adjusts the highlights of colors to reduce shadows.
class func lineOverlay() -> any CIFilter & CILineOverlay
Creates an image that resembles a sketch of the outlines of objects.
class func mix() -> any CIFilter & CIMix
Blends two images together.
class func personSegmentation() -> any CIFilter & CIPersonSegmentation
Creates a mask where red pixels indicate areas of the image that are likely to contain a perso
class func pixellate() -> any CIFilter & CIPixellate
Enlarges the colors of the pixels to create a blurred effect.
class func pointillize() -> any CIFilter & CIPointillize
Applies a pointillize effect to an image.


## Page 50

class func saliencyMap() -> any CIFilter & CISaliencyMap
Creates a saliency map from an image.
class func shadedMaterial() -> any CIFilter & CIShadedMaterial
Creates a shaded image from a height-field image.
class func sobelGradients() -> any CIFilter & CISobelGradients
Calculates the Sobel gradients for an image.
class func spotColor() -> any CIFilter & CISpotColor
Replaces colors of an image with specifed colors.
class func spotLight() -> any CIFilter & CISpotLight
Highlights a definined area of the image.
class func cannyEdgeDetector() -> any CIFilter & CICannyEdgeDetector
Applies the Canny edge-detection algorithm to an image.
protocol CIBlendWithMask
The properties you use to configure a blend with mask filter.
protocol CIBloom
The properties you use to configure a bloom filter.
protocol CICannyEdgeDetector
protocol CIComicEffect
The properties you use to configure a comic effect filter.
protocol CICoreMLModel
The properties you use to configure a Core ML model filter.
protocol CICrystallize
The properties you use to configure a crystalize filter.
protocol CIDepthOfField
The properties you use to configure a depth-of-field filter.
protocol CIEdgeWork
The properties you use to configure an edge-work filter.
Protocols


## Page 51

protocol CIEdges
The properties you use to configure an edges filter.
protocol CIGaborGradients
The properties you use to configure a Gabor gradients filter.
protocol CIGloom
The properties you use to configure a gloom filter.
protocol CIHeightFieldFromMask
The properties you use to configure a height-field-from-mask filter.
protocol CIHexagonalPixellate
The properties you use to configure a hexagonal pixellate filter.
protocol CIHighlightShadowAdjust
The properties you use to configure a highlight-shadow adjust filter.
protocol CILineOverlay
The properties you use to configure a line overlay filter.
protocol CIMix
The properties you use to configure a mix filter.
protocol CIPersonSegmentation
protocol CIPixellate
The properties you use to configure a pixellate filter.
protocol CIPointillize
The properties you use to configure a pointillize filter.
protocol CISaliencyMap
The properties you use to configure a saliency map filter.
protocol CIShadedMaterial
The properties you use to configure a shaded material filter.
protocol CISobelGradients
protocol CISpotColor
The properties you use to configure a spot color filter.
protocol CISpotLight


## Page 52

The properties you use to configure a spotlight filter.
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
Reduction Filters
Create statistical information about an image.
See Also
Filter Catalog


## Page 53

Sharpening Filters
Apply sharpening to images.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 54

class func affineClamp() -> any CIFilter & CIAffineClamp
Performs a transform on the image and extends the image edges to infinity.
class func affineTile() -> any CIFilter & CIAffineTile
Performs a transform on the image and tiles the result.
class func eightfoldReflectedTile() -> any CIFilter & CIEightfold
ReflectedTile
Creates an eight-way reflected pattern.
class func fourfoldReflectedTile() -> any CIFilter & CIFourfoldReflecte
Tile
Creates a four-way reflected pattern.
class func fourfoldRotatedTile() -> any CIFilter & CIFourfoldRotatedTil
Creates a tiled image by rotating a tile in increments of 90 degrees.
class func fourfoldTranslatedTile() -> any CIFilter & CIFourfold
TranslatedTile
Creates a tiled image by applying four translation operations.
class func glideReflectedTile() -> any CIFilter & CIGlideReflectedTile
Tiles an image by rotating and reflecting a tile from the image.
class func kaleidoscope() -> any CIFilter & CIKaleidoscope
Topics
Filters
Core Image / Tile Effect Filters
API Collection
Tile Effect Filters
Produce tiled images from source images.


## Page 55

Creates a 12-way kaleidoscopic image from an image.
class func opTile() -> any CIFilter & CIOpTile
Produces an effect that mimics a style of visual art that uses optical illusions.
class func parallelogramTile() -> any CIFilter & CIParallelogramTile
Warps the image to create a parallelogram and tiles the result.
class func perspectiveTile() -> any CIFilter & CIPerspectiveTile
Tiles an image by adjusting the perspective of the image.
class func sixfoldReflectedTile() -> any CIFilter & CISixfoldReflected
Tile
Produces a tiled image from a source image by applying a six-way reflected symmetry.
class func sixfoldRotatedTile() -> any CIFilter & CISixfoldRotatedTile
Creates a tiled image by rotating in increments of 60 degrees.
class func triangleKaleidoscope() -> any CIFilter & CITriangle
Kaleidoscope
Create a triangular kaleidoscope effect and then tiles the result.
class func triangleTile() -> any CIFilter & CITriangleTile
Tiles a triangular area of an image.
class func twelvefoldReflectedTile() -> any CIFilter & CITwelvefold
ReflectedTile
Creates a tiled image by rotating in increments of 30 degrees.
protocol CIAffineClamp
The properties you use to configure an affine clamp filter.
protocol CIAffineTile
The properties you use to configure an affine tile filter.
protocol CIEightfoldReflectedTile
The properties you use to configure an eightfold reflected tile filter.
protocol CIFourfoldReflectedTile
The properties you use to configure a fourfold reflected tile filter.
Protocols


## Page 56

protocol CIFourfoldRotatedTile
The properties you use to configure a fourfold rotated tile filter.
protocol CIFourfoldTranslatedTile
The properties you use to configure a fourfold translated tile filter.
protocol CIGlideReflectedTile
The properties you use to configure a glide reflected tile filter.
protocol CIKaleidoscope
The properties you use to configure a kaleidoscope filter.
protocol CIOpTile
The properties you use to configure an optical tile filter.
protocol CIParallelogramTile
The properties you use to configure a parallelogram tile filter.
protocol CIPerspectiveTile
The properties you use to configure a perspective tile filter.
protocol CISixfoldReflectedTile
The properties you use to configure a sixfold reflected tile filter.
protocol CISixfoldRotatedTile
The properties you use to configure a sixfold rotated tile filter.
protocol CITriangleKaleidoscope
The properties you use to configure a triangle kaleidoscope filter.
protocol CITriangleTile
The properties you use to configure a triangle tile filter.
protocol CITwelvefoldReflectedTile
The properties you use to configure a twelvefold reflected tile filter.
See Also
Filter Catalog


## Page 57

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
Reduction Filters
Create statistical information about an image.
Sharpening Filters
Apply sharpening to images.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 58



## Page 59

class func accordionFoldTransition() -> any CIFilter & CIAccordionFold
Transition
Transitions by folding and crossfading an image to reveal the target image.
class func barsSwipeTransition() -> any CIFilter & CIBarsSwipeTransitio
Transitions between two images by removing rectangular portions of an image.
class func copyMachineTransition() -> any CIFilter & CICopyMachine
Transition
Simulates the effect of a copy machine scanner light to transiton between two images.
class func disintegrateWithMaskTransition() -> any CIFilter &
CIDisintegrateWithMaskTransition
Transitions between two images using a mask image.
class func dissolveTransition() -> any CIFilter & CIDissolveTransition
Transitions between two images with a fade effect.
class func flashTransition() -> any CIFilter & CIFlashTransition
Creates a flash of light to transition between two images.
class func modTransition() -> any CIFilter & CIModTransition
Transitions between two images by applying irregularly shaped holes.
class func pageCurlTransition() -> any CIFilter & CIPageCurlTransition
Topics
Filters
Core Image / Transition Filters
API Collection
Transition Filters
Transition between two images by using effects including page curl and swipe.


## Page 60

Simulates the curl of a page, revealing the target image.
class func pageCurlWithShadowTransition() -> any CIFilter & CIPageCurl
WithShadowTransition
Simulates the curl of a page, revealing the target image with added shadow.
class func rippleTransition() -> any CIFilter & CIRippleTransition
Simulates a ripple in a pond to transiton from one image to another.
class func swipeTransition() -> any CIFilter & CISwipeTransition
Gradually transitions from one image to another with a swiping motion.
protocol CITransitionFilter
The properties you use to configure a transition filter.
protocol CIBarsSwipeTransition
The properties you use to configure a bars swipe transition filter.
protocol CIAccordionFoldTransition
The properties you use to configure an accordion fold transition filter.
protocol CICopyMachineTransition
The properties you use to configure a copy machine transition filter.
protocol CIDisintegrateWithMaskTransition
The properties you use to configure a disintegrate-with-mask transition filter.
protocol CIDissolveTransition
The properties you use to configure a dissolve transition filter.
protocol CIFlashTransition
The properties you use to configure a flash transition filter.
protocol CIModTransition
The properties you use to configure a mod transition filter.
protocol CIPageCurlTransition
The properties you use to configure a page curl transition filter.
protocol CIPageCurlWithShadowTransition
The properties you use to configure a page-curl-with-shadow transition filter.
Protocols


## Page 61

protocol CIRippleTransition
The properties you use to configure a ripple transition filter.
protocol CISwipeTransition
The properties you use to configure a swipe transition filter.
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
See Also
Filter Catalog


## Page 62

Reduction Filters
Create statistical information about an image.
Sharpening Filters
Apply sharpening to images.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.


