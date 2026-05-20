# 007_CIFormat.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

A description of the bounding shape of a filter and the domain of definition for a filter
operation.


