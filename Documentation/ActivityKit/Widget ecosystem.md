# Widget ecosystem.pdf

## Page 1

Widgets display relevant, glanceable content that people can quickly access for more details. You
app can provide a variety of widgets, letting people focus on the information that’s most importan
to them.
A good way to get started with widgets and WidgetKit is by adding a static widget to your app. A
static widget doesn’t need any configuration by a person. For example, a static widget might show
a stock market summary, or the next event on the person’s calendar. The data the widget shows i
dynamic, but the type of data it shows is fixed. Consider the information your app presents, and
choose something that people would find useful to see at a glance on their device.
Widgets can display data in many sizes, from small watch complications or Dynamic Island
presentations, to extra large iPad and macOS widgets. The example that follows below focuses on
a single size widget, the small system size, or WidgetFamily.systemSmall. The example
widget displays the status of a hypothetical game such as the health level of a character.
You build widgets using SwiftUI. While there are similarities to how you present views in your app,
some aspects are unique to developing widgets. For more information about using SwiftUI, refer t
SwiftUI. However, not all SwiftUI views work in widgets. For a list of the views that work in widgets
refer to SwiftUI views for widgets.
The Widget Extension template provides a starting point for creating your widget. The template
creates an extension target that contains a single widget. Later, you can add widgets to the same
extension to display different types of information or to support additional widget sizes.
1. Open your app project in Xcode and choose File > New > Target.
2. From the Application Extension group, select Widget Extension, and then click Next.
Overview
Add a widget target to your app
WidgetKit / Creating a widget extension
Article
Creating a widget extension
Display your app’s content in a convenient, informative widget on various devices


## Page 2

3. Enter the name of your extension.
4. Deselect the Include Live Activity and Include Configuration App Intent checkboxes, if they’re
selected.
5. Click Finish.
Note
Live Activities use WidgetKit and share many aspects of their design and implementation with
the widgets in your app. If your app supports Live Activities, consider implementing them at
the same time you add your widgets. For more information about Live Activities, refer to
Displaying live data with Live Activities.
The widget extension template provides an initial implementation that conforms to the Widget
protocol. The widget’s body property determines the type of content that the widget presents.
Static widgets use a StaticConfiguration for the body property. Other types of widget
configurations include:
AppIntentConfiguration that enables user customization, such as a weather widget that
needs a zip or postal code for a city, or a package-tracking widget that needs a tracking numbe


## Page 3

ActivityConfiguration to present live data, such as scores during a sporting event or a
food delivery estimate.
RelevanceConfiguration to provide relevance clues for widgets in watchOS.
For more information about these other widget configurations, refer to Making a configurable
widget, Displaying live data with Live Activities, and Increasing the visibility of widgets in Smart
Stacks.
To configure a static widget, provide the following information:
kind
A string that identifies the widget. This is an identifier you choose, and should be descriptive 
what the widget represents.
provider
An object that conforms to TimelineProvider and produces a timeline that tells WidgetK
when to render the widget. A timeline is a sequence that contains a custom TimelineEntry
type you define. The entries in this sequence identify the date when you want WidgetKit to
update the widget’s content and includes properties your widget’s view needs to render in th
custom type.
content
A closure that contains SwiftUI views. WidgetKit invokes this to render the widget’s content,
passing a TimelineEntry parameter from the provider.
Use modifiers to provide additional configuration details, including a display name, a description,
and the families the widget supports. The following code shows a widget that provides general
status for a game:
Add configuration details


## Page 4

The widget’s provider generates a timeline for the widget, and includes the game-status details in
each entry. When the date of each timeline entry arrives, WidgetKit invokes the content closure
to display the widget’s content. Finally, the modifiers specify the name and description shown in
the widget gallery, and the sizes that the widget supports.
Important
For an app’s widget to appear in the widget gallery, a person must launch the app that contains
the widget at least once after the app is installed.
Note the usage of the @main attribute on this widget. This attribute indicates that the Game
StatusWidget is the entry point for the widget extension, implying that the extension contains a
single widget. To support multiple widgets, refer to the WidgetBundle.
The timeline provider you define generates a sequence of timeline entries. Each specifies the date
and time to update the widget’s content, and includes the data your widget needs to render its
view. The game-status widget might define its timeline entry to include a string that represents th
status of the game, as follows:
Provide timeline entries


## Page 5

WidgetKit calls getTimeline(in:completion:) to request the timeline from the provider. Th
timeline consists of one or more timeline entries and a reload policy that informs WidgetKit when 
request a subsequent timeline.
Tip
You can use APNs and WidgetKit push notifications to update your widgets. To build your first
widget, create a widget that uses a timeline to update its data, then add push notification
updates if it’s a good fit for your widget. For more information, refer to Keeping a widget up to
date.
The following example shows how the game-status widget’s provider generates a timeline that
consists of a single entry with the current game status from the server, and a reload policy to
request a new timeline in 15 minutes:
In this example, if the widget didn’t have the current status from the server, it could store a
reference to the completion, perform an asynchronous request to the server to fetch the game
status, and call the completion when that request completes.


## Page 6

For more information about generating timelines, refer to Keeping a widget up to date and
Increasing the visibility of widgets in Smart Stacks. For more information about handling network
requests, refer to Making network requests in a widget extension.
In order for people to be able to use your widget, it needs to be available in the widget gallery. To
show your widget in the widget gallery, WidgetKit asks the provider for a preview snapshot that
displays generic data. WidgetKit makes this request by calling the provider’s getSnapshot(in:
completion:) method with the context parameter’s isPreview property set to true.
In response, you need to create the preview snapshot quickly. If your widget would normally need
assets or information that takes time to generate or fetch from a server, use sample data instead.
In the following code, the game-status widget’s provider implements the snapshot method by
showing the game status if it’s available, falling back to an empty status if it doesn’t have the stat
from its server:
Widgets define their content using a SwiftUI view, commonly by composing other SwiftUI views. A
shown in the Add configuration details section, the widget configuration contains the closure that
WidgetKit invokes to render the widget’s content.
When people add your widget from the widget gallery, they choose the specific family — for
example, small or medium — from the ones your widget supports. The widget’s content closure h
to be capable of rendering each family the widget supports. WidgetKit sets the corresponding
Generate a preview for the widget gallery
Display content in your widget


## Page 7

family and additional properties, such as the color scheme (light or dark), in the SwiftUI
environment.
In the game-status widget’s configuration shown above, the content closure uses a GameStatus
View to display the status. Because this widget only supports the .systemSmall family, it uses
composed GameTurnSummary SwiftUI view to display a summary of the game’s current status.
For any other family size, it shows the default view, which indicates that game status is unavailabl
In your widget, as you add more supported families to the widget’s configuration, you would add
additional cases in the widget view’s body property for each additional family.
Note
The view declares its body with @ViewBuilder because the type of view it uses varies.
A placeholder view is similar to a preview snapshot, but instead of showing example data to let
people see the type of data the widget displays, it shows a generic visual representation with no
specific content. When WidgetKit renders your widget, it may need to render your content as a
placeholder, for example, while you load data in the background or if you tell the system that your
widget contains sensitive information.
Widgets and watch complications may show sensitive information and can be highly visible,
especially on devices with an Always-On display. When you create your widget or watch
Display a placeholder widget
Hide sensitive content


## Page 8

complication, review its content and consider hiding sensitive information.
To let people decide whether a widget should show sensitive data on a locked device, mark views
that contain sensitive information using the privacySensitive(_:) modifier. In iOS, people c
configure whether to show sensitive data on the Lock Screen and during Always On. In Settings,
they can deactivate data access for Lock Screen widgets in the ALLOW ACCESS WHEN LOCKED
section of Settings > Face ID & Passcode. On Apple Watch, people can configure whether to show
sensitive data during Always On by Choosing Settings > Display & Brightness > Always On > Hide
Sensitive Complications. They can choose to show redacted content for all or individual
complications.
If a person chooses to hide privacy sensitive content, WidgetKit renders a placeholder or
redactions you configure. To configure redactions, implement the redacted(reason:) callbac
read out the privacy property, and provide custom placeholder views. You can also choose to
render a view as unredacted with the unredacted() view modifier.
As an alternative to marking individual views as privacy sensitive, for example, if your entire widge
content is privacy sensitive, you can add the Data Protection capability to your widget extension.
Until a person unlocks their device to match the privacy level you chose, WidgetKit displays a
placeholder instead of the widget content. First, enable the Data Protection capability for your
widget extension in Xcode, then set the Data Protection Entitlement entitlement to the
value that fits the level of privacy you want to offer:
NSFileProtectionComplete
WidgetKit hides widget content when the device is locked. Additionally, iOS widgets aren’t
available as iPhone widgets on Mac.
NSFileProtectionCompleteUnlessOpen
WidgetKit hides widget content when the device is passcode locked. Additionally, iOS widget
aren’t available as iPhone widgets on Mac.
If you choose the NSFileProtectionCompleteUntilFirstUserAuthentication or
NSFileProtectionNone protection level for your widget extension:
WidgetKit uses its default behavior and displays a placeholder until a person authenticates afte
they reboot their device.
iOS widgets are available as iPhone widgets on Mac.
Widgets typically present read-only information and don’t generally support interactive elements
such as scrolling lists or text input. Widgets support some interactive elements and animations. F
details on adding interactivity to your widgets, refer to Adding interactivity to widgets and Live
Activities.
Add dynamic content to your widget


## Page 9

For a list of views that WidgetKit supports, refer to SwiftUI views for widgets. WidgetKit ignores
other views when it renders the widget’s content.
Although the display of a widget is based on a snapshot of your view, you can use various SwiftUI
views that continue to update while your widget is visible. For more about providing dynamic
content, refer to Keeping a widget up to date and Displaying dynamic dates in widgets.
When people interact with your widget, beyond interactive elements described above, the system
launches your app to handle the request. When the system activates your app, navigate to the
details that correspond to the widget’s content. Your widget can specify a URL to inform the app
what content to display. To configure custom URLs in your widget:
For all widgets, add the widgetURL(_:) view modifier to a view in your widget’s view
hierarchy. If the widget’s view hierarchy includes more than one widgetURL modifier, the
behavior is undefined.
For widgets that use WidgetFamily.systemMedium, WidgetFamily.systemLarge, or
WidgetFamily.systemExtraLarge, add one or more Link controls to your widget’s view
hierarchy. You can use both widgetURL and Link controls. If the interaction targets a Link
control, the system uses the URL in that control. For interactions anywhere else in the widget,
the system uses the URL specified in the widgetURL view modifier.
For more details about adding links from your widgets to your app, refer to Linking to specific app
scenes from your widget or Live Activity.
Xcode allows you to look at previews of your widgets without running your app in Simulator or on 
test device. The following example shows the preview code from the Emoji Rangers widget of the
Building Widgets Using WidgetKit and SwiftUI sample code project.
As you support more widget families in your widget, you can add more preview views to see
multiple sizes in a single preview.
For additional information about previewing widgets, refer to Previewing widgets and Live Activitie
in Xcode.
Respond to user interactions
Preview widgets in Xcode


## Page 10

To give people flexible access to your app’s content, you can support additional families, add
widget types, make your widgets user-configurable, or add support for Live Activities if your app
presents live data. To explore a plan to support additional features, refer to Developing a WidgetK
strategy.
To explore WidgetKit code for the first time, refer to the following sample code projects:
Building Widgets Using WidgetKit and SwiftUI is the sample code project associated with the
WWDC20 code-alongs Widgets Code-along, part 1: The adventure begins, Widgets Code-alon
part 2: Alternate timelines, and Widgets Code-along, part 3: Advancing timelines, where you
learn how to build your first widget.
Emoji Rangers: Supporting Live Activities, interactivity, and animations expands the Emoji
Rangers sample code project to include Lock Screen widgets, Live Activities, interactivity, and
animations.
Fruta: Building a feature-rich app with SwiftUI and Backyard Birds: Building an app with
SwiftData and widgets are sample code projects that support widgets in addition to other
technologies like App Clips and SwiftData.
You can include multiple widget types in your widget extension, although your app can contain
multiple extensions. For example, if some of your widgets use location information and others
don’t, keep the widgets that use location information in a separate extension. This allows the
system to prompt someone for authorization to use location information only for the widgets from
the extension that uses location information. For details about bundling multiple widgets in an
extension, refer to WidgetBundle.
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
WidgetKit updates
Learn about important changes in WidgetKit.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Expand your widget’s capabilities
Create multiple widget extensions
See Also
Essentials


## Page 11

Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
protocol WidgetBundle
A container used to expose multiple widgets from a single widget extension.


## Page 12

Animations bring your widgets and Live Activities to life and alert a person when new information 
available. Widgets and Live Activities animate data updates with default animations or SwiftUI
animations you choose, bringing a person’s attention to updated data. In earlier OS versions,
widgets don’t animate, and Live Activities only use a subset of SwiftUI transitions and animations
Note
Animations in widgets and Live Activities have a maximum duration of two seconds.
For example, text views animate content changes with blurred content transitions by default, and
changes to images and SF Symbols animate with default content transitions. If you add or remove
views from the interface based on timeline updates or other state changes, views fade in and out
Related session from WWDC23
Session 10028: Bring widgets to life
To replace default animations and transitions:
Configure built-in transitions like opacity, move(edge:), slide, push(from:), or
combinations of them.
Add transition(_:), contentTransition(_:), or animation(_:value:) to views.
Request animations for timer text with numericText(countsDown:).
Overview
WidgetKit / Animating data updates in widgets and Live Activities
Article
Animating data updates in widgets and
Live Activities
Use SwiftUI animations to indicate data updates in your widgets and Live
Activities.


## Page 13

Important
On devices that include an Always-On display, the system doesn’t perform animations to
preserve battery life in Always On. Check the isLuminanceReduced environment value to
detect reduced luminance before animating content changes.
For Live Activities that appear on devices that run iOS 16 or earlier, the system ignores any
animation modifiers — for example, withAnimation(_:_:) and animation(_:value:) —
and uses the system’s animation timing instead. However, you can use built-in transitions like
opacity, move(edge:), slide, push(from:), or combinations of them.
For more information about SwiftUI animations, refer to Animations.
In addition to the default transitions and animations that the system performs when views update
their data, you can choose other built-in SwiftUI transitions and animations. Widgets and Live
Activities support all built-in SwiftUI transitions and animations. For example, you could configure
content transition for numeric text as shown in this example:
Additionally, you could add a spring animation to the transition:
To use custom text animations, use contentTransition(_:) as shown in the example above.
To use the default text animation, use transition(_:), and customize its speed and delay as
shown in the following example:
Add transitions and animations to views that update their
data


## Page 14

In addition to adding transitions or animations to a view that changes its data, you can animate a
view when other widget information changes. To animate a view when a certain value changes, fir
associate the view you want to animate with that value’s data model object. This is easiest when
your data model conforms to the Hashable protocol. If your data model doesn’t conform to
Hashable, change its code accordingly. Then, associate the view with the data model using the
id(_:) view modifier. Finally, add a transition or animation.
The following example shows how the LastDrinkView adds a push transition when the
associated log changes.
If a content update changes many views in your widget or Live Activity, consider disabling
transitions and animations for some views to direct a person’s attention to the most important
updates. To disable animations for a view, including default animations, pass identity to
transition(_:) or nil to the animation parameter of withAnimation(_:_:) and
animation(_:value:).
Note
Transaction isn’t available to widgets and Live Activities, so you can’t cancel or deactivate
an animation by setting the transaction’s animation property to nil.
Add transitions and animations to additional views
Disable animations


## Page 15

Adding interactivity to widgets and Live Activities
Include buttons or toggles in a widget or Live Activity to offer app functionality without
launching the app.
Linking to specific app scenes from your widget or Live Activity
Add deep links to your widgets and Live Activities that enable people to open a specific scen
in your app.
See Also
Interactivity


## Page 16

SwiftUI and WidgetKit power widgets, Live Activities, and watch complications. Because they use
the same technology and share design similarities, plan your WidgetKit adoption before you start
creating these features. Start simple and add complexity later; for example, start by adding a
widget extension as described in Creating a widget extension and support one widget size. Spend
time to make sure it offers a focused, glanceable experience. Then, add support for additional
widget sizes and features like configurability, animations, and interactivity.
Related session from WWDC23
Session 10027: Bring widgets to new places
If you’re new to using WidgetKit, see Developing a WidgetKit strategy.
Widgets, Live Activities, and watch complications appear adjacent to other widgets or
complications. As a result, a consistent look for your content that fits in well with the other
elements needs to be a priority. To achieve a consistent look for your widgets and complications,
use system fonts, default font parameters, and the following font styles:
Font.TextStyle.headline
Font.TextStyle.title
Font.TextStyle.body
Overview
Use system font styles
WidgetKit / Creating views for widgets, Live Activities, and watch complications
Article
Creating views for widgets, Live Activities,
and watch complications
Implement glanceable views with WidgetKit and SwiftUI.


## Page 17

Font.TextStyle.caption
Widgets and watch complications offer limited space for content — especially on the Lock Screen
or on Apple Watch. Give careful consideration to the amount of text you display. For example, say
you support the WidgetFamily.accessoryInline widget. It can include an image and text.
However, the amount of displayable characters varies depending on the context where the widge
appears. On Apple Watch, the size of the inline complication varies depending on the watch face.
Include it in a ViewThatFits view to make sure text always fits the available space.
Note
Test your widgets with every language you support, especially if you support languages that
commonly have words with a lot of characters, such as German.
watchOS 9, iOS 16, iPadOS 16, macOS 13, and earlier use system-defined safe areas to keep
content from getting too close to the edge of the widget, complication, or Live Activity. You likely
don’t change the safe areas that the system defines. However, you might use the ignoresSafe
Area(_:edges:) view modifier to extend content farther than the safe area.
WidgetKit complications, and Live Activities use content margins instead of safe areas. As a resul
ignoresSafeArea(_:edges:) has no effect. Instead, use the contentMarginsDisabled(
view modifier to define custom content margins.
If you use ignoresSafeArea(_:edges:), follow these steps:
1. Add the contentMarginsDisabled() view modifier to your widget configuration.
2. For any content that you intend to remain inside system-defined content margins, make use of
padding(_:) as needed.
Tip
To access the system’s default content margins for an environment, use the widgetContent
Margins environment variable.
Make sure text fits the available space
Use content margins instead of safe areas
See Also


## Page 18

SwiftUI views for widgets
Present your app’s content in widgets with SwiftUI views.
Presentation


## Page 19

People interact with a widget or Live Activity to launch a scene in the corresponding app with
matching content and functionality. For example, when people click or tap a Stocks widget, the
Stocks app opens to a page that displays information about that stock price.
When you create widgets and Live Activities, think about how people interact with them. Make su
interactions launch the scene in your app that fits the widget’s content or the Live Activity.
By default, tapping or clicking your widget or Live Activity opens its corresponding app. To provid
a good experience and not make people navigate to get to the right place in your app, open the a
at a scene that matches the content of the widget or Live Activity. To open a specific screen in yo
app, add the widgetURL(_:) modifier to a view in the view hierarchy of your widget or Live
Activity.
Important
If the view hierarchy includes more than one widgetURL modifier, the behavior is undefined.
For example, the following code snippet from the Emoji Rangers: Supporting Live Activities,
interactivity, and animations sample code project shows how the small widget uses widget
URL(_:) to allow people to open the app and show a character’s detail information:
Overview
Launch a specific screen in your app
WidgetKit / Linking to specific app scenes from your widget or Live Activity
Article
Linking to specific app scenes from your
widget or Live Activity
Add deep links to your widgets and Live Activities that enable people to open a
specific scene in your app.


## Page 20

For widgets with enough space for more than one interaction target — WidgetFamily
.accessoryRectangular, WidgetFamily.systemSmall, and larger system family sizes —
add one or more Link controls to your view hierarchy. You can use one widgetURL and addition
Link controls. If an interaction targets a Link control, the system uses the URL in that control. F
interactions anywhere else in the widget, the system uses the URL you specify in the widget
URL(_:) view modifier.
For example, the leaderboard widget of the Emoji Rangers: Supporting Live Activities, interactivity
and animations app displays a list of characters. Each item in the list uses a Link control to launc
the scene in the app for the specific character that the item represents.
Note
When the widget or Live Activity receives an interaction, the system activates the containing
app and passes the URL to onOpenURL(perform:), application(_:open:options:),
or application(_:open:), depending on the life cycle your app uses.
If a widget doesn’t specify a deep link URL with widgetURL(_:) or Link and a person interacts
with it, the system opens the containing app and passes an NSUserActivity to onContinue
UserActivity(_:perform:), application(_:continue:restorationHandler:), or
application(_:continue:restorationHandler:). The user activity’s userInfo
Detect the originating widget by accessing the user
activity object


## Page 21

dictionary contains details about the widget the person interacted with. Use the keys in Widget
Center.UserInfoKey to access these values from Swift code. To access the userInfo value
from Objective-C, use the keys WGWidgetUserInfoKeyKind and WGWidgetUserInfoKey
Family instead. Then, update your app’s interface to match the widget so people don’t have to
navigate to the right place in your app.
Note
If you use an AppIntentConfiguration to configure your widget, use the widget
ConfigurationIntent(of:) function to access the widget’s intent. Similarly, if you use an
IntentConfiguration, the user activity’s interaction property contains the associated
INIntent.
In CarPlay, linking from your widget to your app works differently to match the specific context of
using your app while using your car. For more information about supporting CarPlay, see Adding
StandBy and CarPlay support to your widget.
Adding interactivity to widgets and Live Activities
Include buttons or toggles in a widget or Live Activity to offer app functionality without
launching the app.
Animating data updates in widgets and Live Activities
Use SwiftUI animations to indicate data updates in your widgets and Live Activities.
Review linking behavior in CarPlay
See Also
Interactivity


## Page 22

Using WidgetKit, you can make your app’s content available in contexts outside the app and exten
its reach by building an ecosystem of glanceable, up-to-date experiences.
The ecosystem that WidgetKit enables consists of:
Widgets
Widgets elevate a small amount of timely, personally relevant information from your app,
display it where people can see it at a glance, and offer specific app functionality without
launching the app. On iPhone and iPad, people put widgets in Today View, on the Home
Screen, and on the Lock Screen. On Mac, people put native Mac app widgets on the desktop
and in Notification Center. Additionally, people place iPhone widgets in locations like a Mac
desktop and Notification Center, or in CarPlay. On Apple Watch, widgets appear in the Smart
Stack, and on Apple Vision Pro, widgets become three-dimensional objects that people pin to
horizontal and vertical surfaces.
Smart Stacks
Overview
Framework
WidgetKit
Extend the reach of your app by creating widgets, watch complications, Live
Activities, and controls.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
visionOS 26.0+
watchOS 9.0+


## Page 23

On iPhone and iPad, people stack widgets on their Home Screen and create Smart Stacks tha
use Smart Rotate to show the most contextually relevant widget. On Apple Watch, the system
intelligently displays widgets that are most relevant to someone’s personal context.
Additionally, a person configures a widget to always appear in the Smart Stack or pins it to a
fixed position.
Watch complications
People place watch complications on the Apple Watch face to view timely, relevant informatio
when they lift their wrist. Additionally, the Smart Stack on Apple Watch offers space for up to
three complications.
Live Activities
Live Activities display up-to-date content from your app such as event and task information o
the Lock Screen or in the Dynamic Island. Live Activities use ActivityKit for updates and
optionally the Apple Push Notification service (APNs) to send ActivityKit push notifications. F
more information, refer to ActivityKit.
Controls
Controls act as a button or toggle that allows people to perform actions you describe with the
App Intents framework in Control Center, on the Lock Screen, and from the Action button. A
button control might initiate an action from your app, or open your app to a specific view, and
toggle might turn a light on and off or open and close a garage door. Controls appear in
Control Center or as menu bar items and in Control Center on Apple Watch.
WidgetKit enables features across iPad, iPhone, the Mac, Apple Watch, and Apple Vision Pro, but
only in a way that best fits a person’s device and personal needs. For example, WidgetKit powers
widgets on all platforms in various sizes. It also powers Live Activities and controls, features that
aren’t available on Apple Vision Pro.
Even though not every feature that WidgetKit powers is available on every platform or device,
widgets, Live Activities, controls, and watch complications share technology and design similaritie
This makes it easy to develop features in tandem and to expand usage across contexts.
Use an iterative approach and start with support for one feature or select sizes of widgets — for
example, start with a small widget as described in Creating a widget extension, but plan and desig
additional sizes and features across platforms from the beginning. Then allow people to view you
content in as many contexts as possible.
For more information, refer to Developing a WidgetKit strategy.
The WidgetKit ecosystem enables people to view your app content in new contexts and offers
specific interactions with your app when and where they need it:
Develop glanceable features iteratively
Understand interactivity and personalization


## Page 24

People tap a widget, watch complication, or Live Activity to launch the corresponding app or th
app’s scene with matching information or functionality. For example, tapping an Emoji Ranger
widget or watch complication launches the scene in the app that matches the displayed hero.
For more information, refer to Linking to specific app scenes from your widget or Live Activity.
People use buttons and toggles in widgets, controls, and Live Activities to interact with your ap
without launching it. For example, the large widget of the Emoji Rangers: Supporting Live
Activities, interactivity, and animations sample code project includes a button that people tap t
give the healing capability of their hero a temporary boost.
In addition to offering relevant information and specific interactivity at a glance, people use
widgets, watch complications, Live Activities, and controls to personalize their devices:
People configure widgets and watch complications to display details specific to their needs. Fo
example, a widget of the Emoji Rangers: Supporting Live Activities, interactivity, and animations
sample code project allows people to configure the hero that appears on the widget.
People arrange widgets and watch complications in the way that works best for them. When th
stack widgets and enable Smart Rotate on iPhone or iPad, WidgetKit automatically rotates the
most relevant widget to the top, making sure people see the most important details at the right
time. On Apple Watch, the Smart Stack displays widgets based on contextual relevance, and
people pin a favorite widget to a fixed position in the Smart Stack.
Widgets and watch complications use a special mechanism to update their content: You create a
timeline of data updates and hand it to WidgetKit. WidgetKit then makes sure the widget or
complication updates its content in an energy-efficient way. For more information on timelines,
refer to Keeping a widget up to date. Additionally, widgets can receive updates by using the Apple
Push Notification service (APNs) and remote push notifications.
Live Activities don’t use timelines to update their content. Instead, they use ActivityKit and
ActivityKit push notifications you send with APNs. For more information, refer to ActivityKit.
Controls don’t use timelines to update their content. Instead, your controls update their content
when someone uses them, the app reloads them, or the system receives a remote push notificatio
from APNs.
Widgets, watch complications, Live Activities, and controls are small and require a focused,
glanceable design. For design guidance, refer to Human Interface Guidelines > Widgets, Human
Interface Guidelines > Complications, Human Interface Guidelines > Live Activities, and Human
Interface Guidelines > Controls.
Update content with timelines and push notifications
Create a focused, glanceable design


## Page 25

Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
WidgetKit updates
Learn about important changes in WidgetKit.
Creating a widget extension
Display your app’s content in a convenient, informative widget on various devices.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
protocol WidgetBundle
A container used to expose multiple widgets from a single widget extension.
Widgets and watch complications
Allow people to personalize their devices, view relevant information, and perform interaction
with widgets and watch complications.
Live Activities
Let people track updates from your app with Live Activities.
Controls
Offer controls that people place in Control Center, on the Lock Screen, and on the Action
button to quickly perform an action from your app.
Creating views for widgets, Live Activities, and watch complications
Implement glanceable views with WidgetKit and SwiftUI.
SwiftUI views for widgets
Present your app’s content in widgets with SwiftUI views.
Topics
Essentials
System experiences
Presentation


## Page 26

Adding interactivity to widgets and Live Activities
Include buttons or toggles in a widget or Live Activity to offer app functionality without
launching the app.
Animating data updates in widgets and Live Activities
Use SwiftUI animations to indicate data updates in your widgets and Live Activities.
Linking to specific app scenes from your widget or Live Activity
Add deep links to your widgets and Live Activities that enable people to open a specific scen
in your app.
Adding accessible descriptions to widgets and Live Activities
Describe the interface elements of your widgets and Live Activities to help people understan
what they represent.
Previewing widgets and Live Activities in Xcode
Use Xcode previews to iteratively develop, fine-tune, and troubleshoot widgets and Live
Activities.
struct WidgetPreviewContext
A specification for the context of a widget preview.
Preview macros
Use Swift macros to create widget previews in Xcode.
Interactivity
Accessibility
Previews and debugging


