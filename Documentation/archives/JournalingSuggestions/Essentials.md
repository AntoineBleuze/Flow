# Essentials.pdf

## Page 1

Browse notable changes in Journaling Suggestions.
Journaling Suggestions supports iPadOS. Suggestions that the system generates on a person’
iPhone sync over iCloud to their iPad.
Register for system Journaling Suggestion notifications, which prompt users to reflect on recen
moments. Refer to the notification schedule a person picks in Settings using Journaling
SuggestionsConfiguration. When a person taps a notification, the system launches
JournalingSuggestionsPicker for your app when you implement Journaling
SuggestionPresentationToken.
Receive suggestions of the JournalingSuggestion.EventPoster type for planned or
attended events in Apple Invites.
Overview
June 2025
iPadOS support
System notifications
Event posters
Location and workouts
Updates / Journaling Suggestions updates
Article
Journaling Suggestions updates
Learn about important changes in Journaling Suggestions.


## Page 2

Distinguish work-related location suggestions using the isWorkLocation property, and
receive information about the location from MapKit with mapKitItemIdentifier.
Refer to the name of a particular workout suggestion with localizedName.
Support for landscape mode in your app.
Capture someone’s run session as well as their mixed running and walking activity sessions wit
MovementType.
Describe media content a person listened to. The system provides an instance of this structure
to your app when a person chooses a media suggestion in the JournalingSuggestions
Picker.
Collect asset content that includes other media playback sessions from other music or podcas
Apps.
Suggest content to people that ask them to describe their state of mind. The system provides a
instance of this structure to your app when a person chooses a state of mind suggestion in the
JournalingSuggestionsPicker.
Use reflection prompts in your app with Reflection.
June 2024
General
Motion activity
Media playback
State of Mind
Reflection
See Also
Technology updates


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
App Intents updates
Learn about important changes in App Intents.
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
Learn about important changes to AVFAudio.
AVFoundation updates


## Page 4

Learn about important changes to AVFoundation.


## Page 5

Present the JournalingSuggestionsPicker to show people recent or important life events a
suggestions, which include information about an event such as images, videos, locations, and so
on. If a person selects a particular suggestion, the system provides you with the event details in th
completion handler.
Start by choosing the text for the button in your app that presents the picker. When a person taps
the text, the system presents the picker in a system process. The picker fills with suggestions tha
draw upon various personal experiences, such as a place someone visited, a person they
connected with, a photo in their library, or a song that they often listened to.
When someone chooses a suggestion, the system makes high-level details about the event
available to your app. Define the suggestion picker’s onCompletion closure to process the
details, and incorporate them into your app’s creative workflow. A journaling app, for example,
might display a visual suggestion in the format of a photo with placeholder text below it as the
beginning of a new journal entry.
Overview
Journaling Suggestions / Presenting the suggestions picker and processing a selection
Article
Presenting the suggestions picker and
processing a selection
Display the journaling suggestions picker and process a suggestion that someone
chooses.


## Page 6

Journaling Suggestions gathers information from the system through built-in apps people use,
such as Photos, Health, Fitness, Apple Podcasts, and Music. Suggestions can also come from thir
party apps that provide data through frameworks such as HealthKit, CallKit, or SiriKit.
Adopting Journaling Suggestions delivers an enhanced privacy experience in your app. When a
person makes a selection in the picker, the system shares only the details of the chosen suggesti
with your app. Thus, your app accesses only the suggestion data that a person explicitly
authorizes.
When your app attempts to display the picker for the first time, a sheet appears that introduces
Journaling Suggestions. If the person taps Turn On Journaling Suggestions, the picker displays,
and includes an information privacy banner. The banner explains that your app only has access to
the suggestions the person chooses to write about or saves to the app. The person can tap the X
to close the banner, or they can tap Learn More, which presents a sheet that goes into more deta
about Private Access.
Maintain user privacy
Privacy banner
Private Access sheet
Consent sheet


## Page 7

Note
The Journaling Suggestions consent sheet displays once per device, so it doesn’t appear if the
person already viewed it, either by launching Journal, or by launching another app that uses
Journaling Suggestions.
Suggestion data requires careful handling. To further preserve user privacy, follow the advice
outlined in the Developer Program License Agreement.
To use Journaling Suggestions in your app, the com.apple.developer.journal.allow
entitlement is required. The suggestions picker fails to present without it. You can can add this
entitlement to your app by enabling the Journaling Suggestions capability in Xcode; see Adding
capabilities to your app.
The JournalingSuggestionsPicker initializers take an argument, title, for a button that
people tap to display the picker.
Add the Journaling Suggestions entitlement
Name the button that opens the suggestions picker


## Page 8

Choose a title that clearly describes the purpose of journaling suggestions in the context of your
app. As an indication that personal moments are about to display, it’s important to set a person’s
expectations about what the picker shows after they tap the text.
To present a suggestions picker, declare a view that displays a button title. When a person taps th
button, the system presents the picker. Upon dismissal, the system invokes the completion handl
you specify.
The picker fills with suggestions that include various types of personal experiences. When a perso
makes a selection, the system provides the chosen suggestion to your app’s onCompletion
handler. Check the suggestion argument’s items property to process the selection. Each
JournalingSuggestion.ItemContent item conforms to JournalingSuggestionAsset
and is one of following types:
Type
Description
Journaling
Suggestion.Photo
An image from a person’s library, including the date captured.
Journaling
Suggestion.Workout
Information about a workout that a person completes, including
calories burnt, distance covered, a route they took, average heart
rate, start and end time, and an icon for the type of workout.
Journaling
Suggestion.Contact
An interaction a person has with someone in their contacts,
including their name and Contact photo.
Declare and present a suggestions picker
Handle the selected suggestion data


## Page 9

Type
Description
Journaling
Suggestion
.Location
A place that a person visited, including its name, surrounding city,
and geographic coordinates, if available.
Journaling
Suggestion.Song
The name of a song that a person plays, including the artist, album,
and album artwork.
Journaling
Suggestion.Podcast
Information about a podcast that a person plays, including the show
artist, episode, and associated artwork.
Journaling
Suggestion.Video
A video from a person’s library, including the date captured.
Journaling
Suggestion.Live
Photo
An image and short video that represents a live photo from a
person’s library, including the date captured.
Journaling
Suggestion.Motion
Activity
The number of steps a person takes in a motion event on iPhone,
including an icon for the activity.
Journaling
Suggestion.Generic
Media
The media content a person listens to, including the information
describing the media.
Journaling
Suggestion
.Reflection
A reflection prompt that a person chooses.
Journaling
Suggestion.StateOf
Mind
The state of mind reflection in the Health app that describes a
persons emotions and moods.
Journaling
Suggestion.Event
Poster
Details about a planned or attented event in Apple Invites.
The following example demonstrates parsing a photo suggestion:


## Page 10

The code displays the suggestion title, followed by a list of images that the person selected in the
picker.
Note
A person can control the types of suggestions available in the picker by tapping Customize in
the consent sheet, or by adjusting Privacy & Security settings for Journaling Suggestions in
the Settings app.
When your app parses a selected suggestion’s details, it organizes that information to serve as a
base for creative expression. A journaling app, for example, might list the selected images in a
journal entry.
My App 1
See Also
Essentials


## Page 11

Journaling Suggestions updates
Learn about important changes in Journaling Suggestions.
com.apple.developer.journal.allow
The entitlement that enables an app to present the journaling suggestions picker.


## Page 12

Type
Array of strings
suggestions
The Journaling Suggestions framework can’t present the JournalingSuggestionsPicker fo
apps without this entitlement in their code signature. Add this entitlement to your app by enabling
the Journaling Suggestions capability in Xcode.
Details
Possible Values
Discussion
Bundle Resources / Entitlements / com.apple.developer.journal.allow
Property List Key
com.apple.developer.journal.allow
An entitlement that enables an app to present the journaling suggestions picker.
iOS 17.2+
iPadOS 17.2+


## Page 13

For more information about presenting journaling suggestions in your app, see Presenting the
suggestions picker and processing a selection.


