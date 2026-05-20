# Colors and Fonts.pdf

## Page 1

CGColor is the fundamental data type used internally by Core Graphics to represent colors.
CGColor objects, and the functions that operate on them, provide a fast and convenient way of
managing and setting colors directly, especially colors that are reused (such as black for text).
A color object contains a set of components (such as red, green, and blue) that uniquely define a
color, and a color space that specifies how those components should be interpreted.
Color objects provide a fast and convenient way to manage and set colors, especially colors that
are used repeatedly. Drawing operations use color objects for setting fill and stroke colors,
managing alpha, and setting color with a pattern.
CGColor is derived from CFTypeRef and inherits the properties that all Core Foundation types
have in common.
func copy() -> CGColor?
Creates a copy of an existing color.
Overview
Topics
Creating Colors
Core Graphics / CGColor
Class
CGColor
A set of components that define a color, with a color space specifying how to
interpret them.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func copy(alpha: CGFloat) -> CGColor?
Creates a copy of an existing color, substituting a new alpha value.
init(genericCMYKCyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black
CGFloat, alpha: CGFloat)
Creates a color in the Generic CMYK color space.
init(gray: CGFloat, alpha: CGFloat)
Creates a color in the Generic gray color space.
init(genericGrayGamma2_2Gray: CGFloat, alpha: CGFloat)
Creates a color in the Generic gray color space with a gamma ramp of 2.2.
init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
Creates a color in the Generic RGB color space.
init(srgbRed: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
Creates a color in the sRGB color space.
init?(colorSpace: CGColorSpace, components: UnsafePointer<CGFloat>)
Creates a color using a list of intensity values (including alpha) and an associated color spac
init?(patternSpace: CGColorSpace, pattern: CGPattern, components: Unsaf
Pointer<CGFloat>)
Creates a color using a list of intensity values (including alpha), a pattern color space, and a
pattern.
class var black: CGColor
The black color in the Generic gray color space.
class var white: CGColor
The white color in the Generic gray color space.
class var clear: CGColor
The clear color in the Generic gray color space.
var alpha: CGFloat
Returns the value of the alpha component associated with a color.
Getting System Colors
Examining a Color


## Page 3

var colorSpace: CGColorSpace?
Returns the color space associated with a color.
var components: [CGFloat]?
Returns the values of the color components (including alpha) associated with a color.
var numberOfComponents: Int
Returns the number of color components (including alpha) associated with a color.
var pattern: CGPattern?
Returns the pattern associated with a color in a pattern color space.
class let conversionTRCSize: CFString
func converted(to: CGColorSpace, intent: CGColorRenderingIntent, option
: CFDictionary?) -> CGColor?
Creates a new color in a different color space that matches the provided color.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for a color data type.
class let conversionBlackPointCompensation: CFString
An option for whether to apply black point compensation when converting between color
profiles.
init?(headroom: Float, colorSpace: CGColorSpace, red: CGFloat, green:
CGFloat, blue: CGFloat, alpha: CGFloat)
var contentHeadroom: Float
Converting Between Color Spaces
Working with Core Foundation Types
Type Properties
Initializers
Instance Properties


## Page 4

Copyable
Equatable
Hashable
Sendable
SendableMetatype
Quartz 2D Programming Guide
class CGColorConversionInfo
An object that describes how to convert between color spaces for use by other system
services.
class CGColorSpace
A profile that specifies how to interpret a color value for display.
class CGFont
A set of character glyphs and layout information for drawing text.
Relationships
Conforms To
See Also
Related Documentation
Colors and Fonts


## Page 5

A CGColorConversionInfo object specifies a conversion between two or more color spaces,
including information about the intent of the conversion. You use color conversion objects to
specify the work to be done by an MPSImageConversion filter, which can then perform GPU-
accelerated image conversion.
init?(src: CGColorSpace, dst: CGColorSpace)
Creates a conversion between two specified color spaces.
init?(optionsSrc: CGColorSpace, dst: CGColorSpace, options: CFDictionar
?)
enum CGColorConversionInfoTransformType
Constants describing how a color conversion uses color spaces.
Overview
Topics
Creating a Color Conversion
Core Graphics / CGColorConversionInfo
Class
CGColorConversionInfo
An object that describes how to convert between color spaces for use by other
system services.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 6

class var typeID: CFTypeID
Returns the Core Foundation type identifier for a color conversion info data type.
func convert(width: Int, height: Int, to: UnsafeMutableRawPointer,
format: CGColorBufferFormat, from: UnsafeRawPointer, format: CGColor
BufferFormat, options: CFDictionary?) -> Bool
init?(src: CGColorSpace, srcHeadroom: Float, dst: CGColorSpace, dst
Headroom: Float, toneMapping: CGToneMapping, options: CFDictionary?,
UnsafeMutablePointer<Unmanaged<CFError>?>?)
Deprecated
Equatable, Hashable
class CGColor
A set of components that define a color, with a color space specifying how to interpret them
class CGColorSpace
A profile that specifies how to interpret a color value for display.
class CGFont
Working with Core Foundation Types
Instance Methods
Initializers
Relationships
Conforms To
See Also
Colors and Fonts


## Page 7

A set of character glyphs and layout information for drawing text.


## Page 8

A color space is multi-dimensional, and each dimension represents a specific color component. F
example, the colors in an RGB color space have three dimensions or components—red, green, and
blue. The intensity of each component is represented by floating point values—their range and
meaning depends on the color space in question.
Different types of devices (scanners, monitors, printers) operate within different color spaces
(RGB, CMYK, grayscale). Additionally, two devices of the same type (for example, color displays
from different manufacturers) may operate within the same kind of color space, yet still produce a
different range of colors, or gamut. Color spaces that are correctly specified ensure that an image
has a consistent appearance regardless of the output device.
Core Graphics supports several kinds of color spaces:
Calibrated color spaces ensure that colors appear the same when displayed on different device
The visual appearance of the color is preserved, as far as the capabilities of the device allow.
Device-dependent color spaces are tied to the system of color representation of a particular
device. Device color spaces are not recommended when high-fidelity color preservation is
important.
Special color spaces—indexed and pattern. An indexed color space contains a color table with
up to 256 entries and a base color space to which the color table entries are mapped. Each ent
in the color table specifies one color in the base color space. A pattern color space is used whe
stroking or filling with a pattern.
Overview
Core Graphics / CGColorSpace
Class
CGColorSpace
A profile that specifies how to interpret a color value for display.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 9

init?(calibratedGrayWhitePoint: UnsafePointer<CGFloat>, blackPoint:
UnsafePointer<CGFloat>?, gamma: CGFloat)
Creates a calibrated grayscale color space.
init?(calibratedRGBWhitePoint: UnsafePointer<CGFloat>, blackPoint:
UnsafePointer<CGFloat>?, gamma: UnsafePointer<CGFloat>?, matrix: Unsafe
Pointer<CGFloat>?)
Creates a calibrated RGB color space.
init?(iccBasedNComponents: Int, range: UnsafePointer<CGFloat>?, profile
CGDataProvider, alternate: CGColorSpace?)
Creates a device-independent color space that is defined according to the ICC color profile
specification.
init?(indexedBaseSpace: CGColorSpace, last: Int, colorTable: Unsafe
Pointer<UInt8>)
Creates an indexed color space, consisting of colors specified by a color lookup table.
init?(labWhitePoint: UnsafePointer<CGFloat>, blackPoint: UnsafePointer<
CGFloat>?, range: UnsafePointer<CGFloat>?)
Creates a device-independent color space that is relative to human color perception,
according to the CIE L*a*b* standard.
init?(patternBaseSpace: CGColorSpace?)
Creates a pattern color space.
init?(name: CFString)
Creates a specified type of Quartz color space.
init?(platformColorSpaceRef: UnsafeRawPointer)
Creates a platform-specific color space.
Deprecated
init?(iccData: CFTypeRef)
Creates an ICC-based color space using the ICC profile contained in the specified data.
init?(propertyListPlist: CFPropertyList)
Topics
Creating Color Spaces


## Page 10

Creates a color space from a property list.
func CGColorSpaceCreateDeviceRGB() -> CGColorSpace
Creates a device-dependent RGB color space.
func CGColorSpaceCreateDeviceCMYK() -> CGColorSpace
Creates a device-dependent CMYK color space.
func CGColorSpaceCreateDeviceGray() -> CGColorSpace
Creates a device-dependent grayscale color space.
init?(iccProfileData: CFData)
Creates an ICC-based color space using the ICC profile contained in the specified data.
Deprecated
var baseColorSpace: CGColorSpace?
Returns the base color space of a pattern or indexed color space.
var numberOfComponents: Int
Returns the number of color components in a color space.
var model: CGColorSpaceModel
Returns the color space model of the provided color space.
enum CGColorSpaceModel
Models for color spaces.
var colorTable: [UInt8]?
The entries in the color table of an indexed color space.
func copyICCData() -> CFData?
Returns a copy of the ICC profile data of the provided color space.
func copyPropertyList() -> CFPropertyList?
Returns a copy of the color space’s properties.
var iccData: CFData?
Returns a copy of the ICC profile of the provided color space.
Deprecated
var name: CFString?
Examining a Color Space


## Page 11

Returns the name used to create the specified color space.
var supportsOutput: Bool
Returns a Boolean indicating whether the color space can be used as a destination color
space.
var isWideGamutRGB: Bool
Returns whether the RGB color space covers a significant portion of the NTSC color gamut.
class let displayP3: CFString
The Display P3 color space, created by Apple.
class let displayP3_HLG: CFString
The Display P3 color space, using the HLG transfer function.
class let displayP3_PQ_EOTF: CFString
The Display P3 color space, using the PQ transfer function.
Deprecated
class let extendedLinearDisplayP3: CFString
The Display P3 color space with a linear transfer function and extended-range values.
class let sRGB: CFString
The standard Red Green Blue (sRGB) color space.
class let linearSRGB: CFString
The sRGB color space with a linear transfer function.
class let extendedSRGB: CFString
The extended sRGB color space.
class let extendedLinearSRGB: CFString
The sRGB color space with a linear transfer function and extended-range values.
class let genericGrayGamma2_2: CFString
The generic gray color space that has an exponential transfer function with a power of 2.2.
class let extendedGray: CFString
The extended gray color space.
class let linearGray: CFString
Accessing System-Defined Color Spaces


## Page 12

The gray color space using a linear transfer function.
class let extendedLinearGray: CFString
The extended gray color space with a linear transfer function.
class let genericCMYK: CFString
The generic CMYK color space.
class let genericRGBLinear: CFString
The generic RGB color space with a linear transfer function.
class let genericXYZ: CFString
The XYZ color space, as defined by the CIE 1931 standard.
class let genericLab: CFString
The generic LAB color space.
class let acescgLinear: CFString
The ACEScg color space.
class let adobeRGB1998: CFString
The Adobe RGB (1998) color space.
class let dcip3: CFString
The DCI P3 color space, which is the digital cinema standard.
class let itur_709: CFString
The recommendation of the International Telecommunication Union (ITU)
Radiocommunication sector for the BT.709 color space.
class let rommrgb: CFString
The Reference Output Medium Metric (ROMM) RGB color space.
class let itur_2020: CFString
The recommendation of the International Telecommunication Union (ITU)
Radiocommunication sector for the BT.2020 color space.
class let itur_2020_HLG: CFString
The recommendation of the International Telecommunication Union (ITU)
Radiocommunication sector for the BT.2020 color space, with the HLG transfer function.
Deprecated
class let itur_2020_PQ_EOTF: CFString


## Page 13

The recommendation of the International Telecommunication Union (ITU)
Radiocommunication sector for the BT.2020 color space, with the PQ transfer function.
Deprecated
class let extendedLinearITUR_2020: CFString
The recommendation of the International Telecommunication Union (ITU)
Radiocommunication sector for the BT.2020 color space, with a linear transfer function and
extended range values.
class let coreMedia709: CFString
class let displayP3_PQ: CFString
class let extendedDisplayP3: CFString
class let extendedITUR_2020: CFString
class let itur_2020_PQ: CFString
Deprecated
class let itur_2020_sRGBGamma: CFString
class let itur_2100_HLG: CFString
class let itur_2100_PQ: CFString
class let itur_709_HLG: CFString
class let itur_709_PQ: CFString
class let linearDisplayP3: CFString
class let linearITUR_2020: CFString
class var typeID: CFTypeID
Returns the Core Foundation type identifier for Quartz color spaces.
enum CGColorRenderingIntent
Handling options for colors that are not located within the destination color space of a
graphics context.
Working with Core Foundation Types
Data Types
Instance Methods


## Page 14

func isHDR() -> Bool
Equatable
Hashable
Sendable
SendableMetatype
Quartz 2D Programming Guide
class CGColor
A set of components that define a color, with a color space specifying how to interpret them
class CGColorConversionInfo
An object that describes how to convert between color spaces for use by other system
services.
class CGFont
A set of character glyphs and layout information for drawing text.
Relationships
Conforms To
See Also
Related Documentation
Colors and Fonts


## Page 15

A glyph can represent a single character (such as ‘b’), more than one character (such as the “ﬁ”
ligature), or a special character such as a space. Core Graphics retrieves the glyphs for the font
from ATS (Apple Type Services) and paints the glyphs based on the relevant parameters of the
current graphics state.
Core Graphics provides a limited, low-level interface for drawing text. For information on text-
drawing functions, see CGContext. For full Unicode and text-layout support, use the services
provided by TextKit).
init?(CGDataProvider)
Creates a font object from data supplied from a data provider.
init?(CFString)
Creates a font object corresponding to the font specified by a PostScript or full name.
Overview
Topics
Creating Font Objects
Examining Font Metadata
Core Graphics / CGFont
Class
CGFont
A set of character glyphs and layout information for drawing text.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 16

var fullName: CFString?
Returns the full name associated with a font object.
var ascent: Int32
Returns the ascent of a font.
var capHeight: Int32
Returns the cap height of a font.
var descent: Int32
Returns the descent of a font.
var fontBBox: CGRect
Returns the bounding box of a font.
var italicAngle: CGFloat
Returns the italic angle of a font.
var leading: Int32
Returns the leading of a font.
var stemV: CGFloat
Returns the thickness of the dominant vertical stems of glyphs in a font.
var unitsPerEm: Int32
Returns the number of glyph space units per em for the provided font.
var xHeight: Int32
Returns the x-height of a font.
var postScriptName: CFString?
Obtains the PostScript name of a font.
func canCreatePostScriptSubset(CGFontPostScriptFormat) -> Bool
Determines whether Core Graphics can create a subset of the font in PostScript format.
Examining Font Metrics
Working with PostScript Fonts


## Page 17

func createPostScriptSubset(subsetName: CFString, format: CGFontPost
ScriptFormat, glyphs: UnsafePointer<CGGlyph>?, count: Int, encoding:
UnsafePointer<CGGlyph>?) -> CFData?
Creates a subset of the font in the specified PostScript format.
enum CGFontPostScriptFormat
Possible formats for a PostScript font subset.
func createPostScriptEncoding(encoding: UnsafePointer<CGGlyph>?) ->
CFData?
Creates a PostScript encoding of a font.
var tableTags: CFArray?
Returns an array of tags that correspond to the font tables for a font.
func table(for: UInt32) -> CFData?
Returns the font table that corresponds to the provided tag.
Font Table Index Values
Possible values for an index into a font table.
Obsolete Font Table Index Values
Deprecated values for an index into a font table.
func copy(withVariations: CFDictionary?) -> CGFont?
Creates a copy of a font using a variation specification dictionary.
var variations: CFDictionary?
Returns the variation specification dictionary for a font.
var variationAxes: CFArray?
Returns an array of the variation axis dictionaries for a font.
Font Variation Axis Keys
Keys used for a font variation axis dictionary.
Working with Font Tables
Working with Variations
Working with Glyphs


## Page 18

var numberOfGlyphs: Int
Returns the number of glyphs in a font.
func name(for: CGGlyph) -> CFString?
Returns the glyph name of the specified glyph in the specified font.
func getGlyphWithGlyphName(name: CFString) -> CGGlyph
Returns the glyph for the glyph name associated with the specified font object.
func getGlyphBBoxes(glyphs: UnsafePointer<CGGlyph>, count: Int, bboxes:
UnsafeMutablePointer<CGRect>) -> Bool
Get the bounding box of each glyph in an array.
func getGlyphAdvances(glyphs: UnsafePointer<CGGlyph>, count: Int,
advances: UnsafeMutablePointer<Int32>) -> Bool
Gets the advance width of each glyph in the provided array.
typealias CGGlyph
An index into the internal glyph table of a font.
let kCGGlyphMax: CGFontIndex
The maximum allowed value of a CGGlyph.
typealias CGFontIndex
An index into a font table.
let kCGFontIndexMax: CGFontIndex
The maximum allowed value of a CGFontIndex.
let kCGFontIndexInvalid: CGFontIndex
An invalid font index (a value which never represents a valid glyph).
class var typeID: CFTypeID
Returns the Core Foundation type identifier for Core Graphics fonts.
Working with Core Foundation Types
Relationships


## Page 19

Equatable, Hashable
Quartz 2D Programming Guide
class CGColor
A set of components that define a color, with a color space specifying how to interpret them
class CGColorConversionInfo
An object that describes how to convert between color spaces for use by other system
services.
class CGColorSpace
A profile that specifies how to interpret a color value for display.
Conforms To
See Also
Related Documentation
Colors and Fonts


