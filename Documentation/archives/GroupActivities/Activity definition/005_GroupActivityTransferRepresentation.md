# 005_GroupActivityTransferRepresentation.pdf

## Page 1

Presenting SharePlay activities from your app’s UI
init<ActivityType>(exporting: (Item) async throws -> ActivityType)
Creates a type that exports a group activity for the specified item.
Sendable, SendableMetatype, TransferRepresentation
Mentioned in
Topics
Initializers
Relationships
Conforms To
Group Activities / GroupActivityTransferRepresentation
Structure
GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
visionOS 1.0+


## Page 2

Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can perform fro
your app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
protocol GroupActivity
A type that can advertise your app’s activities to other participants.
struct GroupActivityMetadata
Text and image content that describes an activity to potential participants.
enum GroupActivityActivationResult
The result of preparing to start a custom activity.
See Also
Activity definition


