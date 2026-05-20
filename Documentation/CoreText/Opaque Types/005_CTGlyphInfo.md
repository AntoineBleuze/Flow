# 005_CTGlyphInfo.pdf

## Page 1

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


## Page 2

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


## Page 3

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


