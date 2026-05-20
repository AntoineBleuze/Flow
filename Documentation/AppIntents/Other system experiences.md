# Other system experiences.pdf

## Page 1

With Spotlight, people access information from within apps and the web, and use it to launch app
and perform actions. When you adopt the App Intents framework and create App Shortcuts, peop
can perform your app’s actions from Spotlight. Additionally, you can donate your AppEntity
objects to Spotlight, allowing people to find your content and launch your app to view more
information. For example, people might search nearby landmarks in Spotlight, find a travel app’s
content, and tap it to launch the app for detailed information.
When an app entity appears in Spotlight, people can tap it to open your app to the scene that
shows detailed information matching the entity. For example, the Adopting App Intents to support
system experiences sample app makes landmarks available to Spotlight. When someone taps a
landmark in Spotlight, the app opens to display detailed information about that landmark.
For each entity type that you want to make available to Spotlight, create an app intent that
conforms to OpenIntent and takes the entity as a parameter, as in the following example:
Overview
Create an intent that displays your entity in your app
App Intents / Making app entities available in Spotlight
Article
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its
semantic index.


## Page 2

To donate your app entities to the semantic index of Spotlight, they need to conform to the
IndexedEntity protocol. For example, the sample app for Adopting App Intents to support
system experiences extends its LandmarkEntity to add the protocol conformance.
By stating that your entity conforms to IndexedEntity, you can then donate it to Spotlight. By
default, the title, subtitle, and image of the entity’s DisplayRepresentation become indexed
attributes in Spotlight, and Spotlight shows your entity if a search matches one of those attributes
However, your entity likely contains additional information that you want to be searchable and
findable in Spotlight. To declare additional attributes that are searchable in Spotlight, implement a
custom attribute set for your entity:
Use the @Property or @ComputedProperty Swift property wrappers to add your entity’s
variables to the Spotlight index.
In iOS 18, provide an attributeSet for your indexed entities that contains attributes for
Spotlight indexing.
If you already use Core Spotlight, associate your app entities with a matching CSSearchable
Item.
For more information about each option, refer to the applicable section below.
The system can automatically extract the keys for Spotlight indexing at compile time and store
them in the App Intents metadata that Xcode generates as part of your app’s bundle. As a result,
Spotlight indexing is faster and can find your app entities without launching your app, and without
you having to explicitly donate the entities to Spotlight. You also don’t need to manually update o
remove entities from the Spotlight index when your app’s data changes.
To add your indexed entity’s variables to the Spotlight index, use the @Property or @Computed
Property Swift macro as follows:
Map the indexed entity’s variable to an indexing key that CSSearchableItemAttributeSet
defines, and use @ComputedProperty(indexingKey: or @Property(indexingKey:).
Make your app entity indexable
Mark your entity’s variables as indexable properties


## Page 3

If an indexed entity’s variable doesn’t fit any of the indexing keys that CSSearchableItem
AttributeSet defines, use @ComputedProperty(customIndexingKey:) or
@Property(customIndexingKey:) to match the variable to a custom Spotlight indexing
key.
Note
If your app entities conform to a schema and domain in App intent domains, donate them to
the system without defining an indexing key mapping. Entities that conform to a schema use a
fixed shape that maps to Spotlight indexing keys. You can’t provide your own mapping for its
variables.
The following example shows how the LandmarkEntity of the Adopting App Intents to support
system experiences sample app uses the different @ComputedProperty Swift macros to the
entity’s variables as searchable attributes to the Spotlight index:
On app launch, donate your app entities to the Spotlight index using CSSearchableIndex and 
indexAppEntities(_:priority:).
The following example shows the implementation of the donation in the AppIntentsTravel
Tracking app:


## Page 4

If your app’s data changes, delete app entities that no longer exist from the Spotlight index using
deleteAppEntities(identifiedBy:ofType:) or deleteAppEntities(ofType:).
In iOS 18, you can’t donate your app entities and their attributes to the Spotlight index using the
@ComputedProperty or @Property Swift macros. Instead, your app entity needs to provide th
attributeSet property. You need to manually donate each entity to the index, and then update
the index when your data changes.
The following example shows how the sample app for Accelerating app interactions with App
Intents creates the CSSearchableItemAttributeSet:
On launch of your app, add your entities to the Spotlight index using CSSearchableIndex and 
indexAppEntities(_:priority:). If your app’s data changes, delete app entities that no
longer exist from the Spotlight index using deleteAppEntities(identifiedBy:ofType:) 
deleteAppEntities(ofType:).
Implement the optional searchable attribute set for your
indexed entity


## Page 5

If your app already supports Spotlight or uses Core Spotlight for its search functionality, follow
these steps to create app entities and associate them with the CSSearchableItem that
represents the entity in the Spotlight index:
1. Create the CSSearchabileItem that represents the entity in the Spotlight index.
2. Set the searchable attributes for CSSearchableItem.
3. Associate the searchable item with the app entity it represents with associateAppEntity(_
priority:). Alternatively, initialize CSSearchabileItem using one of its initializers that
takes an IndexedEntity as a parameter. Make sure to associate the app entity with the
searchable item before adding the item to the Spotlight index.
4. Add all items to the index using indexSearchableItems(_:completionHandler:).
The following code example from Accelerating app interactions with App Intents shows how the
sample app’s TrailDataManager creates searchable items, associates each item with the
matching app entity, and then donates them to the Spotlight index:
Associate existing Core Spotlight indexable items with app
entities


## Page 6

Focus
Adjust your app’s behavior and filter incoming notifications when the current Focus changes
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to start your
app’s workout or dive sessions using the Action button on Apple Watch.
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
See Also
Other system experiences


## Page 7

People use Focus on macOS, iOS, and iPadOS to minimize distractions. For example, someone
might use a Work Focus to hide notifications from personal email or message accounts. When
someone engages a Focus, the system executes your app’s custom SetFocusFilterIntent.
Define a version of this intent to update your app’s configuration and filter incoming notifications.
Related sessions from WWDC22
Session 10121: Meet Focus filters.
Overview
Topics
App Intents / Focus
API Collection
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focu
changes.


## Page 8

protocol SetFocusFilterIntent
An interface for providing an app intent that you use to adapt your app’s behavior when Focu
changes.
Defining your app’s Focus filter
Customize your app’s behavior to reflect the device’s current Focus.
struct FocusFilterAppContext
A type that contains app-specific contextual information for a particular Focus, such as the
notification filter criteria to apply.
struct FocusFilterSuggestionContext
A type you use to suggest app configurations for a given Focus.
enum SetFocusFilterIntentError
Errors that can occur when you try to retrieve the current Focus configuration settings.
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to start your
app’s workout or dive sessions using the Action button on Apple Watch.
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
Developing a WidgetKit strategy
Focus filters
Errors
See Also
Other system experiences


## Page 9

Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.


## Page 10

On supported iPhone models, people can choose a single App Shortcut to perform an app’s actio
when they press the Action button by selecting an App Shortcut in Settings > Action button. To
give users quick access to your app’s functionality, create App Shortcuts for your high-value app
intents using the init(intent:phrases:shortTitle:systemImageName:) or
init(intent:phrases:shortTitle:systemImageName:parameterPresentation:)
initializer. For additional information, see App Shortcuts.
On supported Apple Watch models, people can choose to start workout or dive session using the
Action button in Settings > Action Button. To add your app to the list of available workout or dive
apps, implement an App Intent that adopts the StartWorkoutIntent or StartDiveIntent
protocol. For more information, see Responding to the Action button on Apple Watch Ultra.
For design guidance, see Human Interface Guidelines > App Shortcuts and Human Interface
Guidelines > Action button.
Responding to the Action button on Apple Watch Ultra
Use App Intents to register actions for your app.
protocol StartWorkoutIntent
An App Intent for starting a workout.
Overview
Topics
Responding to the Action button
App Intents / Action button on iPhone and Apple Watch
API Collection
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to
start your app’s workout or dive sessions using the Action button on Apple Watch


## Page 11

protocol PauseWorkoutIntent
An App Intent that lets someone pause your app’s current workout session.
protocol ResumeWorkoutIntent
An App Intent that lets someone resume your app’s paused workout session.
protocol StartDiveIntent
An App Intent that lets people start a dive session when they press the Action button on App
Watch Ultra.
struct ConfirmationActionName
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focus changes
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
See Also
Other system experiences


## Page 12

By adopting the App Intents framework and offering App Shortcuts, you let people instantly acces
app functionality and integrate it with system experiences like Spotlight or App Shortcuts. For
example, a person might place an App Shortcut you provide on the Action button. In Japan, peop
might place an action on the side button of iPhone that instantly launches your voice-based
conversational app. People expect the voice-based conversational functionality to be instantly
available when they launch your app with the side button, so make sure to let them immediately u
it by starting an audio session – for example, with AVFoundation.
Important
Functionality provided by the activate schema API in App Intents is only available on iPhone
in Japan and requires the Side Button Access entitlement. During development, install
your provisioning profile on your iPhone test device to test the functionality. For a production
device, the country or region of your Apple Account must be set to Japan, and you must
physically be located in Japan.
To allow people to press and hold the side button to launch your voice-based conversational app 
its conversation experience:
1. Add the com.apple.developer.side-button-access.allow entitlement to the
.entitlements file in your app’s Xcode project. For details on adding this entitlement, see
Side Button Access.
Overview
App Intents / Launching your voice-based conversational app from the side button of iPhone
Article
Launching your voice-based
conversational app from the side button of
iPhone
Let people in Japan configure the side button of iPhone to launch your voice-
based conversational app.


## Page 13

2. Create an app intent that conforms to the activate app intent schema.
3. In the app intent’s perform() implementation, navigate to the scene that provides voice-base
conversational functionality and start an audio session.
The following example shows how an app that provides voice-based conversational functionality
might implement an app intent that people in Japan can place on the side button of iPhone:
If you’re new to the AppIntents framework, refer to Creating your first app intent and Making
actions and content discoverable and widely available for additional information.
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focus changes
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to start your
app’s workout or dive sessions using the Action button on Apple Watch.
See Also
Other system experiences


## Page 14

Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.


## Page 15

Use WidgetKit to build widgets, controls, watch complications, and Live Activities. When you offe
these system experiences, your app becomes part of the widget ecosystem across platforms and
devices, and expands its reach by taking up limited but effective, eye-catching space. System
experiences that use WidgetKit as a foundation rely on a set of related frameworks and share
design and functional similarities, making them great candidates for code and design component
reuse.
To avoid costly changes in your app’s development process, plan your WidgetKit adoption before
you create designs and write code. As you make your plans, take into account:
Feature availability for each platform
Frameworks to use in addition to WidgetKit
Required appearances and available sizes for widgets, watch complications, and Live Activities
Technology that powers content updates
Animation
Interactivity with your app through deep links, buttons, and toggles
Configuration options for widgets and watch complications
Visibility in Smart Stacks
Functional constraints
Then, approach WidgetKit adoption iteratively. For example, start with a nonconfigurable Widget
Family.systemSmall widget as described in Creating a widget extension because it gives you
content broad exposure in the WidgetKit ecosystem on iPhone, iPad, Mac, and Apple Vision Pro.
Overview
WidgetKit / Developing a WidgetKit strategy
Article
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to
implement widgets, controls, watch complications, and Live Activities.


## Page 16

Then, add support for configuration, additional widget sizes, and — depending on your app’s
features — Live Activities or a watchOS app with watch complications.
Widgets come in different sizes, from circular accessory widgets on the Lock Screen and
complications on Apple Watch to extra-large widgets on Apple Vision Pro. You can choose the
sizes and complications you want to support, but consider supporting as many sizes and
complications as possible.
Live Activities are available on iPhone and iPad and appear on the Lock Screen and in the Dynami
Island on supported devices. Additionally, Live Activities appear on a paired Mac or Apple Watch,
and in CarPlay. When you add support for Live Activities, you need to create minimal, compact, an
extended presentations that make sure your Live Activities appear correctly for each platform.
In iOS, iPadOS, and macOS, your app can offer controls people place in Control Center. On Mac,
people can also place controls on the menu bar as menu bar items. On Apple Watch, controls from
your watchOS app or a paired iPhone appear in Control Center and the Smart Stack, and people
can place them on the Action button of Apple Watch Ultra.
This table shows the functionality available for each platform:
Widget size or
technology
iPhone
iPad
Apple Watch
Mac
Apple
Vision
Pro
Small system
widgets
Home Screen,
Today View,
and StandBy
Home Screen,
Today View,
and Lock
Screen
No
Yes
Yes
Medium system
widgets
Home Screen
and Today
View
Home Screen
and Today
View
No
Yes
Yes
Large system
widgets
Home Screen
and Today
View
Home Screen
and Today
View
No
Yes
Yes
Extra large
system widgets
No
Home Screen
and Today
View
No
Yes
Yes
Extra large
system widgets
No
No
No
No
Yes
Review system experiences for each platform


## Page 17

Widget size or
technology
iPhone
iPad
Apple Watch
Mac
Apple
Vision
Pro
(portrait)
Circular
accessory
widgets
Lock Screen
Lock Screen
Watch
complications and
Smart Stack
No
No
Corner
accessory
widgets
No
No
Watch
complications
No
No
Rectangular
accessory
widgets
Lock Screen
Lock Screen
Watch
complications and
Smart Stack
No
No
Inline accessory
widgets
Lock Screen
Lock Screen
Watch
complications
No
No
Live Activities
Yes
Yes
From a paired
iPhone
From a
paired
iPhone
No
Controls
Yes
Yes
Yes
Yes
No
Widgets, watch complications, controls, and Live Activities use a widget extension you add to you
Xcode project. The role of WidgetKit is to provide the infrastructure and configuration for the
features it enables. Based on features and platforms you support, use WidgetKit in combination
with other frameworks as follows:
To create the user interface for each feature, use SwiftUI.
To add interactivity to widgets and Live Activities, use SwiftUI and the App Intents framework.
To offer watch complications and watchOS widgets, create a watchOS app.
To offer configurable widgets and watch complications, use App Intents.
To provide the contextual clues that the system uses for Smart Stacks and to offer Widget
Suggestions, use App Intents and RelevanceKit.
To start, update, and end Live Activities, use ActivityKit.
Leverage additional frameworks


## Page 18

Depending on the context, a widget or Live Activity changes its appearance to best fit its context.
For example, a WidgetFamily.systemSmall widget appears as follows:
On the Home Screen of iPhone and iPad, it uses it uses the accented rendering mode for ligh
and dark appearances, and fullColor on devices that run iOS and iPad 18 or older.
On the Lock Screen of iPad and iPhone, it uses the vibrant rendering mode that provides a
vibrant, blurred appearance. On the Lock Screen of iPhone in StandBy and StandBy in Night
Mode, it renders scaled up in size using the vibrant rendering mode.
In CarPlay, it renders scaled-up in size using the fullColor rendering mode with the
background removed.
On Mac, it uses the accented rendering mode. On older versions of macOS, it uses the full
Color or vibrant modes.
Similarly, the WidgetFamily.accessoryRectangular widget appears as follows:
On the Lock Screen of iPhone and iPad, it takes on the vibrant appearance.
On Apple Watch, it appears as a watch complication without a background and the accented
appearance and in a fullColor appearance in the Smart Stack.
With each feature you add to your app, make sure your widget, watch complication, or Live Activit
supports all applicable contexts and appearances well. For more information, refer to Preparing
widgets for additional platforms, contexts, and appearances. For design guidance, refer to Human
Interface Guidelines > Widgets.
Widgets and Live Activities can use animations to draw a person’s attention to data updates,
inclusing custom animations. For more information, refer to Animating data updates in widgets an
Live Activities.
Widgets and watch complications use a different mechanism than your app to update their conte
They use a timeline of data updates that you create in your app and hand to WidgetKit. You
maintain this timeline as your app receives new data, but, to optimize battery life for a device, eac
app has a budget to update its widgets or complications. Additionally, the system batches and
schedules updates to preserve power. For more information on how timelines work and how you
can keep your widgets and watch complications up to date, refer to Keeping a widget up to date
and Making network requests in a widget extension. Additionally, widgets can update their data
with the Apple Push Notification service (APNs) and WidgetKit push notifications.
Support different appearances
Animate content updates
Provide up-to-date information


## Page 19

Live Activities don’t use timelines to update their content. Instead, they use ActivityKit and
ActivityKit push notifications you send with APNs. For more information, refer to ActivityKit.
Controls also don’t use timelines to update their content. Instead, they update their content when
someone uses them, the app reloads them, or the system receives a remote push notification from
APNs. For more information, refer to Updating controls locally and remotely.
By default, people tap a widget, watch complication, or Live Activity to launch its corresponding
app. To make the experience more intuitive and require fewer interactions, you can use deep linki
to launch the scene of your app that matches the widget’s visible content. Widgets that offer
enough space, such as WidgetFamily.systemSmall or larger — and Live Activities in the
extended or the Lock Screen appearance — add SwiftUI’s Link to your views and allow people to
open different screens in your app.
Note
In iOS 16 and macOS 13 or earlier versions, only large and extra-large widgets can use Link.
Widgets offer direct interaction with your app using the App Intents framework and SwiftUI. Both
Button and Toggle offer dedicated initializers for this purpose. For more information, refer to
Adding interactivity to widgets and Live Activities.
Make it possible for people to select the information they want to view in the widget or a watch
complication by offering configurable widgets and complications that provide customizable
properties. For example, people might choose to stay informed about a specific stock in a stock
market widget, or enter a tracking number for a package delivery widget. Configurable widgets an
complications use the App Intents framework and custom intents you define — the same
mechanism you use to support system-level services like Siri and the Shortcuts app. For
information about creating configurable widgets and complications, refer to Making a configurabl
widget.
On iPhone and iPad, people create stacks of widgets and swipe through them manually.
Additionally, people use Smart Stacks with Smart Rotate to view the most relevant widgets and se
widget suggestions. To show relevant widgets at the top of Smart Stacks, iOS and iPadOS rely on
Add specific app functionality to your widgets and Live
Activities
Offer configurable widgets and watch complications
Increase visibility in Smart Stacks


## Page 20

behavioral clues that apps provide during use. On Apple Watch, people can place and pin widgets
in the Smart Stack, but they rely more heavily on the system to automatically display contextually
relevant widgets. To determine the most relevant widgets, watchOS queries your widget extensio
for contextual clues.
For more information, refer to Increasing the visibility of widgets in Smart Stacks.
The Lock Screen and watch faces are always visible, and people can configure widgets and
complications to hide sensitive information when the device is locked or supports Always On.
Review data that appears on your widget, Live Activity, or complication, and make sure you suppo
redaction of sensitive data. For additional information, refer to Creating a widget extension.
To add widgets, watch complications, and Live Activities, you create a widget extension and add i
to your app, and the extension target and your app are part of the same app group. As a result, yo
can store files and data in a shared container that’s accessible to the app and the widget extensio
For example, your app can download data and store it in a database in the shared container, and
then a widget can access the database.
For additional information about app groups and accessing a shared container, refer to Configurin
app groups.
Widgets, watch complications, and Live Activities are always visible. To preserve battery life and
user privacy, they follow certain constraints. For example, Live Activities can’t access a person’s
location. The following table shows availability features that impact battery life or user privacy for
each feature:
Functionality
Widgets
Watch complications
Live Activities
Network access
Yes
Yes
No
Location access
Yes
Yes
No
For additional information, refer to Accessing location information in widgets.
Consider user privacy
Store shared data in a group container
Respect functional constraints
See Also


## Page 21

WidgetKit updates
Learn about important changes in WidgetKit.
Creating a widget extension
Display your app’s content in a convenient, informative widget on various devices.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
protocol WidgetBundle
A container used to expose multiple widgets from a single widget extension.
Essentials


