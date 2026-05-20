# 000_CIFilter.pdf

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


