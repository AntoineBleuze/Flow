# 002_Updating with notifications.pdf

## Page 1

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


## Page 2

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


