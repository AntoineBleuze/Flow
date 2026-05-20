# Events and reminders.pdf

## Page 1

Once you have permission to access a person’s Calendar and Reminder data, you can create,
display, and edit events and reminders.
Create a new event with the init(eventStore:) method of the EKEvent class.
You can edit the details of a new event or an event you previously fetched from the Calendar
database by setting the event’s corresponding properties. Some of the details you can edit includ
The event’s title with the title property.
The event’s start and end dates with the startDate and endDate properties.
The calendar with which the event is associated with the calendar property.
The alarms associated with the event with the alarms property (see “Setting an alarm” for mo
details).
The event’s recurrence rule, if it is a repeating event, with the recurrenceRules property (se
“Creating a recurring event” for more details).
Note
In iOS, you have the option of letting users modify event data with the event view controllers
provided in the EventKit UI framework. For information on how to use these event view
controllers, see EventKit UI.
Overview
Create Events
Save and Delete Events
EventKit / Creating events and reminders
Article
Creating events and reminders
Create and modify events and reminders in a person’s database.


## Page 2

Important
If your app modifies a user’s Calendar database, it must get confirmation from the user before
doing so. An app should never modify the Calendar database without specific instruction from
the user.
Save your changes to the Calendar database with the EKEventStore method save(_:span:
commit:). If you want to remove an event from the Calendar database, use the EKEventStore
method remove(_:span:commit:). Whether you are saving or removing an event,
implementing the respective method automatically syncs your changes with the calendar the eve
belongs to (CalDAV, Exchange, and so on).
If you are saving a recurring event, your changes can apply to all future occurrences of the event 
specifying EKSpan.futureEvents for the span parameter of the save(_:span:commit:)
method. Likewise, you can remove all future occurrences of an event by specifying EKSpan
.futureEvents for the span parameter of the remove(_:span:commit:) method.
Note
If you pass NO to the commit parameter, make sure that you later invoke the commit()
method to permanently save your changes.
Reminders are tasks that may be tied to a specific time or location. They are similar to calendar
events, but can be marked complete and may not necessarily span an exact period of time.
Because EKReminder inherits from EKCalendarItem, you can perform the same methods on a
reminder as you would on an event, such as adding an alarm with addAlarm(_:) or setting a
recurrence rule with addRecurrenceRule(_:).
Important
If your iOS app links on macOS and you need to access Reminders data, be sure to include
the NSRemindersUsageDescription key in your Info.plist file.
You can create reminders using the init(eventStore:) class method. The title and
calendar properties are required. The calendar for a reminder is the list with which it is grouped
Like events, reminders can trigger time-based or location-based alarms to alert the user of a
certain task. Read “Setting an Alarm” for more information on how to attach alarms to
calendar items.
Create Reminders


## Page 3

To save a reminder to the Calendar database, call the save(_:commit:) method. To remove an
event, call the remove(_:commit:) method. The title and calendars properties must
explicitly be set before you save the reminder.
Note
Just like when saving or removing events, make sure that if you pass NO to the commit
parameter, you later invoke the commit() method to save your changes.
To associate a start date or due date with a reminder, use the startDateComponents and due
DateComponents properties. To complete a reminder, set the completed property to YES, which
automatically sets completionDate to the current date.
Important
If your app modifies a user’s Calendar database, it must get confirmation from the user before
doing so. An app should never modify the Calendar database without specific instruction from
the user.
Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKEvent
A class that represents an event in a calendar.
class EKReminder
Save and Delete Reminders
Edit Reminders
See Also
Events and reminders


## Page 4

A class that represents a reminder in a calendar.


## Page 5

To search for and return events and reminders from the Calendar database, you must connect to
the event store, as discussed in “Accessing the event store.”
There are two ways to retrieve events and reminders. You can fetch via:
1. Predicate, or search query, and return zero or more events that match a given query.
2. Unique identifier and return a single event that corresponds to the given identifier.
Note
Retrieving events from the Calendar database does not necessarily return events in
chronological order. To sort an array of EKEvent objects by date, call sorted
Array(using:) on the array, providing the selector for the compareStartDate(with:)
method.
Predicates return events and reminders that match a search query.
It’s common to fetch events and reminders that fall within a date range. The EKEventStore
method events(matching:): fetches all events that fall within the date range specified in the
predicate you provide. The following listing demonstrates how to fetch all events that occur
between one day before and one year after the current date.
Overview
Search with Predicates
Fetch Events
EventKit / Retrieving events and reminders
Article
Retrieving events and reminders
Fetch events and reminders from the Calendar database.


## Page 6

Note
Although the events(matching:) method accepts a parameter of type NSPredicate, you
must supply a predicate created with the EKEventStore method predicateFor
Events(withStart:end:calendars:).
Listing 1. Fetching events with a predicate
You can specify a subset of calendars to search by passing an array of EKCalendar objects as
the calendars parameter of the predicateForEvents(withStart:end:
calendars:) method. You can get the user’s calendars from the event store’s
calendars(for:) method. Passing nil tells the method to fetch from all of the user’s
calendars.
Because the events(matching:) method is synchronous, you may not want to run it on your
app’s main thread. For asynchronous behavior, run the method on another thread with
the dispatch_async function or with an Operation object.


## Page 7

You can call fetchReminders(matching:completion:) to access multiple reminders that
match a predicate. Pass a predicate returned by one of the following methods:
predicateForIncompleteReminders(withDueDateStarting:ending:
calendars:) finds incomplete reminders within an optional time period.
predicateForCompletedReminders(withCompletionDateStarting:ending:
calendars:) finds completed reminders within an optional time period.
predicateForReminders(in:) finds all reminders.
You can iterate across matched reminders by passing a block to the completion argument, as
shown in the listing below.
Unlike fetching events via predicate, you can fetch reminders via predicate asynchronously witho
dispatching to another thread.
If you want to abort your fetch request by predicate, call cancelFetchRequest(_:) while
passing the identifier as returned by fetchReminders(matching:completion:).
If you know the event’s unique identifier because you fetched it previously with a predicate, you
can use the EKEventStore method event(withIdentifier:) to fetch the event. If it is a
recurring event, this method will return the first occurrence of the event. You can get an event’s
unique identifier with the eventIdentifier property.
Similarly, if you know a specific reminder’s unique identifier from previously fetching it with a
predicate, you can call the calendarItem(withIdentifier:) instance method. calendar
Item(withIdentifier:) can fetch any calendar item (reminders and events),
whereas event(withIdentifier:) fetches only events.
Fetch Reminders
Search with Unique Identifiers
See Also


## Page 8

Creating events and reminders
Create and modify events and reminders in a person’s database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKEvent
A class that represents an event in a calendar.
class EKReminder
A class that represents a reminder in a calendar.
Events and reminders


## Page 9

It’s possible for another process or app to modify the Calendar database while your app is running
If your app fetches calendar events or reminders, register to be notified about changes to the
Calendar database to ensure the calendar and reminder information you display to the user is
current.
An EKEventStore object posts an EKEventStoreChangedNotification notification
whenever it detects changes to the Calendar database. Register for this notification if your app
handles event or reminder data.
The code listing below registers for the EKEventStoreChangedNotification notification.
When you receive an EKEventStoreChangedNotification notification, it’s possible the
objects you’ve fetched—such as an EKEvent, EKReminder, or EKCalendar—have changed. Th
effect of the changes depends on whether an event was added, modified, or deleted:
If an event was added, it does not affect any of your previously fetched events or reminders, bu
the added event may fall within the date range of events you are displaying to the user.
If an event was modified or deleted, properties of EKEvent and EKReminder objects
representing that event may become out of date.
Overview
Register for Notifications
Respond to Notifications
EventKit / Updating with notifications
API Collection
Updating with notifications
Register for notifications about changes and keep your app up to date.


## Page 10

Because your local data is often invalidated or incomplete when a change occurs in the Calendar
database, you should refetch your current date range of events whenever you receive an EKEven
StoreChangedNotification notification. If you are modifying an event and do not want to
refetch it unless it is absolutely necessary, call the refreshSourcesIfNecessary() method o
the event. If the method returns YES, you can continue to use the event; otherwise, you must
refetch it. 
Note
Events being modified in an event view controller with EventKitUI for iOS are updated
automatically when a change occurs in the Calendar database. See EventKit UI for more.
Creating events and reminders
Create and modify events and reminders in a person’s database.
Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKEvent
A class that represents an event in a calendar.
class EKReminder
A class that represents a reminder in a calendar.
See Also
Events and reminders


## Page 11

With the Reminders app, people can create reminders with alarms based on time and location.
When Location Services is turned on, people receive location-based reminders when entering or
leaving a specified geographic area or geofence. This sample code demonstrates how to add,
fetch, complete, remove, filter, and sort location-based reminders. You app must first request full
access to reminders from the person using the app before it can access their reminder data. An
app with full access can create, edit, save, delete, and fetch all reminders on all of the person’s
calendars. For more information, see Accessing the event store. Next, register your app for
EKEventStoreChanged notifications at launch to listen for any changes to the person’s Calend
database. When your app receives this notification, consider your current reminder data are stale
or invalid and refetch all your reminders. For more information, see Updating with Notifications.
Before running the sample code project in Xcode, select the sample target, then configure it to us
your team for signing. For more information, see Assign the project to a team in Preparing your ap
for distribution.
The sample app presents a map with custom annotations that someone can use to create location
based reminders within the app. It uses location-specific data saved in the MapData.json file to
create annotations for the map. The sample defines a MapAnnotation data type to represent
each annotation. MapData.json contains three MapAnnotation entries. To test reminders
Overview
Configure the sample code project
Provide a map annotation
EventKit / Managing location-based reminders
Sample Code
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
Download
iOS 26.0+
iPadOS 26.0+
Xcode 26.0+


## Page 12

around other locations, duplicate and update a MapAnnotation entry in MapData.json with
other data as needed.
The sample displays a settings button that allows the person to grant or deny the app access to
location services. If the person grants permission, the app uses the person’s current location to
add a user annotation to the map. If the person denies access, the app does nothing.
Important
The app includes the NSLocationWhenInUseUsageDescription key in its Info.plist.
This key is required for apps that access the person’s location services. For more information
on using location services, see Configuring your app to use location services.
The sample includes the NSRemindersFullAccessUsageDescription key in its Info
.plist file. The value of the key is a string that explains why the app needs access to a person’s
reminders. The system displays the string when prompting the person for authorization.
Important
The NSRemindersFullAccessUsageDescription key is required for apps that access a
person’s reminders. On iOS 17 or later, if your app doesn’t include NSRemindersFullAccess
UsageDescription or the older NSRemindersUsageDescription key, iOS automatically
denies any access request without a prompt. For more information, see Accessing the event
store.
The sample app verifies its authorization status upon launching. The authorization status of the a
is .notDetermined until the person authorizes or denies access. The person can grant or deny
the app access to their reminder data, then change the authorization status later in the Settings
app. To determine its status, the app calls the authorizationStatus(for:) class method of
EKEventStore with an entity type reminder:
Provide a full-access usage description for reminders
Check your app authorization status
Request full access


## Page 13

If the authorization status is .notDetermined, the sample app initializes a single instance of
EKEventStore, eventStore, then calls its requestFullAccessToReminders() method to
prompt the person for full access:
If the person approves the request, the app receives a .fullAccess authorization status. It
fetches location reminders in all of the person’s calendars, then displays them organized by priori
If the person denies the request, the app gets no access and displays a message prompting the
person to grant the app full access in Settings on their device.
Important
Set up your app to instantiate and use a single instance of EKEventStore that manages all
reminder-related tasks. An EKEventStore object requires a significant amount of time to
initialize and release.
Creating a reminder requires a list, which is a calendar for these items. The app calls default
CalendarForNewReminders() on eventStore to check whether the person has specified a
default list for reminders.
The app fetches and displays location reminders in all of the person’s calendars if default
CalendarForNewReminders() returns a value, and shows a message prompting the person to
create a list, otherwise.
A location-based reminder is a reminder created with a geofence-enabled alarm. A geofence-
enabled alarm has a structured location and proximity configured. The structured location consist
Check for a default list
Create location-based reminders


## Page 14

of a location object and radius. To use the default radius, set its value to 0. The sample uses the
following steps to create a location-based reminder:
1. Create a reminder object.
2. Configure the reminder’s calendar and title properties.
3. Add a structured location.
4. Add an alarm.
5. Save the reminder.
First, the sample app creates an EKReminder object using init(eventStore:), then it sets the
title and calendar properties, and other properties, such as priority and time zone:
Important
The calendar and title properties are required and must be set before saving the
reminder.
Next, the sample creates a structured location by using either EKStructuredLocation’s
init(title:) or init(mapItem:) methods. When the location object has latitude and
longitude coordinates, the app uses init(title:) to create the structured location. The samp
initializes an CLLocation object with the specified latitude and longitude, then assigns it to the
created structured location’s geoLocation property:


## Page 15

When the location object is an MKMapItem object, the sample uses init(mapItem:) to create
the structured location:
EventKit defines the structured location’s radius property in meters. When someone enters a
value for the radius, the app checks the person’s preferences for unit of length measurement. If th
person’s preferred unit of length is a unit other than meters, the sample converts the radius value
to meters, then assigns the converted value to the structured location’s radius property:
Next, the sample creates an EKAlarm object, then sets its structuredLocation property to t
created structured location object. The sample then sets the proximity property to a value to
finish configuring the alarm’s geofence:
The app adds the created alarm to the reminder. For more information on adding alarms, see
Setting an Alarm.
Finally, it saves the reminder to the person’s Calendar database:
The fetchReminders(matching:completion:) method asynchronously fetches all
reminders matching a given predicate. The app calls this method with predicateFor
Fetch location-based reminders


## Page 16

Reminders(in:) to fetch complete and incomplete reminders. The predicate takes nil or an
array of EKCalendar objects in its calendars parameters. Pass nil to fetch from all of the
person’s calendars, and an array to fetch reminders from a subset of the person’s calendars. The
app passes nil to predicateForReminders(in:):
Then, the app executes the fetch request. If the request succeeds, fetch
Reminders(matching:completion:) returns an array that contains both time-based and
location-based reminders:
To retrieve location-based reminders, the app parses the returned array for reminders defined wit
an existing alarm that has a structuredlocation and proximity value:
Filter and sort reminders


## Page 17

After fetching the location-based reminders, the app displays a segmented control that organizes
the fetched reminders by priority: None, Low, Medium, and High. Fetching reminders from the
Calendar database returns reminders sorted by creation date. The app offers a menu that lets
people choose how to sort the reminders by creation date, due date, or title in ascending order.
When someone selects a priority in the control, the sample inspects the fetch result. If the result
contains location reminders with the priority the person selected, the app uses the person’s sortin
preferences to sort the reminders, then it displays them. The sample uses key paths to sort the
fetched location-based reminders.
If the fetch result contains no value, the app prompts the person to add some location reminders
with the selected priority.
Creating events and reminders
Create and modify events and reminders in a person’s database.
Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
class EKEvent
A class that represents an event in a calendar.
class EKReminder
A class that represents a reminder in a calendar.
See Also
Events and reminders


## Page 18

Creating events and reminders
Retrieving events and reminders
Use the init(eventStore:) method to create a new event. Use the properties in the class to
get and modify certain information about an event. Other properties, such as the event’s title and
calendar, are inherited from the parent class EKCalendarItem.
init(eventStore: EKEventStore)
Creates and returns a new event belonging to a specified event store.
Mentioned in
Overview
Topics
Creating Events
Scheduling Events
EventKit / EKEvent
Class
EKEvent
A class that represents an event in a calendar.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 19

enum EKEventStatus
The event’s status.
enum EKEventAvailability
The event’s availability setting for scheduling purposes.
func compareStartDate(with: EKEvent) -> ComparisonResult
Compares the start date of the receiving event with the start date of another event.
var eventIdentifier: String!
A unique identifier for the event.
var availability: EKEventAvailability
The availability setting for the event.
var startDate: Date!
The start date of the event.
var endDate: Date!
The end date for the event.
var isAllDay: Bool
A Boolean value that indicates whether the event is an all-day event.
var occurrenceDate: Date!
The original occurrence date of an event if it is part of a recurring series.
var isDetached: Bool
A Boolean value that indicates whether an event is a detached instance of a repeating event
var organizer: EKParticipant?
The organizer associated with the event.
var status: EKEventStatus
The status of the event.
var birthdayContactIdentifier: String?
The contact identifier of the person for this birthday event.
Comparing Events
Accessing Event Properties


## Page 20

var structuredLocation: EKStructuredLocation?
The event’s location with a potential geocoordinate.
var birthdayPersonID: Int
The Address Book framework record identifier of the person for this birthday event.
Deprecated
var birthdayPersonUniqueID: String?
The Address Book framework record identifier of the person for this birthday event.
Deprecated
func refresh() -> Bool
Updates the event’s data with the current information in the Calendar database.
EKCalendarItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating events and reminders
Refreshing Event Data
Relationships
Inherits From
Conforms To
See Also
Events and reminders


## Page 21

Create and modify events and reminders in a person’s database.
Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKReminder
A class that represents a reminder in a calendar.


## Page 22

Creating events and reminders
Use the init(eventStore:) method to create a new reminder. Use the properties in the class
to get and modify certain information about a reminder.
init(eventStore: EKEventStore)
Creates and returns a new reminder in the given event store.
enum EKReminderPriority
The priority of the reminder.
Mentioned in
Overview
Topics
Creating a Reminder
Accessing Reminder Properties
EventKit / EKReminder
Class
EKReminder
A class that represents a reminder in a calendar.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 23

var priority: Int
The reminder’s priority.
var startDateComponents: DateComponents?
The start date of the task.
var dueDateComponents: DateComponents?
The date by which the reminder should be completed.
var isCompleted: Bool
A Boolean value determining whether or not the reminder is marked completed.
var completionDate: Date?
The date on which the reminder was completed.
EKCalendarItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating events and reminders
Create and modify events and reminders in a person’s database.
Relationships
Inherits From
Conforms To
See Also
Events and reminders


## Page 24

Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKEvent
A class that represents an event in a calendar.


