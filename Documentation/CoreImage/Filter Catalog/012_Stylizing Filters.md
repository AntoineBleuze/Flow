# 012_Stylizing Filters.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

Sharpening Filters
Apply sharpening to images.
Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


