# 005_Distortion Filters.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


