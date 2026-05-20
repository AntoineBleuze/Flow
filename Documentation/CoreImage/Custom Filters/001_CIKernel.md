# 001_CIKernel.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

class CISampler
An object that retrieves pixel samples for processing by a filter kernel.
class CIFilterShape
A description of the bounding shape of a filter and the domain of definition for a filter
operation.
struct CIFormat
Pixel data formats for image input, output, and processing.


