# 003_CSLocalizedString.pdf

## Page 1

The CSLocalizedString class helps you localize text in searchable items. You can use a
CSLocalizedString object in place of an NSString object to display localized text in search
results related to your app.
For example, you might use the following code to define a CSLocalizedString object for a
searchable item you want to identify as “Song” in English:
Overview
Topics
Specifying localized strings
Core Spotlight / CSLocalizedString
Class
CSLocalizedString
An object that displays localized text in search results related to your app.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

init(localizedStrings: [AnyHashable : Any])
Initializes a CSLocalizedString object with the specified dictionary of localized strings.
func localizedString() -> String
Returns the localized string for the current language.
NSString
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
ExpressibleByExtendedGraphemeClusterLiteral
ExpressibleByStringLiteral
ExpressibleByUnicodeScalarLiteral
Hashable
NSCoding
NSCopying
NSItemProviderReading
NSItemProviderWriting
NSMutableCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Getting a localized string
Relationships
Inherits From
Conforms To
See Also


## Page 3

class CSSearchableItem
The details of your app-specific content that someone might search for on their devices.
class CSSearchableItemAttributeSet
The detailed metadata for a searchable item.
class CSCustomAttributeKey
A key associated with a custom attribute for a searchable item.
class CSPerson
An object that represents a person in the context of search results.
Searchable items


