# 005_CISampler.pdf

## Page 1

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


## Page 2

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


## Page 3

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


