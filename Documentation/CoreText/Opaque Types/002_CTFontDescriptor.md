# 002_CTFontDescriptor.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


