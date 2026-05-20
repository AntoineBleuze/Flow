# 000_App Intents updates.pdf

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


