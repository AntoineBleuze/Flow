# Essentials.pdf

## Page 1

Browse notable changes in App Intents.
Create app intents that conform to SnippetIntent to display an interactive snippet.
Make app entities available in Spotlight that conform to IndexedEntity and use the
@ComputedProperty(indexingKey:) or @Property(indexingKey:) Swift macros for
attributes you want to add to the Spotlight index.
Integrate your app with visual intelligence by providing app entities to the system using an
IntentValueQuery.
Create an AppEntity that conforms to the Transferable protocol and associate the app
entity with a NSUserActivity using the activity’s appEntityIdentifier property to mak
onscreen content available to Siri without adopting an assistant schema.
Make onscreen content available to Siri and Apple Intelligence by describing it as an AppEntit
and adopting an assistant schema. Additionally, adopt the Transferable protocol, and
associate the app entity with a NSUserActivity using the activity’s appEntityIdentifie
property.
Overview
June 2025
November 2024
Siri and Apple Intelligence
Updates / App Intents updates
Article
App Intents updates
Learn about important changes in App Intents.


## Page 2

Integrate your app with Siri and Apple Intelligence using App intent domains.
Use ControlConfigurationIntent and WidgetKit to allow users to put controls on the Lo
Screen or in Control Center.
Create a locked camera capture extension for your app and implement a CameraCapture
Intent to allow people to capture photos and videos from controls or the Action button.
Create app intents that capture audio by implementing AudioRecordingIntent.
Allow people to find app entities in Spotlight by adopting the IndexedEntity protocol.
Make it possible to share and transfer data you describe as App entities by conforming to
Transferable.
Receive content other apps make available with app intents by using IntentFile for your app
intent parameters.
Describe the file that stores your app intent data using FileEntity.
Provide additional information about errors with AppIntentError.PermissionRequired,
AppIntentError.Unrecoverable, and AppIntentError.UserActionRequired.
Pass a condition to requestConfirmation(conditions:actionName:dialog:) to onl
require user confirmation if a person’s context meets the provided condition.
Use URLRepresentableIntent, URLRepresentableEntity, and URLRepresentable
Enum to represent your app intents, app entities, and app enums as universal links that you use
to provide deep links to your app’s content.
Define a set of types for an intent parameter using the UnionValue() macro to create flexible
app intents because a parameter can be of one of several pre-defined union types.
Create entities that have just one singular instance with UniqueAppEntity and the
corresponding UniqueAppEntityQuery. For example, to provide an app intent for app
settings that appear in your app or in System Settings, create a singleton entity that
encapsulates all settings as properties. Use it in the app intent that offers actions to change yo
app’s settings.
June 2024
System integration
Content sharing
General


## Page 3

Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
See Also
Technology updates


## Page 4

Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.
Background Tasks updates
Learn about important changes in Background Tasks.


## Page 5

The App Intents framework offers functionality to express your app’s actions and data in a way th
enables deep integration with system capabilities Apple Intelligence provides and system
experiences like Spotlight. Use App Intents to enable people to view your app’s content and to us
its actions when and where they need them — whether they’re using your app or are elsewhere in
the system.
The App Intents API is a fundamental framework that facilitates deep integration with system
experiences across platforms and devices. You use the framework to express data and actions
once to build a reusable foundation for many experiences and features. For example, use App
Intents to integrate your app with Siri and Apple Intelligence, then reuse the code to create contro
and interactive widgets in combination with WidgetKit.
Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in
development and will be available with a future software update.
When you use the App Intents framework to express your app’s actions and data, you integrate
your app with system experiences that offer broad visibility for your app and content and make its
functionality available outside of the app itself; for example:
People will use Siri to perform app actions.
Overview
Review experiences that App Intents enables directly
App Intents / Making actions and content discoverable and widely available
Article
Making actions and content discoverable
and widely available
Adopt App Intents to make your app discoverable with Spotlight, controls, widget
and the Action button.


## Page 6

People find App Shortcuts you create in the Shortcuts app and initiate them throughout the
system, across platforms and devices with Siri, Spotlight, the Action button, Apple Pencil Pro,
and more.
Using the Shortcuts app, people create custom shortcuts with your app’s functionality and
entirely new workflows across apps.
People reduce distractions with Focus, and you use the App Intents framework to respond to
Focus changes.
On supported devices, the App Intents framework will provide integration with Apple Intelligence,
personal intelligence system that deeply integrates powerful generative models into the core of
iPhone, iPad, and Mac. Siri will draw on the capabilities of Apple Intelligence to deliver assistance
that’s natural, contextually relevant, and personal for everyone, including in the apps they use eve
day. The App Intents framework will enable you to express your app’s capabilities and content,
giving the system access to this context and integrating your app with Siri and Apple Intelligence,
and unlocking new ways for people to interact with it from anywhere on their device. For more
information, refer to Integrating actions with Siri and Apple Intelligence and Making onscreen
content available to Siri and Apple Intelligence.
Across devices, your app’s content and actions appear in additional system experiences you crea
with a combination of the App Intents framework and other frameworks. As a result, adopting App
Intents not only helps you adopt features the framework enables directly, it allows you to easily
support additional system experiences that increase your app’s reach and allow people to
personalize how they use your app. Use the App Intents framework to describe actions and conte
together with:
WidgetKit to offer interactive and configurable widgets, watch complications, and controls
ActivityKit to offer interactive Live Activities
Core Spotlight to enable people to find your content using semantic search in Spotlight
If you’re new to the App Intents framework, first evaluate your app’s functionality and content. Th
framework is a fundamental building block for apps, and enables a broad range of user
experiences, so it’s important to design a new app with App Intents functionality in mind. Similarly
consider a measured, thoughtful approach when adopting App Intents in your existing app.
To get started:
1. Understand the role of the App Intents framework and the experiences it enables.
Understand experiences that use App Intents API
Plan App Intents framework adoption


## Page 7

2. Review key framework concepts and create a first implementation that launches your app with
an AppIntent and add an App Shortcut. For more information, see Creating your first app
intent and App Shortcuts.
3. Express additional actions and content using the App Intents framework.
4. Integrate actions and content with Siri and Apple Intelligence. For more information, see App
intent domains and Integrating actions with Siri and Apple Intelligence.
5. Depending on your app’s functionality, add support for additional system experiences and
interactions that fit your app’s functionality. For example, respond to Focus changes as
described in Focus or add support for the Action button and squeeze gestures on Apple Pencil
Pro, as described in Responding to the Action button on Apple Watch Ultra.
If you’re currently using the App Intents framework in your app, you might limit app intents to
selected actions and content. The App Intents framework will provide integration with Siri and
Apple Intelligence for every action of your app and its content. Review your app’s actions and
content, and consider expressing actions and content with App Intents.
People use app intents to automate workflows with custom shortcuts and App Shortcuts. As a
result, removing AppIntent code or an App Shortcut from your app can break people’s workflow
and confuse or frustrate them because previously available functionality might stop working. Kee
this in mind when you adopt the App Intents framework and consider a deprecation strategy for
your AppIntent code. When you plan to remove an AppIntent, give people notice about your
intention to remove the app intent. Publish a release where you change an existing AppIntent to
DeprecatedAppIntent and offer people a suggested replacement. After giving people enough
time to update their custom shortcuts and move to new App Shortcuts, remove the Deprecated
AppIntent from your app.
For new functionality, use the App Intents framework to integrate your app with system experienc
like widgets, controls, and Live Activities. Siri and Apple Intelligence automatically will leverage
SiriKit intents. For existing functionality keep existing SiriKit implementations and take a measured
approach to replacing SiriKit code with App Intents. If you remove code that uses SiriKit, give
people advance notice about changes to avoid breaking their existing custom shortcuts and make
sure to provide the same or comparable functionality that uses App Intents.
Expand existing App Intents usage
Understand the impact of removing app intents and
shortcuts
Know when to migrate to the App Intents framework


## Page 8

For more information about migrating your SiriKit code to App Intents, see Soup Chef with App
Intents: Migrating custom intents.
App Intents updates
Learn about important changes in App Intents.
Creating your first app intent
Create your first app intent that makes your app available in system experiences like Spotligh
or the Shortcuts app.
Adopting App Intents to support system experiences
Create app intents and entities to incorporate system experiences such as Spotlight, visual
intelligence, and Shortcuts.
Accelerating app interactions with App Intents
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
See Also
Essentials


## Page 9

To let people leverage your app’s features outside of the app itself, system experiences like
Spotlight and the Shortcuts app require your help to understand your app’s actions and content s
the system can expose that functionality. Use App Intents to express your app’s capabilities and
make your app’s actions available to the system. App intents are self-contained types that act as 
bridge between your code and system experiences and services. Each app intent encapsulates a
single action that’s specific to your app. It provides the system with any action that makes sense
for your app’s audience, such as showing information about a hiking trail from a hiking app,
exporting a person’s transaction history from a budgeting app, or converting between two specifi
units of measurement with a converter app.
Every app intent provides descriptive information about itself that experiences and services like S
can display or announce. When you build an app that contains app intents, the compiler examines
your source and generates data about those intents that Xcode stores in the app bundle. After
someone installs your app, the system uses that data to discover the intents and makes them
available to the system.
Before you get started creating your first app intent, read Making actions and content discoverab
and widely available to review App Intents framework features and functionality. Then, identify an
action and create your first app intent, and offer an App Shortcut as described below. App
Shortcuts make your app intent even more useful. For example, App Shortcuts don’t require
configuration, and people can place them on the Action button. Additionally, App Shortcuts appea
in Spotlight even when a person hasn’t launched your app.
Think about actions and tasks people perform in your app, an action’s input and output data, and
how the system could surface actions in its services and experiences. In general, implement your
Overview
Identify an action
App Intents / Creating your first app intent
Article
Creating your first app intent
Create your first app intent that makes your app available in system experiences
like Spotlight or the Shortcuts app.


## Page 10

AppIntent to have a narrow focus and do one thing well. People can invoke it individually, or
create custom shortcuts by combining it with app intents from other apps in the Shortcuts app.
For your first app intent, choose an action that people are likely to use frequently. Then, add an A
Shortcut that includes the app intent.
Tip
To get familiar with the App Intents framework, consider creating your first app intent for
functionality that doesn’t use a specialized app intent protocol; for example, an app intent that
opens your app. When you’ve successfully created your first app intent, make changes to
adopt a specialized app intent or add more app intents for more complex app functionality.
For many app intents, the AppIntent protocol is the preferred protocol to adopt. However,
depending on your app’s specific behaviors, you might prefer your code to conform to one of the
other intent protocols; for example:
Create app intents that conform to assistant schemas that make sure your actions and content
work well with the enhanced action capabilities of Siri that Apple Intelligence provides.
If your app plays or records audio and you want to offer that same functionality in an app intent
adopt AudioPlaybackIntent instead. This protocol inherits from AppIntent and indicates
the audio-related behavior to the system so that, where possible, it avoids audio interactions a
other potential interruptions.
The App Intents framework provides a number of other specialized app intent protocols. For more
information about integrating your app intents with Siri and Apple Intelligence, see Integrating
actions with Siri and Apple Intelligence and App intent domains. For more information about other
specialized protocols, see App intents.
To define an action, create a type that adopts the AppIntent protocol, or a related protocol that
provides the specific behavior you need. If possible, start with a simple action that doesn’t require
parameters. Alternatively, if your action requires a parameter, consider initially hard-coding the
parameter to get your first app intent implementation to work. Then make changes to add
parameters to your first app intent as described in Adding parameters to an app intent.
For example, the Accelerating app interactions with App Intents sample code project provides an
app intent that opens the app and displays a person’s favorite hiking trails:
Review when to adopt specialized app intent protocols
Create an app intent that opens your app


## Page 11

In the structure, implement the protocol’s title requirement to provide the localized text that th
Shortcuts app displays in its Action Library and shortcut editor. To include additional context for t
intent, implement the optional description requirement to provide localized text that describes
the app intent’s behavior. The Shortcuts app shows the description in its Action Library.
To provide your intent’s functionality, implement the perform() protocol requirement. The syste
invokes this method after it resolves any required parameters, meaning those parameters are safe
for your code to access from the function’s body.
Your implementation must complete the necessary work and return a result to the system. A resu
may include, among other things, a value that a shortcut can use in subsequent connected action
dialogue to display or announce, and a SwiftUI snippet view.
For example, the Accelerating app interactions with App Intents sample code project returns a
dialog for the GetTrailInfo app intent:
Perform the app intent’s action


## Page 12

If it doesn’t make sense for your intent to return a concrete result, return .result() to tell the
system the intent is complete.
Important
By default, the system launches your app in a limited mode in the background and executes
the intent’s perform() method on an arbitrary queue. To override this behavior and launch
the app in the foreground, set the intent’s openAppWhenRun variable to true. If your intent
updates the app’s user interface, annotate perform() with @MainActor to make sure the
method executes on the main queue.
During development, validate that your intents behave as you expect by testing them in Simulator
or on-device. If you’re adding intents to a macOS app, build and run the app. For other platforms,
select the relevant simulator or connected device and then build and run. After your app launches
follow these steps:
1. Launch the Shortcuts app.
2. Tap or click the New Shortcut (+) button to create a shortcut.
3. Choose Apps in the Action Library’s segmented control.
4. Tap or click your app’s icon.
5. Select the action to test.
Verify the behavior of your intent in Simulator or on-device


## Page 13

6. For app intents with parameters, use the summary to set the parameter values.
7. Tap or click the Run button.
Set a breakpoint at the top of your perform() method to confirm your implementation is workin
The debugger pauses execution immediately after you run the shortcut, enabling you to step
through the code and inspect the intent’s parameters to verify they have the values they require.
People may interact with your app intent through Siri. For a good user experience, consider
communicating the intent’s result with a visual response using a custom UI snippet, and as a dialo
for Siri to communicate the same information. For more information, see Design custom response
Creating an app intent that opens a screen in your app is the first step to becoming familiar with t
App Intents framework and to making your app and its content discoverable. Many actions in you
app receive input and return data. To describe actions that receive and return data, add paramete
to the app intent to tell the system about that data and whether it’s required or optional. By
exposing parameters, you enable people to configure your intents with values unique to their
requirements and enable the App Intents framework to communicate with system experiences to
write those values at runtime. For example, the Accelerating app interactions with App Intents
sample code project enables people to choose which hiking trail information to view when they
invoke an app intent. For more information about using parameters in an app intent, see Adding
parameters to an app intent.
App intents you create appear in the Shortcuts app. People can create custom shortcuts that
initiate your app intent and combine app intents to perform custom workflows. To enable people t
discover and run your app intents without any configuration, bundle your app’s app intents into Ap
Shortcuts to provide workflows of your app’s actions.
By offering App Shortcuts, you make your app’s functionality instantly available for use in
Shortcuts, Spotlight, and Siri from the moment a person installs your app — without any setup in
the Shortcuts app or an Add to Siri button. On devices that support the Action button, people can
invoke your App Shortcut with the Action button for quick access to your app’s functionality.
To offer an App Shortcut for your first app intent:
1. Create the AppShortcut object for your app intent using the init(intent:phrases:
shortTitle:systemImageName:) initializer and provide phrases that people can use to ru
the app intent and the metadata that appears in the Shortcuts app.
Design custom responses
Receive input with parameters and return results
Create an App Shortcut


## Page 14

2. Implement the AppShortcutsProvider protocol that provides the App Shortcuts you offer t
the Shortcuts app.
For more information about creating App Shortcuts, see App Shortcuts and Create App Shortcuts
To learn more about supporting the Action button, refer to Action button on iPhone and Apple
Watch.
Make your app intents discoverable by explicitly donating them to the system. When someone
performs an action in your app, donate an intent that corresponds to that action. The system uses
the information you provide to predict actions someone might take in the future. For example, if
someone requests the weather from your app each morning, the system might proactively offer th
corresponding app intent at the same time each day.
For more information, see Intent discovery.
App Intents updates
Learn about important changes in App Intents.
Making actions and content discoverable and widely available
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the
Action button.
Adopting App Intents to support system experiences
Create app intents and entities to incorporate system experiences such as Spotlight, visual
intelligence, and Shortcuts.
Accelerating app interactions with App Intents
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
Donate app intents to the system
See Also
Essentials


## Page 15

The app in this sample offers actions in the Shortcuts app that people can use to create custom
shortcuts. It includes an App Shortcut to find the closest landmark and find tickets to visit the
landmark, all without opening the app. Additionally, the app makes its data available to system
experiences like Spotlight, Siri and Apple Intelligence, and visual intelligence.
By adopting the App Intents framework, the app provides functionality across the system, enablin
people to:
In Shortcuts, find and run the app’s app intents.
In Shortcuts, create custom shortcuts or view the provided “Find Closest” App Shortcut.
In Shortcuts, place custom shortcuts or the App Shortcut on the Home Screen as a bookmark.
In Spotlight, search for a landmark or the “Find Closest” App Shortcut.
With visual intelligence, circle an object in the visual intelligence camera or onscreen and view
matching results from the app.
With the Action button, trigger a custom shortcut or the App Shortcut.
From Siri suggestions, use custom shortcuts or the App Shortcut.
In the app, view information about a landmark, then ask Siri something like “What’s a summary
the history of this place?” or similar to receive a content summary, and more.
Overview
App Intents / Adopting App Intents to support system experiences
Sample Code
Adopting App Intents to support system
experiences
Create app intents and entities to incorporate system experiences such as
Spotlight, visual intelligence, and Shortcuts.
Download
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
Xcode 26.0+


## Page 16

The app contains many actions and makes them available to the system as app intents, so people
can use them to create custom shortcuts and invoke across system experiences. For example, the
app offers key actions like finding the closest landmark or opening a landmark in the app. This ap
intent opens a landmark in the app:
To use your data as input and output of app intents and make the data available to the system, yo
use app entities. App entities often limit the information a model object you persist to storage to
what the system needs. They also add required information to understand the data or to use it in
system experiences. For example, the LandmarkEntity of the sample app provides required
typeDisplayRepresentation and displayRepresentation properties but doesn’t includ
every property of the Landmark model object:
Describe actions as app intents and entities


## Page 17

For more information about describing actions as app intents and app entities, refer to Making
actions and content discoverable and widely available and Creating your first app intent.
The app’s “Find Closest” App Shortcut performs an app intent that finds the closest nearby
landmark without opening the app, and allows people to find tickets to visit it. Instead of taking
them to the app, the app intent displays interactive snippets that appear as overlays at the top of
the screen. To display the interactive snippet, the app’s ClosestLandmarkIntent returns a
SnippetIntent that presents the interactive snippet in its perform() method:
Offer interactive snippets


## Page 18

For more information about displaying interactive snippets, refer to Displaying static and interacti
snippets.
To allow Siri to access the landmark information that’s visible onscreen in the app, its Landmark
Entity implements the Transferable protocol and provides plain-text, image, and PDF
representations that Siri can understand and forward to other services, including third-party
services:
Make your entity available to Siri and Apple Intelligence


## Page 19

When the landmark becomes visible onscreen, the app uses the user activity annotation API to gi
the system access to the data:


## Page 20

For more information about making onscreen content available to Siri and Apple Intelligence, refe
to Making onscreen content available to Siri and Apple Intelligence.
The app describes its data as app entities, so the system can use it when it performs app intents.
Additionally, the app donates the entities into the semantic search index, making it possible to find
the app entities in Spotlight. The following example shows how the app’s LandmarkEntity
conforms to IndexedEntity and uses Swift macros to add the indexing keys that Spotlight
needs.
In a utility function, the app donates the landmark entities to the Spotlight index:
For more information, refer to Making app entities available in Spotlight.
With visual intelligence, people circle items onscreen or in visual intelligence camera to search for
matching results across apps that support visual intelligence. To support visual intelligence searc
the sample app implements an IntentValueQuery to find matching landmarks:
Add entities to the Spotlight index
Integrate search results with visual intelligence


## Page 21



## Page 22

For more information about integrating your app with visual intelligence, refer to Visual Intelligenc
App Intents updates
Learn about important changes in App Intents.
Making actions and content discoverable and widely available
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the
Action button.
Creating your first app intent
Create your first app intent that makes your app available in system experiences like Spotligh
or the Shortcuts app.
Accelerating app interactions with App Intents
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
See Also
Essentials


## Page 23

The app in this sample code project provides information on trails, allowing people to check on
conditions, search for trails that allow activities like skiing, and record which trails they visit.
Expressing these features as intents allows people to use them through Siri, Spotlight search, and
Shortcuts. Additionally, the project integrates workout tracking on Apple Watch, and shows how t
implement Action button support on Apple Watch Ultra. The intents also appear as actions in the
Shortcuts app. People can combine these actions to build entirely new features in Shortcuts
because the intents provide custom data types that match each other’s inputs.
The sample app includes two key features that people are likely to use frequently: looking up
information on a trail, and recording activity on a trail. To make it easy for people to use these
features without even opening the app, the sample code creates intents for them to use with Siri,
Spotlight search, and Shortcuts. For example, if someone saves their favorite trails in the app and
wants to get the current conditions for those trails, the app implements the OpenFavorites
structure, which conforms to AppIntent. When someone runs this intent, the app opens and
navigates to the Favorites view.
Overview
Identify common actions
App Intents / Accelerating app interactions with App Intents
Sample Code
Accelerating app interactions with App
Intents
Enable people to use your app’s features quickly through Siri, Spotlight, and
Shortcuts.
Download
iOS 18.1+
iPadOS 18.1+
macOS 15.1+
visionOS 2.1+
watchOS 11.0+
Xcode 26.0+


## Page 24

People may ask Siri to show their favorite trails, or they may find this suggested action through a
Spotlight search. To support both of these options, the app implements an AppShortcut using
OpenFavorites. An App Shortcut combines an intent with phrases people may use with Siri to
perform the action, and additional metadata, such as an icon, and then uses this information in a
Spotlight search. People can invoke the App Shortcut with a suggested phrase, or other similiar
words, because the system uses a semantic similarity index to help identify people’s requests —
automatically matching phrases that are similar, but not identical.
To register the App Shortcut with the system, the app calls updateAppShortcutParameters 
its AppShortcutsProvider during the init of the App structure.
To aid the system’s presentation of the App Shortcut, the sample app includes a short title and an
SF Symbols name that represent the App Shortcut. Further, the sample app’s Info.plist file
Create App Shortcuts


## Page 25

declares NSAppIconActionTintColorName with the app’s primary color and two contrasting
colors in an array for the NSAppIconComplementingColorNames key. The system uses these
colors when displaying the App Shortcuts, such as in Spotlight or the Shortcuts app. The specifie
values of the color names for these keys come from the app’s asset catalog.
After registering an App Shortcut with the system, people can begin using the intent through Siri
without any further configuration. To teach people a phrase to use the intent, the app provides a
SiriTipView in the associated view.
The SiriTipView takes a binding to a visibility Boolean so that the app hides the view if an
individual chooses to dismiss it.
Aside from intents for people to quickly view their favorite trails and track their workouts, the
sample app provides extensive search capabilities through intents. The app doesn’t provide App
Shortcuts for intents that people use less commonly. Best practice is to provide App Shortcuts fo
only the most common actions in an app — usually between two and five intents, and not more th
ten.
Even though the app doesn’t provide GetTrailInfo as an App Shortcut, people may still intera
with it through Siri, such as including the intent in a shortcut they create in the Shortcuts app. For
good user experience, this intent provides its result with a visual response using a custom UI
snippet, and as a dialog for Siri to communicate the same information. It does so by conforming th
return type of the intent’s perform function to both ProvidesDialog and ShowsSnippet
View.
The app provides both visual experiences and voice-only experiences because people may be in 
context where they can’t see information in a custom UI (such as when the intent runs on
HomePod), or when displaying the custom UI may be inappropriate (such as when the intent runs
through CarPlay). This implementation provides a custom UI with a shorter supporting dialog to u
when the custom UI is visible, and a different dialog containing additional information if the system
can’t show the snippet. The sample uses a transparent background for the custom UI because th
system displays it over a translucent background material. Avoiding opaque backgrounds provide
the best results.
Design custom responses


## Page 26

This sample app provides custom dialog throughout its intents. SuggestTrails validates the
parameters that people provide and uses the custom dialog to prompt them for additional
information. For example, if the provided location parameter isn’t specific enough, the intent
prompts the individual to choose from a list of locations related to their input. The app does this b
throwing needsDisambiguationError with a value for the dialog parameter.
An app intent can optionally require certain parameters to complete its action. For example, the
GetTrailInfo intent declares a trail parameter by decorating the property with the Intent
Parameter property wrapper.
The system supports parameters using common Foundation types, such as String, and those fo
custom data types in an app. The app makes its trail data available in an app intent through the
TrailEntity type, which is a structure conforming to the AppEntity protocol.
To allow the system to query the app for TrailEntity data, the entity implements the
Identifiable protocol with values that are stable and persistent. TrailEntity declares
defaultQuery, which the system uses to perform queries to receive TrailEntity structures.
An AppEntity makes its properties available to the system by decorating it with the Entity
Property property wrapper.
Add parameters to an intent


## Page 27

The system queries the app for its trail data through TrailEntityQuery, a type conforming to
EntityQuery. For example, if someone saves a specific value as the trail parameter for Get
TrailInfo, the system locates the TrailEntity by using the defaultQuery and requesting
the entity by its ID from the Identifable protocol. All types conforming to EntityQuery need
to implement this method.
The app also provides a list of common trail suggestions by implementing the optional suggeste
Entities function.
Provide the app’s data through queries


## Page 28

There are several subprotocols to EntityQuery, each of which enables different types of
functionality. The sample app implements all of them for demonstration purposes, but a real app
can use only the ones that meet its needs.
The app implements EntityStringQuery to help people configure GetTrailInfo. When
people configure this intent in the Shortcuts app, they first see the list of trails from suggested
Entities. The Shortcuts app provides a search field, enabling people to search for results that
appear in the list of suggested trails. The app provides results for the search term by implementin
entities(matching:).
Apps implementing either the EnumerableEntityQuery or the EntityPropertyQuery
protocol automatically add a Find intent in the Shortcuts app. These intents enable people to build
powerful new features for themselves in Shortcuts, powered by the app’s data — without requiring
the app to implement that feature itself. For example, the sample app focuses its UI on providing
trail information, but people can also use its data to plan activities for a vacation. The app doesn’t
need to build vacation-planning features because it implements these entity query protocols to
provide an interface to the data through a Shortcut.
The sample app groups trails into collections based on geographic region, and implements the
collections as a type called TrailCollection that conforms to AppEntity. The list of
geographic regions is small, and a TrailCollection is a simple structure with the collection
name and a list of trail IDs that require little memory. To make this information available through a
Find intent, the app implements FeaturedCollectionEntityQuery with conformance to
EnumerableEntityQuery. The app uses EnumerableEntityQuery here because the data f
the featured trail collections is a small and fixed set of values, and doesn’t require a large amount
memory. The app implements allEntities to return all of the values, which people can filter by
name in the Shortcuts app.
Enable Find intents


## Page 29

The app also implements EntityPropertyQuery for TrailEntity. This query type is ideal fo
large data sets that may have large numbers of entities, or entities that have higher memory
consumption. Implementing this query adds a Find intent to the Shortcuts app, enabling people to
run predicate searches on entity properties. For example, someone planning a vacation around
seeing waterfalls that are easily accessible can configure the Find intent with criteria for trails
containing fall in the trail name, and a trail distance of less than 1 kilometer. An implementation of
EntityPropertyQuery includes several required functions and properties. TrailEntity
Query+PropertyQuery.swift contains the complete implementation.
Designing great intents for integration with the system means that the intents work as standalone
intents with their parameters, and also work with other intents the app provides, or with other app
that may be installed. People can create shortcuts that use the output of one intent the app
provides and use it as input to another intent the app provides, like the following examples:
SuggestTrails can use the output of the Find intent for trail collections as input.
The Find intent for trails can use the output of SuggestTrails to further refine the results.
The Find intent for trails can also work alone, searching for matching trail properties from all of
the trail data the app provides.
The sample app provides its trail data to Spotlight when the app first runs. The app declares a
Trail structure for this data, containing the app’s internal representation of that data. The app
maps its data from the structure to searchable attributes in a CSSearchableItemAttribute
Set.
Contribute entities to Spotlight


## Page 30

The app also declares a TrailEntity structure to make the trail data available to the rest of the
system as part of its App Intents integration. To integrate TrailEntity with Spotlight, Trail
Entity conforms to IndexedEntity. The app associates the searchable attributes from the
Trail structure with the TrailEntity by calling associateAppEntity(_:priority:)
before contributing the data to the Spotlight index.
The sample app offers an OpenTrail intent so that people can open the app to a specific trail’s
information from a shortcut. Rather than adding code to configure the app’s UI for displaying a
trail’s information just for this intent, the app uses the same URL scheme it uses to implement
universal links. The app declares the URL for a trail’s details through conformance to
URLRepresentableEntity.
Integrate universal links


## Page 31

To leverage the app’s existing code for handling a universal link, the app conforms the OpenTrai
intent to both OpenIntent and URLRepresentableIntent. These conformances allow the ap
to skip implementing a perform() method on OpenTrail. When the intent runs, the system
automatically passes the URL to the app using the standard mechanisms required for handling
universal links.
App Intents updates
Learn about important changes in App Intents.
Making actions and content discoverable and widely available
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the
Action button.
Creating your first app intent
Create your first app intent that makes your app available in system experiences like Spotligh
or the Shortcuts app.
Adopting App Intents to support system experiences
Create app intents and entities to incorporate system experiences such as Spotlight, visual
intelligence, and Shortcuts.
See Also
Essentials


