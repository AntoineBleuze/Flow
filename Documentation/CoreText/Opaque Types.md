# Opaque Types.pdf

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


## Page 10

A font collection represents a group of font descriptors taken together as a single object.
Font collections provide the capabilities of font enumeration, access to global and custom font
collections, and access to the font descriptors comprising the collection.
func CTFontCollectionCreateFromAvailableFonts(CFDictionary?) -> CTFont
Collection
Returns a new font collection containing all available fonts.
func CTFontCollectionCreateWithFontDescriptors(CFArray?, CFDictionary?)
-> CTFontCollection
Returns a new font collection based on the given array of font descriptors.
func CTFontCollectionCreateCopyWithFontDescriptors(CTFontCollection,
CFArray?, CFDictionary?) -> CTFontCollection
Returns a copy of the original collection augmented with the given new font descriptors.
Overview
Topics
Creating Font Collections
Core Text / CTFontCollection
Class
CTFontCollection
A font collection.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 11

func CTFontCollectionCreateMutableCopy(CTFontCollection) -> CTMutable
FontCollection
Creates a mutable copy of the original collection.
func CTFontCollectionCopyExclusionDescriptors(CTFontCollection) ->
CFArray?
Retrieves the array of descriptors to exclude from the match.
func CTFontCollectionCopyQueryDescriptors(CTFontCollection) -> CFArray?
Retrieves the array of descriptors for font matching.
func CTFontCollectionSetExclusionDescriptors(CTMutableFontCollection,
CFArray?)
Replaces the array of descriptors to exclude from the match.
func CTFontCollectionSetQueryDescriptors(CTMutableFontCollection,
CFArray?)
Replaces the array of descriptors for font matching.
func CTFontCollectionCreateMatchingFontDescriptors(CTFontCollection) ->
CFArray?
Returns an array of font descriptors matching the collection.
func CTFontCollectionCreateMatchingFontDescriptorsWithOptions(CTFont
Collection, CFDictionary?) -> CFArray?
Creates an array of font descriptors that match the specified collection.
func CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback(
CTFontCollection, CTFontCollectionSortDescriptorsCallback?, Unsafe
MutableRawPointer?) -> CFArray?
Returns the array of matching font descriptors sorted with the callback function.
func CTFontCollectionCreateMatchingFontDescriptorsForFamily(CTFont
Collection, CFString, CFDictionary?) -> CFArray?
Retrieves an array of font descriptors that match the specified family, one descriptor for eac
style in the collection.
typealias CTFontCollectionSortDescriptorsCallback
Excluding and Including Font Descriptors
Getting Font Descriptors


## Page 12

The collection sorting callback type.
func CTFontCollectionCopyFontAttribute(CTFontCollection, CFString,
CTFontCollectionCopyOptions) -> CFArray
Retrieves an array of font descriptor attribute values.
func CTFontCollectionCopyFontAttributes(CTFontCollection, CFSet, CTFont
CollectionCopyOptions) -> CFArray
Retrieves an array of dictionaries containing font descriptor attribute values.
func CTFontCollectionGetTypeID() -> CFTypeID
Returns the type identifier for Core Text font collection references.
class CTMutableFontCollection
A reference to a mutable font collection.
let kCTFontCollectionRemoveDuplicatesOption: CFString
struct CTFontCollectionCopyOptions
Option bits for use with CTFontCollectionCopyFontAttribute(s).
CTMutableFontCollection
Get Font Descriptor Attributes
Getting the Type Identifier
Data Types
Constants
Relationships
Inherited By
Conforms To


## Page 13

Equatable, Hashable
class CTFont
A font object.
class CTFontDescriptor
A font descriptor.
class CTFrame
A frame.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
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
See Also
Opaque Types


## Page 14

A font descriptor is a dictionary of attributes (such as name, point size, and variation) that can
completely specify a font.
A font descriptor can be an incomplete specification, in which case the system chooses the most
appropriate font to match the given attributes.
func CTFontDescriptorCreateWithNameAndSize(CFString, CGFloat) -> CTFont
Descriptor
Creates a new font descriptor with the provided PostScript name and size.
func CTFontDescriptorCreateWithAttributes(CFDictionary) -> CTFont
Descriptor
Creates a new font descriptor reference from a dictionary of attributes.
func CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptor,
CFDictionary) -> CTFontDescriptor
Overview
Topics
Creating Font Descriptors
Core Text / CTFontDescriptor
Class
CTFontDescriptor
A font descriptor.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 15

Creates a copy of the original font descriptor with new attributes.
func CTFontDescriptorCreateCopyWithVariation(CTFontDescriptor, CFNumber
CGFloat) -> CTFontDescriptor
Creates a copy of the original font descriptor with a new variation instance.
func CTFontDescriptorCreateCopyWithFeature(CTFontDescriptor, CFNumber,
CFNumber) -> CTFontDescriptor
Copies a font descriptor with new feature settings.
func CTFontDescriptorCreateCopyWithFamily(CTFontDescriptor, CFString) -
CTFontDescriptor?
Creates a copy of the font descriptor in the specified family based on the traits of the origina
func CTFontDescriptorCreateCopyWithSymbolicTraits(CTFontDescriptor,
CTFontSymbolicTraits, CTFontSymbolicTraits) -> CTFontDescriptor?
Creates a copy of the font descriptor with the specified symbolic traits as the original.
func CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptor,
CFSet?) -> CFArray?
Returns an array of normalized font descriptors matching the provided descriptor.
func CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptor,
CFSet?) -> CTFontDescriptor?
Returns the single preferred matching font descriptor based on the original descriptor and
system precedence.
func CTFontDescriptorCopyAttributes(CTFontDescriptor) -> CFDictionary
Returns the attributes dictionary of the font descriptor.
func CTFontDescriptorCopyAttribute(CTFontDescriptor, CFString) -> CFTyp
Ref?
Returns the value associated with an arbitrary attribute.
func CTFontDescriptorCopyLocalizedAttribute(CTFontDescriptor, CFString,
UnsafeMutablePointer<Unmanaged<CFString>?>?) -> CFTypeRef?
Returns a localized value for the requested attribute, if available.
Getting Attributes
Getting the Font Descriptor Type


## Page 16

func CTFontDescriptorGetTypeID() -> CFTypeID
Returns the type identifier for Core Text font descriptor references.
Font Attributes
The keys for accessing font attributes from a font descriptor.
enum CTFontOrientation
The intended rendering orientation of the font for obtaining glyph metrics.
enum CTFontFormat
The recognized format of the font.
typealias CTFontPriority
The priority of font descriptors when resolving duplicates and sorting match results.
Font Traits
The keys for accessing font traits from a font descriptor.
Font Class Mask Shift Constants
These constants represent the font class mask shift.
struct CTFontSymbolicTraits
The symbolic representation of stylistic font attributes.
struct CTFontStylisticClass
The stylistic class values of the font.
Equatable, Hashable
Accessing Font Attributes
Accessing Font Traits
Relationships
Conforms To


## Page 17

class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFrame
A frame.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
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
See Also
Opaque Types


## Page 18

A frame contains multiple lines of text. The frame object is the output resulting from the text-
framing process performed by a CTFramesetter object.
You can draw the entire text frame directly into the current graphic context. The frame object
contains an array of line objects that can be retrieved for individual rendering or to get glyph
information.
func CTFrameGetStringRange(CTFrame) -> CFRange
Returns the range of characters originally requested to fill the frame.
func CTFrameGetVisibleStringRange(CTFrame) -> CFRange
Returns the range of characters that actually fit in the frame.
func CTFrameGetPath(CTFrame) -> CGPath
Returns the path used to create the frame.
Overview
Topics
Getting Frame Data
Core Text / CTFrame
Class
CTFrame
A frame.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 19

func CTFrameGetFrameAttributes(CTFrame) -> CFDictionary?
Returns the frame attributes used to create the frame.
func CTFrameGetLines(CTFrame) -> CFArray
Returns an array of lines stored in the frame.
func CTFrameGetLineOrigins(CTFrame, CFRange, UnsafeMutablePointer<
CGPoint>)
Copies a range of line origins for a frame.
func CTFrameDraw(CTFrame, CGContext)
Draws an entire frame into a context.
func CTFrameGetTypeID() -> CFTypeID
Returns the type identifier for the CTFrame opaque type.
enum CTFramePathFillRule
These constants specify the fill rule used by a frame
enum CTFrameProgression
Constants that specify frame progression types.
let kCTFrameProgressionAttributeName: CFString
Specifies progression for a frame.
let kCTFramePathFillRuleAttributeName: CFString
The key used to specify the fill rule for a frame.
let kCTFramePathWidthAttributeName: CFString
The key used to specify the frame width.
Getting Lines
Drawing the Frame
Getting the Type Identifier
Data Types
Constants


## Page 20

let kCTFrameClippingPathsAttributeName: CFString
Specifies array of paths to clip frame.
let kCTFramePathClippingPathAttributeName: CFString
Specifies clipping path.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
Relationships
Conforms To
See Also
Opaque Types


## Page 21

class CTRun
A glyph run.
class CTRunDelegate
A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.


## Page 22

CTFramesetter is an object factory for CTFrame objects.
The framesetter takes an attributed string object and a shape descriptor object and calls into the
typesetter to create line objects that fill that shape. The output is a frame object containing an
array of lines. The frame can then draw itself directly into the current graphic context.
func CTFramesetterCreateWithAttributedString(CFAttributedString) ->
CTFramesetter
Creates an immutable framesetter object from an attributed string.
func CTFramesetterCreateWithTypesetter(CTTypesetter) -> CTFramesetter
Creates a framesetter directly from a typesetter.
Overview
Topics
Creating a Framesetter
Creating Frames
Core Text / CTFramesetter
Class
CTFramesetter
Generate text frames.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 23

func CTFramesetterCreateFrame(CTFramesetter, CFRange, CGPath,
CFDictionary?) -> CTFrame
Creates an immutable frame using a framesetter.
func CTFramesetterGetTypesetter(CTFramesetter) -> CTTypesetter
Returns the typesetter object being used by the framesetter.
func CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetter, CFRang
, CFDictionary?, CGSize, UnsafeMutablePointer<CFRange>?) -> CGSize
Determines the frame size needed for a string range.
func CTFramesetterGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the framesetter object.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
Frame Sizing
Getting the Type Identifier
Relationships
Conforms To
See Also
Opaque Types


## Page 24

class CTFrame
A frame.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
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


## Page 25

func CTGlyphInfoGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the glyph info object
func CTGlyphInfoCreateWithGlyphName(CFString, CTFont, CFString) ->
CTGlyphInfo?
Creates an immutable glyph info object with a glyph name.
func CTGlyphInfoCreateWithGlyph(CGGlyph, CTFont, CFString) -> CTGlyph
Info?
Creates an immutable glyph info object with a glyph index.
func CTGlyphInfoCreateWithCharacterIdentifier(CGFontIndex, CTCharacter
Collection, CFString) -> CTGlyphInfo?
Creates an immutable glyph info object with a character identifier.
Topics
Getting the GlyphInfo Type
Creating GlyphInfo Objects
Getting GlyphInfo Data
Core Text / CTGlyphInfo
Class
CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 26

func CTGlyphInfoGetGlyphName(CTGlyphInfo) -> CFString?
Retrieves the glyph name for a glyph info object, if that object exists.
func CTGlyphInfoGetCharacterIdentifier(CTGlyphInfo) -> CGFontIndex
Gets the character identifier for a glyph info object.
func CTGlyphInfoGetCharacterCollection(CTGlyphInfo) -> CTCharacter
Collection
Gets the character collection for a glyph info object.
func CTGlyphInfoGetGlyph(CTGlyphInfo) -> CGGlyph
Retrieves the glyph for a glyph info, if that object exists.
enum CTCharacterCollection
Constants that specify character collections.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 27

class CTFrame
A frame.
class CTFramesetter
Generate text frames.
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


## Page 28

A CTLine object contains an array of glyph runs. Line objects are created by the typesetter durin
a framesetting operation and can draw themselves directly into a graphics context.
func CTLineCreateWithAttributedString(CFAttributedString) -> CTLine
Creates a single immutable line object from an attributed string.
func CTLineCreateTruncatedLine(CTLine, Double, CTLineTruncationType,
CTLine?) -> CTLine?
Creates a truncated line from an existing line.
func CTLineCreateJustifiedLine(CTLine, CGFloat, Double) -> CTLine?
Creates a justified line from an existing line.
Overview
Topics
Creating Lines
Drawing the Line
Core Text / CTLine
Class
CTLine
A line of text.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 29

func CTLineDraw(CTLine, CGContext)
Draws a complete line.
func CTLineGetGlyphCount(CTLine) -> CFIndex
Returns the total glyph count for the line object.
func CTLineGetGlyphRuns(CTLine) -> CFArray
Returns the array of glyph runs that make up the line object.
func CTLineGetStringRange(CTLine) -> CFRange
Gets the range of characters that originally spawned the glyphs in the line.
func CTLineGetPenOffsetForFlush(CTLine, CGFloat, Double) -> Double
Gets the pen offset required to draw flush text.
func CTLineGetImageBounds(CTLine, CGContext?) -> CGRect
Calculates the image bounds for a line.
func CTLineGetTypographicBounds(CTLine, UnsafeMutablePointer<CGFloat>?,
UnsafeMutablePointer<CGFloat>?, UnsafeMutablePointer<CGFloat>?) ->
Double
Calculates the typographic bounds of a line.
func CTLineGetTrailingWhitespaceWidth(CTLine) -> Double
Returns the trailing whitespace width for a line.
func CTLineGetStringIndexForPosition(CTLine, CGPoint) -> CFIndex
Performs hit testing.
func CTLineGetOffsetForStringIndex(CTLine, CFIndex, UnsafeMutablePointe
<CGFloat>?) -> CGFloat
Determines the graphical offset or offsets for a string index.
func CTLineEnumerateCaretOffsets(CTLine, (Double, CFIndex, Bool, Unsafe
MutablePointer<Bool>) -> Void)
Getting Line Data
Measuring Lines
Getting Line Positioning


## Page 30

Enumerates caret offsets for characters in a line.
func CTLineGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the line object.
enum CTLineTruncationType
Truncation types required by the CTLineCreateTruncatedLine(_:_:_:_:) function to
tell the truncation engine which type of truncation is being requested.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
class CTFrame
A frame.
class CTFramesetter
Getting the Type Identifier
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 31

Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
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


## Page 32

A paragraph style object represents a complex attribute value in an attributed string, storing a
number of subattributes that affect paragraph layout for the characters of the string. Among thes
subattributes are alignment, tab stops, writing direction, line-breaking mode, and indentation
settings.
func CTParagraphStyleCreate(UnsafePointer<CTParagraphStyleSetting>?, In
) -> CTParagraphStyle
Creates an immutable paragraph style.
func CTParagraphStyleCreateCopy(CTParagraphStyle) -> CTParagraphStyle
Creates an immutable copy of a paragraph style.
Overview
Topics
Creating Paragraph Styles
Getting the Value of a Style Specifier
Core Text / CTParagraphStyle
Class
CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 33

func CTParagraphStyleGetValueForSpecifier(CTParagraphStyle, CTParagraph
StyleSpecifier, Int, UnsafeMutableRawPointer) -> Bool
Obtains the current value for a single setting specifier.
func CTParagraphStyleGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the paragraph style object.
struct CTParagraphStyleSetting
This structure is used to alter the paragraph style.
enum CTTextAlignment
Constants that specify text alignment.
enum CTLineBreakMode
These constants specify what happens when a line is too long for its frame.
enum CTWritingDirection
These constants specify the writing direction.
enum CTParagraphStyleSpecifier
Constants used to query and modify a paragraph style object.
Equatable, Hashable
Getting the Type Identifier
Data Types
Constants
Relationships
Conforms To
See Also


## Page 34

class CTFont
A font object.
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
class CTLine
A line of text.
class CTRun
A glyph run.
class CTRunDelegate
A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.
Opaque Types


## Page 35

A glyph run is a set of consecutive glyphs sharing the same attributes and direction.
The typesetter creates glyph runs as it produces lines from character strings, attributes, and font
objects. That is, a line is constructed of one or more glyphs runs. Glyph runs can draw themselve
into a graphic context, if desired, although most users have no need to interact directly with glyph
runs.
func CTRunGetGlyphCount(CTRun) -> CFIndex
Gets the glyph count for the run.
func CTRunGetAttributes(CTRun) -> CFDictionary
Returns the attribute dictionary that was used to create the glyph run.
func CTRunGetStatus(CTRun) -> CTRunStatus
Returns the run’s status.
Overview
Topics
Getting Glyph Run Data
Core Text / CTRun
Class
CTRun
A glyph run.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 36

func CTRunGetGlyphsPtr(CTRun) -> UnsafePointer<CGGlyph>?
Returns a direct pointer for the glyph array stored in the run.
func CTRunGetGlyphs(CTRun, CFRange, UnsafeMutablePointer<CGGlyph>)
Copies a range of glyphs into a user-provided buffer.
func CTRunGetPositionsPtr(CTRun) -> UnsafePointer<CGPoint>?
Returns a direct pointer for the glyph position array stored in the run.
func CTRunGetPositions(CTRun, CFRange, UnsafeMutablePointer<CGPoint>)
Copies a range of glyph positions into a user-provided buffer.
func CTRunGetAdvancesPtr(CTRun) -> UnsafePointer<CGSize>?
Returns a direct pointer for the glyph advance array stored in the run.
func CTRunGetAdvances(CTRun, CFRange, UnsafeMutablePointer<CGSize>)
Copies a range of glyph advances into a user-provided buffer.
func CTRunGetStringIndicesPtr(CTRun) -> UnsafePointer<CFIndex>?
Returns a direct pointer for the string indices stored in the run.
func CTRunGetStringIndices(CTRun, CFRange, UnsafeMutablePointer<CFIndex
>)
Copies a range of string indices into a user-provided buffer.
func CTRunGetStringRange(CTRun) -> CFRange
Gets the range of characters that originally spawned the glyphs in the run.
func CTLineGetBoundsWithOptions(CTLine, CTLineBoundsOptions) -> CGRect
Calculates the bounds for a line.
func CTRunGetTypographicBounds(CTRun, CFRange, UnsafeMutablePointer<
CGFloat>?, UnsafeMutablePointer<CGFloat>?, UnsafeMutablePointer<CGFloat
>?) -> Double
Gets the typographic bounds of the run.
func CTRunGetImageBounds(CTRun, CGContext?, CFRange) -> CGRect
Calculates the image bounds for a glyph range.
func CTRunGetBaseAdvancesAndOrigins(CTRun, CFRange, UnsafeMutablePointe
<CGSize>?, UnsafeMutablePointer<CGPoint>?)
Measuring the Glyph Run


## Page 37

Copies a range of base advances and origins into user-provided buffers.
func CTRunDraw(CTRun, CGContext, CFRange)
Draws a complete run or part of one.
func CTRunGetTextMatrix(CTRun) -> CGAffineTransform
Returns the text matrix needed to draw this run.
func CTRunGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the run object.
struct CTRunStatus
A bitfield that represents the disposition of the run.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
Drawing the Glyph Run
Getting the Type Identifier
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 38

class CTFontDescriptor
A font descriptor.
class CTFrame
A frame.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRunDelegate
A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.


## Page 39

A run delegate is assigned to a run (attribute range) to control typographic traits such glyph
ascent, glyph descent, and glyph width.
The callbacks defined for CTRunDelegate objects are provided by the owner of a run delegate
and are used to modify glyph metrics during layout. The values returned by the delegate are
applied to each glyph in the run or runs corresponding to the attribute with that delegate.
func CTRunDelegateCreate(UnsafePointer<CTRunDelegateCallbacks>, Unsafe
MutableRawPointer?) -> CTRunDelegate?
Creates an immutable instance of a run delegate.
func CTRunDelegateGetRefCon(CTRunDelegate) -> UnsafeMutableRawPointer
Returns a run delegate’s “refCon” value.
Overview
Topics
Creating a Run Delegate
Getting Information About a Run Delegate
Core Text / CTRunDelegate
Class
CTRunDelegate
A run delegate.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 40

func CTRunDelegateGetTypeID() -> CFTypeID
Returns the type of CTRunDelegate objects.
typealias CTRunDelegateGetAscentCallback
Defines a pointer to a function that determines typographic ascent of glyphs in the run.
typealias CTRunDelegateGetDescentCallback
Defines a pointer to a function that determines typographic descent of glyphs in the run.
typealias CTRunDelegateGetWidthCallback
Defines a pointer to a function that determines the typographic width of glyphs in the run.
typealias CTRunDelegateDeallocateCallback
Defines a pointer to a function that is invoked when a CTRunDelegate object is deallocated.
struct CTRunDelegateCallbacks
A structure holding pointers to callbacks implemented by the run delegate.
Run Delegate Versions
The version of the run delegate.
Equatable, Hashable
Callbacks
Data Types
Constants
Relationships
Conforms To
See Also


## Page 41

class CTFont
A font object.
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
class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRun
A glyph run.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.
Opaque Types


## Page 42

Core Text supports five alignment types: CTTextAlignment.left, CTTextAlignment
.center, CTTextAlignment.right, CTTextAlignment.justified and CTText
Alignment.natural. These alignment types are absolute, not based on the line sweep directio
of text.
For example, tabbed text is always positioned to the left of a right-aligned tab, whether the line
sweep direction is left to right or right to left. A tab’s location, on the other hand, is relative to the
back margin. A tab set at 1.5 inches, for example, is at 1.5 inches from the right in right-to-left tex
func CTTextTabCreate(CTTextAlignment, Double, CFDictionary?) -> CTText
Tab
Creates and initializes a new text tab object.
func CTTextTabGetAlignment(CTTextTab) -> CTTextAlignment
Overview
Topics
Creating Text Tabs
Getting Text Tab Data
Core Text / CTTextTab
Class
CTTextTab
A tab in a paragraph style, storing an alignment type and location.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 43

Returns the text alignment of the tab.
func CTTextTabGetLocation(CTTextTab) -> Double
Returns the tab’s ruler location.
func CTTextTabGetOptions(CTTextTab) -> CFDictionary?
Returns the dictionary of attributes associated with the tab.
func CTTextTabGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the text tab object.
kCTTabColumnTerminatorsAttributeName
Specifies the terminating character for a tab column.
Equatable, Hashable
class CTFont
A font object.
class CTFontCollection
A font collection.
class CTFontDescriptor
A font descriptor.
Getting the Type Identifier
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 44

class CTFrame
A frame.
class CTFramesetter
Generate text frames.
class CTGlyphInfo
Override a font’s specified mapping from Unicode to the glyph ID.
class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRun
A glyph run.
class CTRunDelegate
A run delegate.
class CTTypesetter
A typesetter which performs line layout.


## Page 45

Line layout includes word wrapping, hyphenation, and line breaking in either vertical or horizontal
rectangles. A typesetter object takes as input an attributed string and produces a line of typeset
glyphs (composed into glyph runs) in a CTLine object. The typesetter performs character-to-
glyph encoding, glyph ordering, and positional operations, such as kerning, tracking, and baseline
adjustments. If multiline layout is needed, it is performed by a CTFramesetter object, which ca
into the typesetter to generate the typeset lines to fill the frame.
A CTFramesetter encapsulates a typesetter and provides a reference to it as a convenience, bu
a caller may also choose to create a freestanding typesetter.
func CTTypesetterCreateWithAttributedString(CFAttributedString) ->
CTTypesetter
Creates an immutable typesetter object using an attributed string.
func CTTypesetterCreateWithAttributedStringAndOptions(CFAttributedStrin
, CFDictionary?) -> CTTypesetter?
Overview
Topics
Creating a Typesetter
Core Text / CTTypesetter
Class
CTTypesetter
A typesetter which performs line layout.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 46

Creates an immutable typesetter object using an attributed string and a dictionary of options
func CTTypesetterCreateLine(CTTypesetter, CFRange) -> CTLine
Creates an immutable line from the typesetter.
func CTTypesetterCreateLineWithOffset(CTTypesetter, CFRange, Double) ->
CTLine
Creates an immutable line from the typesetter at a specified line offset.
func CTTypesetterSuggestLineBreak(CTTypesetter, CFIndex, Double) ->
CFIndex
Suggests a contextual line breakpoint based on the width provided.
func CTTypesetterSuggestLineBreakWithOffset(CTTypesetter, CFIndex,
Double, Double) -> CFIndex
Suggests a contextual line breakpoint based on the width provided and the specified offset.
func CTTypesetterSuggestClusterBreak(CTTypesetter, CFIndex, Double) ->
CFIndex
Suggests a cluster line breakpoint based on the width provided.
func CTTypesetterSuggestClusterBreakWithOffset(CTTypesetter, CFIndex,
Double, Double) -> CFIndex
Suggests a cluster line breakpoint based on the specified width and line offset.
func CTTypesetterGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the typesetter object.
Typesetter Options
Control aspects of the typesetter’s text processing.
Creating Lines
Breaking Lines
Getting the Type Identifier
Constants


## Page 47

Equatable, Hashable
class CTFont
A font object.
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
class CTLine
A line of text.
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRun
A glyph run.
class CTRunDelegate
Relationships
Conforms To
See Also
Opaque Types


## Page 48

A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.


