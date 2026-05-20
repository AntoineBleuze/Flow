# 000_DDMatchCalendarEvent.pdf

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


