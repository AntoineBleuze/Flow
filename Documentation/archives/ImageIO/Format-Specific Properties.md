# Format-Specific Properties.pdf

## Page 1

let kCGImagePropertyCIFFDictionary: CFString
A dictionary of key-value pairs for an image that uses Camera Image File Format (CIFF).
let kCGImagePropertyCIFFDescription: CFString
The camera description.
let kCGImagePropertyCIFFImageName: CFString
The image name.
let kCGImagePropertyCIFFImageFileName: CFString
The image file name.
let kCGImagePropertyCIFFImageSerialNumber: CFString
The image serial number.
let kCGImagePropertyCIFFWhiteBalanceIndex: CFString
The white balance index.
let kCGImagePropertyCIFFFlashExposureComp: CFString
Topics
Dictionary
Image Details
Exposure
Image I/O / CIFF Image Properties
API Collection
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.


## Page 2

The flash exposure compensation.
let kCGImagePropertyCIFFMeasuredEV: CFString
The measured exposure value.
let kCGImagePropertyCIFFMeteringMode: CFString
The metering mode.
let kCGImagePropertyCIFFReleaseTiming: CFString
The priority for shutter release timing—shutter or focus.
let kCGImagePropertyCIFFSelfTimingTime: CFString
The time in milliseconds until shutter release when using the self-timer.
let kCGImagePropertyCIFFReleaseMethod: CFString
The method of shutter release—single-shot or continuous.
let kCGImagePropertyCIFFContinuousDrive: CFString
The continuous drive mode.
let kCGImagePropertyCIFFShootingMode: CFString
The shooting mode.
let kCGImagePropertyCIFFFocusMode: CFString
The focus mode.
let kCGImagePropertyCIFFLensMaxMM: CFString
The maximum lens length in millimeters.
let kCGImagePropertyCIFFLensMinMM: CFString
The minimum lens length in millimeters.
let kCGImagePropertyCIFFLensModel: CFString
The lens model.
let kCGImagePropertyCIFFFirmware: CFString
Shutter Information
Lens and Focus
Camera Information


## Page 3

The firmware version of the camera.
let kCGImagePropertyCIFFOwnerName: CFString
The name of the camera’s owner.
let kCGImagePropertyCIFFCameraSerialNumber: CFString
The camera serial number.
let kCGImagePropertyCIFFRecordID: CFString
The number of images taken since the camera shipped.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 4

For more information about the DNG format, see Digital Negative (DNG) Specification at
www.adobe.com.
let kCGImagePropertyDNGDictionary: CFString
A dictionary of key-value pairs for an image that uses the Digital Negative (DNG) archival
format.
let kCGImagePropertyDNGBaselineSharpness: CFString
The amount of sharpening required for this camera model.
let kCGImagePropertyDNGLinearResponseLimit: CFString
The fraction of the encoding range, above which the response may become significantly non
linear.
let kCGImagePropertyDNGChromaBlurRadius: CFString
A hint to the DNG reader about how much chroma blur to apply to the image.
let kCGImagePropertyDNGAntiAliasStrength: CFString
Overview
Topics
Dictionary
Quality
Image I/O / DNG Image Properties
API Collection
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.


## Page 5

A hint to the DNG reader about how strong the camera’s antialias filter is.
let kCGImagePropertyDNGShadowScale: CFString
A tag that Adobe Camera Raw uses to control the sensitivity of its Shadows slider.
let kCGImagePropertyDNGBestQualityScale: CFString
The scale factor to apply to the default scale to achieve the best quality image size.
let kCGImagePropertyDNGDefaultScale: CFString
The default scale factors for each direction to convert the image to square pixels.
let kCGImagePropertyDNGLinearizationTable: CFString
A lookup table that maps stored values into linear values.
let kCGImagePropertyDNGBaselineExposure: CFString
The amount by which to adjust the zero point of the exposure, specified in EV units.
let kCGImagePropertyDNGBaselineNoise: CFString
The relative noise level of the camera model at an ISO of 100.
let kCGImagePropertyDNGBaselineExposureOffset: CFString
The amount of EV units to add to the baseline exposure during image rendering.
let kCGImagePropertyDNGAnalogBalance: CFString
The analog or digital gain that applies to the stored raw values.
let kCGImagePropertyDNGAsShotNeutral: CFString
The selected white balance at the time of capture, encoded as the coordinates of a neutral
color in linear reference space values.
let kCGImagePropertyDNGAsShotWhiteXY: CFString
The selected white balance at the time of capture, encoded as x-y chromaticity coordinates
let kCGImagePropertyDNGBayerGreenSplit: CFString
A value that specifies how closely green pixels in the blue/green rows track the green pixels 
red/green rows.
let kCGImagePropertyDNGForwardMatrix1: CFString
Exposure
Color Balance


## Page 6

A matrix that maps white balanced camera colors to XYZ D50 colors.
let kCGImagePropertyDNGForwardMatrix2: CFString
A matrix that maps white balanced camera colors to XYZ D50 colors.
let kCGImagePropertyDNGDefaultBlackRender: CFString
A hint to the raw converter about how to handle the black point during rendering.
let kCGImagePropertyDNGBlackLevelRepeatDim: CFString
The repeat pattern size for the black level tag.
let kCGImagePropertyDNGBlackLevel: CFString
The zero light encoding level, specified as a repeating pattern.
let kCGImagePropertyDNGBlackLevelDeltaH: CFString
The difference between the zero-light encoding level for each column and the baseline zero
light encoding level.
let kCGImagePropertyDNGBlackLevelDeltaV: CFString
The difference between the zero-light encodoing level for each row and the baseline zero-
light encoding level.
let kCGImagePropertyDNGWhiteLevel: CFString
The saturated encoding level for the raw sample values.
let kCGImagePropertyDNGCalibrationIlluminant1: CFString
The illuminant for the first set of color calibration tags.
let kCGImagePropertyDNGCalibrationIlluminant2: CFString
The illuminant for an optional second set of color calibration tags.
let kCGImagePropertyDNGColorMatrix1: CFString
A transformation matrix that converts XYZ values to reference camera native color spaces,
under the first calibration illuminant.
let kCGImagePropertyDNGColorMatrix2: CFString
A transformation matrix that converts XYZ values to reference camera native color spaces,
under the second calibration illuminant.
let kCGImagePropertyDNGCameraCalibration1: CFString
Color Calibration


## Page 7

A matrix that transforms reference camera native space values to camera-native space value
under the first calibration illuminant.
let kCGImagePropertyDNGCameraCalibration2: CFString
A matrix that transforms reference camera native space values to camera-native space value
under the second calibration illuminant.
let kCGImagePropertyDNGReductionMatrix1: CFString
A reduction matrix that converts color camera-native space values to XYZ values, under the
first calibration illuminant.
let kCGImagePropertyDNGReductionMatrix2: CFString
A reduction matrix that converts color camera-native space values to XYZ values, under the
second calibration illuminant.
let kCGImagePropertyDNGAsShotICCProfile: CFString
A profile that specifies default color rendering from camera color-space coordinates into the
ICC profile space.
let kCGImagePropertyDNGAsShotPreProfileMatrix: CFString
A matrix to apply to the camera color-space coordinates before processing values through t
ICC profile.
let kCGImagePropertyDNGCurrentICCProfile: CFString
A profile that specifies default color rendering from camera color-space coordinates into the
ICC profile space.
let kCGImagePropertyDNGCurrentPreProfileMatrix: CFString
A matrix to apply to the current camera color-space coordinates before processing values
through the ICC profile.
let kCGImagePropertyDNGColorimetricReference: CFString
The colorimetric reference for the CIE XYZ values.
let kCGImagePropertyDNGCameraCalibrationSignature: CFString
A string to match against the profile calibration signature for the selected camera profile.
let kCGImagePropertyDNGProfileCalibrationSignature: CFString
A string that describes the calibration for the current profile.
let kCGImagePropertyDNGActiveArea: CFString
Crop Data


## Page 8

The rectangle that defines the non-masked pixels of the sensor.
let kCGImagePropertyDNGMaskedAreas: CFString
A list of non-overlapping rectangles that contain fully masked pixels in the image.
let kCGImagePropertyDNGDefaultCropOrigin: CFString
The origin of the final image area, relative to the top-left corner of the active area rectangle.
let kCGImagePropertyDNGDefaultCropSize: CFString
The size of the final image area, in raw image coordinates.
let kCGImagePropertyDNGDefaultUserCrop: CFString
A default user-crop rectangle in relative coordinates.
let kCGImagePropertyDNGOriginalRawFileName: CFString
The file name of the original raw file.
let kCGImagePropertyDNGOriginalRawFileData: CFString
The compressed contents of the original raw file.
let kCGImagePropertyDNGNoiseReductionApplied: CFString
The amount of noise reduction applied to the raw data on a scale of 0.0 to 1.0.
let kCGImagePropertyDNGNewRawImageDigest: CFString
An MD5 digest of the raw image data.
let kCGImagePropertyDNGOriginalRawFileDigest: CFString
An MD5 digest of the data stored for the original raw file data.
let kCGImagePropertyDNGRawImageDigest: CFString
A modified MD5 digest of the raw image data.
let kCGImagePropertyDNGOriginalDefaultFinalSize: CFString
THe default final size of the larger original file that was the source of this proxy.
let kCGImagePropertyDNGOriginalBestQualityFinalSize: CFString
The best-quality final size of the larger original file that was the source of this proxy.
let kCGImagePropertyDNGOriginalDefaultCropSize: CFString
The default crop size of the larger original file that was the source of this proxy.
RAW Data


## Page 9

let kCGImagePropertyDNGRawToPreviewGain: CFString
The gain between the main raw IFD and the preview IFD that contains this tag.
let kCGImagePropertyDNGNoiseProfile: CFString
The amount of noise in the raw image.
let kCGImagePropertyDNGCFALayout: CFString
The spatial layout of the CFA.
let kCGImagePropertyDNGCFAPlaneColor: CFString
A mapping between the values in the CFA pattern tag and the plane numbers in linear raw
space.
let kCGImagePropertyDNGOpcodeList1: CFString
The list of opcodes to apply to the raw image, as read directly from the file.
let kCGImagePropertyDNGOpcodeList2: CFString
THe list of opcodes to apply to the raw image, after mapping it to linear reference values.
let kCGImagePropertyDNGOpcodeList3: CFString
The list of opcodes to apply to the raw image, after demosaicing it.
let kCGImagePropertyDNGWarpRectilinear: CFString
An opcode to apply a warp to an image to correct for geometric distortion and lateral
chromatic aberration for rectilinear lenses.
let kCGImagePropertyDNGWarpFisheye: CFString
An opcode to unwrap an image captued with a fisheye lens and map it to a perspective
projection.
let kCGImagePropertyDNGFixVignetteRadial: CFString
An opcode to apply a gain function to an image to correct vignetting.
let kCGImagePropertyDNGPrivateData: CFString
Private data that manufacturers may store with an image and use in their own converters.
let kCGImagePropertyDNGMakerNoteSafety: CFString
A Boolean value that tells the DNG reader whether the EXIF MakerNote tag is safe to preserv
let kCGImagePropertyDNGRawDataUniqueID: CFString
A 16-byte unique identifier for the raw image data.
Image File Data


## Page 10

let kCGImagePropertyDNGSubTileBlockSize: CFString
The size of rectangular blocks that tiles use to group pixels.
let kCGImagePropertyDNGRowInterleaveFactor: CFString
The number of interleaved fields for the rows of the image.
let kCGImagePropertyDNGBackwardVersion: CFString
The oldest version for which a file is compatible.
let kCGImagePropertyDNGVersion: CFString
An encoding of the four-tier version number.
let kCGImagePropertyDNGExtraCameraProfiles: CFString
A list of file offsets to extra camera profiles.
let kCGImagePropertyDNGAsShotProfileName: CFString
A string containing the name of the “as shot” camera profile, if any.
let kCGImagePropertyDNGProfileHueSatMapDims: CFString
The number of input samples in each dimension of the hue/saturation/value mapping tables.
let kCGImagePropertyDNGProfileHueSatMapData1: CFString
The data for the first hue/saturation/value mapping table.
let kCGImagePropertyDNGProfileHueSatMapData2: CFString
The data for the second hue/saturation/value mapping table.
let kCGImagePropertyDNGProfileHueSatMapEncoding: CFString
The encoding option to use when indexing into a 3D look table during raw conversion.
let kCGImagePropertyDNGProfileToneCurve: CFString
The default tone curve to apply when processing the image as a starting point for user
adjustments.
let kCGImagePropertyDNGProfileName: CFString
A string containing the name of the camera profile.
let kCGImagePropertyDNGProfileEmbedPolicy: CFString
The usage rules for the camera profile.
let kCGImagePropertyDNGProfileCopyright: CFString
Profile Data


## Page 11

The copyright information for the camera profile.
let kCGImagePropertyDNGProfileLookTableDims: CFString
The number of input samples in each dimentsion of a default “look” table.
let kCGImagePropertyDNGProfileLookTableData: CFString
The default “look” table to apply when processing the image as a starting point for user
adjustment.
let kCGImagePropertyDNGProfileLookTableEncoding: CFString
The encoding option to use when indexing into a 3D look table during raw conversion.
let kCGImagePropertyDNGPreviewApplicationName: CFString
The name of the app that created the preview stored in the IFD.
let kCGImagePropertyDNGPreviewApplicationVersion: CFString
The version number of the app that created the preview stored in the IFD.
let kCGImagePropertyDNGPreviewSettingsName: CFString
The name of the conversion settings for the preview.
let kCGImagePropertyDNGPreviewSettingsDigest: CFString
A unique ID of the conversion settings used to render the preview.
let kCGImagePropertyDNGPreviewColorSpace: CFString
The color space associated with the rendered preview.
let kCGImagePropertyDNGPreviewDateTime: CFString
The date and time for the render of the preview.
let kCGImagePropertyDNGLensInfo: CFString
Information about the lens used for the image.
let kCGImagePropertyDNGUniqueCameraModel: CFString
A unique, nonlocalized name for the camera model.
let kCGImagePropertyDNGLocalizedCameraModel: CFString
The localized camera model name.
Preview
Camera Details


## Page 12

let kCGImagePropertyDNGCameraSerialNumber: CFString
The camera serial number.
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 13

let kCGImagePropertyGIFDictionary: CFString
A dictionary of key-value pairs for an image that uses Graphics Interchange Format (GIF).
let kCGImagePropertyGIFCanvasPixelHeight: CFString
The height of the main image, in pixels.
let kCGImagePropertyGIFCanvasPixelWidth: CFString
The width of the main image, in pixels.
let kCGImagePropertyGIFHasGlobalColorMap: CFString
A Boolean value that indicates whether the GIF has a global color map.
let kCGImagePropertyGIFImageColorMap: CFString
The image color map.
let kCGImagePropertyGIFFrameInfoArray: CFString
An array of dictionaries that contain timing information for the image sequence.
let kCGImagePropertyGIFDelayTime: CFString
Topics
Dictionary
Image Properties
Sequence Timing
Image I/O / GIF Image Properties
API Collection
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).


## Page 14

The number of seconds to wait before displaying the next image in an animated sequence,
clamped to a minimum of 100 milliseconds.
let kCGImagePropertyGIFUnclampedDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImagePropertyGIFLoopCount: CFString
The number of times to repeat an animated sequence.
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 15

let kCGImagePropertyHEICSDictionary: CFString
A dictionary of properties related to an HEIC container.
let kCGImagePropertyHEICSCanvasPixelHeight: CFString
The height of the main image, in pixels.
let kCGImagePropertyHEICSCanvasPixelWidth: CFString
The width of the main image, in pixels.
let kCGImagePropertyNamedColorSpace: CFString
The name of the image’s color space.
let kCGImagePropertyHEICSFrameInfoArray: CFString
An array of dictionaries that contain timing information for the image sequence.
let kCGImagePropertyHEICSDelayTime: CFString
The number of seconds to wait before displaying the next image in the sequence, clamped t
a minimum of 0.1 seconds.
Topics
Dictionary
Image Properties
Sequence Timing
Image I/O / HEIC Image Properties
API Collection
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.


## Page 16

let kCGImagePropertyHEICSUnclampedDelayTime: CFString
The unclamped number of seconds to wait before displaying the next image in the sequence
let kCGImagePropertyHEICSLoopCount: CFString
The number of times to play the sequence.
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 17

let kCGImagePropertyJFIFDictionary: CFString
A dictionary of key-value pairs for an image that uses JPEG File Interchange Format (JFIF).
let kCGImagePropertyJFIFXDensity: CFString
The x pixel density.
let kCGImagePropertyJFIFYDensity: CFString
The y pixel density.
let kCGImagePropertyJFIFDensityUnit: CFString
The units for the x and y density fields.
let kCGImagePropertyJFIFIsProgressive: CFString
Whether there are versions of the image of increasing quality.
let kCGImagePropertyJFIFVersion: CFString
The version of JFIF.
Topics
Dictionary
Quality Information
Version Information
Image I/O / JFIF Image Properties
API Collection
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).


## Page 18

CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 19

let kCGImagePropertyPNGDictionary: CFString
A dictionary of key-value pairs for an image that uses Portable Network Graphics (PNG)
format.
let kCGImagePropertyPNGSource: CFString
let kCGImagePropertyAPNGCanvasPixelHeight: CFString
The height of the main image, in pixels.
let kCGImagePropertyAPNGCanvasPixelWidth: CFString
The width of the main image, in pixels.
let kCGImagePropertyPNGXPixelsPerMeter: CFString
The number of x pixels per meter.
let kCGImagePropertyPNGYPixelsPerMeter: CFString
The number of y pixels per meter.
let kCGImagePropertyPNGGamma: CFString
The gamma value.
Topics
Dictionary
Properties
Image Properties
Image I/O / PNG Image Properties
API Collection
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.


## Page 20

let kCGImagePropertyPNGInterlaceType: CFString
The interlace type.
let kCGImagePropertyPNGsRGBIntent: CFString
The sRGB intent.
let kCGImagePropertyPNGChromaticities: CFString
The chromaticities.
let kCGImagePropertyAPNGFrameInfoArray: CFString
An array of dictionaries that contain timing information for the image sequence.
let kCGImagePropertyAPNGDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImagePropertyAPNGUnclampedDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImagePropertyAPNGLoopCount: CFString
The number of times that an animated PNG should play through its frames before stopping.
let kCGImagePropertyPNGTitle: CFString
A string that holds the image’s title.
let kCGImagePropertyPNGDescription: CFString
A string that describes the image.
let kCGImagePropertyPNGComment: CFString
A string that contains image comments.
let kCGImagePropertyPNGDisclaimer: CFString
A disclaimer string.
let kCGImagePropertyPNGWarning: CFString
A warning string.
let kCGImagePropertyPNGAuthor: CFString
A string that identifies the author of the image.
Sequence Timing
Descriptive Information


## Page 21

let kCGImagePropertyPNGCopyright: CFString
A string that identifies the copyright of the image.
let kCGImagePropertyPNGCreationTime: CFString
A string that identifies the date and time the image was created.
let kCGImagePropertyPNGModificationTime: CFString
A string that identifies the last date and time the image was modified.
let kCGImagePropertyPNGSoftware: CFString
A string that identifies the software used to create the image.
let kCGImagePropertyPNGCompressionFilter: CFString
The PNG filter to apply prior to compression.
var IMAGEIO_PNG_NO_FILTERS: Int32
No PNG filters.
var IMAGEIO_PNG_FILTER_NONE: Int32
A filter in which each byte is unchanged.
var IMAGEIO_PNG_FILTER_SUB: Int32
A filter in which each byte is replaced with the difference between it and the corresponding
byte to its left.
var IMAGEIO_PNG_FILTER_UP: Int32
A filter in which each byte is replaced with the difference between it and the byte above it.
var IMAGEIO_PNG_FILTER_AVG: Int32
A filter in which each byte is replaced with the difference between it and the average of the
bytes above it and to its left.
var IMAGEIO_PNG_FILTER_PAETH: Int32
A filter in which each byte is replaced with the difference between it and the Paeth predictor
of the bytes to its left, above, and upper left.
Pre-Compression Filters
See Also


## Page 22

CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
Format-Specific Properties


## Page 23

let kCGImagePropertyTGADictionary: CFString
let kCGImagePropertyTGACompression: CFString
enum CGImagePropertyTGACompression
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Topics
Dictionary Key
Compression
See Also
Format-Specific Properties
Image I/O / TGA Image Properties
API Collection
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.


## Page 24

Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.


## Page 25

let kCGImagePropertyTIFFDictionary: CFString
A dictionary of key-value pairs for an image that uses Tagged Image File Format (TIFF).
let kCGImagePropertyTIFFCompression: CFString
The compression scheme used on the image data.
let kCGImagePropertyTIFFPhotometricInterpretation: CFString
The color space of the image data.
let kCGImagePropertyTIFFTransferFunction: CFString
The transfer function, in tabular format, used to map pixel components from a nonlinear form
into a linear form.
let kCGImagePropertyTIFFOrientation: CFString
The image orientation.
let kCGImagePropertyTIFFXResolution: CFString
The number of pixels per resolution unit in the image width direction.
Topics
Dictionary
Image Quality
Canvas Details
Image I/O / TIFF Image Properties
API Collection
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).


## Page 26

let kCGImagePropertyTIFFYResolution: CFString
The number of pixels per resolution unit in the image height direction.
let kCGImagePropertyTIFFResolutionUnit: CFString
The units of resolution.
let kCGImagePropertyTIFFWhitePoint: CFString
The white point of the image.
let kCGImagePropertyTIFFPrimaryChromaticities: CFString
The chromaticities of the primaries of the image.
let kCGImagePropertyTIFFTileLength: CFString
let kCGImagePropertyTIFFTileWidth: CFString
let kCGImagePropertyTIFFDocumentName: CFString
The document name.
let kCGImagePropertyTIFFImageDescription: CFString
The image description.
let kCGImagePropertyTIFFArtist: CFString
The artist who created the image.
let kCGImagePropertyTIFFCopyright: CFString
Copyright information.
let kCGImagePropertyTIFFDateTime: CFString
The date and time that the image was created.
let kCGImagePropertyTIFFMake: CFString
The name of the manufacturer of the camera or input device.
let kCGImagePropertyTIFFModel: CFString
The camera or input device model.
let kCGImagePropertyTIFFSoftware: CFString
The name and version of the software used for image creation.
let kCGImagePropertyTIFFHostComputer: CFString
Descriptive Information


## Page 27

The computer or operating system used when the image was created.
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.
See Also
Format-Specific Properties


## Page 28

let kCGImageProperty8BIMDictionary: CFString
A dictionary of key-value pairs for an Adobe Photoshop image.
let kCGImageProperty8BIMLayerNames: CFString
The layer names for an Adobe Photoshop file.
let kCGImageProperty8BIMVersion: CFString
The Adobe Photoshop file version.
CIFF Image Properties
Metadata keys for the Camera Image File Format (CIFF) image format.
DNG Image Properties
Metadata keys for the Digital Negative (DNG) archival format.
Topics
Dictionary
File Information
See Also
Format-Specific Properties
Image I/O / 8BIM Image Properties
API Collection
8BIM Image Properties
Metadata keys for the Adobe Photoshop image format.


## Page 29

GIF Image Properties
Metadata keys for the Graphics Interchange Format (GIF).
HEIC Image Properties
Metadata keys for the High Efficiency Image Container (HEIC) format.
JFIF Image Properties
Metadata keys for the JPEG File Interchange Format (JFIF).
PNG Image Properties
Metadata keys for the Portable Network Graphics (PNG) format.
TGA Image Properties
Metadata keys for the Truevision Graphics Adapter (TGA) format.
TIFF Image Properties
Metadata keys for the Tagged Image File Format (TIFF).


