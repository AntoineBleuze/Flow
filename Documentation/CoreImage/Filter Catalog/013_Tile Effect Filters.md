# 013_Tile Effect Filters.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5



