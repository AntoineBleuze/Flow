# 000_Writing Custom Kernels.pdf

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


