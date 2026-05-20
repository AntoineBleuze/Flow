# 014_Transition Filters.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Reduction Filters
Create statistical information about an image.
Sharpening Filters
Apply sharpening to images.
Stylizing Filters
Create stylized versions of images by applying effects including pixelation and line overlays.
Tile Effect Filters
Produce tiled images from source images.


