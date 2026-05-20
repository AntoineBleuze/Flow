# 009_CTRunDelegate.pdf

## Page 1

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


## Page 2

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
class CTParagraphStyle
Paragraph or ruler attributes in an attributed string.
class CTRun
A glyph run.
class CTTextTab
A tab in a paragraph style, storing an alignment type and location.
class CTTypesetter
A typesetter which performs line layout.
Opaque Types


