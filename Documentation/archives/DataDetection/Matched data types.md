# Matched data types.pdf

## Page 1

The DataDetection framework returns a calendar event match in a DDMatchCalendarEvent
object, which has only a beginning date, only an end date, or both a beginning date and an end
date.
var isAllDay: Bool
A Boolean value that indicates whether the event is an all-day event.
var endDate: Date?
A date that represents the end of the event.
var endTimeZone: TimeZone?
The time zone for the event’s end date.
var startDate: Date?
A date that represents the start of the event.
Overview
Topics
Getting event details
DataDetection / DDMatchCalendarEvent
Class
DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection
system matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

var startTimeZone: TimeZone?
The time zone for the event’s start date.
DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
Relationships
Inherits From
Conforms To
See Also
Matched data types


## Page 3

class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.


## Page 4

The DataDetection framework returns an email match in a DDMatchEmailAddress object, whic
includes an email address, and optionally a label that categorizes the email address.
var emailAddress: String
A string that represents an email address.
var label: String?
A string that categorizes an email address, such as Home or Work.
Overview
Topics
Getting email information
Relationships
Inherits From
DataDetection / DDMatchEmailAddress
Class
DDMatchEmailAddress
An object that contains an email address that the data detection system matches
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 5

DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.
Conforms To
See Also
Matched data types


## Page 6

The DataDetection framework returns a flight number match in a DDMatchFlightNumber objec
which contains an airline name and flight number.
var airline: String
The name of an airline.
var flightNumber: String
A string that represents a flight number.
Overview
Topics
Getting flight information
Relationships
Inherits From
DataDetection / DDMatchFlightNumber
Class
DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 7

DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.
Conforms To
See Also
Matched data types


## Page 8

The DataDetection framework returns a link match in a DDMatchLink object, which contains a
URL.
var url: URL
An address for a web resource, such as a webpage or image.
DDMatch
Overview
Topics
Getting link information
Relationships
Inherits From
DataDetection / DDMatchLink
Class
DDMatchLink
An object that contains a web link that the data detection system matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 9

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.
Conforms To
See Also
Matched data types


## Page 10

The DataDetection framework returns a match for an amount of money in a DDMatchMoney
Amount object, which contains an amount of money and an ISO currency code.
var amount: Double
A number that represents an amount of money.
var currency: String
A string that contains an ISO currency code, which the data detection system identifies from
the matched string and user preferences.
Overview
Topics
Getting money information
Relationships
DataDetection / DDMatchMoneyAmount
Class
DDMatchMoneyAmount
An object that contains an amount of money that the data detection system
matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 11

DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
Inherits From
Conforms To
See Also
Matched data types


## Page 12

An object that contains parcel tracking information that the data detection system matches.


## Page 13

The DataDetection framework returns a phone number match in a DDMatchPhoneNumber objec
which contains a phone number, and optionally a label that categorizes the phone number.
var phoneNumber: String
A string that represents a phone number.
var label: String?
A string that categorizes a phone number, such as Home or Work.
Overview
Topics
Getting phone information
Relationships
Inherits From
DataDetection / DDMatchPhoneNumber
Class
DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 14

DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPostalAddress
An object that contains a postal address that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.
Conforms To
See Also
Matched data types


## Page 15

The DataDetection framework returns a postal address match in a DDMatchPostalAddress
object, which optionally contains the matching parts of a postal address: street, city, state, postal
code, and country.
var street: String?
The street name in a postal address.
var city: String?
The city name in a postal address.
var state: String?
The state name in a postal address.
var postalCode: String?
The postal code in a postal address.
Overview
Topics
Getting postal address information
DataDetection / DDMatchPostalAddress
Class
DDMatchPostalAddress
An object that contains a postal address that the data detection system matches
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 16

var country: String?
The country or region name in a postal address.
DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
Relationships
Inherits From
Conforms To
See Also
Matched data types


## Page 17

class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system matches.


## Page 18

The DataDetection framework returns a shipment tracking number match in a DDMatchShipmen
TrackingNumber object, which contains a carrier name and tracking identifier.
var carrier: String
The name of a parcel carrier.
var trackingNumber: String
A string that represents a carrier’s tracking identifier for a parcel.
Overview
Topics
Getting tracking information
Relationships
DataDetection / DDMatchShipmentTrackingNumber
Class
DDMatchShipmentTrackingNumber
An object that contains parcel tracking information that the data detection system
matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 19

DDMatch
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class DDMatchCalendarEvent
An object that represents a calendar date or date range that the data detection system
matches.
class DDMatchEmailAddress
An object that contains an email address that the data detection system matches.
class DDMatchFlightNumber
An object that contains a flight number that the data detection system matches.
class DDMatchLink
An object that contains a web link that the data detection system matches.
class DDMatchMoneyAmount
An object that contains an amount of money that the data detection system matches.
class DDMatchPhoneNumber
An object that contains a phone number that the data detection system matches.
class DDMatchPostalAddress
Inherits From
Conforms To
See Also
Matched data types


## Page 20

An object that contains a postal address that the data detection system matches.


