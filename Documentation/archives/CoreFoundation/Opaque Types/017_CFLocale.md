# 017_CFLocale.pdf

## Page 1

Unicode operations such as collation and text boundary determination can be affected by the
conventions of a particular language or region. CFLocale objects specify language-specific or
region-specific information for locale-sensitive operations.
The CFLocale opaque type provides support for obtaining available locales, obtaining localized
locale names, and converting among locale data formats. Locale identifiers in macOS follow the
IETF’s BCP 47. CFLocale never uses Script Manager codes (except for the legacy support provide
by CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(_:_:_:
—the Script Manager and all its concepts are deprecated.
For more information on locale identifiers, read Internationalization and Localization Guide. It is als
useful to read the ICU’s User Guide for the Locale Class.
CFLocale is “toll-free bridged” with its Cocoa Foundation counterpart, NSLocale. This means tha
the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSLocale * parameter, you can
pass in a CFLocaleRef, and in a function where you see a CFLocaleRef parameter, you can
pass in an NSLocale instance. See Toll-Free Bridged Types for more information on toll-free
bridging.
Overview
Topics
Creating a Locale
Core Foundation / CFLocale
Class
CFLocale
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFLocaleCopyCurrent() -> CFLocale!
Returns a copy of the logical locale for the current user.
func CFLocaleCreate(CFAllocator!, CFLocaleIdentifier!) -> CFLocale!
Creates a locale for the given arbitrary locale identifier.
func CFLocaleCreateCopy(CFAllocator!, CFLocale!) -> CFLocale!
Returns a copy of a locale.
func CFLocaleGetSystem() -> CFLocale!
Returns the root, canonical locale.
func CFLocaleCopyAvailableLocaleIdentifiers() -> CFArray!
Returns an array of CFString objects that represents all locales for which locale data is
available.
func CFLocaleCopyISOCountryCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO country codes.
func CFLocaleCopyISOLanguageCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO language codes.
func CFLocaleCopyISOCurrencyCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO currency codes.
func CFLocaleCopyCommonISOCurrencyCodes() -> CFArray!
Returns an array of strings that represents ISO currency codes for currencies in common us
func CFLocaleCopyPreferredLanguages() -> CFArray!
Returns the array of canonicalized language IDs that the user prefers.
func CFLocaleCopyDisplayNameForPropertyValue(CFLocale!, CFLocaleKey!,
CFString!) -> CFString!
Getting System Locale Information
Getting ISO Information
Language Preferences
Getting Information About a Locale


## Page 3

Returns the display name for the given value.
func CFLocaleGetValue(CFLocale!, CFLocaleKey!) -> CFTypeRef!
Returns the corresponding value for the given key of a locale’s key-value pair.
func CFLocaleGetIdentifier(CFLocale!) -> CFLocaleIdentifier!
Returns the given locale’s identifier.
func CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(
CFAllocator!, LangCode, RegionCode) -> CFLocaleIdentifier!
Returns a canonical locale identifier from given language and region codes.
func CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocator!,
CFString!) -> CFLocaleIdentifier!
Returns a canonical language identifier by mapping an arbitrary locale identification string to
the canonical identifier
func CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocator!,
CFString!) -> CFLocaleIdentifier!
Returns a canonical locale identifier by mapping an arbitrary locale identification string to the
canonical identifier.
func CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocator!, CFLocal
Identifier!) -> CFDictionary!
Returns a dictionary containing the result from parsing a locale ID consisting of language,
script, country or region, variant, and keyword/value pairs.
func CFLocaleCreateLocaleIdentifierFromComponents(CFAllocator!,
CFDictionary!) -> CFLocaleIdentifier!
Returns a locale identifier consisting of language, script, country or region, variant, and
keyword/value pairs derived from a dictionary containing the source information.
func CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(CFAllocator!,
UInt32) -> CFLocaleIdentifier!
Returns a locale identifier from a Windows locale code.
func CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(CFLocaleIdentifie
!) -> UInt32
Returns a Windows locale code from the locale identifier.
Getting and Creating Locale Identifiers


## Page 4

func CFLocaleGetLanguageCharacterDirection(CFString!) -> CFLocale
LanguageDirection
Returns the character direction for the specified ISO language code.
func CFLocaleGetLanguageLineDirection(CFString!) -> CFLocaleLanguage
Direction
Returns the line direction for the specified ISO language code.
func CFLocaleGetTypeID() -> CFTypeID
Returns the type identifier for the CFLocale opaque type.
enum CFLocaleLanguageDirection
These constants describe the text direction for a language. They are returned by the functio
CFLocaleGetLanguageCharacterDirection(_:) and CFLocaleGetLanguageLin
Direction(_:).
Locale Property Keys
Predefined locale keys used to get property values.
Locale Calendar Identifiers
Predefined locale keys used to get calendar values—values for kCFLocaleCalendar
Identifier.
Locale Change Notification
Identifier for notification sent if the current locale changes.
Getting Line and Character Direction for a Language
Getting the CFLocale Type ID
Constants
Relationships
Conforms To


## Page 5

Equatable, Hashable
Internationalization and Localization Guide
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
See Also
Related Documentation
Opaque Types


