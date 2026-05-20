# Filters.pdf

## Page 1

Processing an Image Using Built-in Filters
Selectively Focusing on an Image
Customizing Image Transitions
The CIFilter class produces a CIImage object as output. Typically, a filter takes one or more
images as input. Some filters, however, generate an image based on other types of input
parameters. The parCIFilter swift.class` object are set and retrieved through the use of key-
value pairs.
You use the CIFilter object in conjunction with other Core Image classes, such as CIImage,
CIContext, and CIColor, to take advantage of the built-in Core Image filters when processing
images, creating filter generators, or writing custom filters.
CIFilter objects are mutable, and thus cannot be shared safely among threads. Each thread
must create its own CIFilter objects, but you can pass a filter’s immutable input and output
CIImage objects between threads.
To get a quick overview of how to set up and use Core Image filters, see Core Image Programming
Guide.
Mentioned in
Overview
Core Image / CIFilter
Class
CIFilter
An image processor that produces an image by manipulating one or more input
images or by generating new image data.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 2

Core Image provides methods that create type-safe CIFilter instances. Use these filters to
avoid run-time errors that can occur when relying on Core Image’s string-based API.
To use the type-safe API, import CoreImage.CIFilterBuiltins:
The type-safe approach returns a non-optional filter. Because the returned filter conforms to the
relevant protocol—for example, CIFalseColor in the case of falseColor()—the parameters
are available as properties. The following creates and applies a false color filter:
The false color filter maps luminance to a color ramp of two colors:
You can subclass CIFilter in order to create custom filter effects:
Create type-safe filters
Subclassing notes


## Page 3

By chaining together two or more built-in Core Image filters
By using an image-processing kernel that you write
Regardless of whether your subclass provides its effect by chaining filters or implementing its ow
kernel, you should:
Declare any input parameters as properties whose names are prefixed with input, such as
inputImage.
Override the setDefaults() methods to provide default values for any input parameters
you’ve declared.
Implement an outputImage method to create a new CIImage with your filter’s effect.
The CIFilter class automatically manages input parameters when archiving, copying, and
deallocating filters. For this reason, your subclass must obey the following guidelines to ensure
proper behavior:
Store input parameters in instance variables whose names are prefixed with input.
Don’t use auto-synthesized instance variables, because their names are automatically prefixed w
an underscore. Instead, synthesize the property manually. For example:
@synthesize inputMyParameter;
If using manual reference counting, don’t release input parameter instance variables in your
dealloc method implementation. The dealloc implementation in the CIFilter class uses
Key-value coding to automatically set the values of all input parameters to nil.
init?(name: String)
Creates a CIFilter object for a specific kind of filter.
init?(name: String, withInputParameters: [String : Any]?)
Creates a CIFilter object for a specific kind of filter and initializes the input values.
Configure Core Image filters that expose their attributes as properties.
protocol CIFilterProtocol
The properties you use to configure a Core Image filter.
Topics
Creating a filter
Configuring type-safe filters


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
Tile Effect Filters
Produce tiled images from source images.


## Page 5

Transition Filters
Transition between two images by using effects including page curl and swipe.
class func filterNames(inCategories: [String]?) -> [String]
Returns an array of all published filter names that match all the specified categories.
class func filterNames(inCategory: String?) -> [String]
Returns an array of all published filter names in the specified category.
class func registerName(String, constructor: any CIFilterConstructor,
classAttributes: [String : Any])
Publishes a custom filter that is not packaged as an image unit.
var name: String
A name associated with a filter.
var isEnabled: Bool
A Boolean value that determines whether the filter is enabled. Animatable.
var attributes: [String : Any]
A dictionary of key-value pairs that describe the filter.
var inputKeys: [String]
The names of all input parameters to the filter.
var outputKeys: [String]
The names of all output parameters from the filter.
var outputImage: CIImage?
Returns a CIImage object that encapsulates the operations configured in the filter.
func setDefaults()
Sets all input values for a filter to default values.
Accessing registered filters
Registering a filter
Getting filter parameters and attributes
Setting default values


## Page 6

func apply(CIKernel, arguments: [Any]?, options: [String : Any]?) ->
CIImage?
Produces a CIImage object by applying arguments to a kernel function and using options to
control how the kernel function is evaluated.
class func localizedName(forFilterName: String) -> String?
Returns the localized name for the specified filter name.
class func localizedName(forCategory: String) -> String
Returns the localized name for the specified filter category.
class func localizedDescription(forFilterName: String) -> String?
Returns the localized description of a filter for display in the user interface.
class func localizedReferenceDocumentation(forFilterName: String) -> UR
?
Returns the location of the localized reference documentation that describes the filter.
func view(forUIConfiguration: [AnyHashable : Any]!, excludedKeys: [Any
]!) -> IKFilterUIView!
Returns a filter view for the filter.
struct CIDynamicRangeOption
An enum string type that your code can use to select different System Tone Mapping modes
Filter Attribute Keys
Attributes for a filter and its parameters.
Data Type Attributes
Applying a filter
Getting localized information for registered filters
Creating a configuration view for a filter
Applying system tone mapping modes
Constants


## Page 7

Numeric data types.
Vector Quantity Attributes
Vector data types.
Color Attribute Keys
Color types.
Image Attribute Keys
Image Types
Filter Category Keys
Categories of filters.
Options for Applying a Filter
Options that control the application of a custom Core Image filter.
User Interface Control Options
Sets of controls for various user scenarios.
User Interface Options
Keys or values for the size of the input parameter controls for a filter view.
Filter Parameter Keys
Keys for input parameters to filters.
RAW Image Options
Options for creating a CIFilter object from RAW image data.
init!(CVPixelBuffer: CVPixelBuffer!, properties: [AnyHashable : Any]!,
options: [CIRAWFilterOption : Any]!)
Creates a filter from a Core Video pixel buffer.
Deprecated
init!(imageData: Data!, options: [CIRAWFilterOption : Any]!)
Creates a filter that allows the processing of RAW images.
Deprecated
init!(imageURL: URL!, options: [CIRAWFilterOption : Any]!)
Creates a filter that allows the processing of RAW images.
Deprecated
Deprecated


## Page 8

struct CIRAWFilterOption
Deprecated
class func serializedXMP(from: [CIFilter], inputImageExtent: CGRect) ->
Data?
Serializes filter parameters into XMP form that is suitable for embedding in an image.
Deprecated
class func filterArray(fromSerializedXMP: Data, inputImageExtent: CGRec
, error: NSErrorPointer) -> [CIFilter]
Returns an array of filter objects de-serialized from XMP data.
Deprecated
class func supportedRawCameraModels() -> [String]!
Deprecated
class func areaAlphaWeightedHistogram() -> any CIFilter & CIArea
Histogram
class func areaBoundsRed() -> any CIFilter & CIAreaBoundsRed
class func maximumScaleTransform() -> any CIFilter & CIMaximumScale
Transform
class func toneMapHeadroom() -> any CIFilter & CIToneMapHeadroom
class func areaAverageMaximumRed() -> any CIFilter & CIAreaAverage
MaximumRed
class func blurredRoundedRectangleGenerator() -> any CIFilter &
CIBlurredRoundedRectangleGenerator
class func distanceGradientFromRedMask() -> any CIFilter & CIDistance
GradientFromRedMask
class func roundedQRCodeGenerator() -> any CIFilter & CIRoundedQRCode
Generator
class func signedDistanceGradientFromRedMask() -> any CIFilter &
CISignedDistanceGradientFromRedMask
class func systemToneMap() -> any CIFilter & CISystemToneMap
Type methods
Type Methods


## Page 9

NSObject
CIRAWFilter
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CIRAWFilter
A filter subclass that produces an image by manipulating RAW image sensor data from a
digital camera or scanner.
class CIColor
The Core Image class that defines a color object.
class CIVector
The Core Image class that defines a vector object.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Filters


## Page 10

Use this class to generate a CIImage object based on the configuration parameters you provide.
You can use this object in conjunction with other Core Image classes—such as CIFilter and
CIContext—to take advantage of the built-in Core Image filters when processing images or
writing custom filters.
You can also query this object to find out about the supported camera models, decoders, and
filters.
convenience init?(cvPixelBuffer: CVPixelBuffer, properties: [AnyHashabl
: Any])
Creates a RAW filter from the pixel buffer and its properties that you specify.
convenience init?(imageData: Data, identifierHint: String?)
Creates a RAW filter from the image data and type hint that you specify.
Overview
Topics
Creating a filter
Core Image / CIRAWFilter
Class
CIRAWFilter
A filter subclass that produces an image by manipulating RAW image sensor data
from a digital camera or scanner.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 11

convenience init?(imageURL: URL)
Creates a RAW filter from the image at the URL location that you specify.
class var supportedCameraModels: [String]
An array containing the names of all supported camera models.
var supportedDecoderVersions: [CIRAWDecoderVersion]
An array of all supported decoder versions for the given image type.
struct CIRAWDecoderVersion
var isColorNoiseReductionSupported: Bool
A Boolean that indicates if the current image supports color noise reduction adjustments.
var isContrastSupported: Bool
A Boolean that indicates if the current image supports contrast adjustments.
var isDetailSupported: Bool
A Boolean that indicates if the current image supports detail enhancement adjustments.
var isLensCorrectionSupported: Bool
A Boolean that indicates if you can enable lens correction for the current image.
var isLocalToneMapSupported: Bool
A Boolean that indicates if the current image supports local tone curve adjustments.
var isLuminanceNoiseReductionSupported: Bool
A Boolean that indicates if the current image supports luminance noise reduction adjustmen
var isMoireReductionSupported: Bool
A Boolean that indicates if the current image supports moire artifact reduction adjustments.
var isSharpnessSupported: Bool
A Boolean that indicates if the current image supports sharpness adjustments.
var nativeSize: CGSize
The full native size of the unscaled image.
Inspecting supported camera models, decoders, and filters
Configuring a filter


## Page 12

var baselineExposure: Float
A value that indicates the baseline exposure to apply to the image.
var boostAmount: Float
A value that indicates the amount of global tone curve to apply to the image.
var boostShadowAmount: Float
A value that indicates the amount to boost the shadow areas of the image.
var colorNoiseReductionAmount: Float
A value that indicates the amount of chroma noise reduction to apply to the image.
var contrastAmount: Float
A value that indicates the amount of local contrast to apply to the edges of the image.
var decoderVersion: CIRAWDecoderVersion
A value that indicates the decoder version to use.
var detailAmount: Float
A value that indicates the amount of detail enhancement to apply to the edges of the image.
var exposure: Float
A value that indicates the amount of exposure to apply to the image.
var extendedDynamicRangeAmount: Float
A value that indicates the amount of extended dynamic range (EDR) to apply to the image.
var isDraftModeEnabled: Bool
A Boolean that indicates whether to enable draft mode.
var isGamutMappingEnabled: Bool
A Boolean that indicates whether to enable gamut mapping.
var isLensCorrectionEnabled: Bool
A Boolean that indicates whether to enable lens correction.
var linearSpaceFilter: CIFilter?
An optional filter you can apply to the RAW image while it’s in linear space.
var localToneMapAmount: Float
A value that indicates the amount of local tone curve to apply to the image.
var luminanceNoiseReductionAmount: Float


## Page 13

A value that indicates the amount of luminance noise reduction to apply to the image.
var moireReductionAmount: Float
A value that indicates the amount of moire artifact reduction to apply to high frequency area
of the image.
var neutralChromaticity: CGPoint
A value that indicates the amount of white balance based on chromaticity values to apply to
the image.
var neutralLocation: CGPoint
A value that indicates the amount of white balance based on pixel coordinates to apply to th
image.
var neutralTemperature: Float
A value that indicates the amount of white balance based on temperature values to apply to
the image.
var neutralTint: Float
A value that indicates the amount of white balance based on tint values to apply to the image
var orientation: CGImagePropertyOrientation
A value that indicates the orientation of the image.
var portraitEffectsMatte: CIImage?
An optional auxiliary image that represents the portrait effects matte of the image.
var previewImage: CIImage?
An optional auxiliary image that represents a preview of the original image.
var properties: [AnyHashable : Any]
A dictionary that contains properties of the image source.
var scaleFactor: Float
A value that indicates the desired scale factor to draw the output image.
var semanticSegmentationGlassesMatte: CIImage?
An optional auxiliary image that represents the semantic segmentation glasses matte of the
image.
var semanticSegmentationHairMatte: CIImage?
An optional auxiliary image that represents the semantic segmentation hair matte of the
image.


## Page 14

var semanticSegmentationSkinMatte: CIImage?
An optional auxiliary image that represents the semantic segmentation skin matte of the
image.
var semanticSegmentationSkyMatte: CIImage?
An optional auxiliary image that represents the semantic segmentation sky matte of the
image.
var semanticSegmentationTeethMatte: CIImage?
An optional auxiliary image that represents the semantic segmentation teeth matte of the
image.
var shadowBias: Float
A value that indicates the amount to subtract from the shadows in the image.
var sharpnessAmount: Float
A value that indicates the amount of sharpness to apply to the edges of the image.
var isHighlightRecoveryEnabled: Bool
var isHighlightRecoverySupported: Bool
CIFilter
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Instance Properties
Relationships
Inherits From
Conforms To


## Page 15

NSSecureCoding
class CIFilter
An image processor that produces an image by manipulating one or more input images or by
generating new image data.
class CIColor
The Core Image class that defines a color object.
class CIVector
The Core Image class that defines a vector object.
See Also
Filters


## Page 16

Selectively Focusing on an Image
Use CIColor instances in conjunction with other Core Image classes, such as CIFilter and
CIKernel. Many of the built-in Core Image filters have one or more CIColor inputs that you can
set to affect the filter’s behavior.
A color is defined as a N-dimensional model where each dimension’s color component is
represented by intensity values. A color component may also be referred to as a color channel. An
RGB color model, for example, is three-dimensional and the red, green, and blue component
intensities define each unique color.
A color is also defined by a color space that locates the axes of N-dimensional model within the
greater volume of human perceivable colors. Core Image uses CGColorSpace instances to
specify a variety of different color spaces such as sRGB, P3, BT.2020, etc. The CGColorSpace
Mentioned in
Overview
Color Model
Color Space
Core Image / CIColor
Class
CIColor
The Core Image class that defines a color object.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 17

also defines if the color space is coded linearly or in a non-linear perceptual curve. (For more
information on CGColorSpace see CGColorSpace)
Standard dynamic range (SDR) color color component values range from 0.0 to 1.0, with 0.0
representing an 0% of that component and 1.0 representing 100%. In contrast, high dynamic
range (HDR) color values can be less than 0.0 (for more saturation) or greater than 1.0 (for mor
brightness).
CIColor instances also have an alpha component, which represents the opacity of the color, wit
0.0 meaning completely transparent and 1.0 meaning completely opaque. If a color does not have
an explicit alpha component, Core Image assumes that the alpha component equals 1.0. With
CIColor that color components values are not premultiplied. So for example, a semi-transparent
pure red CIColor is represented by RGB 1.0,0.0,0.0 and A 0.5. In contrast color componen
values in CIImage buffers or read in CIKernel samplers are premultiplied by default.
init(cgColor: CGColor)
Create a Core Image color object with a Core Graphics color object.
convenience init(color: UIColor)
convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat)
Initialize a Core Image color object in the sRGB color space with the specified red, green, blu
and alpha component values.
convenience init?(red: CGFloat, green: CGFloat, blue: CGFloat, color
Space: CGColorSpace)
Initialize a Core Image color object with the specified red, green, and blue component values
as measured in the specified color space.
convenience init?(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat, colorSpace: CGColorSpace)
Color Range
Color Opacity
Topics
Initializing Color Objects


## Page 18

Initialize a Core Image color object with the specified red, green, and blue component values
as measured in the specified color space.
convenience init(red: CGFloat, green: CGFloat, blue: CGFloat)
Create a Core Image color object in the sRGB color space with the specified red, green, and
blue component values.
convenience init(string: String)
Create a Core Image color object in the sRGB color space using a string containing the RGBA
color component values.
var colorSpace: CGColorSpace
Returns the CGColorSpace associated with the color
var components: UnsafePointer<CGFloat>
Return a pointer to an array of CGFloat values including alpha.
var numberOfComponents: Int
Returns the color components of the color including alpha.
var red: CGFloat
Returns the unpremultiplied red component of the color.
var green: CGFloat
Returns the unpremultiplied green component of the color.
var blue: CGFloat
Returns the unpremultiplied blue component of the color.
var alpha: CGFloat
Returns the alpha value of the color.
var stringRepresentation: String
Returns a formatted string with the unpremultiplied color and alpha components of the color
class var black: CIColor
Creating Color Objects
Getting Color Components
Creating a CIColor Object with Preset Components


## Page 19

Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,0 and alpha value 1.
class var blue: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,1 and alpha value 1.
class var clear: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,0 and alpha value 0.
class var cyan: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,1,1 and alpha value 1.
class var gray: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values 0
.5,0.5,0.5 and alpha value 1.
class var green: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,1,0 and alpha value 1.
class var magenta: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,0,1 and alpha value 1.
class var red: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,0,0 and alpha value 1.
class var white: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,1,1 and alpha value 1.
class var yellow: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,1,0 and alpha value 1.
Relationships


## Page 20

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CIFilter
An image processor that produces an image by manipulating one or more input images or by
generating new image data.
class CIRAWFilter
A filter subclass that produces an image by manipulating RAW image sensor data from a
digital camera or scanner.
class CIVector
The Core Image class that defines a vector object.
Inherits From
Conforms To
See Also
Filters


## Page 21

A CIVector can store one or more CGFloat in one object. They can store a group of float value
for a variety of different uses such as coordinate points, direction vectors, geometric rectangles,
transform matrices, convolution weights, or just a list a parameter values.
You use CIVector objects in conjunction with other Core Image classes, such as CIFilter and
CIKernel. Many of the built-in Core Image filters have one or more CIVector inputs that you c
set to affect the filter’s behavior.
init(values: UnsafePointer<CGFloat>, count: Int)
Initialize a Core Image vector object with the specified the values.
convenience init(x: CGFloat)
Initialize a Core Image vector object with one value.
convenience init(x: CGFloat, y: CGFloat)
Initialize a Core Image vector object with two values.
Overview
Topics
Initializing a Vector
Core Image / CIVector
Class
CIVector
The Core Image class that defines a vector object.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 22

convenience init(x: CGFloat, y: CGFloat, z: CGFloat)
Initialize a Core Image vector object with three values.
convenience init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat)
Initialize a Core Image vector object with four values.
convenience init(string: String)
Initialize a Core Image vector object with values provided in a string representation.
convenience init(cgAffineTransform: CGAffineTransform)
Initialize a Core Image vector object with six values provided by a CGAffineTransform
structure.
convenience init(cgPoint: CGPoint)
Initialize a Core Image vector object with two values provided by a CGPoint structure.
convenience init(cgRect: CGRect)
Initialize a Core Image vector object with four values provided by a CGRect structure.
func value(at: Int) -> CGFloat
Returns a value from a specific position in the vector.
var count: Int
The number of items in the vector.
var x: CGFloat
The value located in the first position in the vector.
var y: CGFloat
The value located in the second position in the vector.
var z: CGFloat
The value located in the third position in the vector.
var w: CGFloat
The value located in the forth position in the vector.
var stringRepresentation: String
Returns a formatted string with all the values of a CIVector.
var cgAffineTransformValue: CGAffineTransform
Getting Values From a Vector


## Page 23

Returns the values in the vector as a CGAffineTransformValue structure.
var cgPointValue: CGPoint
Returns the values in the vector as a CGPoint structure.
var cgRectValue: CGRect
Returns the values in the vector as a CGRect structure.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CIFilter
An image processor that produces an image by manipulating one or more input images or by
generating new image data.
class CIRAWFilter
Relationships
Inherits From
Conforms To
See Also
Filters


## Page 24

A filter subclass that produces an image by manipulating RAW image sensor data from a
digital camera or scanner.
class CIColor
The Core Image class that defines a color object.


