# Common Image Properties.pdf

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


## Page 5

let kCGImagePropertyExifDictionary: CFString
A dictionary of key-value pairs for an image that uses Exchangeable Image File Format (EXIF
let kCGImagePropertyExifAuxDictionary: CFString
An auxiliary dictionary of key-value pairs for an image that uses Exchangeable Image File
Format (EXIF).
let kCGImagePropertyExifDeviceSettingDescription: CFString
For a particular camera mode, indicates the conditions for taking the picture.
let kCGImagePropertyExifFNumber: CFString
The F-number.
let kCGImagePropertyExifShutterSpeedValue: CFString
The shutter speed value.
let kCGImagePropertyExifApertureValue: CFString
The aperture value.
let kCGImagePropertyExifMaxApertureValue: CFString
The maximum aperture value.
Topics
Dictionaries
Camera Settings
Image I/O / EXIF Dictionary Keys
API Collection
EXIF Dictionary Keys
Metadata keys for Exchangeable Image File Format (EXIF) data.


## Page 6

let kCGImagePropertyExifFocalLength: CFString
The focal length.
let kCGImagePropertyExifSpectralSensitivity: CFString
The spectral sensitivity of each channel.
let kCGImagePropertyExifISOSpeedRatings: CFString
The ISO speed ratings.
let kCGImagePropertyExifSubjectDistance: CFString
The distance to the subject, in meters.
let kCGImagePropertyExifMeteringMode: CFString
The metering mode.
let kCGImagePropertyExifSubjectArea: CFString
The subject area.
let kCGImagePropertyExifSubjectLocation: CFString
The location of the image’s primary subject.
let kCGImagePropertyExifSensingMethod: CFString
The sensor type of the camera or input device.
let kCGImagePropertyExifSceneType: CFString
The scene type.
let kCGImagePropertyExifDigitalZoomRatio: CFString
The digital zoom ratio.
let kCGImagePropertyExifFocalLenIn35mmFilm: CFString
The equivalent focal length in 35 mm film.
let kCGImagePropertyExifSceneCaptureType: CFString
The scene capture type; for example, standard, landscape, portrait, or night.
let kCGImagePropertyExifSubjectDistRange: CFString
The distance to the subject.
let kCGImagePropertyExifExposureTime: CFString
The exposure time.
Exposure


## Page 7

let kCGImagePropertyExifExposureProgram: CFString
The exposure program.
let kCGImagePropertyExifExposureIndex: CFString
The selected exposure index.
let kCGImagePropertyExifExposureMode: CFString
The exposure mode setting.
let kCGImagePropertyExifISOSpeed: CFString
The ISO speed setting used to capture the image.
let kCGImagePropertyExifISOSpeedLatitudeyyy: CFString
The ISO speed latitude yyy value.
let kCGImagePropertyExifISOSpeedLatitudezzz: CFString
The ISO speed latitude zzz value.
let kCGImagePropertyExifRecommendedExposureIndex: CFString
The recommended exposure index.
let kCGImagePropertyExifExposureBiasValue: CFString
The exposure bias value.
let kCGImagePropertyExifSensitivityType: CFString
The type of sensitivity data stored for the image.
let kCGImagePropertyExifStandardOutputSensitivity: CFString
The sensitivity data for the image.
let kCGImagePropertyExifSourceExposureTimesOfCompositeImage: CFString
The exposure times for composite images.
let kCGImagePropertyExifCFAPattern: CFString
The color filter array (CFA) pattern, which is the geometric pattern of the image sensor for a 
chip color sensor area.
let kCGImagePropertyExifBrightnessValue: CFString
The brightness value.
let kCGImagePropertyExifLightSource: CFString
Image Quality


## Page 8

The light source.
let kCGImagePropertyExifFlash: CFString
The flash status when the image was shot.
let kCGImagePropertyExifSpatialFrequencyResponse: CFString
The spatial frequency table and spatial frequency response values in the width, height, and
diagonal directions.
let kCGImagePropertyExifContrast: CFString
The contrast setting.
let kCGImagePropertyExifSaturation: CFString
The saturation setting.
let kCGImagePropertyExifSharpness: CFString
The sharpness setting.
let kCGImagePropertyExifGamma: CFString
The gamma setting.
let kCGImagePropertyExifWhiteBalance: CFString
The white balance mode.
let kCGImagePropertyExifGainControl: CFString
The gain adjustment setting.
let kCGImagePropertyExifImageUniqueID: CFString
The unique ID of the image.
let kCGImagePropertyExifCompressedBitsPerPixel: CFString
The bits per pixel of the compression mode.
let kCGImagePropertyExifColorSpace: CFString
The color space.
let kCGImagePropertyExifPixelXDimension: CFString
The x dimension of a pixel.
let kCGImagePropertyExifPixelYDimension: CFString
The y dimension of a pixel.
Image Settings


## Page 9

let kCGImagePropertyExifRelatedSoundFile: CFString
A sound file related to the image.
let kCGImagePropertyExifFocalPlaneXResolution: CFString
The number of image-width pixels (x-axis) per focal plane resolution unit.
let kCGImagePropertyExifFocalPlaneYResolution: CFString
The number of image-height pixels (y-axis) per focal plane resolution unit.
let kCGImagePropertyExifFocalPlaneResolutionUnit: CFString
The unit of measurement for the focal plane x and y resolutions.
let kCGImagePropertyExifCustomRendered: CFString
Special rendering performed on the image data.
let kCGImagePropertyExifCompositeImage: CFString
let kCGImagePropertyExifOECF: CFString
The opto-electric conversion function (OECF) that defines the relationship between the
optical input of the camera and the resulting image.
let kCGImagePropertyExifComponentsConfiguration: CFString
The components configuration for compressed data.
let kCGImagePropertyExifSourceImageNumberOfCompositeImage: CFString
The number of images that make up a composite image.
let kCGImagePropertyExifFileSource: CFString
The image source.
let kCGImagePropertyExifDateTimeOriginal: CFString
The original date and time.
let kCGImagePropertyExifDateTimeDigitized: CFString
The digitized date and time.
let kCGImagePropertyExifSubsecTime: CFString
The fraction of seconds for the date and time tag.
let kCGImagePropertyExifSubsecTimeOrginal: CFString
The fraction of seconds for the original date and time tag.
Timestamp


## Page 10

Deprecated
let kCGImagePropertyExifSubsecTimeOriginal: CFString
The fraction of seconds for the original date and time tag.
let kCGImagePropertyExifSubsecTimeDigitized: CFString
The fraction of seconds for the digitized date and time tag.
let kCGImagePropertyExifOffsetTime: CFString
let kCGImagePropertyExifOffsetTimeOriginal: CFString
let kCGImagePropertyExifOffsetTimeDigitized: CFString
let kCGImagePropertyExifLensSpecification: CFString
The specification information for the camera lens.
let kCGImagePropertyExifLensMake: CFString
A string with the name of the lens manufacturer.
let kCGImagePropertyExifLensModel: CFString
A string with the lens model information.
let kCGImagePropertyExifLensSerialNumber: CFString
A string with the lens’s serial number.
let kCGImagePropertyExifMakerNote: CFString
Information specified by the camera manufacturer.
let kCGImagePropertyExifUserComment: CFString
A user comment.
let kCGImagePropertyExifCameraOwnerName: CFString
A string with the name of the camera’s owner.
let kCGImagePropertyExifBodySerialNumber: CFString
A string with the serial number of the camera.
Lens Information
Camera Information
Flash Information


## Page 11

let kCGImagePropertyExifFlashPixVersion: CFString
The FlashPix version supported by an FPXR file.
let kCGImagePropertyExifFlashEnergy: CFString
The strobe energy when the image was captured, in beam candle power seconds.
let kCGImagePropertyExifAuxLensInfo: CFString
Lens information.
let kCGImagePropertyExifAuxLensModel: CFString
The lens model.
let kCGImagePropertyExifAuxSerialNumber: CFString
The serial number.
let kCGImagePropertyExifAuxLensID: CFString
The lens ID.
let kCGImagePropertyExifAuxLensSerialNumber: CFString
The lens serial number.
let kCGImagePropertyExifAuxImageNumber: CFString
The image number.
let kCGImagePropertyExifAuxFlashCompensation: CFString
Flash compensation.
let kCGImagePropertyExifAuxOwnerName: CFString
The owner name.
let kCGImagePropertyExifAuxFirmware: CFString
Firmware information.
let kCGImagePropertyExifVersion: CFString
The EXIF version.
Auxiliary Keys
EXIF Format


## Page 12

Image Properties
Properties that apply to the container in general, and not necessarily to an individual image i
the container.
IPTC Dictionary Keys
Metadata keys for International Press Telecommunications Council (IPTC) data.
GPS Dictionary Keys
Keys for Global Positioning System (GPS) information.
WebP Data
Metadata keys for WebP metadata.
See Also
Common Image Properties


## Page 13

IPTC constants are metadata elements of the Information Interchange Model (IIM) used to provide
information about images. The IIM was developed by the Newspaper Association of America (NAA
and the IPTC.
let kCGImagePropertyIPTCDictionary: CFString
A dictionary of key-value pairs for an image that uses International Press Telecommunication
Council (IPTC) metadata.
let kCGImagePropertyIPTCUrgency: CFString
The urgency level.
let kCGImagePropertyIPTCSubjectReference: CFString
The subject.
let kCGImagePropertyIPTCCategory: CFString
The category.
let kCGImagePropertyIPTCSupplementalCategory: CFString
Overview
Topics
Dictionary
Image Categorization
Image I/O / IPTC Dictionary Keys
API Collection
IPTC Dictionary Keys
Metadata keys for International Press Telecommunications Council (IPTC) data.


## Page 14

A supplemental category.
let kCGImagePropertyIPTCFixtureIdentifier: CFString
A fixture identifier.
let kCGImagePropertyIPTCKeywords: CFString
Keywords relevant to the image.
let kCGImagePropertyIPTCContentLocationCode: CFString
The content location code.
let kCGImagePropertyIPTCContentLocationName: CFString
The content location name.
let kCGImagePropertyIPTCEditStatus: CFString
The edit status.
let kCGImagePropertyIPTCEditorialUpdate: CFString
An editorial update.
let kCGImagePropertyIPTCObjectCycle: CFString
The editorial cycle (morning, evening, or both) of the image.
let kCGImagePropertyIPTCImageType: CFString
The image type.
let kCGImagePropertyIPTCImageOrientation: CFString
The image orientation (portrait, landscape, or square).
let kCGImagePropertyIPTCLanguageIdentifier: CFString
The language identifier, a two-letter code defined by ISO 639:1988.
let kCGImagePropertyIPTCCaptionAbstract: CFString
The description of the image.
let kCGImagePropertyIPTCHeadline: CFString
A summary of the contents of the image.
let kCGImagePropertyIPTCCredit: CFString
The name of the service that provided the image.
Image Information


## Page 15

let kCGImagePropertyIPTCStarRating: CFString
The star rating.
let kCGImagePropertyIPTCScene: CFString
The scene codes for the image; a scene code is a six-digit string.
let kCGImagePropertyIPTCCopyrightNotice: CFString
The copyright notice.
let kCGImagePropertyIPTCRightsUsageTerms: CFString
The usage rights for the image.
let kCGImagePropertyIPTCReleaseDate: CFString
The earliest day on which you can use the image, in the form CCYYMMDD.
let kCGImagePropertyIPTCReleaseTime: CFString
The earliest time at which you can use the image, in the form HHMMSS.
let kCGImagePropertyIPTCExpirationDate: CFString
The latest date you can use the image, in the form CCYYMMDD.
let kCGImagePropertyIPTCExpirationTime: CFString
The latest time on the expiration date you can use the image, in the form HHMMSS.
let kCGImagePropertyIPTCSpecialInstructions: CFString
Special instructions about the use of the image.
let kCGImagePropertyIPTCActionAdvised: CFString
The advised action.
let kCGImagePropertyIPTCReferenceService: CFString
The reference service.
let kCGImagePropertyIPTCReferenceDate: CFString
The reference date.
let kCGImagePropertyIPTCReferenceNumber: CFString
The reference number.
Copyright
Release Information


## Page 16

let kCGImagePropertyIPTCDateCreated: CFString
The creation date.
let kCGImagePropertyIPTCTimeCreated: CFString
The creation time.
let kCGImagePropertyIPTCDigitalCreationDate: CFString
The digital creation date.
let kCGImagePropertyIPTCDigitalCreationTime: CFString
The digital creation time.
let kCGImagePropertyIPTCByline: CFString
The name of the person who created the image.
let kCGImagePropertyIPTCBylineTitle: CFString
The title of the person who created the image.
let kCGImagePropertyIPTCSource: CFString
The original owner of the image.
let kCGImagePropertyIPTCContact: CFString
The contact information for getting details about the image.
let kCGImagePropertyIPTCWriterEditor: CFString
The name of the person who wrote or edited the description of the image.
let kCGImagePropertyIPTCCreatorContactInfo: CFString
The creator’s contact info.
IPTC Creator Contact Info Dictionary Keys
Keys for an image that uses International Press Telecommunications Council (IPTC) metadat
let kCGImagePropertyIPTCCity: CFString
The city where the image was created.
let kCGImagePropertyIPTCSubLocation: CFString
The location within the city where the image was created.
Personnel
Location Data


## Page 17

let kCGImagePropertyIPTCProvinceState: CFString
The province or state.
let kCGImagePropertyIPTCCountryPrimaryLocationCode: CFString
The primary country code, a three-letter code defined by ISO 3166-1.
let kCGImagePropertyIPTCCountryPrimaryLocationName: CFString
The primary country name.
let kCGImagePropertyIPTCOriginalTransmissionReference: CFString
The call letter or number combination associated with the originating point of an image.
let kCGImagePropertyIPTCOriginatingProgram: CFString
The originating application.
let kCGImagePropertyIPTCProgramVersion: CFString
The application version.
let kCGImagePropertyIPTCObjectTypeReference: CFString
The object type.
let kCGImagePropertyIPTCObjectAttributeReference: CFString
The object attribute.
let kCGImagePropertyIPTCObjectName: CFString
The object name.
let kCGImageMetadataNamespaceIPTCExtension: CFString
let kCGImageMetadataPrefixIPTCExtension: CFString
Software Program
Object Details
IPTC Extension
See Also


## Page 18

Image Properties
Properties that apply to the container in general, and not necessarily to an individual image i
the container.
EXIF Dictionary Keys
Metadata keys for Exchangeable Image File Format (EXIF) data.
GPS Dictionary Keys
Keys for Global Positioning System (GPS) information.
WebP Data
Metadata keys for WebP metadata.
Common Image Properties


## Page 19

let kCGImagePropertyGPSDictionary: CFString
A dictionary of key-value pairs for an image that has Global Positioning System (GPS)
information.
let kCGImagePropertyGPSLatitude: CFString
The latitude.
let kCGImagePropertyGPSLongitude: CFString
The longitude.
let kCGImagePropertyGPSAltitude: CFString
The altitude.
let kCGImagePropertyGPSLatitudeRef: CFString
An indication of whether the latitude is north or south.
let kCGImagePropertyGPSLongitudeRef: CFString
An indication of whether the longitude is east or west.
let kCGImagePropertyGPSAltitudeRef: CFString
The altitude point of reference.
Topics
Dictionary
GPS Coordinate
Image I/O / GPS Dictionary Keys
API Collection
GPS Dictionary Keys
Keys for Global Positioning System (GPS) information.


## Page 20

let kCGImagePropertyGPSHPositioningError: CFString
The horizontal error in the GPS position.
let kCGImagePropertyGPSDestLatitude: CFString
The latitude of the destination point.
let kCGImagePropertyGPSDestLongitude: CFString
The longitude of the destination point.
let kCGImagePropertyGPSDestBearing: CFString
The bearing to the destination point.
let kCGImagePropertyGPSDestDistance: CFString
The distance to the destination point.
let kCGImagePropertyGPSDestLatitudeRef: CFString
An indication of whether the latitude of the destination point is northern or southern.
let kCGImagePropertyGPSDestLongitudeRef: CFString
An indication of whether the longitude of the destination point is east or west.
let kCGImagePropertyGPSDestBearingRef: CFString
The reference for giving the bearing to the destination point.
let kCGImagePropertyGPSDestDistanceRef: CFString
The units for expressing the distance to the destination point.
let kCGImagePropertyGPSImgDirectionRef: CFString
The reference for the direction of the image.
let kCGImagePropertyGPSImgDirection: CFString
The direction of the image.
let kCGImagePropertyGPSStatus: CFString
The status of the GPS receiver.
Destinations
Image Orientation
Measurement Details


## Page 21

let kCGImagePropertyGPSSatellites: CFString
The satellites used for GPS measurements.
let kCGImagePropertyGPSMeasureMode: CFString
The measurement mode.
let kCGImagePropertyGPSDOP: CFString
The degree of precision (DOP) of the data.
let kCGImagePropertyGPSSpeedRef: CFString
The unit for expressing the GPS receiver’s speed of movement.
let kCGImagePropertyGPSSpeed: CFString
The GPS receiver’s speed of movement.
let kCGImagePropertyGPSTrackRef: CFString
The reference for the direction of GPS receiver’s movement.
let kCGImagePropertyGPSTrack: CFString
The direction of GPS receiver’s movement.
let kCGImagePropertyGPSMapDatum: CFString
The geodetic survey data used by the GPS receiver.
let kCGImagePropertyGPSProcessingMethod: CFString
The name of the method used to find a location.
let kCGImagePropertyGPSAreaInformation: CFString
The name of the GPS area.
let kCGImagePropertyGPSDifferental: CFString
An indication of whether differential correction is applied to the GPS receiver.
let kCGImagePropertyGPSTimeStamp: CFString
The time in UTC (Coordinated Universal Time).
let kCGImagePropertyGPSDateStamp: CFString
The date and time information relative to Coordinated Universal Time (UTC).
Timestamp Information
GPS Version


## Page 22

let kCGImagePropertyGPSVersion: CFString
The GPS version information.
Image Properties
Properties that apply to the container in general, and not necessarily to an individual image i
the container.
EXIF Dictionary Keys
Metadata keys for Exchangeable Image File Format (EXIF) data.
IPTC Dictionary Keys
Metadata keys for International Press Telecommunications Council (IPTC) data.
WebP Data
Metadata keys for WebP metadata.
See Also
Common Image Properties


## Page 23

let kCGImagePropertyWebPDictionary: CFString
A dictionary of properties related to a WebP container.
let kCGImagePropertyWebPCanvasPixelHeight: CFString
The height of the main image, in pixels.
let kCGImagePropertyWebPCanvasPixelWidth: CFString
The width of the main image, in pixels.
let kCGImagePropertyWebPFrameInfoArray: CFString
An array of dictionaries that contain timing information for the image sequence.
let kCGImagePropertyWebPDelayTime: CFString
The number of seconds to wait before displaying the next image in the sequence.
let kCGImagePropertyWebPUnclampedDelayTime: CFString
The unadjusted number of seconds to wait before displaying the next image in the sequence
let kCGImagePropertyWebPLoopCount: CFString
Topics
Dictionary
Image Properties
Sequence Timing
Image I/O / WebP Data
API Collection
WebP Data
Metadata keys for WebP metadata.


## Page 24

The number of times to play the sequence.
Image Properties
Properties that apply to the container in general, and not necessarily to an individual image i
the container.
EXIF Dictionary Keys
Metadata keys for Exchangeable Image File Format (EXIF) data.
IPTC Dictionary Keys
Metadata keys for International Press Telecommunications Council (IPTC) data.
GPS Dictionary Keys
Keys for Global Positioning System (GPS) information.
See Also
Common Image Properties


