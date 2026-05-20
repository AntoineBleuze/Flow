# 001_CTFontCollection.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


