# 001_DataDetector.pdf

## Page 1

func dataDetectorMatches(DataDetector.MatchType, options: DataDetector.
Options) -> some AsyncSequence<DataDetector.Match, Never>
Searches for known data types in a string or a substring.
struct Match
A representation of a match that includes common properties and an enumeration that
represents the match type and its specific semantic components.
struct MatchType
A set of types of matches that the system can find in a string.
struct Options
A set of options you can use to refine the behavior of text scanning, and better interpret the
semantic domain of the matches.
Topics
Methods that scan strings for known content types
Structures
DataDetection / DataDetector
Enumeration
DataDetector
An extension to the string protocol that scans strings for semantic entities, such a
email addresses, phone numbers, URLs, and flight information.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

static let all: DataDetector.MatchType
A set of types that includes all publicly useable types.
static let link: DataDetector.MatchType
The type that represents links, not limited to web links.
static let emailAddress: DataDetector.MatchType
The type that represents email addresses.
static let phoneNumber: DataDetector.MatchType
The type that represents phone numbers.
static let postalAddress: DataDetector.MatchType
The type that represents postal addresses.
static let calendarEvent: DataDetector.MatchType
The type that represents calendar events, such as dates and times, or date and time ranges
static let moneyAmount: DataDetector.MatchType
The type that represents monetary amounts.
static let measurement: DataDetector.MatchType
The type that represents measurements, such as distances and weights.
static let flightNumber: DataDetector.MatchType
The type that represents flight numbers.
static let shipmentTrackingNumber: DataDetector.MatchType
The type that represents shipment tracking numbers.
static let paymentIdentifier: DataDetector.MatchType
The type that represents payment identifiers, such as Universal Payments Interface (UPI)
identifiers.
Known entity types
See Also
Matched strings


## Page 3

class DDMatch
A base class for common types of data that the data detection system matches.


