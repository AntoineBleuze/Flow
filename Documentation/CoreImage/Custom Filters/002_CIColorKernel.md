# 002_CIColorKernel.pdf

## Page 1

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


## Page 2

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


## Page 3

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


