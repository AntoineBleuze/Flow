# Actions.pdf

## Page 1

Use app intents to express your app’s capabilities to the system. An app intent includes the code
you need to perform an action, and expresses the data you require from the system. The system
exposes your actions directly from the Shortcuts app and in system experiences like Siri.
To define an action, create a type that adopts the AppIntent protocol, or a related protocol that
provides the specific behavior you need. Annotate any key properties with the @Parameter
property wrapper to let the system know you need the associated information to perform the
action.
For more information about features App Intents enables, see Making actions and content
discoverable and widely available.
protocol AppIntent
An interface for providing an app-specific capability that people invoke from system
experiences like Siri and the Shortcuts app.
protocol AudioPlaybackIntent
An App Intent that plays, pauses, or otherwise modifies audio playback state when it
executes.
Overview
Topics
Actions
App Intents / App intents
API Collection
App intents
Define the custom actions your app exposes to the system, and incorporate
support for existing SiriKit intents.


## Page 2

protocol AudioRecordingIntent
An app intent that starts, stops or otherwise modifies audio recording state.
protocol AudioStartingIntent
An App Intent that plays, pauses, or otherwise modifies audio playback state when it
executes.
Deprecated
protocol CameraCaptureIntent
Designates intent that will launch an activity that uses device’s camera to capture photos or
videos. Marking your intent with this protocol makes it available as a possible action for
Camera quick action.
protocol DeleteIntent
Delete the associated entity(s).
protocol DeprecatedAppIntent
An app intent that marks an action as deprecated and informs people which action to use
instead.
protocol ForegroundContinuableIntent
A protocol you use for app intents which begin their work with the app in the background bu
may request to continue in the foreground.
Deprecated
protocol OpenIntent
Open the associated item.
struct OpenURLIntent
An intent that opens a universal link.
protocol PlayVideoIntent
An intent that looks for videos based on a search term, then plays the content.
protocol ProgressReportingIntent
An intent that reports progress to the system during its execution
protocol PushToTalkTransmissionIntent
An intent that begins or ends an audio transmission with the Push to Talk framework.
protocol URLRepresentableIntent
An app intent with a URL representation.


## Page 3

protocol SetValueIntent
An intent that contains a value which can be set.
protocol ShowInAppSearchResultsIntent
An app intent that takes a person to search results for a specified search term.
protocol SystemIntent
Designates intent types provided by App Intents.
protocol ControlConfigurationIntent
An interface for configuring a Control Center module.
protocol LiveActivityStartingIntent
An intent that starts, pauses, or otherwise modifies a Live Activity.
Deprecated
protocol LiveActivityIntent
An intent that starts, pauses, or otherwise modifies a Live Activity when it runs.
protocol WidgetConfigurationIntent
An interface for configuring a WidgetKit widget.
Integrating actions with Siri and Apple Intelligence
Create app intents, entities, and enumerations that conform to assistant schemas to tap into
the enhanced action capabilities of Siri and Apple Intelligence.
App intent domains
Make your app’s actions and content available to Siri and Apple Intelligence with assistant
schemas.
protocol CustomIntentMigratedAppIntent
An interface for replacing a custom SiriKit intent that allows existing shortcuts and donations
to continue working.
Controls, widgets, and Live Activities
Siri and Apple Intelligence
SiriKit intent migration


## Page 4

class AppDependencyManager
An object that manages the registration and initialization of an app intent’s dependencies.
class AppDependency
A property wrapper that resolves a registered dependency at runtime.
protocol AppIntentsPackage
A type that describes app intent definitions that aren’t part of an app bundle and their
dependencies.
struct IntentDescription
The human-readable description and metadata for an app intent.
struct IntentDialog
The text you want the system to display, or speak, when requesting a value, asking for
disambiguation, or confirming an action.
struct IntentDeprecation
class IntentProjection
Projections for an app intent that returns non-optional values for parameters.
struct IntentSystemContext
Information that the system makes available to an app intent while it performs its action.
protocol IntentResult
A type that contains the result of performing an action, and includes optional information to
deliver back to the initiator.
struct IntentResultContainer
An object that represents the output of a completed intent.
protocol OpensIntent
The result of performing an action that delivers an app intent back to the initiator of the actio
Dependency management
Supplementary content
Results


## Page 5

protocol ProvidesDialog
The result of performing an action that delivers a dialog back to the initiator of the action.
protocol ReturnsValue
The result of performing an action that delivers a value back to the initiator.
protocol ShowsSnippetView
The result of performing an action that delivers a view back to the initiator of the action.
protocol ResultsCollection
A protocol representing a collection of returned items with support for sectioning.
protocol AppIntentsExtension
An interface for managing an extension’s configuration.
Intent discovery
Donate your app’s intents to the system to help it identify trends and predict future behavior
App Shortcuts
Integrate your app’s intents and entities with the Shortcuts app, Siri, Spotlight, and the Actio
button on supported iPhone and Apple Watch models.
Extensions
See Also
Actions


## Page 6

Make your intents more discoverable to people by donating them to the system. When someone
performs an action in your app, donate an intent that corresponds to that action. The system uses
the information you provide to predict actions someone might take in the future. For example, if
someone requests the weather from your app each morning, the system might proactively offer th
corresponding app intent at the same time each day.
Donate intents only when someone uses your app’s interface directly. You don’t need to donate
intents associated with Siri or interactions with the Shortcuts app because the system donates
them automatically. You can also delete donations when someone cancels or reverses a previousl
executed action, or when the action is no longer relevant.
struct IntentDonationManager
A type you use to donate intents to the system, or delete intents when they become irrelevan
struct IntentDonationIdentifier
An opaque type that identifies a specific donation to the system.
struct IntentDonationMatchingPredicate
The match conditions that identify a set of previously donated app intents.
Overview
Topics
Donation management
App Intents / Intent discovery
API Collection
Intent discovery
Donate your app’s intents to the system to help it identify trends and predict futur
behaviors.


## Page 7

protocol PredictableIntent
An interface that allows the system to suggest the app intent to someone in the future using
predictions you provide.
struct IntentPrediction
A prediction for a specific app intent that the system might display to someone when it’s
relevant.
struct RelevantIntent
A type that specifies an intent and its relevance to the user.
class RelevantIntentManager
A type that saves relevant intents.
struct RelevantContext
Contextual clues the system uses to show relevant widgets in the Smart Stack on watchOS.
App intents
Define the custom actions your app exposes to the system, and incorporate support for
existing SiriKit intents.
App Shortcuts
Integrate your app’s intents and entities with the Shortcuts app, Siri, Spotlight, and the Actio
button on supported iPhone and Apple Watch models.
Intent predictions
Intent relevancy
See Also
Actions


## Page 8

Create a preconfigured App Shortcut that enables people to discover and run your app intent
without any configuration. By creating App Shortcuts, you make your app’s functionality instantly
available for use in Shortcuts, Spotlight, and Siri from the moment a person installs your app —
without any setup in the Shortcuts app or an Add to Siri button. On iPhone models that support th
Action button, people can associate your preconfigured App Shortcut on the Action button for
quick access of your app’s functionality.
Note
Apple may extract anonymized App Shortcuts data such as localized phrases, display
representation values, and the title and description of related intents. Machine learning models
use this data when training to help improve the App Shortcuts experience.
Key app functionalities that people use to complete a task quickly and that you expose to the
system with app intents are great candidates for App Shortcuts. For each high-value app intent,
create an App Shortcut that specifies the intended action, the required parameters, the spoken
phrases someone uses to run it, and the short title and the image that appear in the Shortcuts ap
To offer an App Shortcut:
1. Create an app intent for a key app functionality as described in Creating your first app intent.
2. Create the AppShortcut object for your app intent using the init(intent:phrases:
shortTitle:systemImageName:) initializer with phrases people can use to run the app
intent and with the metadata that appears in the Shortcuts app.
3. Implement the AppShortcutsProvider protocol that provides the App Shortcuts you offer t
the Shortcuts app.
Overview
App Intents / App Shortcuts
API Collection
App Shortcuts
Integrate your app’s intents and entities with the Shortcuts app, Siri, Spotlight, and
the Action button on supported iPhone and Apple Watch models.


## Page 9

With these three steps, you make your app’s functionality more discoverable and enable people to
interact with your app in a lightweight way. However, the system displays a default interface for
your App Shortcut. To display a custom view for each shortcut, return a SwiftUI view in your app
intent’s perform() method.
Related sessions from WWDC22
Session 10170: Implement App Shortcuts with App Intents and Session 10169: Design App
Shortcuts.
With App Shortcuts, you can also preconfigure phrases for app intents that use specific
parameters. When you include parameters, people can use one phrase to start an interaction with
an app without Siri having to ask for clarification. For example, a meditation app could offer an ap
intent to start a meditation with the phrase “Start a meditation”. Because the app offers many
different meditations, Siri would require an additional clarification which meditation a person want
to start.
With an App Shortcut, you can supply preconfigured parameters ahead of time that enable a
person to skip this clarification step. For example, the meditation app could provide parameterize
phrases where each phrase represents a common meditation. A person could then start a
meditation with one phrase like “Start a mindfulness meditation.” or “Start a short meditation.”
Although App Shortcuts don’t require a person to do any configuration in the Shortcuts app or by
using the Add to Siri button, you may want to present elements in your app to tell people about an
available App Shortcut. You have two options:
SiriTipView and SiriTipUIView present a view that tells a person that an App Shortcut is
available.
ShortcutsLink enables you to display a link to your App Shortcut.
ShortcutsLink is especially convenient if your app displays a list of its available App Shortcuts
Offer App Shortcuts with preconfigured parameters
Make your App Shortcuts even more discoverable
Topics
App Shortcut management


## Page 10

protocol AppShortcutsProvider
A type alias for the type that provides an app’s preconfigured shortcuts.
struct AppShortcut
A type that defines a preconfigured shortcut for a specific app intent.
struct AppShortcutPhrase
A spoken phrase that causes the system to run the corresponding App Shortcut.
struct NegativeAppShortcutPhrase
An object that represents a negative phrase.
struct NegativeAppShortcutPhrases
This is a set of negative phrases, which will all be added to the app-level negative training se
All the training data specified here, will be used to completely bypass your app
NSAppIconActionTintColorName
The tint color to apply to text and symbols in the App Shortcuts platter.
NSAppIconComplementingColorNames
The names of the colors to use for the background of the App Shortcuts platter.
enum AppShortcutsBuilder
A result builder that allows you to declaratively describe the App Shortcuts that your app
provides.
enum ShortcutTileColor
Describes the colors a shortcut tile in the Shortcuts app.
struct AppShortcutOptionsCollection
Represents a collection of options for parameters of an App Shortcut.
protocol AppShortcutOptionsCollectionProtocol
protocol AppShortcutOptionsCollectionSpecification
enum AppShortcutOptionsCollectionSpecificationBuilder
App Shortcut definition
App Shortcut options


## Page 11

struct AppShortcutParameterPresentation
Describes the presentation of an App Shortcut for the provided parameter.
struct AppShortcutParameterPresentationSummary
The summary of the presentation of an App Shortcut parameter.
struct AppShortcutParameterPresentationSummaryString
struct AppShortcutParameterPresentationTitle
A struct that represents the title of the presentation of an App Shortcut.
Deprecated
struct AppShortcutParameterPresentationTitleString
Deprecated
class ShortcutsUIButton
A button that opens the current app’s page in the Shortcuts app.
struct ShortcutsLink
A button that brings users to the current app’s App Shortcuts page in the Shortcuts app.
struct ShortcutsLinkStyle
The styles to apply to buttons you use to open your app’s page in the Shortcuts app.
class SiriTipUIView
A view that displays the phrase a person uses to invoke an App Shortcut.
struct SiriTipView
A SwiftUI view that displays the phrase someone uses to invoke an App Shortcut.
struct SiriTipViewStyle
App Shortcut parameter presentation
Buttons
Discussion
Tip views
Discussion


## Page 12

The styles to apply to the tip views you use to display spoken phrases.
App intents
Define the custom actions your app exposes to the system, and incorporate support for
existing SiriKit intents.
Intent discovery
Donate your app’s intents to the system to help it identify trends and predict future behavior
See Also
Actions


