# Essentials.pdf

## Page 1

Your app must obtain permission from the person using the app before it can access the calendar
database: your app must never directly modify the calendar database on its own. EKEventStore
is the app’s way of accessing calendar and reminder data.
Your app should only request the access it needs to complete its tasks. You can request write-on
access to events, which lets your app create new events but doesn’t let it read any events or othe
calendar information, including events your app created. You can also request full access to eithe
events or reminders, which lets your app create, view, edit, and delete data.
Note
Your app can’t request read-only access to either events or reminders. To read events or
reminders from the event store, your app needs full access.
To receive event or reminder data, you must request access to an entity type after initializing the
event store. To request access to reminders, use requestFullAccessTo
Reminders(completion:). To request access to events, use requestWriteOnlyAccessTo
Events(completion:) or requestFullAccessToEvents(completion:), depending on
the level of access your app needs.
For example, to request full access to reminders, use the following:
Overview
Connect to the event store
Objective-C
EventKit / Accessing the event store
Article
Accessing the event store
Request access to a person’s calendar data through the event store.
Swift


## Page 2

Releasing an event store instance before other EventKit objects may result in an error.
Your app can use the entire EventKit calendar API when it has write-only calendar access. If your
app has write-only access, a request for a list of calendars returns a single virtual calendar, that
doesn’t represent any real calendar in the event store. Requests for events on the virtual calendar
return no results. When your app creates an event, EventKit saves it to a calendar that’s chosen b
the person using your app.
EventKit UI presents chooser and editor UI outside of your app’s process on iOS 17 and later. You
app can use EventKit UI without requesting write-only or full calendar access. The chooser and
editor UI has full access to calendars on the device regardless of the access granted to your app.
your app needs to present UI for creating and editing calendar events, consider using EventKit UI
instead of requesting full access to calendar data. Create an event, then present an EKEventEdi
ViewController to allow people to edit and save the event. EKEventEditViewController
saves the event to the calendar the person requests in the editor UI.
An iOS app must include in its Info.plist file the usage description keys for the types of data i
needs to access. On iOS 17 and later, to access a person’s calendar events or reminders, you nee
to include descriptions for:
NSCalendarsWriteOnlyAccessUsageDescription or NSCalendarsFullAccessUsag
Description, depending on the level of access to events your app needs. Don’t request full
access if your app’s features only need write-only access.
NSRemindersFullAccessUsageDescription, if your app needs access to reminders.
Use EventKit with write-only calendar access
Protect user privacy with information property list keys


## Page 3

Important
On iOS 17 or later, if your app doesn’t include usage description keys, or only includes the
older NSCalendarsUsageDescription key for describing events access, iOS automatically
denies any access request.
To access a person’s calendar events or reminders through EventKit or EventKit UI, your app need
to include descriptions for the following if your app links to iOS 10 or later, and runs on iOS 10
through iOS 16:
NSCalendarsUsageDescription, which is a fallback if your app runs on iOS 17 or later and
doesn’t include descriptions for NSCalendarsWriteOnlyAccessUsageDescription or
NSCalendarsFullAccessUsageDescription.
NSRemindersUsageDescription, which is a fallback if your app runs on iOS 17 or later and
doesn’t include a description for NSRemindersFullAccessUsageDescription.
NSContactsUsageDescription, as EventKit UI may need to access Contacts data to choo
the correct display name or avatar for a contact in a calendar.
Warning
If your app that’s linked on iOS 10 through iOS 16 doesn’t include these keys, your app
crashes.
Because these keys provide access to the event store, they protect the person’s privacy by only
allowing access to this information if they explicitly grant permission in the app.
To access Calendar data, all sandboxed macOS apps must include the com.apple.security
.personal-information.calendars entitlement.
class EKEventStore
An object that accesses a person’s calendar events and reminders and supports the
scheduling of new events.
Accessing Calendar using EventKit and EventKitUI
Choose and implement the appropriate Calendar access level in your app.
See Also
Essentials


## Page 4



## Page 5

Retrieving events and reminders
Accessing the event store
Creating events and reminders
The EKEventStore class is an app’s point of contact for accessing calendar and reminder data.
After initializing the event store, you must request access to events or reminders before attemptin
to fetch or create data. To request access to reminders, call requestFullAccessTo
Reminders(completion:). To request access to events, call requestWriteOnlyAccessTo
Events(completion:) or requestFullAccessToEvents(completion:).
Important
To request access to events and reminders, your app needs to include permission strings in its
Info.plist file that explain to someone why the app needs access. For more information,
see Accessing the event store.
A typical workflow for using an event store is:
Mentioned in
Overview
EventKit / EKEventStore
Class
EKEventStore
An object that accesses a person’s calendar events and reminders and supports
the scheduling of new events.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 6

1. Create a predicate, or a search query for events, with predicateForEvents(withStart:
end:calendars:).
2. Fetch and process events that match the predicate with the events(matching:) and
enumerateEvents(matching:using:) methods.
3. Save and delete events from the event store with the save(_:span:commit:) and
remove(_:span:commit:) methods.
Use similar methods to access and manipulate reminders.
After receiving an object from an event store, don’t use that object with a different event store. Th
restriction applies to EKObject subclasses such as EKEvent, EKReminder, EKCalendar, and
EKSource, as well as predicates that the event store creates. For example, don’t fetch an event
from one event store, modify the event, and then pass it to save(_:span:) in a different store.
init()
Creates a new event store.
init(sources: [EKSource])
Creates an event store that contains data for the specified sources.
var eventStoreIdentifier: String
The unique identifier for the event store.
func requestWriteOnlyAccessToEvents(completion: (Bool, (any Error)?) ->
Void)
Prompts the person using your app to grant or deny write access to event data.
func requestFullAccessToEvents(completion: (Bool, (any Error)?) -> Void
Prompts people to grant or deny read and write access to event data.
func requestFullAccessToReminders(completion: (Bool, (any Error)?) ->
Void)
Prompts people to grant or deny read and write access to reminders.
Topics
Creating event stores
Requesting access to events and reminders


## Page 7

class func authorizationStatus(for: EKEntityType) -> EKAuthorization
Status
Determines the authorization status for the given entity type.
enum EKAuthorizationStatus
The current authorization status for a specific entity type.
typealias EKEventStoreRequestAccessCompletionHandler
The signature for a closure that EventKit calls when requesting access to event and reminde
data.
NSCalendarsFullAccessUsageDescription
A message that tells people why the app is requesting access to read and write their calenda
data.
NSCalendarsWriteOnlyAccessUsageDescription
A message that tells people why the app is requesting access to create calendar events.
NSRemindersFullAccessUsageDescription
A message that tells people why the app is requesting access to read and write their
reminders data.
var sources: [EKSource]
An unordered array of objects that represent accounts that contain calendars.
var delegateSources: [EKSource]
The event sources delegated to the person using your app.
func source(withIdentifier: String) -> EKSource?
Locates an event source with the specified identifier.
func commit() throws
Commits all unsaved changes to the event store.
func reset()
Reverts the event store to its saved state.
func refreshSourcesIfNecessary()
Accessing account sources
Saving and restoring state


## Page 8

Pulls new data from remote sources, if necessary.
var defaultCalendarForNewEvents: EKCalendar?
The calendar that events are added to by default, as specified by user settings.
func defaultCalendarForNewReminders() -> EKCalendar?
Identifies the default calendar for adding reminders to, as specified by user settings.
func calendars(for: EKEntityType) -> [EKCalendar]
Identifies the calendars that support a given entity type, such as reminders or events.
func calendar(withIdentifier: String) -> EKCalendar?
Locates a calendar with the specified identifier.
func saveCalendar(EKCalendar, commit: Bool) throws
Saves a calendar to the event store by either committing or batching the changes.
func removeCalendar(EKCalendar, commit: Bool) throws
Removes a calendar from the event store by either committing or batching the changes.
var calendars: [EKCalendar]
The calendars associated with the event store.
Deprecated
func event(withIdentifier: String) -> EKEvent?
Locates the first occurrence of an event with a given identifier.
func calendarItem(withIdentifier: String) -> EKCalendarItem?
Locates a reminder or the first occurrence of an event with the specified identifier.
func calendarItems(withExternalIdentifier: String) -> [EKCalendarItem]
Locates all reminders or the first occurrences of all events with the specified external
identifier.
func remove(EKEvent, span: EKSpan) throws
Removes an event from the event store.
func remove(EKEvent, span: EKSpan, commit: Bool) throws
Accessing calendars
Accessing calendar events


## Page 9

Removes an event or recurring events from the event store by either committing or batching
the changes.
func remove(EKReminder, commit: Bool) throws
Removes a reminder from the event store by either committing or batching the changes.
func save(EKEvent, span: EKSpan) throws
Saves changes to an event permanently.
func save(EKEvent, span: EKSpan, commit: Bool) throws
Saves an event or recurring events to the event store by either committing or batching the
changes.
func save(EKReminder, commit: Bool) throws
Saves changes to a reminder by either committing or batching the changes.
func enumerateEvents(matching: NSPredicate, using: EKEventSearchCallbac
)
Finds all events that match a given predicate and calls a given callback for each event found
func events(matching: NSPredicate) -> [EKEvent]
Finds all events that match a given predicate.
func fetchReminders(matching: NSPredicate, completion: ([EKReminder]?) 
> Void) -> Any
Fetches reminders that match a given predicate.
func cancelFetchRequest(Any)
Cancels the request to fetch reminders.
func predicateForEvents(withStart: Date, end: Date, calendars: [
EKCalendar]?) -> NSPredicate
Creates a predicate to identify events that occur within a given date range.
func predicateForReminders(in: [EKCalendar]?) -> NSPredicate
Creates a predicate to identify all reminders in a collection of calendars.
func predicateForCompletedReminders(withCompletionDateStarting: Date?,
ending: Date?, calendars: [EKCalendar]?) -> NSPredicate
Creates a predicate to identify all completed reminders that occur within a given date range.
Searching calendars


## Page 10

func predicateForIncompleteReminders(withDueDateStarting: Date?, ending
Date?, calendars: [EKCalendar]?) -> NSPredicate
Creates a predicate to identify all incomplete reminders that occur within a given date range
typealias EKEventSearchCallback
The signature for a closure that operates on events when enumerating them.
func requestAccess(to: EKEntityType, completion: (Bool, (any Error)?) -
Void)
Prompts the person using your app to grant or deny access to event or reminder data.
Deprecated
struct EventStoreChanged
A notification posted when changes are made to the Calendar or Reminders database.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Deprecated methods
Structures
Relationships
Inherits From
Conforms To
See Also


## Page 11

Accessing the event store
Request access to a person’s calendar data through the event store.
Accessing Calendar using EventKit and EventKitUI
Choose and implement the appropriate Calendar access level in your app.
Essentials


## Page 12

Prior to iOS 17, your app needs to include the NSCalendarsUsageDescription key in its Info
.plist and request authorization from the user before it can access the user’s calendar data.
NSCalendarsUsageDescription indicates how your app intends to use calendar data. If the
user approves the request, the app gets full access to all events on all the user’s calendars,
including the ones the app didn’t create. If the user denies the request, the app gets no access to
the user’s data.
Starting in iOS 17, your app should only request the specific level of access it requires to complete
its calendar data tasks. The iOS 17 SDK introduces new calendar usage description strings, the
ability to add events to Calendar without prompting the user for access, and a new write-only
access. See Accessing the event store for details.
This sample consists of three targets that illustrate how to implement Calendar access level using
EventKit and EventKitUI. The DropInLessons target builds an app that saves events to Calenda
without prompting the user for authorization. The RepeatingLessons target, which implements
the write-only access feature, builds an app that saves events directly to Calendar with user
permission. The MonthlyEvents target, which illustrates the full-access feature, builds an app
that fetches and displays all events occuring within a month in all the user’s calendars.
Note
This sample code project is associated with WWDC23 session 10052: Discover Calendar and
EventKit.
Overview
EventKit / Accessing Calendar using EventKit and EventKitUI
Sample Code
Accessing Calendar using EventKit and
EventKitUI
Choose and implement the appropriate Calendar access level in your app.
Download
iOS 16.4+
iPadOS 16.4+
Xcode 15.0+


## Page 13

Before you run the sample code project in Xcode:
Open the sample with Xcode 15 or later.
Select the top-level Calendar Access project.
For the three targets, choose your team from the Team menu in the Signing & Capabilities pane
to let Xcode automatically manage your provisioning profile.
Select the target you wish to build, then build and run it in the Simulator, in Mac Catalyst, or on
device.
In iOS 17, your app can add events to Calendar without prompting the user for access using
EKEventEditViewController. If the purpose of your app is to create, configure, and present
calendar events in an editor UI, consider saving events to Calendar without prompting the user fo
authorization in your app following these steps:
Build your app with Xcode 15 and link against the iOS 17 SDK.
If your app includes NSCalendarsUsageDescription, remove this key.
If your app requests permission using requestAccess(to:completion:) or request
Access(to:), remove these instance methods from your source code.
The DropInLessons app writes data to Calendar without performing any other operations on th
user’s events. Because its workflow doesn’t interact with the user’s calendar data, the app isn’t
required to include any calendar usage strings or prompt the user for access. EKEventStore
allows apps to request permission from the user, and read and write data to Calendar. DropIn
Lessons creates an instance of the event store, store.
When the user schedules a lesson, DropInLessons creates a selectedEvent, then presents
an event edit view controller.
Configure the sample code project
Save events without prompting the user for access


## Page 14

The app creates selectedEvent in the event store, adds it to the default calendar for the store,
then configures selectedEvent with the selected lesson’s details. The view controller takes
selectedEvent and store as parameters.
DropInLessons relinquishes control once the editor is presented. Because the event edit view
controller renders its content out of process, it has full access to all the user’s calendars on the
device, regardless of the access granted to the app. This allows the user to get a full-featured
editing experience, such as choosing another calendar to save the selected lesson or changing
presented information in the editor. However, the app isn’t aware of any of these changes. When
the user taps the Add button in the UI, the system saves the lesson to the user’s selected or defa
calendar, then dismisses the editor.
Because the calendar edits happen out of process, inspecting the properties of the dismissed
controller, such as event, to determine what the user added to Calendar doesn’t return any
useful information. The app isn’t aware of the changes, which naturally means it can’t see them.
In iOS 17, an app with write-only access can create and save events to Calendar, display events
using EKEventEditViewController, and allow the user to select another calendar using
EKCalendarChooser. If your app needs to write data directly, consider implementing write-only
access in your app following these steps:
Build your app with Xcode 15 and link against the iOS 17 SDK.
Add the NSCalendarsWriteOnlyAccessUsageDescription key to the Info.plist file
of the target building your app.
To request write-only access to events, use requestWriteOnlyAccessTo
Events(completion:) or requestWriteOnlyAccessToEvents().
Request write-only access


## Page 15

Note
EKEventEditViewController and EKCalendarChooser require write-only or full
access. EKEventEditViewController doesn’t require any user permission.
RepeatingLessons displays a list of recurring lessons and a “Select calendar” button in the
toolbar. The app offers the lessons on specific dates and times and doesn’t fetch any events from
the user’s calendars. RepeatingLessons can’t let the user or the system make any changes to
these events. Because of these reasons, the app requires write-only access so it can control the
date and time of every event added to Calendar. When the user selects a lesson, then taps the
booking button, the app first checks whether it has authorization to access the user’s calendar
data. If the authorization status is .notDetermined, the app uses an instance of EKEvent
Store, eventStore, to prompt the user for write-only access.
RepeatingLessons includes NSCalendarsWriteOnlyAccessUsageDescription in its
Info.plist file and uses its value when showing an alert. The alert prompts the user for write-
only acess to save repeating lessons to a calendar that the user chooses. If the user grants the
request, the app receives a .writeOnly authorization status, creates a recurring event using the
selected lesson’s details, then saves it to Calendar without the user making any changes to this
event.
The “Select calendar” button in the toolbar allows the user to choose another calendar to save th
recurring events using EKCalendarChooser. The app turns off the button by default. The app
turns it on when the user grants write-only or full access to the app. When the user taps the
button, RepeatingLessons presents a calendar chooser with an instance of EKCalendar,
calendar, which keeps track of calendars the user chooses in the view controller.
The displayStyle property of EKCalendarChooser specifies whether to display writable
calendars only or all calendars. In write-only access apps, the calendar chooser ignores the value
of the displayStyle setting and this setting always behaves as if it’s set to .writable
CalendarsOnly. As a result, the app only allows the user to select a single writable calendar fro
the list presented in the calendar chooser.


## Page 16

The app sets the selectedCalendars property of EKCalendarChooser to calendar, which
is empty when the user hasn’t selected a calendar.
RepeatingLessons configures the chooser to show the Done and Cancel buttons.
If the user chooses a calendar from the view controller, RepeatingLessons adds recurring
events to that calendar. If the user doesn’t make any selection, the app saves the events to the
user’s default calendar.
In iOS 17, an app with full access can create, edit, save, delete, and fetch all events on all the user
calendars. Additionally, the app can display events using EKEventViewController and allow
the user to select another calendar using EKCalendarChooser. Implement full access if your ap
needs to read and write data to Calendar. If your app only needs to write data directly to Calendar
implement write-only access instead. If your app only uses EventKit APIs to create and set up
events, consider saving events to Calendar without prompting the user for authorization.
Request full access


## Page 17

To implement full access in your app, follow these steps:
Build your app with Xcode 15 and link against the iOS 17 SDK.
Add the NSCalendarsFullAccessUsageDescription key to the Info.plist file of the
target building your app.
To request full access to events, use requestFullAccessToEvents(completion:) or
requestFullAccessToEvents().
Upon its first launch, the MonthlyEvents app registers for EKEventStoreChanged
notifications to listen for any changes to the event store.
Then, the app checks whether it’s authorized to access the user’s calendar data.
If the authorization status is .notDetermined, the app uses an instance of EKEventStore,
eventStore, to prompt the user for full access.
MonthlyEvents includes NSCalendarsFullAccessUsageDescription in its Info.plist
file and uses its value when showing an alert. The alert prompts the user for full access to fetch
events in all the user’s calendars and delete the ones the user selects in the app. If the user grant
the request, the app receives a .fullAccess authorization status.
Then, the app fetches and displays all events occuring within a month in all the user’s calendars
sorted by start date in ascending order.


## Page 18

If the user denies the request, the app does nothing. In subsequent launches, the app displays a
message prompting the user to grant the app full access in Settings on their device.
Because the user authorized the app for full access, the user can additionally select and delete on
or more events in MonthlyEvents. The app iterates through an array of events that the user
chose to delete. It calls and sets the commit parameter of the remove(_:span:commit:)
function to false to batch the deletion of each event in the array.
Then, the app commits the changes once it’s done iterating through the array.
When you assign true to commit to immediately save or remove the event in your app, the even
store automatically rolls back any changes if the commit operation fails. However, if you set
commit to false and your app successfully removes some events and fails removing others, thi
can result in a later commit failing. Every subsequent commit fails until you roll back the changes.
Call reset() to manually roll back the changes.
If you build your app with Xcode 15, link it against the iOS 17 SDK, and need to run it on systems
earlier than iOS 17:
Add NSCalendarsUsageDescription to the Info.plist file of the target building your
app. If your app that’s linked on iOS 10 through iOS 16 doesn’t include NSCalendarsUsage
Description, your app crashes.
To request access to events, use requestAccess(to:completion:) or request
Access(to: .event).
To determine whether your app is authorized to access the user’s calendar data, confirm that
authorizationStatus(for:) is set to .authorized.
Run apps on operating system earlier than iOS 17


## Page 19

Note
The new request methods are unavailable on systems earlier than iOS 17, which may cause
your app to crash when running on these versions. Check that these methods are available in
the iOS version that you wish to run your app on before calling them in your app. See
Declaration Attributes for details.
The DropInLessons, MonthlyEvents, and RepeatingLessons targets in the sample projec
have a deployment target of iOS 16.4, meaning their apps can run on devices running iOS 16.4 an
later. These apps include NSCalendarsUsageDescription in their Info.plist and use
requestAccess(to: .event) when requesting permission from the user.
Important
In iOS 17, calling requestAccess(to: .event) or requestAccess(to:completion:)
doesn’t prompt the user for access and throws an error.
MonthlyEvents and RepeatingLessons confirm that they have an .authorized
authorization status.
Accessing the event store
Request access to a person’s calendar data through the event store.
class EKEventStore
An object that accesses a person’s calendar events and reminders and supports the
scheduling of new events.
See Also
Essentials


