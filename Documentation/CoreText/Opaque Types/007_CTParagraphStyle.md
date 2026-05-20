# 007_CTParagraphStyle.pdf

## Page 1

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


## Page 2

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


## Page 3

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


