# 003_Adopting App Intents to support system experiences.pdf

## Page 1

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


## Page 2

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


## Page 3

For more information about describing actions as app intents and app entities, refer to Making
actions and content discoverable and widely available and Creating your first app intent.
The app’s “Find Closest” App Shortcut performs an app intent that finds the closest nearby
landmark without opening the app, and allows people to find tickets to visit it. Instead of taking
them to the app, the app intent displays interactive snippets that appear as overlays at the top of
the screen. To display the interactive snippet, the app’s ClosestLandmarkIntent returns a
SnippetIntent that presents the interactive snippet in its perform() method:
Offer interactive snippets


## Page 4

For more information about displaying interactive snippets, refer to Displaying static and interacti
snippets.
To allow Siri to access the landmark information that’s visible onscreen in the app, its Landmark
Entity implements the Transferable protocol and provides plain-text, image, and PDF
representations that Siri can understand and forward to other services, including third-party
services:
Make your entity available to Siri and Apple Intelligence


## Page 5

When the landmark becomes visible onscreen, the app uses the user activity annotation API to gi
the system access to the data:


## Page 6

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


## Page 7



## Page 8

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


