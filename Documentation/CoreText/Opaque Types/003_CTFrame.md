# 003_CTFrame.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

class CTRun
A glyph run.
class CTRunDelegate
A run delegate.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.


