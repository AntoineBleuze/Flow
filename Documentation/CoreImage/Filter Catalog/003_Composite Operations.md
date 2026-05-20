# 003_Composite Operations.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


