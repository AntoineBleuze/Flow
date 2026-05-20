# Functions.pdf

## Page 1

If baseDirection is not NSWritingDirectionNatural, result comes from
CFAttributedStringGetBidiLevelsAndResolvedDirections; otherwise, it fills bidiLevels by applying a
statistical approach (a paragraph is RTL if 40% or more of its words are RTL) to the characters in
range. Returns true if the result is not uni-level LTR (in other words, needing further Bidi
processing). baseDirection is NSWritingDirection (NSWritingDirectionNatural,
NSWritingDirectionLeftToRight, and NSWritingDirectionRightToLeft). Understands
NSWritingDirectionAttributeName values.
Discussion
Core Foundation / CFAttributedStringGetStatisticalWritingDirections(_:_:_:_:_:)
Function
CFAttributedStringGetStatisticalWriting
Directions(_:_:_:_:_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


