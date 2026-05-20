# Custom Filters.pdf

## Page 1

The Core Image Kernel Language is a shading language optimized for writing custom kernels for
use in apps leveraging Core Image. You can add custom image processing routines to a Core Ima
pipeline.
You can also write your own kernels in the Metal Shading Language. The following flowchart show
how you decide which language to use for writing custom kernels:
Source code written in Core Image Kernel Language should contain one or more image processin
routines and may optionally contain other functions that are called by these routines. The source
code is parsed and validated when the code is passed to Core Image’s CIKernel creation APIs.
When rendering, Core Image can concatenate kernel functions used within an image graph and
construct optimized shader programs. See Core Image Kernel Language Reference for a list of
supported data types, functions, and language features.
Alternatively, you can write custom kernels in the Metal Shading Language. If you intend to use
Metal-only language features and support exclusively Metal-supported devices, then writing
custom kernels in Metal Shading Language can reduce compile-time cost while providing code
Overview
Core Image / Writing Custom Kernels
Article
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the
Metal Shading Language.


## Page 2

consistency across your Metal app. See Metal Shading Language for Core Image Kernels for a list
of supported data types, functions, and language features.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.
See Also
Custom Filters


## Page 3

Writing Custom Kernels
Note
If your custom filter uses both color and geometry information, but does not require
processing both at the same time, you can improve performance by separating your image
processing code: use a CIColorKernel object for the color processing step and a CIWarp
Kernel object for the geometry processing step.
The kernel language routine for a general-purpose filter kernel has the following characteristics:
Its return type is vec4 (Core Image Kernel Language) or float4 (Metal Shading Language);
that is, it returns a pixel color for the output image.
It may use zero or more input images. Each input image is represented by a parameter of type
sampler.
A kernel routine typically produces its output by calculating source image coordinates (using the
destCoord and samplerTransform functions or the samplerTransform function), samples
from the source images (using the sample function), and computes a final pixel color (output
Mentioned in
Overview
Core Image / CIKernel
Class
CIKernel
A GPU-based image-processing routine used to create custom Core Image filters
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 4

using the return keyword). For example, the Metal Shading Language source below implements
filter that passes through its input image unchanged.
The equivalent code in Core Image Kernel Language is:
The Core Image Kernel Language is a dialect of the OpenGL Shading Language. See Core Image
Kernel Language Reference and Core Image Programming Guide for more details.
convenience init(functionName: String, fromMetalLibraryData: Data)
throws
Creates a single kernel object using a Metal Shading Language (MSL) kernel function.
convenience init(functionName: String, fromMetalLibraryData: Data,
outputPixelFormat: CIFormat) throws
Creates a single kernel object using a Metal Shading Language kernel function with optional
pixel format.
class func kernelNames(fromMetalLibraryData: Data) -> [String]
Return an array of strings containing the names of all of the kernels contained in the Metal
library.
Topics
Creating a Kernel Using Metal Shading Language


## Page 5

class func kernels(withMetalString: String) throws -> [CIKernel]
Load kernels from a Metal language string.
var name: String
The name of the kernel routine.
func setROISelector(Selector)
Sets the selector Core Image uses to query the region of interest for image processing with
the kernel.
func apply(extent: CGRect, roiCallback: CIKernelROICallback, arguments:
[Any]) -> CIImage?
Creates a new image using the kernel and specified arguments.
typealias CIKernelROICallback
The signature for a block that computes the region of interest (ROI) for a given area of
destination image pixels. Core Image calls this block when applying the kernel. You specify
this block when using the apply(extent:roiCallback:arguments:) method.
convenience init?(source: String)
Creates a single kernel object.
Deprecated
class func makeKernels(source: String) -> [CIKernel]?
Creates and returns and array of CIKernel objects.
Deprecated
Getting a Kernel Name
Identifying the Region of Interest for the Kernel
Applying a Kernel to Filter an Image
Deprecated
Relationships


## Page 6

NSObject
CIColorKernel, CIWarpKernel
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
Inherits From
Inherited By
Conforms To
See Also
Custom Filters


## Page 7

class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.


## Page 8

The kernel language routine for a color kernel has the following characteristics:
Its return type is vec4 (Core Image Kernel Language) or float4 (Metal Shading Language);
that is, it returns a pixel color for the output image.
It may use zero or more input images. Each input image is represented by a parameter of type 
_sample (Core Image Kernel Language) or sample_t (Metal Shading Language), which can b
treated as a single pixel color of type vec4 (Core Image Kernel Language) or float4 (Metal
Shading Language);.
A color kernel routine receives as input single-pixel colors (one sampled from each input image)
and computes a final pixel color (output using the return keyword). For example, the Metal
Shading Language source below implements a filter that passes through its input image
unchanged.
Overview
Core Image / CIColorKernel
Class
CIColorKernel
A GPU-based image-processing routine that processes only the color information
in images, used to create custom Core Image filters.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS
visionOS 1.0+


## Page 9

The equivalent code in Core Image Kernel Language is:
The Core Image Kernel Language is a dialect of the OpenGL Shading Language. See Core Image
Kernel Language Reference and Core Image Programming Guide for more details.
convenience init?(source: String)
Creates a color kernel object from the specified kernel source code.
Deprecated
func apply(extent: CGRect, arguments: [Any]) -> CIImage?
Creates a new image using the kernel and specified arguments.
CIKernel
CIBlendKernel
CVarArg
Topics
Creating a Kernel
Applying a Kernel to Filter an Image
Relationships
Inherits From
Inherited By
Conforms To


## Page 10

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.
See Also
Custom Filters


## Page 11

The kernel language routine for a warp kernel has the following characteristics:
It uses exactly one input image.
Its return type is vec2 (Core Image Kernel Language) or float2 (Metal Shading Language),
specifying a position in source image coordinates.
A warp kernel routine requires no input parameters (but can use additional custom parameters yo
declare). Typically, a warp kernel uses the destination coordinate function to look up the
coordinates of the destination pixel currently being rendered, then computes a corresponding
position in source image coordinates (output using the return keyword). Core Image then
samples from the source image at the returned coordinates to produce a pixel color for the outpu
image. For example, the Metal Shading Language source below implements a filter that passes
through its input image unchanged.
Overview
Core Image / CIWarpKernel
Class
CIWarpKernel
A GPU-based image-processing routine that processes only the geometry
information in an image, used to create custom Core Image filters.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS
visionOS 1.0+


## Page 12

The equivalent code in Core Image Kernel Language is:
The Core Image Kernel Language is a dialect of the OpenGL Shading Language. See Core Image
Kernel Language Reference and Core Image Programming Guide for more details.
convenience init?(source: String)
Creates a warp kernel object from the specified kernel source code.
Deprecated
func apply(extent: CGRect, roiCallback: CIKernelROICallback, image:
CIImage, arguments: [Any]) -> CIImage?
Creates a new image using the kernel and the specified input image and arguments.
CIKernel
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Topics
Creating a Kernel
Applying a Kernel to Filter an Image
Relationships
Inherits From
Conforms To


## Page 13

Hashable
NSObjectProtocol
Sendable
SendableMetatype
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.
See Also
Custom Filters


## Page 14

The blend kernel function has the following characteristics:
It has two arguments of type __sample (Core Image Kernel Language) or sample_t (Metal
Shading Language), representing the foreground and background images.
Its return type is vec4 (Core Image Kernel Language) or float4 (Metal Shading Language);
that is, it returns a pixel color for the output image.
A blend kernel routine receives as input single-pixel colors (one sampled from each input image)
and computes a final pixel color (output using the return keyword). For example, the Metal Shadin
Language source below implements a filter that returns the average of its two input images.
Generally, the extent of the output image is the union of the extents of the foreground and
background images.
Overview
Core Image / CIBlendKernel
Class
CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two image
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 15

convenience init?(source: String)
Creates a custom blend kernel from a program string.
Deprecated
func apply(foreground: CIImage, background: CIImage) -> CIImage?
Creates a new image using the blend kernel and specified foreground and background
images.
class var clear: CIBlendKernel
A blend kernel that returns a clear color.
class var color: CIBlendKernel
A blend kernel that uses the luminance values of the background with the hue and saturation
values of the foreground image.
class var colorBurn: CIBlendKernel
A blend kernel that darkens the background image samples to reflect the foreground image
samples.
class var colorDodge: CIBlendKernel
A blend kernel that brightens the background image samples to reflect the foreground image
samples.
class var componentAdd: CIBlendKernel
A blend kernel that adds color components to achieve a brightening effect.
class var componentMax: CIBlendKernel
A blend kernel that creates an image using the maximum values of two input images.
class var componentMin: CIBlendKernel
A blend kernel that creates an image using the minimum values of two input images.
Topics
Creating a Kernel
Applying a Kernel to Filter an Image
Builtin Blend Kernels


## Page 16

class var componentMultiply: CIBlendKernel
A blend kernel that multiplies the color components of its input images.
class var darken: CIBlendKernel
A blend kernel that creates an image using the darker values of two input images.
class var darkerColor: CIBlendKernel
A blend kernel that creates an image using the darker color of two input images.
class var destination: CIBlendKernel
A blend kernel that returns the background input image.
class var destinationAtop: CIBlendKernel
A blend kernel that places the background over the foreground and crops based on the
visibility of the foreground.
class var destinationIn: CIBlendKernel
A blend kernel that places the background over the foreground and crops based on the
visibility of both.
class var destinationOut: CIBlendKernel
A blend kernel that uses the background image to define what to take out of the foreground
image.
class var destinationOver: CIBlendKernel
A blend kernel that places the background image over the input foreground image.
class var difference: CIBlendKernel
A blend kernel that creates an image using the difference between the background and
foreground images.
class var divide: CIBlendKernel
A blend kernel that divides the background image sample color with the foreground image
sample color.
class var exclusion: CIBlendKernel
A blend kernel that produces an effect similar to difference blending but with lower contrast.
class var exclusiveOr: CIBlendKernel
A blend kernel that returns either the foreground or background image if the other contains a
clear color.
class var hardLight: CIBlendKernel


## Page 17

A blend kernel that either multiplies or screens colors, depending on the source image samp
color.
class var hardMix: CIBlendKernel
A blend kernel that adds two images together, setting each color channel value to either 0 o
1.
class var hue: CIBlendKernel
A blend kernel that uses the luminance and saturation values of the background image with
the hue of the foreground image.
class var lighten: CIBlendKernel
A blend kernel that creates an image using the lighter values of two input images.
class var lighterColor: CIBlendKernel
A blend kernel that creates an image using the lighter color of two input images.
class var linearBurn: CIBlendKernel
A blend kernel that darkens the background image samples to reflect the foreground image
samples while also increasing contrast.
class var linearDodge: CIBlendKernel
A blend kernel that lightens the background image samples to reflect the foreground image
samples while also increasing contrast.
class var linearLight: CIBlendKernel
A blend kernel that burns or dodges colors by changing brightness, depending on the blend
color.
class var luminosity: CIBlendKernel
A blend kernel that uses the hue and saturation of the background image with the luminance
of the foreground image.
class var multiply: CIBlendKernel
A blend kernel that multiplies the background image sample color with the foreground image
sample color.
class var overlay: CIBlendKernel
A blend kernel that either multiplies or screens the foreground image samples with the
background image samples, depending on the background color.
class var pinLight: CIBlendKernel
A blend kernel that conditionally replaces background image samples with source image
samples depending on the brightness of the source image samples.


## Page 18

class var saturation: CIBlendKernel
A blend kernel that uses the luminance and hue values of the background image with the
saturation of the foreground image.
class var screen: CIBlendKernel
A blend kernel that multiplies the inverse of the foreground image samples with the inverse o
the background image samples.
class var softLight: CIBlendKernel
A blend kernel that either darkens or lightens colors, depending on the foreground image
sample color.
class var source: CIBlendKernel
A blend kernel that returns the foreground input image.
class var sourceAtop: CIBlendKernel
A blend kernel that places the foreground over the background and crops based on the
visibility of the background.
class var sourceIn: CIBlendKernel
A blend kernel that places the foreground over the background and crops based on the
visibility of both.
class var sourceOut: CIBlendKernel
A blend kernel that uses the foreground image to define what to take out of the background
image.
class var sourceOver: CIBlendKernel
A blend kernel that places the foreground image over the input background image.
class var subtract: CIBlendKernel
A blend kernel that subtracts the background image sample color from the foreground image
sample color.
class var vividLight: CIBlendKernel
A blend kernel that burns or dodges colors by changing contrast, depending on the blend
color.
func apply(foreground: CIImage, background: CIImage, colorSpace: CGColo
Space) -> CIImage?
Instance Methods


## Page 19

CIColorKernel
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
Relationships
Inherits From
Conforms To
See Also
Custom Filters


## Page 20

class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.


## Page 21

The CISampler class retrieves samples of images for processing by a CIKernel object. A
CISampler object defines a coordinate transform, and modes for interpolation and wrapping. Yo
use CISampler objects in conjunction with other Core Image classes, such as CIFilter,
CIKernel, and CIFilterShape, to create custom filters.
convenience init(image: CIImage)
Initializes a sampler with an image object.
init(image: CIImage, options: [AnyHashable : Any]?)
Initializes the sampler with an image object using options specified in a dictionary.
var definition: CIFilterShape
The domain of definition (DOD) of the sampler
Overview
Topics
Initializing a Sampler
Getting Information About the Sampler Object
Core Image / CISampler
Class
CISampler
An object that retrieves pixel samples for processing by a filter kernel.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 22

var extent: CGRect
The rectangle that specifies the extent of the sampler
Sampler Option Keys
Keys for creating a sampler.
Sampler Option Values
Values for sampler option keys.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
Constants
Relationships
Inherits From
Conforms To
See Also
Custom Filters


## Page 23

A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.


## Page 24

You use CIFilterShape objects in conjunction with Core Image classes, such as CIFilter,
CIKernel, and CISampler, to create custom filters.
init(rect: CGRect)
Initializes a filter shape object with a rectangle.
var extent: CGRect
The extent of the filter shape.
Overview
Topics
Initializing a Filter Shape
Inspecting a Filter Shape
Modifying a Filter Shape
Core Image / CIFilterShape
Class
CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a
filter operation.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 25

func insetBy(x: Int32, y: Int32) -> CIFilterShape
Modifies a filter shape object so that it is inset by the specified x and y values.
func intersect(with: CIFilterShape) -> CIFilterShape
Creates a filter shape object that represents the intersection of the current filter shape and
the specified filter shape object.
func intersect(with: CGRect) -> CIFilterShape
Creates a filter shape that represents the intersection of the current filter shape and a
rectangle.
func transform(by: CGAffineTransform, interior: Bool) -> CIFilterShape
Creates a filter shape that results from applying a transform to the current filter shape.
func union(with: CIFilterShape) -> CIFilterShape
Creates a filter shape that results from the union of the current filter shape and another filter
shape object.
func union(with: CGRect) -> CIFilterShape
Creates a filter shape that results from the union of the current filter shape and a rectangle.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Relationships
Inherits From
Conforms To


## Page 26

Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
struct CIFormat
Pixel data formats for image input, output, and processing.
See Also
Custom Filters


## Page 27

static let A16: CIFormat
A 16-bit-per-pixel, fixed-point pixel format in which the sole component is alpha.
static let A8: CIFormat
An 8-bit-per-pixel, fixed-point pixel format in which the sole component is alpha.
static let ABGR8: CIFormat
A 32-bit-per-pixel, fixed-point pixel format in which the alpha value precedes the blue, green
and red color components.
static let ARGB8: CIFormat
A 32-bit-per-pixel, fixed-point pixel format in which the alpha value precedes the red, green
and blue color components.
static let Af: CIFormat
A 32-bit-per-pixel, full-width floating-point pixel format in which the sole component is alph
static let Ah: CIFormat
A 16-bit-per-pixel, half-width floating-point pixel format in which the sole component is alph
Topics
Image Formats
Core Image / CIFormat
Structure
CIFormat
Pixel data formats for image input, output, and processing.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 28

static let BGRA8: CIFormat
A 32-bit-per-pixel, fixed-point pixel format in which the blue, green, and red color
components precede the alpha value.
static let R16: CIFormat
A 16-bit-per-pixel, fixed-point pixel format in which the sole component is a red color value.
static let R8: CIFormat
An 8-bit-per-pixel, fixed-point pixel format in which the sole component is a red color value.
static let RG16: CIFormat
A 32-bit-per-pixel, fixed-point pixel format with only red and green color components.
static let RG8: CIFormat
A 16-bit-per-pixel, fixed-point pixel format with only red and green color components.
static let RGB10: CIFormat
static let RGBA16: CIFormat
A 64-bit-per-pixel, fixed-point pixel format.
static let RGBX16: CIFormat
static let RGBA8: CIFormat
A 32-bit-per-pixel, fixed-point pixel format in which the red, green, and blue color
components precede the alpha value.
static let RGBAf: CIFormat
A 128-bit-per-pixel, floating-point pixel format.
static let rgbXf: CIFormat
static let RGBAh: CIFormat
A 64-bit-per-pixel, floating-point pixel format.
static let rgbXh: CIFormat
static let RGf: CIFormat
A 64-bit-per-pixel, floating-point pixel format with only red and green color components.
static let RGh: CIFormat
A 32-bit-per-pixel, floating-point pixel format with only red and green color components.
static let Rf: CIFormat


## Page 29

A 32-bit-per-pixel, floating-point pixel format in which the sole component is a red color
value.
static let Rh: CIFormat
A 16-bit-per-pixel, floating-point pixel format in which the sole component is a red color valu
static let L16: CIFormat
A 16-bit-per-pixel, fixed-point pixel format in which the sole component is luminance.
static let L8: CIFormat
An 8-bit-per-pixel, fixed-point pixel format in which the sole component is luminance.
static let LA16: CIFormat
A 32-bit-per-pixel, fixed-point pixel format with only 16-bit luminance and alpha component
static let LA8: CIFormat
A 16-bit-per-pixel, fixed-point pixel format with only 8-bit luminance and alpha components
static let LAf: CIFormat
A 64-bit-per-pixel, full-width floating-point pixel format with 32-bit luminance and alpha
components.
static let LAh: CIFormat
A 32-bit-per-pixel, half-width floating-point pixel format with 16-bit luminance and alpha
components.
static let Lf: CIFormat
A 32-bit-per-pixel, full-width floating-point pixel format in which the sole component is
luminance.
static let Lh: CIFormat
A 16-bit-per-pixel, half-width floating-point pixel format in which the sole component is
luminance.
init(rawValue: Int32)
static let RGBX8: CIFormat
Initializers
Type Properties


## Page 30

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Writing Custom Kernels
Write your own custom kernels in either the Core Image Kernel Language or the Metal Shadi
Language.
class CIKernel
A GPU-based image-processing routine used to create custom Core Image filters.
class CIColorKernel
A GPU-based image-processing routine that processes only the color information in images
used to create custom Core Image filters.
class CIWarpKernel
A GPU-based image-processing routine that processes only the geometry information in an
image, used to create custom Core Image filters.
class CIBlendKernel
A GPU-based image-processing routine that is optimized for blending two images.
class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
Relationships
Conforms To
See Also
Custom Filters


## Page 31

A description of the bounding shape of a filter and the domain of definition for a filter
operation.


