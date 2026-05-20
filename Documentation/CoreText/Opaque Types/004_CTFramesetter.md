# 004_CTFramesetter.pdf

## Page 1

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


## Page 2

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


## Page 3

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


