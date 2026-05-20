# 010_CTTextTab.pdf

## Page 1

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


## Page 2

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


## Page 3

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


