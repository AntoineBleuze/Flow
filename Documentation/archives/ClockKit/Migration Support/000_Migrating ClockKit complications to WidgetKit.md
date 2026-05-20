# 000_Migrating ClockKit complications to WidgetKit.pdf

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


