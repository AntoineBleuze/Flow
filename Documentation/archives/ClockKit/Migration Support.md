# Migration Support.pdf

## Page 1

With watchOS 9 and later, you can create complications for your watchOS app using SwiftUI view
in WidgetKit. WidgetKit provides a modern API for creating and updating glanceable elements —
making it an ideal fit for watchOS complications. Because WidgetKit’s design is inspired by
ClockKit, if you’ve already designed ClockKit complications for your app, the process feels familia
Similarly, if you’re already using widgets for iOS, you can quickly set up WidgetKit complications f
a watchOS app. In many cases, you can use the same code to display WidgetKit complications in
watchOS and widgets on the Lock Screen on iPhone. For more information, see Creating accesso
widgets and watch complications.
To convert ClockKit complications to WidgetKit, start by adding a WidgetKit extension to your
watchOS project.
Overview
Add WidgetKit to your project
WidgetKit / Widgets and watch complications / Migrating ClockKit complications to WidgetKit
Article
Migrating ClockKit complications to
WidgetKit
Leverage WidgetKit’s API to create watchOS complications using SwiftUI.


## Page 2

1. In Xcode, select the project icon in the Project navigator.
2. Click the “Add a target” button.
3. In the watchOS tab, select the Widget Extension template and click Next.
4. Give the new target a name.
5. If your app dynamically creates the set of CLKComplicationDescriptor objects to suppor
multiple complication types, enable the Include Configuration App Intent option. If you don’t pla
to configure your complications using app intents, you can disable this option.
6. Click Finish.
Xcode creates a new target containing Swift files for the widget, an asset catalog, and an Info
.plist file for the extension. The WidgetKit template provides you with structures that adopt the
Widget and View protocols. It also includes a starting implementation for your Timeline
Provider, or AppIntentTimelineProvider if you enabled Include Configuration App Intent


## Page 3

Important
After you add a WidgetKit extension to your project, the system tries to use it to generate
complications for your watchOS app. As soon as your WidgetKit extension begins providing
widget-based complications, the system disables your app’s ClockKit complications. It no
longer wakes your app to call your CLKComplicationDataSource object’s methods to
request timeline entries. However, the system may still wake your data source to call get
WidgetConfiguration(from:completionHandler:), while migrating complications
from ClockKit to WidgetKit.
The template creates a Provider structure that adopts the TimelineProvider or AppInten
TimelineProvider protocol, and provides a default implementation for the protocol’s methods
WidgetKit calls these methods to get the data needed to create the widget view.
Note
WidgetKit’s daily budget for reloading the timeline works differently than ClockKit’s. Your
widget-based complication receives up to 75 updates per day, based on how often they’re
viewed. If you have a complication on the Apple Watch face, it’s always considered viewed, so
your budget tends towards the higher end of that range.
In each of the protocol methods, your app needs to create and return one or more Timeline
Entry instances:
placeholder(in:)
Returns a single entry for your complication’s placeholder. By default, the system redacts all
the content in the placeholder’s widget.
getSnapshot(in:completion:)
Returns a single timeline entry for your app.
getTimeline(in:completion:)
Returns an array of timeline entries. WidgetKit uses this timeline to automatically update you
complication over time.
The template provides a timeline entry that contains the date when the system should display it.
Add any extra properties that you need for your complications.
Configure your timeline provider


## Page 4

Then, begin updating the timeline provider’s methods. For the placeholder, the system
automatically redacts all of the widget’s content, unless you explicitly mark items with the
unredacted() view modifier in your complication’s SwiftUI view. As a result, you may want to
provide generic data that fills out the redacted version.
The system can display the placeholder when the watch is locked, when it’s in Always On mode,
and when it can’t otherwise display a live version of your complication.
For the snapshot, return a single entry. In general, you want to return the current state of your app
However, the system also uses the snapshot when displaying your complication in the complicatio
picker. When returning your snapshot entry, be sure to check the context parameter isPrevie
property. This property indicates whether the snapshot will be used in the complication picker. If
this is true, provide generic data that shows your app’s typical appearance.


## Page 5

For the timeline, create an array of entries, and then create a Timeline instance from that array.
You can also select a reload policy for the timeline. By default, the system reloads the timeline
when you reach its end. However, in the example below, the system only reloads the timeline whe
you explicitly request it.


## Page 6

For more information, see Making a configurable widget and Keeping a widget up to date.
If your app provides a static set of widgets, you can define multiple widgets using a Widget
Bundle protocol. For example, the code listing below provides three complications: one that
displays the user’s current caffeine dose, one that provides the total number of cups of coffee for
the day, and one that provides both. Each widget can then support a different subset of the
available families.
However, if you need to dynamically configure a set of complications, provide a custom app inten
For example, a weather app may let people install complications for any cities in their favorites list
WidgetKit uses app intents for customizable properties, the same method that Siri Suggestions a
Siri Shortcuts use to customize those interactions. In iOS, the app intents describe elements that
the user can customize. For WidgetKit complications in watchOS, these intents aren’t user
configurable. Instead, they represent items that your app can dynamically configure.
To customize the widgets, implement your AppIntentTimelineProvider structure’s
recommendations() method to return an array of AppIntentRecommendation instances.
Support multiple complications


## Page 7

For more information, see Making a configurable widget.
Use SwiftUI static views, such as text, shapes, or images, to create your complication’s content.
You can also add render effects like blurs and gradients, but keep in mind that complications only
have one or two frames in which to render the effect.
Because complications show a snapshot of the app’s data at a particular point in time, they don’t
support features like animation. Additionally, if the user touches your complication, the system
launches your app instead of passing the touch event to the SwiftUI views, so a complication can
use interactive elements like buttons or switches.
Start by updating your Widget structure.
The body of the widget contains either a static or intent configuration, depending on whether you
app uses custom app intent definitions. Use the configuration to set items like the complication’s
Design the complication using SwiftUI


## Page 8

display name and the supported families. The configuration also takes a closure that returns a
SwiftUI view for the specified entry.
WidgetKit reduces the number of families you need to support. In some cases, a WidgetKit
accessory family covers more than one ClockKit family, which reduces the number of supported
families from 12 to 4.
ClockKit family
WidgetKit family
CLKComplicationFamily.graphicRectangular
WidgetFamily
.accessory
Rectangular
CLKComplicationFamily.graphicCorner
WidgetFamily
.accessoryCorner
CLKComplicationFamily.graphicCircular,
CLKComplicationFamily.graphicBezel,
CLKComplicationFamily.graphicExtraLarge
WidgetFamily
.accessoryCircular
CLKComplicationFamily.utilitarianSmallFlat,
CLKComplicationFamily.utilitarianLarge
WidgetFamily
.accessoryInline
Note
watchOS 9 and later no longer shows families like CLKComplicationFamily.circular
Small, CLKComplicationFamily.modularSmall, or CLKComplicationFamily
.modularLarge on watch faces.
Use the widgetFamily environment value to determine the complication’s family. You can
provide a different SwiftUI view for each family. You can also get the family from the context pass
to your timeline provider’s getTimeline(in:completion:), getSnapshot(in:
completion:), and placeholder(in:) methods.


## Page 9

Then, check the WidgetRenderingMode environmental value to determine whether your
complication is rendered in full color or using accent colors. Modify your design to best suit the
current rendering mode.


## Page 10

In accented mode, you can explicitly partition your view into an accented group and the default
group by adding the widgetAccentable(_:) view modifier to part of your complication’s view
hierarchy. For more information, see Creating accessory widgets and watch complications and
Creating views for widgets, Live Activities, and watch complications.
When designing your WidgetKit complications, build your complication views so that they can
adapt to different sizes. For example, you can use ViewThatFits to provide a set of different-
sized views, letting the system pick the best fit for the current context.
You can add a standard background to your complication by adding a AccessoryWidget
Background in a ZStack behind your widget’s content, and you can also add additional
information to circular and corner complications using a widgetLabel(label:). Use the widge
label to add gauges, progress views, or text along the inside curve of the corner view, or to add an
image and text along the bezel of the Infograph watch face.
Finally, consider how Always On affects your complications. You may need to redact sensitive
information, or adjust the widget’s appearance for reduced luminance. You can explicitly redact
sensitive information using the privacySensitive(_:) view modifier. If you do, the system
displays the redacted version of your view during Always On. For more information, see Designing
your app for the Always On state.
Note
If you don’t use the privacySensitive(_:) view modifier anywhere in your view hierarchy,
the system displays a placeholder instead of a live complication. By default, the placeholder
redacts all of your complication’s content.
When users upgrade your app, you need to transition them from the old ClockKit complications to
your new WidgetKit complications. Start by implementing your CLKComplicationDataSource
type’s widgetMigrator method. Use your implementation to return an instance that conforms 
the CLKComplicationWidgetMigrator protocol.
For example, update your data source so that it conforms to the CLKComplicationWidget
Migrator protocol.
Migrate complications on a watch face


## Page 11

Then, have the widgetMigrator property return self.
Finally, implement the getWidgetConfiguration(from:completionHandler:) method.
This method determines the best WidgetKit configuration for the given complication descriptor.
This example uses the Swift async version of the method:
See Also
Accessory and watchOS widgets


## Page 12

Creating accessory widgets and watch complications
Support accessory widgets that appear on the Lock Screen and as complications on Apple
Watch.
struct AccessoryWidgetGroup
A view type that has a label at the top and three content views masked with a circle or
rounded square.
struct AccessoryWidgetGroupStyle
The style for an AccessoryWidgetGroup view.


## Page 13

Enabling Complications for Your watchOS App
Sharing an Apple Watch face
Apps that support a complication must define a class that supports the CLKComplicationData
Source protocol and register it with the system. Your data source is responsible for providing
timeline entries and data for all of the complication families that you support. You do this by
implementing the protocol methods, returning the timeline entries displayed by your complication
and information about the features that your complication supports.
You don’t instantiate your data source class explicitly. After defining your class, specify the class
name in the General tab of the project settings for your WatchKit extension. When the system
needs data, ClockKit instantiates your data source and initializes it by calling its init method.
Once initialized, ClockKit calls the corresponding protocol methods to gather any needed data. Yo
can also specify your class name in your app’s Info.plist file using the CLKComplications
PrincipalClass key.
When the user installs your complication on the clock face, ClockKit creates an appropriate
CLKComplication object for the selected complication family. ClockKit then passes the
complication to your data source so that you know how to format your timeline entries. Use the
General tab of your WatchKit extension’s project settings to specify the families you support.
Mentioned in
Overview
ClockKit / CLKComplicationDataSource
Protocol
CLKComplicationDataSource
A protocol that provides ClockKit with information about your complication.
watchOS 2.0+


## Page 14

Your complication data source class must implement the CLKComplicationDataSource
protocol’s getCurrentTimelineEntry(for:withHandler:) method.
You may implement other methods as needed to support the data in your complication. For
example, to batch load future timeline entries, implement getTimelineEndDate(for:with
Handler:) and pass a future date to the handler. For more information, see Creating
complications for your watchOS app.
Note
For watchOS 6 and earlier, you must implement both getCurrentTimelineEntry(for:
withHandler:) and getSupportedTimeTravelDirections(for:withHandler:).
Use getSupportedTimeTravelDirections(for:withHandler:) to specify whether
your app can batch load future timeline entries.
ClockKit calls your data source methods on your watchOS app’s main thread.
var widgetMigrator: any CLKComplicationWidgetMigrator
A migrator that maps ClockKit complications to their WidgetKit replacements.
class CLKComplicationStaticWidgetMigrationConfiguration
A configuration object that specifies a static complication in WidgetKit.
class CLKComplicationAppIntentWidgetMigrationConfiguration
A configuration object that specifies a WidgetKit complication that uses app intents.
class CLKComplicationIntentWidgetMigrationConfiguration
A configuration object that specifies an intents-based complication in WidgetKit.
protocol CLKComplicationWidgetMigrator
A protocol that maps ClockKit complications to their WidgetKit replacements.
class CLKComplicationWidgetMigrationConfiguration
An abstract class that specifies WidgetKit complications.
Topics
Migrating to WidgetKit
Setting information property keys


## Page 15

CLKComplicationPrincipalClass
The name of the class that implements the complication data source protocol.
let CLKLaunchedTimelineEntryDateKey: String
A key that indicates the date when the system launched the complication.
Deprecated
let CLKLaunchedComplicationIdentifierKey: String
A key that indicates the identifier of a complication the system launched.
Deprecated
func getComplicationDescriptors(handler: ([CLKComplicationDescriptor]) 
> Void)
Returns the list of complication descriptors.
Deprecated
func handleSharedComplicationDescriptors([CLKComplicationDescriptor])
Informs the app about complications from a shared watch face.
Deprecated
func getLocalizableSampleTemplate(for: CLKComplication, withHandler: (
CLKComplicationTemplate?) -> Void)
Gets a localizable template that shows sample data for the specified complication.
Deprecated
func getPrivacyBehavior(for: CLKComplication, withHandler: (
CLKComplicationPrivacyBehavior) -> Void)
Returns the privacy behavior for the specified complication.
Deprecated
enum CLKComplicationPrivacyBehavior
Constants indicating the complication behavior when the Apple Watch is locked.
Deprecated
func getAlwaysOnTemplate(for: CLKComplication, withHandler: (
CLKComplicationTemplate?) -> Void)
Returns the template to use during Always On.
Deprecated
Deprecated methods


## Page 16

func getTimelineEndDate(for: CLKComplication, withHandler: (Date?) ->
Void)
Retrieves the last date for the data that your app can supply.
Deprecated
func getCurrentTimelineEntry(for: CLKComplication, withHandler: (
CLKComplicationTimelineEntry?) -> Void)
Retrieves the timeline entry that you want to display now.
Required
Deprecated
func getTimelineEntries(for: CLKComplication, after: Date, limit: Int,
withHandler: ([CLKComplicationTimelineEntry]?) -> Void)
Retrieves future timeline entries for the complication.
Deprecated
func getTimelineAnimationBehavior(for: CLKComplication, withHandler: (
CLKComplicationTimelineAnimationBehavior) -> Void)
Gets the animation behavior when transitioning between timeline entries.
Deprecated
enum CLKComplicationTimelineAnimationBehavior
Constants indicating the animation behavior during Time Travel.
Deprecated
func getSupportedTimeTravelDirections(for: CLKComplication, withHandler
(CLKComplicationTimeTravelDirections) -> Void)
Determines whether your complication can provide timeline entries for the future or the past
Deprecated
struct CLKComplicationTimeTravelDirections
Constants indicating the supported time travel directions, if any.
Deprecated
func getTimelineStartDate(for: CLKComplication, withHandler: (Date?) ->
Void)
Retrieves the earliest date for which your complication is prepared to supply data.
Deprecated
func getTimelineEntries(for: CLKComplication, before: Date, limit: Int,
withHandler: ([CLKComplicationTimelineEntry]?) -> Void)
Retrieves past timeline entries for the complication.


## Page 17

Deprecated
func getNextRequestedUpdateDate(handler: (Date?) -> Void)
Gets the next time at which to update your complication.
Deprecated
func requestedUpdateDidBegin()
Indicates that a requested update has begun so that you’ve an opportunity to extend or reloa
your timeline.
Deprecated
func requestedUpdateBudgetExhausted()
Indicates that your complication’s time budget is exhausted.
Deprecated
func getPlaceholderTemplate(for: CLKComplication, withHandler: (
CLKComplicationTemplate?) -> Void)
Gets a static template to display in the selection screen for your complication.
Deprecated
NSObjectProtocol
Migrating ClockKit complications to WidgetKit
Leverage WidgetKit’s API to create watchOS complications using SwiftUI.
let CLKDefaultComplicationIdentifier: String
An identifier representing a default complication.
class CLKComplicationDescriptor
Relationships
Inherits From
See Also
Migration Support


## Page 18

A descriptor that defines a complication and the families that it supports.


## Page 19

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


## Page 20

Migrating ClockKit complications to WidgetKit
Leverage WidgetKit’s API to create watchOS complications using SwiftUI.
protocol CLKComplicationDataSource
A protocol that provides ClockKit with information about your complication.
class CLKComplicationDescriptor
A descriptor that defines a complication and the families that it supports.
See Also
Migration Support


## Page 21

Declaring complications for your app
Creating a timeline entry
Use complication descriptors to define the different types of complications that your app support
Each descriptor provides a unique identifier for the complication, and the list of families that the
complication supports. ClockKit defines the available families using the CLKComplication
Family enumeration, while your app can define as many identifiers as it needs. Each unique
identifier within your app represents a separate complication in the complication picker. For
example, a weather app may have separate descriptors for Condition, Temperature, and
Precipitation.
Mentioned in
Overview
ClockKit / CLKComplicationDescriptor
Class
CLKComplicationDescriptor
A descriptor that defines a complication and the families that it supports.
watchOS 7.0+


## Page 22

You can dynamically create unique identifiers to further customize the complications. For example
if the weather app provides separate complications for all the cities in the user’s favorite city list, 
can create a separate descriptor for each city and weather data pair. The app can create unique
identifiers by appending the city name and the weather data’s name.


## Page 23

When dynamically creating identifiers, consider using the descriptor’s userInfo property to
contain any additional information your app needs to create timeline entries for the complication. 
the above example, the weather app adds the myCityIDKey and myTypeIdentifierKey key
so that it can access the city and weather data type without parsing the identifier string.
convenience init(identifier: String, displayName: String, supported
Families: [CLKComplicationFamily])
Returns a new complication descriptor.
Deprecated
convenience init(identifier: String, displayName: String, supported
Families: [CLKComplicationFamily], userActivity: NSUserActivity)
Returns a new complication descriptor with an associated user activity.
Deprecated
convenience init(identifier: String, displayName: String, supported
Families: [CLKComplicationFamily], userInfo: [AnyHashable : Any])
Returns a new complication descriptor with an associated dictionary of user data.
Deprecated
var identifier: String
A string that uniquely identifies the descriptor.
var displayName: String
A localized string that identifies complications from the descriptor to the user.
Topics
Creating descriptors
Accessing the descriptor’s data


## Page 24

var supportedFamilies: [CLKComplicationFamily]
The families that support this type of complication.
var userActivity: NSUserActivity?
A user activity object that represents the state of the app at a moment in time.
var userInfo: [AnyHashable : Any]?
A dictionary of data that your data source can use to generate timeline entries.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Migrating ClockKit complications to WidgetKit
Leverage WidgetKit’s API to create watchOS complications using SwiftUI.
protocol CLKComplicationDataSource
A protocol that provides ClockKit with information about your complication.
let CLKDefaultComplicationIdentifier: String
Relationships
Inherits From
Conforms To
See Also
Migration Support


## Page 25

An identifier representing a default complication.


