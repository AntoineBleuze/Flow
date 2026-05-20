# 006_Generator Filters.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 5

Tile Effect Filters
Produce tiled images from source images.
Transition Filters
Transition between two images by using effects including page curl and swipe.


