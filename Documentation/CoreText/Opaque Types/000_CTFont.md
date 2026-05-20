# 000_CTFont.pdf

## Page 1

The CTFont opaque type represents a Core Text font object.
Font objects represent fonts to an application, providing access to characteristics of the font, suc
as point size, transform matrix, and other attributes. Fonts provide assistance in laying out glyphs
relative to one another and are used to establish the current font when drawing in a graphics
context.
func CTFontCreateWithName(CFString, CGFloat, UnsafePointer<CGAffine
Transform>?) -> CTFont
Returns a new font reference for the given name.
func CTFontCreateWithNameAndOptions(CFString, CGFloat, UnsafePointer<
CGAffineTransform>?, CTFontOptions) -> CTFont
Returns a new font reference for the given name.
Overview
Topics
Creating Fonts
Core Text / CTFont
Class
CTFont
A font object.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CTFontCreateWithFontDescriptor(CTFontDescriptor, CGFloat, Unsafe
Pointer<CGAffineTransform>?) -> CTFont
Returns a new font reference that best matches the given font descriptor.
func CTFontCreateWithFontDescriptorAndOptions(CTFontDescriptor, CGFloat
UnsafePointer<CGAffineTransform>?, CTFontOptions) -> CTFont
Returns a new font reference that best matches the given font descriptor.
func CTFontCreateUIFontForLanguage(CTFontUIFontType, CGFloat, CFString?
-> CTFont?
Returns the special user-interface font for the given language and user-interface type.
func CTFontCreateCopyWithAttributes(CTFont, CGFloat, UnsafePointer<
CGAffineTransform>?, CTFontDescriptor?) -> CTFont
Returns a new font with additional attributes based on the original font.
func CTFontCreateCopyWithSymbolicTraits(CTFont, CGFloat, UnsafePointer<
CGAffineTransform>?, CTFontSymbolicTraits, CTFontSymbolicTraits) ->
CTFont?
Returns a new font in the same font family as the original with the specified symbolic traits.
func CTFontCreateCopyWithFamily(CTFont, CGFloat, UnsafePointer<CGAffine
Transform>?, CFString) -> CTFont?
Returns a new font in the specified family based on the traits of the original font.
func CTFontCreateForString(CTFont, CFString, CFRange) -> CTFont
Returns a font reference that most accurately maps the string range based on the current
font.
func CTFontCreateForStringWithLanguage(CTFont, CFString, CFRange,
CFString?) -> CTFont
Returns a font reference that most accurately maps the string range based on the current fo
and language.
func CTFontCopyFontDescriptor(CTFont) -> CTFontDescriptor
Returns the normalized font descriptor for the given font reference.
func CTFontCopyAttribute(CTFont, CFString) -> CFTypeRef?
Returns the value associated with an arbitrary attribute of the given font.
func CTFontGetSize(CTFont) -> CGFloat
Getting Font Data


## Page 3

Returns the point size of the given font.
func CTFontGetMatrix(CTFont) -> CGAffineTransform
Returns the transformation matrix of the given font.
func CTFontGetSymbolicTraits(CTFont) -> CTFontSymbolicTraits
Returns the symbolic traits of the given font.
func CTFontCopyTraits(CTFont) -> CFDictionary
Returns the traits dictionary of the given font.
func CTFontCopyDefaultCascadeListForLanguages(CTFont, CFArray?) ->
CFArray?
Retrieves an ordered list of font substitution preferences.
func CTFontCopyPostScriptName(CTFont) -> CFString
Returns the PostScript name of the given font.
func CTFontCopyFamilyName(CTFont) -> CFString
Returns the family name of the given font.
func CTFontCopyFullName(CTFont) -> CFString
Returns the full name of the given font.
func CTFontCopyDisplayName(CTFont) -> CFString
Returns the display name of the given font.
func CTFontCopyName(CTFont, CFString) -> CFString?
Returns a reference to the requested name of the given font.
func CTFontCopyLocalizedName(CTFont, CFString, UnsafeMutablePointer<
Unmanaged<CFString>?>?) -> CFString?
Returns a reference to a localized name for the given font.
func CTFontCopyCharacterSet(CTFont) -> CFCharacterSet
Returns the Unicode character set of the font.
func CTFontGetStringEncoding(CTFont) -> CFStringEncoding
Getting Font Names
Working With Encoding


## Page 4

Returns the best string encoding for legacy format support.
func CTFontCopySupportedLanguages(CTFont) -> CFArray
Returns an array of languages supported by the font.
func CTFontGetAscent(CTFont) -> CGFloat
Returns the scaled font-ascent metric of the given font.
func CTFontGetDescent(CTFont) -> CGFloat
Returns the scaled font-descent metric of the given font.
func CTFontGetLeading(CTFont) -> CGFloat
Returns the scaled font-leading metric of the given font.
func CTFontGetUnitsPerEm(CTFont) -> UInt32
Returns the units-per-em metric of the given font.
func CTFontGetGlyphCount(CTFont) -> CFIndex
Returns the number of glyphs of the given font.
func CTFontGetBoundingBox(CTFont) -> CGRect
Returns the scaled bounding box of the given font.
func CTFontGetUnderlinePosition(CTFont) -> CGFloat
Returns the scaled underline position of the given font.
func CTFontGetUnderlineThickness(CTFont) -> CGFloat
Returns the scaled underline-thickness metric of the given font.
func CTFontGetSlantAngle(CTFont) -> CGFloat
Returns the slant angle of the given font.
func CTFontGetCapHeight(CTFont) -> CGFloat
Returns the cap-height metric of the given font.
func CTFontGetXHeight(CTFont) -> CGFloat
Returns the x-height metric of the given font.
Getting Font Metrics
Getting Glyph Data


## Page 5

func CTFontCreatePathForGlyph(CTFont, CGGlyph, UnsafePointer<CGAffine
Transform>?) -> CGPath?
Creates a path for the specified glyph.
func CTFontGetGlyphWithName(CTFont, CFString) -> CGGlyph
Returns the glyph for the specified name.
func CTFontGetBoundingRectsForGlyphs(CTFont, CTFontOrientation, Unsafe
Pointer<CGGlyph>, UnsafeMutablePointer<CGRect>?, CFIndex) -> CGRect
Calculates the bounding rects for an array of glyphs and returns the overall bounding
rectangle for the glyph run.
func CTFontGetAdvancesForGlyphs(CTFont, CTFontOrientation, UnsafePointe
<CGGlyph>, UnsafeMutablePointer<CGSize>?, CFIndex) -> Double
Calculates the advances for an array of glyphs and returns the summed advance.
func CTFontGetOpticalBoundsForGlyphs(CTFont, UnsafePointer<CGGlyph>,
UnsafeMutablePointer<CGRect>?, CFIndex, CFOptionFlags) -> CGRect
Calculates the optical bounds for an array of glyphs and returns the overall optical bounds fo
the run.
func CTFontGetVerticalTranslationsForGlyphs(CTFont, UnsafePointer<
CGGlyph>, UnsafeMutablePointer<CGSize>, CFIndex)
Calculates the offset from the default (horizontal) origin to the vertical origin for an array of
glyphs.
func CTFontCopyVariationAxes(CTFont) -> CFArray?
Returns an array of variation axes.
func CTFontCopyVariation(CTFont) -> CFDictionary?
Returns a variation dictionary from the font reference.
func CTFontCopyFeatures(CTFont) -> CFArray?
Returns an array of font features.
func CTFontCopyFeatureSettings(CTFont) -> CFArray?
Returns an array of font feature-setting tuples.
Working With Font Variations
Getting Font Features


## Page 6

func CTFontGetGlyphsForCharacters(CTFont, UnsafePointer<UniChar>, Unsaf
MutablePointer<CGGlyph>, CFIndex) -> Bool
Performs basic character-to-glyph mapping.
func CTFontDrawGlyphs(CTFont, UnsafePointer<CGGlyph>, UnsafePointer<
CGPoint>, Int, CGContext)
Renders the given glyphs of a font at the specified positions in the supplied graphics contex
func CTFontGetLigatureCaretPositions(CTFont, CGGlyph, UnsafeMutable
Pointer<CGFloat>?, CFIndex) -> CFIndex
Returns caret positions within a glyph.
func CTFontCopyGraphicsFont(CTFont, UnsafeMutablePointer<Unmanaged<
CTFontDescriptor>?>?) -> CGFont
Returns a Core Graphics font reference and attributes.
func CTFontCreateWithGraphicsFont(CGFont, CGFloat, UnsafePointer<
CGAffineTransform>?, CTFontDescriptor?) -> CTFont
Creates a new font reference from an existing Core Graphics font reference.
func CTFontGetPlatformFont(CTFont, UnsafeMutablePointer<Unmanaged<CTFon
Descriptor>?>?) -> ATSFontRef
Returns an ATS font reference and attributes.
Deprecated
func CTFontCreateWithPlatformFont(ATSFontRef, CGFloat, UnsafePointer<
CGAffineTransform>?, CTFontDescriptor?) -> CTFont?
Creates a new font reference from an ATS font reference.
Deprecated
func CTFontCreateWithQuickdrawInstance(ConstStr255Param?, Int16, UInt8,
CGFloat) -> CTFont
Returns a font reference for the given QuickDraw instance.
Deprecated
Working with Glyphs
Converting Fonts
Getting Font Table Data


## Page 7

func CTFontCopyAvailableTables(CTFont, CTFontTableOptions) -> CFArray?
Returns an array of font table tags.
func CTFontCopyTable(CTFont, CTFontTableTag, CTFontTableOptions) ->
CFData?
Returns a reference to the font table data.
func CTFontGetTypeID() -> CFTypeID
Returns the type identifier for Core Text font references.
Name Specifier Constants
Name specifier constants provide access to the different names associated with a font.
Font Variation Axis Dictionary Keys
These constants provide keys to font variation axis dictionary values.
Font Feature Constants
These constants provide keys to font feature dictionary values.
enum CTFontUIFontType
Constants that represent the specific user-interface purpose to specify for font creation.
typealias CTFontTableTag
Font table tags provide access to font table data.
struct CTFontTableOptions
Constants that describe font table options.
struct CTFontOptions
Options for font creation and descriptor matching.
init(CTFontUIFontType, size: CGFloat)
Getting the Type Identifier
Global Variables
Enumerations
Initializers


## Page 8

init(CTFontDescriptor, size: CGFloat)
init(CFString, size: CGFloat)
init(CTFontUIFontType, size: CGFloat, language: CFString?)
init(CFString, transform: CGAffineTransform)
init(CTFontDescriptor, transform: CGAffineTransform)
init(font: CTFont, string: CFString, range: CFRange)
init(font: CTFont, string: CFString, range: CFRange, language: CFString
?)
Equatable, Hashable
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
class CTFrame
A frame.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
Relationships
Conforms To
See Also
Opaque Types


## Page 9

class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRun
A glyph run.
class CTRunDelegate
A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.


