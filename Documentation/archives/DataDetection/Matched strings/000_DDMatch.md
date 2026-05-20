# 000_DDMatch.pdf

## Page 1

The DataDetection framework returns results in objects that are subclasses of DDMatch, which a
specific to the type of matching data. Each object contains the matched string.
var matchedString: String
A substring that the data detection system identifies from an original string as a common typ
of data.
NSObject
Overview
Topics
Getting matches
Relationships
Inherits From
DataDetection / DDMatch
Class
DDMatch
A base class for common types of data that the data detection system matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

DDMatchCalendarEvent
DDMatchEmailAddress
DDMatchFlightNumber
DDMatchLink
DDMatchMoneyAmount
DDMatchPhoneNumber
DDMatchPostalAddress
DDMatchShipmentTrackingNumber
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
enum DataDetector
An extension to the string protocol that scans strings for semantic entities, such as email
addresses, phone numbers, URLs, and flight information.
Inherited By
Conforms To
See Also
Matched strings


