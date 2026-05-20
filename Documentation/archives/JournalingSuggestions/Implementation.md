# Implementation.pdf

## Page 1

Presenting the suggestions picker and processing a selection
Receiving journaling suggestions system notifications
This interface displays several grids of content that layout visual mementos, each representing
unique, personal events that occur in a person’s life. It enables a person to reflect and choose a
particular event as a topic for derivative work. For example, a workout can serve as the beginning
of a new journal entry or illustration.
The first time the picker appears, a modal sheet introduces the concept of journaling suggestions
After a person selects a suggestion in the picker, the system shares only the information associat
with the chosen suggestion with your app.
For more information, see Presenting the suggestions picker and processing a selection.
Mentioned in
Overview
Topics
Creating a suggestions picker
Journaling Suggestions / JournalingSuggestionsPicker
Structure
JournalingSuggestionsPicker
A view that lists different types of recent events in a person’s life.
iOS 17.2+


## Page 2

init(label: () -> Label, onCompletion: (JournalingSuggestion) async ->
Void)
Creates a suggestions picker within the given view.
init(LocalizedStringKey, onCompletion: (JournalingSuggestion) async ->
Void)
Creates a suggestions picker with button text defined by the given localized string key.
init<S>(S, onCompletion: (JournalingSuggestion) async -> Void)
Creates a suggestions picker with button text defined by the given string.
Sendable, SendableMetatype, View
struct JournalingSuggestion
High-level information about a suggestion that a person chooses in the journaling suggestio
picker.
protocol JournalingSuggestionAsset
An interface for the content that the suggestions picker presents.
Relationships
Conforms To
See Also
Implementation


## Page 3

Receiving journaling suggestions system notifications
When a person chooses a particular suggestion in the JournalingSuggestionsPicker, the
system provides your app with more information about the event by passing an instance of this
structure to your picker’s onCompletion handler.
let date: DateInterval?
The range of time in which the suggested event takes place.
let title: String
The title for the suggestion.
Mentioned in
Overview
Topics
Inspecting suggestion details
Journaling Suggestions / JournalingSuggestion
Structure
JournalingSuggestion
High-level information about a suggestion that a person chooses in the journaling
suggestions picker.
iOS 17.2+


## Page 4

let items: [JournalingSuggestion.ItemContent]
The individual items that compose the suggestion’s content.
struct ItemContent
A container for the information about a specific suggestion.
func content<Content>(forType: Content.Type) async -> [Content]
Searches a suggestion’s items for information of the given type.
struct Contact
A suggestion for a connection a person makes with someone else.
struct EventPoster
A suggestion for a poster image of an event.
struct GenericMedia
A suggestion describing now playable media that a person listened to.
struct LivePhoto
A suggestion for a Live Photo from a person’s library.
struct Location
A suggestion that represents a location that a person visits.
struct LocationGroup
A suggestion that contains multiple visited locations that a person chooses in the picker.
struct MotionActivity
A suggestion that describes motion activity, including the number of steps a person takes.
struct Photo
A suggestion for a photo from a person’s library.
struct Podcast
A suggestion that describes a podcast episode a person listened to.
struct Reflection
Accessing suggestion data by type
Interacting with suggestion types


## Page 5

A suggestion for a reflection prompt.
struct StateOfMind
A suggestion that describes a state of mind reflection in the Health app.
struct Song
A suggestion for a song from a person’s music library.
struct Video
A suggestion for a video from a person’s library.
struct Workout
A suggestion that describes a workout that a person completed.
struct WorkoutGroup
A suggestion that contains multiple workouts that a person chooses in the picker.
Equatable, Hashable
struct JournalingSuggestionsPicker
A view that lists different types of recent events in a person’s life.
protocol JournalingSuggestionAsset
An interface for the content that the suggestions picker presents.
Relationships
Conforms To
See Also
Implementation


## Page 6

Presenting the suggestions picker and processing a selection
When a person makes a selection in a JournalingSuggestionsPicker, the system invokes
the picker’s onCompletion closure, and passes in the selected suggestion (Journaling
Suggestion). Each item in the suggestion’s items array conforms to this protocol.
associatedtype JournalingSuggestionContent : JournalingSuggestionAsset 
Self
Represents a generic content type for journaling suggestions.
Required
Mentioned in
Overview
Topics
Associated Types
Journaling Suggestions / JournalingSuggestionAsset
Protocol
JournalingSuggestionAsset
An interface for the content that the suggestions picker presents.
iOS 17.2+


## Page 7

JournalingSuggestion.Contact
JournalingSuggestion.EventPoster
JournalingSuggestion.GenericMedia
JournalingSuggestion.LivePhoto
JournalingSuggestion.Location
JournalingSuggestion.LocationGroup
JournalingSuggestion.MotionActivity
JournalingSuggestion.Photo
JournalingSuggestion.Podcast
JournalingSuggestion.Reflection
JournalingSuggestion.Song
JournalingSuggestion.StateOfMind
JournalingSuggestion.Video
JournalingSuggestion.Workout
JournalingSuggestion.Workout.Details
JournalingSuggestion.WorkoutGroup
struct JournalingSuggestionsPicker
A view that lists different types of recent events in a person’s life.
struct JournalingSuggestion
High-level information about a suggestion that a person chooses in the journaling suggestio
picker.
Relationships
Conforming Types
See Also
Implementation


