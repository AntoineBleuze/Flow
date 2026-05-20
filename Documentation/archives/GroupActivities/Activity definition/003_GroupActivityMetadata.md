# 003_GroupActivityMetadata.pdf

## Page 1

Defining your app’s SharePlay activities
Adding spatial Persona support to an activity
Use a GroupActivityMetadata structure to store user-facing information about a specific
activity your app suggests. Metadata information includes the title of the activity, an image that
corresponds to the activity, and a fallback URL for users who don’t have your app. For example, a
movie-watching activity might include the poster of the specific movie a participant suggests. Th
system uses the provided metadata to generate invitations for other participants.
Create a GroupActivityMetadata structure in the metadata property of your custom Group
Activity subclass. Populate the new structure with the relevant data for your activity.
init()
Mentioned in
Overview
Topics
Creating group activity metadata
Group Activities / GroupActivityMetadata
Structure
GroupActivityMetadata
Text and image content that describes an activity to potential participants.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

Creates a new instance for storing descriptive information about an activity.
var title: String?
The localized string to display as the title of your activity.
var subtitle: String?
The localized string that provides additional information about the activity.
var previewImage: CGImage?
The image to display for the current activity.
var fallbackURL: URL?
A URL that offers participants a way to identify or join the activity from a web browser.
var type: GroupActivityMetadata.ActivityType
The type of shared experience.
struct ActivityType
Constants that indicate the group activity’s type to the system.
var sceneAssociationBehavior: SceneAssociationBehavior
Criteria the system uses to direct an activity to a specific scene of your app.
struct SceneAssociationBehavior
A type that tells the system which scene to associate with an incoming group activity.
var supportsContinuationOnTV: Bool
A Boolean value that indicates whether your app supports activity continuation on an Apple
TV.
var preferredBroadcastOptions: BroadcastOptions
Preferences for how to present audio and video on the main communication channel.
Presenting the activity
Indicating the activity’s type
Assigning an app-specific scene
Specifying media-related behavior


## Page 3

struct BroadcastOptions
Options for how to broadcast media on the shared communications channel.
struct LifetimePolicy
An activity lifetime policy used by a Group Activity.
var experience: GroupActivityMetadata.Experience?
Deprecated
var lifetimePolicy: GroupActivityMetadata.LifetimePolicy
Determines how an activity can be ended.
var localizedSubtitle: String?
Deprecated
var localizedTitle: String?
Deprecated
enum Experience
Deprecated
Copyable
Decodable
Encodable
Equatable
Sendable
SendableMetatype
Structures
Instance Properties
Enumerations
Relationships
Conforms To
See Also


## Page 4

Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can perform fro
your app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
protocol GroupActivity
A type that can advertise your app’s activities to other participants.
enum GroupActivityActivationResult
The result of preparing to start a custom activity.
struct GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
Activity definition


