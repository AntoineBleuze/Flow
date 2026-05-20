# 002_CLKDefaultComplicationIdentifier.pdf

## Page 1

The system assigns a CLKDefaultComplicationIdentifier value to the complication’s
identifier property, whenever a specific identifier is unavailable. For example, ClockKit uses
default type identifiers to represent the type on complications designed for watchOS 6 or earlier. 
also uses the default type for complications from a shared watch face, when the sender chose to
not include complication data in the shared watch face.
If your app supports multiple complications per family, you must check for CLKDefault
ComplicationIdentifier values in your data source’s getCurrentTimelineEntry(for:
withHandler:) and getTimelineEntries(for:after:limit:withHandler:) method
If you receive a CLKDefaultComplicationIdentifier, return generic entries for the specifi
family.
Discussion
ClockKit / CLKDefaultComplicationIdentifier
Global Variable
CLKDefaultComplicationIdentifier
An identifier representing a default complication.
watchOS 7.0+


## Page 2

Migrating ClockKit complications to WidgetKit
Leverage WidgetKit’s API to create watchOS complications using SwiftUI.
protocol CLKComplicationDataSource
A protocol that provides ClockKit with information about your complication.
class CLKComplicationDescriptor
A descriptor that defines a complication and the families that it supports.
See Also
Migration Support


