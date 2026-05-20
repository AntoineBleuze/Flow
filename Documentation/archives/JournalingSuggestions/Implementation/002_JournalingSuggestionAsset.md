# 002_JournalingSuggestionAsset.pdf

## Page 1

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


## Page 2

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


