# Reference.pdf

## Page 1

This reference document describes the attributes to which Core Text responds when the attribute
are placed in a CFAttributedString object.
String Attribute Name Constants
These constants represent string attribute names.
struct CTUnderlineStyle
Underline style specifiers.
struct CTUnderlineStyleModifiers
Underline style modifiers.
Overview
Topics
Constants
See Also
Reference
Core Text / Styling Attributed Strings
API Collection
Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedStrin
object.


## Page 2

Core Text Structures
Core Text Enumerations
Core Text Constants
Core Text Functions
Core Text Data Types
SFNT Support


## Page 3

Core Text / Core Text Structures
API Collection
Core Text Structures


## Page 4

struct CTLineBoundsOptions
Options for getting the bounds of a line of text.
struct LtagStringRange
struct LtagTable
struct SFNTLookupVectorHeader
Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Enumerations
Core Text Constants
Core Text Functions
Core Text Data Types
SFNT Support
Topics
Structures
See Also
Reference


## Page 5

enum CTFontDescriptorMatchingState
Constants that track the progress of font descriptor matching.
enum CTFontManagerAutoActivationSetting
Sets the auto-activation for the specified bundle identifier.
enum CTFontManagerError
Errors that prevent unregistration of fonts for a specified font file URL.
enum CTFontManagerScope
Constants that define the scope for font registration.
struct CTLineBoundsOptions
Options for getting the bounds of a line of text.
enum CTRubyAlignment
Constants that specify how to align the ruby text and the base text relative to each other wh
they have different lengths.
enum CTRubyOverhang
Constants that specify whether, and on which side, ruby text can overhang adjacent text if it
wider than the base text.
enum CTRubyPosition
Constants that specify the position of the ruby text relative to to the base text.
Topics
Enumerations
Core Text / Core Text Enumerations
API Collection
Core Text Enumerations


## Page 6

Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Structures
Core Text Constants
Core Text Functions
Core Text Data Types
SFNT Support
See Also
Reference


## Page 7

var ATSFONTREF_DEFINED: Int32
var kBSLNIdeographicHighBaseline: Int
let kCTAdaptiveImageProviderAttributeName: CFString
let kCTBackgroundColorAttributeName: CFString
let kCTBaselineClassAttributeName: CFString
let kCTBaselineClassHanging: CFString
let kCTBaselineClassIdeographicCentered: CFString
let kCTBaselineClassIdeographicHigh: CFString
let kCTBaselineClassIdeographicLow: CFString
let kCTBaselineClassMath: CFString
let kCTBaselineClassRoman: CFString
let kCTBaselineInfoAttributeName: CFString
let kCTBaselineOriginalFont: CFString
let kCTBaselineReferenceFont: CFString
let kCTBaselineReferenceInfoAttributeName: CFString
let kCTFontCollectionDisallowAutoActivationOption: CFString
let kCTFontCollectionIncludeDisabledFontsOption: CFString
Topics
Constants
Core Text / Core Text Constants
API Collection
Core Text Constants


## Page 8

let kCTFontDescriptorMatchingCurrentAssetSize: CFString
let kCTFontDescriptorMatchingDescriptors: CFString
let kCTFontDescriptorMatchingError: CFString
let kCTFontDescriptorMatchingPercentage: CFString
let kCTFontDescriptorMatchingResult: CFString
let kCTFontDescriptorMatchingSourceDescriptor: CFString
let kCTFontDescriptorMatchingTotalAssetSize: CFString
let kCTFontDescriptorMatchingTotalDownloadedSize: CFString
let kCTFontDownloadableAttribute: CFString
The font downloadable state.
let kCTFontDownloadedAttribute: CFString
The download state.
let kCTFontManagerBundleIdentifier: CFString
let kCTFontManagerErrorDomain: CFString
let kCTFontManagerErrorFontAssetNameKey: CFString
let kCTFontManagerErrorFontDescriptorsKey: CFString
let kCTFontManagerErrorFontURLsKey: CFString
let kCTFontManagerRegisteredFontsChangedNotification: CFString
let kCTFontOpenTypeFeatureTag: CFString
let kCTFontOpenTypeFeatureValue: CFString
let kCTFontOpticalSizeAttribute: CFString
let kCTFontRegistrationUserInfoAttribute: CFString
var kCTFontTableAnkr: Int
var kCTFontTableLtag: Int
var kCTFontTableMATH: Int
let kCTFontVariationAxesAttribute: CFString
let kCTHorizontalInVerticalFormsAttributeName: CFString
Setting text in tate-chu-yoko form (horizontal numerals in vertical text).


## Page 9

let kCTLanguageAttributeName: CFString
The name of the text language.
let kCTRubyAnnotationAttributeName: CFString
let kCTRubyAnnotationScaleToFitAttributeName: CFString
let kCTRubyAnnotationSizeFactorAttributeName: CFString
var kCTVersionNumber10_10: Int32
var kCTVersionNumber10_11: Int32
var kCTVersionNumber10_12: Int32
var kCTVersionNumber10_13: Int32
var kCTVersionNumber10_14: Int32
var kCTVersionNumber10_15: Int32
var kCTVersionNumber10_5_2: Int32
var kCTVersionNumber10_5_3: Int32
var kCTVersionNumber10_5_5: Int32
var kCTVersionNumber10_5: Int32
var kCTVersionNumber10_6: Int32
var kCTVersionNumber10_7: Int32
var kCTVersionNumber10_8: Int32
var kCTVersionNumber10_9: Int32
var kCTVersionNumber11_0: Int32
let kCTWritingDirectionAttributeName: CFString
var kCTWritingDirectionEmbedding: Int
var kCTWritingDirectionOverride: Int
var kKERXDescending: Int
var kKERXValuesAreLong: Int
var kLanguageTagType: Int
var kLTAGCurrentVersion: Int
var kMORXCoverLogicalOrder: Int


## Page 10

var kSTKCrossStreamReset: Int
Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Structures
Core Text Enumerations
Core Text Functions
Core Text Data Types
SFNT Support
See Also
Reference


## Page 11

func CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArray,
CFSet?, CTFontDescriptorProgressHandler) -> Bool
Matches font descriptors and tracks progress with a progress handler.
func CTFontManagerCompareFontFamilyNames(UnsafeRawPointer, UnsafeRaw
Pointer, UnsafeMutableRawPointer?) -> CFComparisonResult
A comparator function to compare font family names and sort them according to Apple
guidelines.
func CTFontManagerCopyAvailableFontFamilyNames() -> CFArray
Returns an array of visible font family names sorted for user interface display.
func CTFontManagerCopyAvailableFontURLs() -> CFArray
Returns an array of font URLs.
func CTFontManagerCopyAvailablePostScriptNames() -> CFArray
Returns an array of unique PostScript font names for the fonts.
func CTFontManagerCreateFontDescriptorFromData(CFData) -> CTFont
Descriptor?
Creates a font descriptor representing the font in the supplied data.
func CTFontManagerCreateFontDescriptorsFromURL(CFURL) -> CFArray?
Returns an array of font descriptors representing each of the fonts in the specified URL.
Topics
Functions
Core Text / Core Text Functions
API Collection
Core Text Functions


## Page 12

func CTFontManagerCreateFontRequestRunLoopSource(CFIndex, (CFDictionary
pid_t) -> Unmanaged<CFArray>) -> CFRunLoopSource?
Creates a reference to a run loop source used to convey font requests from the Font Manage
Deprecated
func CTFontManagerEnableFontDescriptors(CFArray, Bool)
Enables or disables the matching font descriptors for font descriptor matching.
func CTFontManagerGetAutoActivationSetting(CFString?) -> CTFontManager
AutoActivationSetting
Gets the auto-activation setting for the specified bundle identifier.
func CTFontManagerGetScopeForURL(CFURL) -> CTFontManagerScope
Returns the registration scope of the specified URL.
func CTFontManagerIsSupportedFont(CFURL) -> Bool
Determines whether a file is in a supported font format.
func CTFontManagerRegisterFontsForURL(CFURL, CTFontManagerScope, Unsafe
MutablePointer<Unmanaged<CFError>?>?) -> Bool
Registers fonts from the specified font URL with the Font Manager. Registered fonts are
discoverable through font descriptor matching.
func CTFontManagerRegisterFontsForURLs(CFArray, CTFontManagerScope,
UnsafeMutablePointer<Unmanaged<CFArray>?>?) -> Bool
Registers fonts from the specified array of font URLs with the Font Manager. Registered font
are discoverable through font descriptor matching.
Deprecated
func CTFontManagerRegisterGraphicsFont(CGFont, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Bool
Registers the specified graphics font with the font manager.
Deprecated
func CTFontManagerSetAutoActivationSetting(CFString?, CTFontManagerAuto
ActivationSetting)
Sets the auto-activation setting for the specified bundle identifier.
func CTFontManagerUnregisterFontsForURL(CFURL, CTFontManagerScope,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Bool
Unregisters fonts from the specified font URL with the Font Manager. Unregistered fonts are
no longer discoverable through font descriptor matching.


## Page 13

func CTFontManagerUnregisterFontsForURLs(CFArray, CTFontManagerScope,
UnsafeMutablePointer<Unmanaged<CFArray>?>?) -> Bool
Unregisters fonts from the specified array of font URLs with the Font Manager. Unregistered
fonts are no longer discoverable through font descriptor matching.
Deprecated
func CTFontManagerUnregisterGraphicsFont(CGFont, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> Bool
Unregisters the specified graphics font with the font manager.
Deprecated
func CTFontManagerCopyRegisteredFontDescriptors(CTFontManagerScope, Boo
) -> CFArray
Retrieves the font descriptors that were registered with the font manager.
func CTFontManagerCreateFontDescriptorsFromData(CFData) -> CFArray
Creates an array of font descriptors for the fonts in the supplied data.
func CTFontManagerRegisterFontDescriptors(CFArray, CTFontManagerScope,
Bool, ((CFArray, Bool) -> Bool)?)
Registers font descriptors with the font manager.
func CTFontManagerRegisterFontURLs(CFArray, CTFontManagerScope, Bool, (
CFArray, Bool) -> Bool)?)
Registers fonts from the specified font URLs with the font manager.
func CTFontManagerRegisterFontsWithAssetNames(CFArray, CFBundle?, CTFon
ManagerScope, Bool, ((CFArray, Bool) -> Bool)?)
Registers named font assets in the specified bundle with the font manager.
func CTFontManagerRequestFonts(CFArray, (CFArray) -> Void)
Resolves font descriptors specified on input.
func CTFontManagerUnregisterFontDescriptors(CFArray, CTFontManagerScope
((CFArray, Bool) -> Bool)?)
Unregisters font descriptors with the font manager.
func CTFontManagerUnregisterFontURLs(CFArray, CTFontManagerScope, ((
CFArray, Bool) -> Bool)?)
Unregisters fonts from the specified font URLs with the font manager.
func CTGetCoreTextVersion() -> UInt32
Returns the version of the Core Text framework.


## Page 14

Deprecated
func CTRubyAnnotationCreate(CTRubyAlignment, CTRubyOverhang, CGFloat,
UnsafeMutablePointer<Unmanaged<CFString>?>) -> CTRubyAnnotation
Creates an immutable ruby annotation object.
func CTRubyAnnotationCreateCopy(CTRubyAnnotation) -> CTRubyAnnotation
Creates an immutable copy of a ruby annotation object.
func CTRubyAnnotationCreateWithAttributes(CTRubyAlignment, CTRuby
Overhang, CTRubyPosition, CFString, CFDictionary) -> CTRubyAnnotation
Creates an immutable ruby annotation object with the specified attributes.
func CTRubyAnnotationGetAlignment(CTRubyAnnotation) -> CTRubyAlignment
Retrieves the alignment value of a ruby annotation object.
func CTRubyAnnotationGetOverhang(CTRubyAnnotation) -> CTRubyOverhang
Retrieves the overhang value of a ruby annotation object.
func CTRubyAnnotationGetSizeFactor(CTRubyAnnotation) -> CGFloat
Retrieves the size factor of a ruby annotation object.
func CTRubyAnnotationGetTextForPosition(CTRubyAnnotation, CTRubyPositio
) -> CFString?
Retrieves the ruby text for a particular position in a ruby annotation.
func CTRubyAnnotationGetTypeID() -> CFTypeID
Retrieves the type of the ruby annotation object.
func CTFontCopyNameForGlyph(CTFont, CGGlyph) -> CFString?
Retrieves the name for the specified glyph.
func CTFontDrawImageFromAdaptiveImageProviderAtPoint(CTFont, any
CTAdaptiveImageProviding, CGPoint, CGContext)
func CTFontGetTypographicBoundsForAdaptiveImageProvider(CTFont, (any
CTAdaptiveImageProviding)?) -> CGRect
func CTFontHasTable(CTFont, CTFontTableTag) -> Bool
See Also


## Page 15

Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Structures
Core Text Enumerations
Core Text Constants
Core Text Data Types
SFNT Support
Reference


## Page 16

Core Text / Core Text Data Types
API Collection
Core Text Data Types


## Page 17

typealias ATSFontRef
typealias CTFontCollectionSortDescriptorsCallback
The collection sorting callback type.
typealias CTFontDescriptorProgressHandler
The progress callback type.
Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Structures
Core Text Enumerations
Core Text Constants
Core Text Functions
SFNT Support
Topics
Data Types
See Also
Reference


## Page 18

struct AnchorPoint
struct AnchorPointTable
struct AnkrTable
struct BslnFormat0Part
struct BslnFormat1Part
struct BslnFormat2Part
struct BslnFormat3Part
struct BslnFormatUnion
struct BslnTable
struct FontVariation
struct JustDirectionTable
struct JustPCAction
struct JustPCActionSubrecord
struct JustPCConditionalAddAction
struct JustPCDecompositionAction
struct JustPCDuctilityAction
struct JustPCGlyphRepeatAddAction
Topics
Structures
Core Text / SFNT Support
API Collection
SFNT Support


## Page 19

struct JustPostcompTable
struct JustTable
struct JustWidthDeltaEntry
struct JustWidthDeltaGroup
struct KernFormatSpecificHeader
struct KernIndexArrayHeader
struct KernKerningPair
struct KernOffsetTable
struct KernOrderedListEntry
struct KernOrderedListHeader
struct KernSimpleArrayHeader
struct KernStateEntry
struct KernStateHeader
struct KernSubtableHeader
struct KernTableHeader
struct KernVersion0Header
struct KernVersion0SubtableHeader
struct KerxAnchorPointAction
struct KerxControlPointAction
struct KerxControlPointEntry
struct KerxControlPointHeader
struct KerxCoordinateAction
struct KerxFormatSpecificHeader
struct KerxIndexArrayHeader
struct KerxKerningPair
struct KerxOrderedListEntry
struct KerxOrderedListHeader
struct KerxSimpleArrayHeader


## Page 20

struct KerxStateEntry
struct KerxStateHeader
struct KerxSubtableHeader
struct KerxTableHeader
struct LcarCaretClassEntry
struct LcarCaretTable
struct MortChain
struct MortContextualSubtable
struct MortFeatureEntry
struct MortInsertionSubtable
struct MortLigatureSubtable
struct MortRearrangementSubtable
struct MortSpecificSubtable
struct MortSubtable
struct MortSwashSubtable
struct MortTable
struct MorxChain
struct MorxContextualSubtable
struct MorxInsertionSubtable
struct MorxLigatureSubtable
struct MorxRearrangementSubtable
struct MorxSpecificSubtable
struct MorxSubtable
struct MorxTable
struct OpbdSideValues
struct OpbdTable
struct PropLookupSegment
struct PropLookupSingle


## Page 21

struct PropTable
struct ROTAGlyphEntry
Deprecated
struct ROTAHeader
Deprecated
struct SFNTLookupArrayHeader
struct SFNTLookupBinarySearchHeader
struct SFNTLookupFormatSpecificHeader
struct SFNTLookupSegment
struct SFNTLookupSegmentHeader
struct SFNTLookupSingle
struct SFNTLookupSingleHeader
struct SFNTLookupTable
struct SFNTLookupTrimmedArrayHeader
struct STClassTable
struct STEntryOne
struct STEntryTwo
struct STEntryZero
struct STHeader
struct STXEntryOne
struct STXEntryTwo
struct STXEntryZero
struct STXHeader
struct TrakTable
struct TrakTableData
struct TrakTableEntry
struct sfntCMapEncoding
struct sfntCMapExtendedSubHeader
struct sfntCMapHeader
struct sfntCMapSubHeader


## Page 22

struct sfntDescriptorHeader
struct sfntDirectory
struct sfntDirectoryEntry
struct sfntFeatureHeader
struct sfntFeatureName
struct sfntFontDescriptor
struct sfntFontFeatureSetting
struct sfntFontRunFeature
struct sfntInstance
struct sfntNameHeader
struct sfntNameRecord
struct sfntVariationAxis
struct sfntVariationHeader
struct ALMXGlyphEntry
Deprecated
struct ALMXHeader
Deprecated
typealias BslnBaselineClass
typealias BslnBaselineRecord
typealias BslnTableFormat
typealias BslnTablePtr
typealias FontLanguageCode
typealias FontNameCode
typealias FontPlatformCode
typealias FontScriptCode
typealias JustPCActionType
typealias JustPCUnconditionalAddAction
typealias JustificationFlags
Type Aliases


## Page 23

typealias KernArrayOffset
typealias KernKerningValue
typealias KernOffsetTablePtr
typealias KernOrderedListEntryPtr
typealias KernSubtableHeaderPtr
typealias KernSubtableInfo
typealias KernTableFormat
typealias KernTableHeaderHandle
typealias KernTableHeaderPtr
typealias KerxArrayOffset
typealias KerxOrderedListEntryPtr
typealias KerxSubtableCoverage
typealias KerxSubtableHeaderPtr
typealias KerxTableHeaderHandle
typealias KerxTableHeaderPtr
typealias LcarCaretTablePtr
typealias MortLigatureActionEntry
typealias MortSubtableMaskFlags
typealias OpbdTableFormat
typealias PropCharProperties
typealias SFNTLookupKind
typealias SFNTLookupOffset
typealias SFNTLookupTableFormat
typealias SFNTLookupTableHandle
typealias SFNTLookupTablePtr
typealias SFNTLookupValue
typealias STClass
typealias STEntryIndex


## Page 24

typealias STXClass
typealias STXClassTable
typealias STXEntryIndex
typealias STXStateIndex
typealias TrakValue
var cmapFontTableTag: Int
var descriptorFontTableTag: Int
var featureFontTableTag: Int
var kANKRCurrentVersion: Int
var kAbbrevSquaredLigaturesOffSelector: Int
var kAbbrevSquaredLigaturesOnSelector: Int
var kAllCapsSelector: Int
var kAllLowerCaseSelector: Int
var kAllTypeFeaturesOffSelector: Int
var kAllTypeFeaturesOnSelector: Int
var kAllTypographicFeaturesType: Int
var kAltHalfWidthTextSelector: Int
var kAltProportionalTextSelector: Int
var kAlternateHorizKanaOffSelector: Int
var kAlternateHorizKanaOnSelector: Int
var kAlternateKanaType: Int
var kAlternateVertKanaOffSelector: Int
var kAlternateVertKanaOnSelector: Int
var kAnnotationType: Int
var kAsteriskToMultiplyOffSelector: Int
var kAsteriskToMultiplyOnSelector: Int
Constants


## Page 25

var kBSLNControlPointFormatNoMap: Int
var kBSLNControlPointFormatWithMap: Int
var kBSLNCurrentVersion: Int
var kBSLNDistanceFormatNoMap: Int
var kBSLNDistanceFormatWithMap: Int
var kBSLNHangingBaseline: Int
var kBSLNIdeographicCenterBaseline: Int
var kBSLNIdeographicLowBaseline: Int
var kBSLNLastBaseline: Int
var kBSLNMathBaseline: Int
var kBSLNNoBaseline: Int
var kBSLNNoBaselineOverride: Int
var kBSLNNumBaselineClasses: Int
var kBSLNRomanBaseline: Int
var kBSLNTag: Int
var kBoxAnnotationSelector: Int
var kCJKItalicRomanOffSelector: Int
var kCJKItalicRomanOnSelector: Int
var kCJKItalicRomanSelector: Int
var kCJKRomanSpacingType: Int
var kCJKSymbolAltFiveSelector: Int
var kCJKSymbolAltFourSelector: Int
var kCJKSymbolAltOneSelector: Int
var kCJKSymbolAltThreeSelector: Int
var kCJKSymbolAltTwoSelector: Int
var kCJKSymbolAlternativesType: Int
var kCJKVerticalRomanCenteredSelector: Int
var kCJKVerticalRomanHBaselineSelector: Int


## Page 26

var kCJKVerticalRomanPlacementType: Int
var kCTFontTableCBDT: Int
var kCTFontTableCBLC: Int
var kCTFontTableCFF2: Int
var kCTFontTableCOLR: Int
var kCTFontTableCPAL: Int
var kCTFontTableCidg: Int
var kCTFontTableFond: Int
var kCTFontTableHVAR: Int
var kCTFontTableMERG: Int
var kCTFontTableMVAR: Int
var kCTFontTableMeta: Int
var kCTFontTableSTAT: Int
var kCTFontTableSVG: Int
var kCTFontTableVVAR: Int
var kCTFontTableXref: Int
var kCanonicalCompositionOffSelector: Int
var kCanonicalCompositionOnSelector: Int
var kCaseSensitiveLayoutOffSelector: Int
var kCaseSensitiveLayoutOnSelector: Int
var kCaseSensitiveLayoutType: Int
var kCaseSensitiveSpacingOffSelector: Int
var kCaseSensitiveSpacingOnSelector: Int
var kCharacterAlternativesType: Int
var kCharacterShapeType: Int
var kCircleAnnotationSelector: Int
var kCommonLigaturesOffSelector: Int
var kCommonLigaturesOnSelector: Int


## Page 27

var kCompatibilityCompositionOffSelector: Int
var kCompatibilityCompositionOnSelector: Int
var kContextualAlternatesOffSelector: Int
var kContextualAlternatesOnSelector: Int
var kContextualAlternatesType: Int
var kContextualLigaturesOffSelector: Int
var kContextualLigaturesOnSelector: Int
var kContextualSwashAlternatesOffSelector: Int
var kContextualSwashAlternatesOnSelector: Int
var kCursiveConnectionType: Int
var kCursiveSelector: Int
var kDecomposeDiacriticsSelector: Int
var kDecorativeBordersSelector: Int
var kDefaultCJKRomanSelector: Int
var kDefaultLowerCaseSelector: Int
var kDefaultUpperCaseSelector: Int
var kDesignComplexityType: Int
var kDesignLevel1Selector: Int
var kDesignLevel2Selector: Int
var kDesignLevel3Selector: Int
var kDesignLevel4Selector: Int
var kDesignLevel5Selector: Int
var kDiacriticsType: Int
var kDiagonalFractionsSelector: Int
var kDiamondAnnotationSelector: Int
var kDingbatsSelector: Int
var kDiphthongLigaturesOffSelector: Int
var kDiphthongLigaturesOnSelector: Int


## Page 28

var kDisplayTextSelector: Int
var kEngravedTextSelector: Int
var kExpertCharactersSelector: Int
var kExponentsOffSelector: Int
var kExponentsOnSelector: Int
var kFleuronsSelector: Int
var kFontAlbanianLanguage: Int
var kFontAmharicLanguage: Int
var kFontAmharicScript: Int
var kFontArabicLanguage: Int
var kFontArabicScript: Int
var kFontArmenianLanguage: Int
var kFontArmenianScript: Int
var kFontAssameseLanguage: Int
var kFontAymaraLanguage: Int
var kFontAzerbaijanArLanguage: Int
var kFontAzerbaijaniLanguage: Int
var kFontBasqueLanguage: Int
var kFontBengaliLanguage: Int
var kFontBengaliScript: Int
var kFontBulgarianLanguage: Int
var kFontBurmeseLanguage: Int
var kFontBurmeseScript: Int
var kFontByelorussianLanguage: Int
var kFontCatalanLanguage: Int
var kFontChewaLanguage: Int
var kFontChineseScript: Int
var kFontCopyrightName: Int


## Page 29

var kFontCroatianLanguage: Int
var kFontCustom16BitScript: Int
var kFontCustom816BitScript: Int
var kFontCustom8BitScript: Int
var kFontCustomPlatform: Int
var kFontCyrillicScript: Int
var kFontCzechLanguage: Int
var kFontDanishLanguage: Int
var kFontDescriptionName: Int
var kFontDesignerName: Int
var kFontDesignerURLName: Int
var kFontDevanagariScript: Int
var kFontDutchLanguage: Int
var kFontDzongkhaLanguage: Int
var kFontEastEuropeanRomanScript: Int
var kFontEnglishLanguage: Int
var kFontEsperantoLanguage: Int
var kFontEstonianLanguage: Int
var kFontEthiopicScript: Int
var kFontExtendedArabicScript: Int
var kFontFaeroeseLanguage: Int
var kFontFamilyName: Int
var kFontFarsiLanguage: Int
var kFontFinnishLanguage: Int
var kFontFlemishLanguage: Int
var kFontFrenchLanguage: Int
var kFontFullName: Int
var kFontGallaLanguage: Int


## Page 30

var kFontGeezScript: Int
var kFontGeorgianLanguage: Int
var kFontGeorgianScript: Int
var kFontGermanLanguage: Int
var kFontGreekLanguage: Int
var kFontGreekScript: Int
var kFontGuaraniLanguage: Int
var kFontGujaratiLanguage: Int
var kFontGujaratiScript: Int
var kFontGurmukhiScript: Int
var kFontHebrewLanguage: Int
var kFontHebrewScript: Int
var kFontHindiLanguage: Int
var kFontHungarianLanguage: Int
var kFontISO10646_1993Semantics: Int
var kFontIcelandicLanguage: Int
var kFontIndonesianLanguage: Int
var kFontIrishLanguage: Int
var kFontItalianLanguage: Int
var kFontJapaneseLanguage: Int
var kFontJapaneseScript: Int
var kFontJavaneseRomLanguage: Int
var kFontKannadaLanguage: Int
var kFontKannadaScript: Int
var kFontKashmiriLanguage: Int
var kFontKazakhLanguage: Int
var kFontKhmerLanguage: Int
var kFontKhmerScript: Int


## Page 31

var kFontKirghizLanguage: Int
var kFontKoreanLanguage: Int
var kFontKoreanScript: Int
var kFontKurdishLanguage: Int
var kFontLaoLanguage: Int
var kFontLaotianScript: Int
var kFontLappishLanguage: Int
var kFontLastReservedName: Int
var kFontLatinLanguage: Int
var kFontLatvianLanguage: Int
var kFontLettishLanguage: Int
var kFontLicenseDescriptionName: Int
var kFontLicenseInfoURLName: Int
var kFontLithuanianLanguage: Int
var kFontMacCompatibleFullName: Int
var kFontMacedonianLanguage: Int
var kFontMacintoshPlatform: Int
var kFontMalagasyLanguage: Int
var kFontMalayArabicLanguage: Int
var kFontMalayRomanLanguage: Int
var kFontMalayalamLanguage: Int
var kFontMalayalamScript: Int
var kFontMalteseLanguage: Int
var kFontManufacturerName: Int
var kFontMarathiLanguage: Int
var kFontMicrosoftPlatform: Int
var kFontMicrosoftStandardScript: Int
var kFontMicrosoftSymbolScript: Int


## Page 32

var kFontMicrosoftUCS4Script: Int
var kFontMoldavianLanguage: Int
var kFontMongolianCyrLanguage: Int
var kFontMongolianLanguage: Int
var kFontMongolianScript: Int
var kFontNepaliLanguage: Int
var kFontNoLanguageCode: UInt32
var kFontNoNameCode: UInt32
var kFontNoPlatformCode: UInt32
var kFontNoScriptCode: UInt32
var kFontNorwegianLanguage: Int
var kFontOriyaLanguage: Int
var kFontOriyaScript: Int
var kFontOromoLanguage: Int
var kFontPashtoLanguage: Int
var kFontPersianLanguage: Int
var kFontPolishLanguage: Int
var kFontPortugueseLanguage: Int
var kFontPostScriptCIDName: Int
var kFontPostscriptName: Int
var kFontPreferredFamilyName: Int
var kFontPreferredSubfamilyName: Int
var kFontPunjabiLanguage: Int
var kFontQuechuaLanguage: Int
var kFontRSymbolScript: Int
var kFontReservedPlatform: Int
var kFontRomanScript: Int
var kFontRomanianLanguage: Int


## Page 33

var kFontRuandaLanguage: Int
var kFontRundiLanguage: Int
var kFontRussian: Int
var kFontRussianLanguage: Int
var kFontSaamiskLanguage: Int
var kFontSampleTextName: Int
var kFontSanskritLanguage: Int
var kFontSerbianLanguage: Int
var kFontSimpChineseLanguage: Int
var kFontSimpleChineseScript: Int
var kFontSindhiLanguage: Int
var kFontSindhiScript: Int
var kFontSinhaleseLanguage: Int
var kFontSinhaleseScript: Int
var kFontSlavicScript: Int
var kFontSlovakLanguage: Int
var kFontSlovenianLanguage: Int
var kFontSomaliLanguage: Int
var kFontSpanishLanguage: Int
var kFontStyleName: Int
var kFontSundaneseRomLanguage: Int
var kFontSwahiliLanguage: Int
var kFontSwedishLanguage: Int
var kFontTagalogLanguage: Int
var kFontTajikiLanguage: Int
var kFontTamilLanguage: Int
var kFontTamilScript: Int
var kFontTatarLanguage: Int


## Page 34

var kFontTeluguLanguage: Int
var kFontTeluguScript: Int
var kFontThaiLanguage: Int
var kFontThaiScript: Int
var kFontTibetanLanguage: Int
var kFontTibetanScript: Int
var kFontTigrinyaLanguage: Int
var kFontTradChineseLanguage: Int
var kFontTrademarkName: Int
var kFontTraditionalChineseScript: Int
var kFontTurkishLanguage: Int
var kFontTurkmenLanguage: Int
var kFontUighurLanguage: Int
var kFontUkrainianLanguage: Int
var kFontUnicodeDefaultSemantics: Int
var kFontUnicodePlatform: Int
var kFontUnicodeV1_1Semantics: Int
var kFontUnicodeV2_0BMPOnlySemantics: Int
var kFontUnicodeV2_0FullCoverageSemantics: Int
var kFontUnicodeV4_0VariationSequenceSemantics: Int
var kFontUnicode_FullRepertoire: Int
var kFontUninterpretedScript: Int
var kFontUniqueName: Int
var kFontUrduLanguage: Int
var kFontUzbekLanguage: Int
var kFontVendorURLName: Int
var kFontVersionName: Int
var kFontVietnameseLanguage: Int


## Page 35

var kFontVietnameseScript: Int
var kFontWelshLanguage: Int
var kFontYiddishLanguage: Int
var kFormInterrobangOffSelector: Int
var kFormInterrobangOnSelector: Int
var kFractionsType: Int
var kFullWidthCJKRomanSelector: Int
var kFullWidthIdeographsSelector: Int
var kFullWidthKanaSelector: Int
var kHalfWidthCJKRomanSelector: Int
var kHalfWidthIdeographsSelector: Int
var kHalfWidthTextSelector: Int
var kHanjaToHangulAltOneSelector: Int
var kHanjaToHangulAltThreeSelector: Int
var kHanjaToHangulAltTwoSelector: Int
var kHanjaToHangulSelector: Int
var kHideDiacriticsSelector: Int
var kHiraganaToKatakanaSelector: Int
var kHistoricalLigaturesOffSelector: Int
var kHistoricalLigaturesOnSelector: Int
var kHojoCharactersSelector: Int
var kHyphenToEnDashOffSelector: Int
var kHyphenToEnDashOnSelector: Int
var kHyphenToMinusOffSelector: Int
var kHyphenToMinusOnSelector: Int
var kHyphensToEmDashOffSelector: Int
var kHyphensToEmDashOnSelector: Int
var kIdeographicAltFiveSelector: Int


## Page 36

var kIdeographicAltFourSelector: Int
var kIdeographicAltOneSelector: Int
var kIdeographicAltThreeSelector: Int
var kIdeographicAltTwoSelector: Int
var kIdeographicAlternativesType: Int
var kIdeographicSpacingType: Int
var kIlluminatedCapsSelector: Int
var kInequalityLigaturesOffSelector: Int
var kInequalityLigaturesOnSelector: Int
var kInferiorsSelector: Int
var kInitialCapsAndSmallCapsSelector: Int
var kInitialCapsSelector: Int
var kInternationalSymbolsSelector: Int
var kInvertedBoxAnnotationSelector: Int
var kInvertedCircleAnnotationSelector: Int
var kInvertedRoundedBoxAnnotationSelector: Int
var kItalicCJKRomanType: Int
var kJIS1978CharactersSelector: Int
var kJIS1983CharactersSelector: Int
var kJIS1990CharactersSelector: Int
var kJIS2004CharactersSelector: Int
var kJUSTCurrentVersion: Int
var kJUSTKashidaPriority: Int
var kJUSTLetterPriority: Int
var kJUSTNullPriority: Int
var kJUSTOverrideLimits: Int
var kJUSTOverridePriority: Int
var kJUSTOverrideUnlimited: Int


## Page 37

var kJUSTPriorityCount: Int
var kJUSTPriorityMask: Int
var kJUSTSpacePriority: Int
var kJUSTStandardFormat: Int
var kJUSTTag: Int
var kJUSTUnlimited: Int
var kJUSTnoGlyphcode: Int
var kJUSTpcConditionalAddAction: Int
var kJUSTpcDecompositionAction: Int
var kJUSTpcDuctilityAction: Int
var kJUSTpcGlyphRepeatAddAction: Int
var kJUSTpcGlyphStretchAction: Int
var kJUSTpcUnconditionalAddAction: Int
var kKERNCrossStream: Int
var kKERNCrossStreamResetNote: Int
var kKERNCurrentVersion: Int
var kKERNFormatMask: Int
var kKERNIndexArray: Int
var kKERNLineEndKerning: Int
var kKERNLineStart: Int
var kKERNNoCrossKerning: Int
var kKERNNoStakeNote: Int
var kKERNNotApplied: Int
var kKERNNotesRequested: Int
var kKERNOrderedList: Int
var kKERNResetCrossStream: Int
var kKERNSimpleArray: Int
var kKERNStateTable: Int


## Page 38

var kKERNTag: Int
var kKERNUnusedBits: Int
var kKERNVariation: Int
var kKERNVertical: Int
var kKERXActionOffsetMask: UInt32
var kKERXActionTypeAnchorPoints: UInt32
var kKERXActionTypeControlPoints: UInt32
var kKERXActionTypeCoordinates: UInt32
var kKERXActionTypeMask: UInt32
var kKERXControlPoint: Int
var kKERXCrossStream: Int
var kKERXCrossStreamResetNote: Int
var kKERXCurrentVersion: Int
var kKERXFormatMask: Int
var kKERXIndexArray: Int
var kKERXLineEndKerning: Int
var kKERXLineStart: Int
var kKERXNoCrossKerning: Int
var kKERXNoStakeNote: Int
var kKERXNotApplied: Int
var kKERXNotesRequested: Int
var kKERXOrderedList: Int
var kKERXResetCrossStream: Int
var kKERXSimpleArray: Int
var kKERXStateTable: Int
var kKERXTag: Int
var kKERXUnusedBits: Int
var kKERXUnusedFlags: UInt32


## Page 39

var kKERXVariation: Int
var kKERXVertical: Int
var kKanaSpacingType: Int
var kKanaToRomanizationSelector: Int
var kKatakanaToHiraganaSelector: Int
var kLCARCtlPointFormat: Int
var kLCARCurrentVersion: Int
var kLCARLinearFormat: Int
var kLCARTag: Int
var kLastFeatureType: Int
var kLetterCaseType: Int
var kLigaturesType: Int
var kLineFinalSwashesOffSelector: Int
var kLineFinalSwashesOnSelector: Int
var kLineInitialSwashesOffSelector: Int
var kLineInitialSwashesOnSelector: Int
var kLinguisticRearrangementOffSelector: Int
var kLinguisticRearrangementOnSelector: Int
var kLinguisticRearrangementType: Int
var kLogosOffSelector: Int
var kLogosOnSelector: Int
var kLowerCaseNumbersSelector: Int
var kLowerCasePetiteCapsSelector: Int
var kLowerCaseSmallCapsSelector: Int
var kLowerCaseType: Int
var kMORTContextualType: Int
var kMORTCoverDescending: Int
var kMORTCoverIgnoreVertical: Int


## Page 40

var kMORTCoverTypeMask: Int
var kMORTCoverVertical: Int
var kMORTCurrInsertBefore: Int
var kMORTCurrInsertCountMask: Int
var kMORTCurrInsertCountShift: Int
var kMORTCurrInsertKashidaLike: Int
var kMORTCurrJustTableCountMask: Int
var kMORTCurrJustTableCountShift: Int
var kMORTCurrentVersion: Int
var kMORTDoInsertionsBefore: Int
var kMORTInsertionType: Int
var kMORTInsertionsCountMask: Int
var kMORTIsSplitVowelPiece: Int
var kMORTLigFormOffsetMask: Int
var kMORTLigFormOffsetShift: Int
var kMORTLigLastAction: Int
var kMORTLigStoreLigature: Int
var kMORTLigatureType: Int
var kMORTMarkInsertBefore: Int
var kMORTMarkInsertCountMask: Int
var kMORTMarkInsertCountShift: Int
var kMORTMarkInsertKashidaLike: Int
var kMORTMarkJustTableCountMask: Int
var kMORTMarkJustTableCountShift: Int
var kMORTRearrangementType: Int
var kMORTSwashType: Int
var kMORTTag: Int
var kMORTraCDx: Int


## Page 41

var kMORTraCDxA: Int
var kMORTraCDxAB: Int
var kMORTraCDxBA: Int
var kMORTraDCx: Int
var kMORTraDCxA: Int
var kMORTraDCxAB: Int
var kMORTraDCxBA: Int
var kMORTraDx: Int
var kMORTraDxA: Int
var kMORTraDxAB: Int
var kMORTraDxBA: Int
var kMORTraNoAction: Int
var kMORTraxA: Int
var kMORTraxAB: Int
var kMORTraxBA: Int
var kMORXCoverDescending: Int
var kMORXCoverIgnoreVertical: Int
var kMORXCoverTypeMask: Int
var kMORXCoverVertical: Int
var kMORXCurrentVersion: Int
var kMORXTag: Int
var kMathSymbolsSelector: Int
var kMathematicalExtrasType: Int
var kMathematicalGreekOffSelector: Int
var kMathematicalGreekOnSelector: Int
var kMonospacedNumbersSelector: Int
var kMonospacedTextSelector: Int
var kNLCCharactersSelector: Int


## Page 42

var kNoAlternatesSelector: Int
var kNoAnnotationSelector: Int
var kNoCJKItalicRomanSelector: Int
var kNoCJKSymbolAlternativesSelector: Int
var kNoFractionsSelector: Int
var kNoIdeographicAlternativesSelector: Int
var kNoOrnamentsSelector: Int
var kNoRubyKanaSelector: Int
var kNoStyleOptionsSelector: Int
var kNoStylisticAlternatesSelector: Int
var kNoTransliterationSelector: Int
var kNonFinalSwashesOffSelector: Int
var kNonFinalSwashesOnSelector: Int
var kNormalPositionSelector: Int
var kNumberCaseType: Int
var kNumberSpacingType: Int
var kOPBDControlPointFormat: Int
var kOPBDCurrentVersion: Int
var kOPBDDistanceFormat: Int
var kOPBDTag: Int
var kOrdinalsSelector: Int
var kOrnamentSetsType: Int
var kOverlappingCharactersType: Int
var kPROPALDirectionClass: Int
var kPROPANDirectionClass: Int
var kPROPBNDirectionClass: Int
var kPROPCSDirectionClass: Int
var kPROPCanHangLTMask: Int


## Page 43

var kPROPCanHangRBMask: Int
var kPROPCurrentVersion: Int
var kPROPDirectionMask: Int
var kPROPENDirectionClass: Int
var kPROPESDirectionClass: Int
var kPROPETDirectionClass: Int
var kPROPIsFloaterMask: Int
var kPROPLDirectionClass: Int
var kPROPLREDirectionClass: Int
var kPROPLRODirectionClass: Int
var kPROPNSMDirectionClass: Int
var kPROPNumDirectionClasses: Int
var kPROPONDirectionClass: Int
var kPROPPDFDirectionClass: Int
var kPROPPSDirectionClass: Int
var kPROPPairOffsetMask: Int
var kPROPPairOffsetShift: Int
var kPROPPairOffsetSign: Int
var kPROPRDirectionClass: Int
var kPROPRLEDirectionClass: Int
var kPROPRLODirectionClass: Int
var kPROPRightConnectMask: Int
var kPROPSDirectionClass: Int
var kPROPSENDirectionClass: Int
var kPROPTag: Int
var kPROPUseRLPairMask: Int
var kPROPWSDirectionClass: Int
var kPROPZeroReserved: Int


## Page 44

var kParenthesisAnnotationSelector: Int
var kPartiallyConnectedSelector: Int
var kPeriodAnnotationSelector: Int
var kPeriodsToEllipsisOffSelector: Int
var kPeriodsToEllipsisOnSelector: Int
var kPiCharactersSelector: Int
var kPreventOverlapOffSelector: Int
var kPreventOverlapOnSelector: Int
var kProportionalCJKRomanSelector: Int
var kProportionalIdeographsSelector: Int
var kProportionalKanaSelector: Int
var kProportionalNumbersSelector: Int
var kProportionalTextSelector: Int
var kQuarterWidthNumbersSelector: Int
var kQuarterWidthTextSelector: Int
var kRareLigaturesOffSelector: Int
var kRareLigaturesOnSelector: Int
var kRebusPicturesOffSelector: Int
var kRebusPicturesOnSelector: Int
var kRequiredLigaturesOffSelector: Int
var kRequiredLigaturesOnSelector: Int
var kRomanNumeralAnnotationSelector: Int
var kRomanizationToHiraganaSelector: Int
var kRomanizationToKatakanaSelector: Int
var kRoundedBoxAnnotationSelector: Int
var kRubyKanaOffSelector: Int
var kRubyKanaOnSelector: Int
var kRubyKanaSelector: Int


## Page 45

var kRubyKanaType: Int
var kSFNTLookupSegmentArray: Int
var kSFNTLookupSegmentSingle: Int
var kSFNTLookupSimpleArray: Int
var kSFNTLookupSingleTable: Int
var kSFNTLookupTrimmedArray: Int
var kSFNTLookupVector: Int
var kSTClassDeletedGlyph: Int
var kSTClassEndOfLine: Int
var kSTClassEndOfText: Int
var kSTClassOutOfBounds: Int
var kSTLigActionMask: Int
var kSTMarkEnd: Int
var kSTNoAdvance: Int
var kSTRearrVerbMask: Int
var kSTSetMark: Int
var kSTXHasLigAction: Int
var kScientificInferiorsSelector: Int
var kShowDiacriticsSelector: Int
var kSimplifiedCharactersSelector: Int
var kSlashToDivideOffSelector: Int
var kSlashToDivideOnSelector: Int
var kSlashedZeroOffSelector: Int
var kSlashedZeroOnSelector: Int
var kSmallCapsSelector: Int
var kSmartQuotesOffSelector: Int
var kSmartQuotesOnSelector: Int
var kSmartSwashType: Int


## Page 46

var kSquaredLigaturesOffSelector: Int
var kSquaredLigaturesOnSelector: Int
var kStyleOptionsType: Int
var kStylisticAltEightOffSelector: Int
var kStylisticAltEightOnSelector: Int
var kStylisticAltEighteenOffSelector: Int
var kStylisticAltEighteenOnSelector: Int
var kStylisticAltElevenOffSelector: Int
var kStylisticAltElevenOnSelector: Int
var kStylisticAltFifteenOffSelector: Int
var kStylisticAltFifteenOnSelector: Int
var kStylisticAltFiveOffSelector: Int
var kStylisticAltFiveOnSelector: Int
var kStylisticAltFourOffSelector: Int
var kStylisticAltFourOnSelector: Int
var kStylisticAltFourteenOffSelector: Int
var kStylisticAltFourteenOnSelector: Int
var kStylisticAltNineOffSelector: Int
var kStylisticAltNineOnSelector: Int
var kStylisticAltNineteenOffSelector: Int
var kStylisticAltNineteenOnSelector: Int
var kStylisticAltOneOffSelector: Int
var kStylisticAltOneOnSelector: Int
var kStylisticAltSevenOffSelector: Int
var kStylisticAltSevenOnSelector: Int
var kStylisticAltSeventeenOffSelector: Int
var kStylisticAltSeventeenOnSelector: Int
var kStylisticAltSixOffSelector: Int


## Page 47

var kStylisticAltSixOnSelector: Int
var kStylisticAltSixteenOffSelector: Int
var kStylisticAltSixteenOnSelector: Int
var kStylisticAltTenOffSelector: Int
var kStylisticAltTenOnSelector: Int
var kStylisticAltThirteenOffSelector: Int
var kStylisticAltThirteenOnSelector: Int
var kStylisticAltThreeOffSelector: Int
var kStylisticAltThreeOnSelector: Int
var kStylisticAltTwelveOffSelector: Int
var kStylisticAltTwelveOnSelector: Int
var kStylisticAltTwentyOffSelector: Int
var kStylisticAltTwentyOnSelector: Int
var kStylisticAltTwoOffSelector: Int
var kStylisticAltTwoOnSelector: Int
var kStylisticAlternativesType: Int
var kSubstituteVerticalFormsOffSelector: Int
var kSubstituteVerticalFormsOnSelector: Int
var kSuperiorsSelector: Int
var kSwashAlternatesOffSelector: Int
var kSwashAlternatesOnSelector: Int
var kSymbolLigaturesOffSelector: Int
var kSymbolLigaturesOnSelector: Int
var kTRAKCurrentVersion: Int
var kTRAKTag: Int
var kTRAKUniformFormat: Int
var kTallCapsSelector: Int
var kTextSpacingType: Int


## Page 48

var kThirdWidthNumbersSelector: Int
var kThirdWidthTextSelector: Int
var kTitlingCapsSelector: Int
var kTraditionalAltFiveSelector: Int
var kTraditionalAltFourSelector: Int
var kTraditionalAltOneSelector: Int
var kTraditionalAltThreeSelector: Int
var kTraditionalAltTwoSelector: Int
var kTraditionalCharactersSelector: Int
var kTraditionalNamesCharactersSelector: Int
var kTranscodingCompositionOffSelector: Int
var kTranscodingCompositionOnSelector: Int
var kTransliterationType: Int
var kTypographicExtrasType: Int
var kUnconnectedSelector: Int
var kUnicodeDecompositionType: Int
var kUpperAndLowerCaseSelector: Int
var kUpperCaseNumbersSelector: Int
var kUpperCasePetiteCapsSelector: Int
var kUpperCaseSmallCapsSelector: Int
var kUpperCaseType: Int
var kVerticalFractionsSelector: Int
var kVerticalPositionType: Int
var kVerticalSubstitutionType: Int
var kWordFinalSwashesOffSelector: Int
var kWordFinalSwashesOnSelector: Int
var kWordInitialSwashesOffSelector: Int
var kWordInitialSwashesOnSelector: Int


## Page 49

var nameFontTableTag: Int
var nonGlyphID: Int
var os2FontTableTag: Int
var sizeof_sfntCMapEncoding: Int
var sizeof_sfntCMapExtendedSubHeader: Int
var sizeof_sfntCMapHeader: Int
var sizeof_sfntCMapSubHeader: Int
var sizeof_sfntDescriptorHeader: Int
var sizeof_sfntDirectory: Int
var sizeof_sfntInstance: Int
var sizeof_sfntNameHeader: Int
var sizeof_sfntNameRecord: Int
var sizeof_sfntVariationAxis: Int
var sizeof_sfntVariationHeader: Int
var variationFontTableTag: Int
Styling Attributed Strings
Attributes to which Core Text responds when placed in a CFAttributedString object.
Core Text Structures
Core Text Enumerations
Core Text Constants
Core Text Functions
Core Text Data Types
See Also
Reference


## Page 50



