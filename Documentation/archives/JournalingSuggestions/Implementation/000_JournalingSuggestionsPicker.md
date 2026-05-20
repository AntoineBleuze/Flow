# 000_JournalingSuggestionsPicker.pdf

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


