# 000_Image Properties.pdf

## Page 1

Access these properties using the CGImageSourceCopyProperties(_:_:) function.
let kCGImagePropertyFileContentsDictionary: CFString
A dictionary of properties related to the image’s on-disk file.
let kCGImagePropertyFileSize: CFString
The size of the image file in bytes, if known.
let kCGImagePropertyImageCount: CFString
The number of images in the file.
let kCGImagePropertyIsIndexed: CFString
A Boolean value that indicates whether the image contains indexed pixel samples.
Overview
Topics
Dictionary
Container File Size
Image Information
Image I/O / Image Properties
API Collection
Image Properties
Properties that apply to the container in general, and not necessarily to an
individual image in the container.


## Page 2

let kCGImagePropertyImages: CFString
An array of dictionaries, each of which contains metadata for one of the images in the file.
let kCGImagePropertyThumbnailImages: CFString
let kCGImagePropertyPrimaryImage: CFString
The index of the primary image in the file.
let kCGImagePropertyIsFloat: CFString
A Boolean value that indicates whether the image contains floating-point pixel samples.
let kCGImagePropertyOrientation: CFString
The intended display orientation of the image.
Individual Image Properties
Properties that apply to an individual image in an image source.
enum CGImagePropertyOrientation
A value describing the intended display orientation for an image.
let kCGImagePropertyPixelFormat: CFString
The format of the image’s individual pixels.
let kCGImagePropertyPixelWidth: CFString
The number of pixels along the x-axis of the image.
let kCGImagePropertyPixelHeight: CFString
The number of pixels along the y-axis of the image.
let kCGImagePropertyDPIHeight: CFString
The resolution, in dots per inch, in the y dimension.
let kCGImagePropertyDPIWidth: CFString
The resolution, in dots per inch, in the x dimension.
let kCGImagePropertyDepth: CFString
The number of bits in the color sample of a pixel.
Pixel Information
Color Information


## Page 3

let kCGImagePropertyHasAlpha: CFString
A Boolean value that indicates whether the image has an alpha channel.
let kCGImagePropertyNamedColorSpace: CFString
The name of the image’s color space.
let kCGImagePropertyProfileName: CFString
The name of the optional International Color Consortium (ICC) profile embedded in the imag
if known.
let kCGImagePropertyColorModel: CFString
The color model of the image, such as RGB, CMYK, grayscale, or Lab.
let kCGImagePropertyColorModelRGB: CFString
A Red Green Blue (RGB) color model.
let kCGImagePropertyColorModelCMYK: CFString
A Cyan Magenta Yellow Black (CMYK) color model.
let kCGImagePropertyColorModelGray: CFString
A grayscale color model.
let kCGImagePropertyColorModelLab: CFString
A Lab color model, where color values contain the amount of light and the amounts of four
human-perceivable colors.
EXIF Dictionary Keys
Metadata keys for Exchangeable Image File Format (EXIF) data.
IPTC Dictionary Keys
Metadata keys for International Press Telecommunications Council (IPTC) data.
GPS Dictionary Keys
Keys for Global Positioning System (GPS) information.
WebP Data
See Also
Common Image Properties


## Page 4

Metadata keys for WebP metadata.


