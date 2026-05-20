# Calendars.pdf

## Page 1

Retrieving events and reminders
Use the properties in this class to get attributes about a calendar, such as its title and type. Use th
init(for:eventStore:) method to create a calendar object.
init(for: EKEntityType, eventStore: EKEventStore)
Creates a new calendar that can contain the given entity type.
init(eventStore: EKEventStore)
Creates and returns a calendar belonging to a specified event store.
Deprecated
Mentioned in
Overview
Topics
Creating Calendars
EventKit / EKCalendar
Class
EKCalendar
A class that represents a calendar in EventKit.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

enum EKCalendarType
Possible calendar types.
struct EKCalendarEventAvailabilityMask
A bitmask indicating the event availability settings that the calendar can support.
var allowsContentModifications: Bool
A Boolean value that indicates whether you can add, edit, and delete items in the calendar.
var cgColor: CGColor!
The calendar’s color.
var color: NSColor!
The calendar’s color.
var isImmutable: Bool
A Boolean value indicating whether the calendar’s properties can be edited or deleted.
var title: String
The calendar’s title.
var type: EKCalendarType
The calendar’s type.
var allowedEntityTypes: EKEntityMask
The entity types this calendar can contain.
var source: EKSource!
The source object representing the account to which this calendar belongs.
var isSubscribed: Bool
A Boolean value indicating whether the calendar is a subscribed calendar.
var supportedEventAvailabilities: EKCalendarEventAvailabilityMask
The event availability settings supported by this calendar, as indicated by a bitmask.
var calendarIdentifier: String
A unique identifier for the calendar.
func DATETIME_COMPONENTS_DO_NOT_USE()
Accessing Calendar Properties


## Page 3

A deprecated function.
Deprecated
func DATE_COMPONENTS_DO_NOT_USE()
A deprecated function.
Deprecated
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class EKParticipant
A class that represents person, group, or room invited to a calendar event.
Relationships
Inherits From
Conforms To
See Also
Calendars


## Page 4

Do not create EKParticipant objects directly. Instead, use the property attendees on
EKCalendarItem to return an array of EKParticipant objects.
EventKit cannot add participants to an event nor change participant information. Use the properti
in this class to get information about a participant.
A participant can be a person, group, room, or other resource.
enum EKParticipantRole
The participant’s role for an event.
enum EKParticipantType
The type of participant.
enum EKParticipantStatus
The participant’s attendance status for an event.
Overview
Topics
Defining Participants
EventKit / EKParticipant
Class
EKParticipant
A class that represents person, group, or room invited to a calendar event.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 5

enum EKParticipantScheduleStatus
The participant’s scheduled status.
var isCurrentUser: Bool
A Boolean value indicating whether this participant represents the owner of this account.
var name: String?
The participant’s name.
var participantRole: EKParticipantRole
The participant’s role in the event.
var participantStatus: EKParticipantStatus
The participant’s attendance status.
var participantType: EKParticipantType
The participant’s type.
var url: URL
The URL representing this participant.
var contactPredicate: NSPredicate
A predicate to use with the Contacts framework to retrieve the corresponding contact
instance.
func abRecord(with: ABAddressBook) -> ABRecord?
Returns the address book record that represents the participant.
func abPerson(in: ABAddressBook) -> ABPerson?
Returns the address book record that represents the participant.
Deprecated
typealias ABAddressBook
A reference to an ABAddressBook object.
Deprecated
typealias ABRecord
A reference to an ABRecord object or any of its derivedopaque types.
Accessing Participant Properties
Finding Participant Address Book Records


## Page 6

Deprecated
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class EKCalendar
A class that represents a calendar in EventKit.
Relationships
Inherits From
Conforms To
See Also
Calendars


