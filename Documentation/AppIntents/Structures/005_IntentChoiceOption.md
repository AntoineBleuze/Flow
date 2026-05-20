# 005_IntentChoiceOption.pdf

## Page 1

Each option includes display text and an optional style that influences its visual presentation. For
example, an option for deleting a file might use a text and style to communicate its destructive
action.
struct Style
Defines the visual style and semantic meaning of an IntentChoiceOption.
init(title: LocalizedStringResource, style: IntentChoiceOption.Style)
Creates a new option for a person to choose to continue an app intent.
Overview
Topics
Structures
Initializers
Instance Properties
App Intents / IntentChoiceOption
Structure
IntentChoiceOption
A structure representing an entry in a list of options for a person to choose from
before an app intent resumes its action.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

let style: IntentChoiceOption.Style
The style applied to the option, affecting its visual appearance in the system UI.
let title: LocalizedStringResource
The localized text displayed for this option.
static var cancel: IntentChoiceOption
A system-provided option that cancel the app intent.
Equatable
Type Properties
Relationships
Conforms To


