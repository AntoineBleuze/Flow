# Activity definition.pdf

## Page 1

SharePlay activities are an organic way to create experiences that people can enjoy together. Whe
you add the Group Activities framework to your app, you gain the ability to share your app’s
features over FaceTime, Messages, and AirDrop. Some examples of experiences people can share
together include:
Watching or listening to content
Participating in an online fitness class
Creating content on a shared whiteboard or painter’s canvas
Shopping for food, clothes, or other online products
Planning a trip or browsing the web
Reading a book or taking an online class
Consider the preceding list of activities, and any other activities your app supports, and build
SharePlay support for them. Think about how people might enjoy those activities if they were
together in the same physical space. Consider the types of interactions that can occur in the real
world, and build support for those interactions into your activities. For example, a movie-watching
app needs to pause playback for all participants when one person hits the pause button. A shared
whiteboard app needs to transmit newly drawn content to other participants, and send all of the
content to someone who arrives late.
Overview
Group Activities / Defining your app’s SharePlay activities
Article
Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can
perform from your app.


## Page 2

Note
Make activities available on all the platforms your app supports to ensure people can join from
any device. Customize the experience as needed for each platform to give it a more intuitive
feel.
After configuring your SharePlay activities, you can display and start them from the share sheet.
See Presenting SharePlay activities from your app’s UI for more information.
Before you start adding SharePlay support to your app, add the Group Activities capability t
your Xcode project. Because SharePlay involves communication with other devices, you need this
capability to support activities. To add the capability to your app:
1. Open your Xcode project.
2. Select your app target.
3. Go to the Signing & Capabilities pane.
4. Add the Group Activities capability to the target.
Configure this capability only for app targets. When you add the Group Activities capability, Xcode
adds the necessary entitlements to your app and updates its provisioning profile.
For more information, see Adding capabilities to your app.
Create a SharePlay experience by defining a struct conforming to the GroupActivity protocol.
This protocol provides the basic definition of a SharePlay activity and provides the information tha
SharePlay needs to promote that activity to participants.
Ensure the data being shared during your activity conforms to Codable. If you want to use the
share sheet in SwiftUI to share an activity, it requires items to support the Transferable
protocol. Adopt this protocol in your custom data types and implement the transfer
Representation property.
Most of the content in a GroupActivity type is the data you use to support the activity itself.
Include data that is critical for performing the activity, such as the type of game in a game-playing
activity. Include information to support the overall experience, such as a title, to display in the
SharePlay UI. Store as little data as possible to support the activity. For instance, store a link to a
video rather than the file itself. Also share state information instead of detailed changes wherever
possible. The following example defines a BoardGame type that stores information about the typ
of game, and a group activity to share the experience:
Configure the Group Activities capability
Create an activity


## Page 3

Ensure your GroupActivity type conforms to Transferable. This conformance allows Swift
to present possible activities from your UI and enables SharePlay to share them via AirDrop. Whe
including a ShareLink view in your SwiftUI app, specify the transferable data type as the
shareable item from that view. When someone taps or clicks the link, the system displays a share
sheet with options for starting the associated activity. For information on starting an activity and
using a ShareLink, see Presenting SharePlay activities from your app’s UI.
Note
If you have multiple activities in your app, each GroupActivity type must have a unique
string in its activityIdentifier property.
Each activity contains a GroupActivityMetadata type that stores descriptive information abo
the activity. When inviting people to join the activity, the system incorporates this metadata into th
system UI. A concise title, a short description of the activity, and an image help people understan
which activity they’re joining. You can also provide additional details, such as a fallback URL that
someone can use to join the activity from a web browser.
Create a GroupActivityMetadata type dynamically from your activity, and populate it with
activity-related details. Fill in as much of the information as possible, and make your descriptions
concise and clear. People need to quickly identify the purpose of the activity and whether it’s one
they want to join, so make sure your descriptions are clear enough for someone to make a decisio
Provide descriptive information about the activity


## Page 4

Classify your app’s activities by specifying an appropriate value for the type property of Group
ActivityMetadata. In the SharePlay banner or share sheet, the system displays an icon that
matches the type of the activity. The icon provides an additional visual cue about what people can
expect from the activity.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
protocol GroupActivity
A type that can advertise your app’s activities to other participants.
struct GroupActivityMetadata
Text and image content that describes an activity to potential participants.
enum GroupActivityActivationResult
The result of preparing to start a custom activity.
struct GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
See Also
Activity definition


## Page 5

Watching TV and movies, and listening to music, can be more fun when you do it with friends and
family. However, getting together in person isn’t always an option. Beginning with iOS 15, tvOS 15
and macOS 12, you have the ability to create media apps that let people watch and listen togethe
wherever they are. This capability is possible using AVFoundation and the new GroupActivities
frameworks.
AVFoundation introduces a new class, AVPlayerPlaybackCoordinator, that synchronizes th
timing of AVPlayer objects across devices. Apps use the GroupActivities framework to connect
playback coordinators using a GroupSession object.
Overview
AVFoundation / Media playback / Supporting coordinated media playback
Sample Code
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen
across devices.
Download
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
Xcode 13.0+


## Page 6

This sample app shows you how to add coordinated media playback support to your app. It
provides a simple movie-playing app, where a user selects a movie from the library and plays it in
standard player user interface.
You must build the sample with Xcode 13 and Swift 5.5.
You must run the sample on a physical device with iOS 15 or later.
To experience coordinated playback, you need to install the app on two or more devices with
unique Apple IDs. Start a FaceTime call between the devices, and select an item from the library o
one of them. The system prompts you to play the movie locally or with the group. Select to play it
with the group, and starting playback on one device starts it on the other. The system automatica
propagates rate and time changes to all playback coordinators to keep group playback in sync.
The sample app plays movies, which it represents with a Movie structure that defines essential
data about an item in its library.
Configure the sample code project
Create an activity


## Page 7

To make movie watching a group experience, the sample creates a structure called Movie
WatchingActivity that adopts the GroupActivity protocol. This protocol defines a
shareable experience in the app. The activity stores the movie to share with the group, and
provides supporting metadata that the system displays when a user shares an activity.
Note
GroupActivity extends Codable, so any data that an activity stores must also conform to
Codable.
When a user selects a movie, the sample determines whether it needs to play the movie for the
current user only, or share it with the group. It makes this determination by calling the activity’s
asynchronous prepareForActivation() method, which enables the system to present an
interface for the user to select their preferred action.
Share an activity


## Page 8

The call returns a result that indicates the appropriate action to take. A result of GroupActivity
ActivationResult.activationDisabled indicates that group playback isn’t active, or the
user selects to play the movie locally only. In this case, the app sets the movie as the enqueued
Movie, which enqueues it for local playback. A result of GroupActivityActivationResult
.activationPreferred indicates that group playback is possible, and the user wants to start 
group activity. When this occurs, the sample calls the activity’s activate() method, which star
a group session and shares the activity with the group. The sample doesn’t immediately enqueue
the movie for playback, but instead waits until the group session notifies all participants of the new
activity.
When the sample activates a MovieWatchingActivity, the system creates a group session. It
accesses the session by calling the sessions() method, which returns sessions for the activity
as an asynchronous sequence.
Await group sessions


## Page 9

When the sample receives a new session, it sets it as the active group session, and then joins it,
which makes the app eligible to participate in the session. Then it subscribes to the session’s
activity publisher and, when it receives a new value, it enqueues the activity’s movie for playback.
The last step the sample takes to enable group playback is to access the player’s coordinator and
connect it with the group session. It does this by calling the coordinator object’s coordinate
WithSession(_:) method, which connects it with the coordinators of other participants in the
session.
Prepare for coordinated playback


## Page 10

After the sample makes this connection, the system coordinates rate and time changes across
participant players. The app continues to enqueue movies in a typical way, and controls playback
using the player’s standard transport methods like play(), pause(), and seek(to:). The
coordinator intercepts these changes and communicates them to other coordinators as
appropriate. Likewise, it also responds to rate and time changes from other participants and sets
them on its local player.
In most cases, the sample keeps playback in sync with the group. However, there are times when 
needs to prevent local interruptions from impacting other participants. In these situations, it
disconnects from the group temporarily by issuing a playback suspension. An AVPlayer
PlaybackCoordinator automatically issues playback suspensions for common system events
like network stalls and audio session interruptions. Apps can also define custom suspensions.
The sample provides a feature that lets a viewer quickly catch up with content they miss. This
action doesn’t impact the group, so the app begins a custom playback suspension. It creates an
extension on AVCoordinatedPlaybackSuspension.Reason that defines a new what
Happened suspension reason.
When a user taps the feature’s button in the user interface, the sample calls its performWhat
Happened() method. In this method, it starts the custom suspension, rewinds by 10 seconds, an
then plays at double speed until playback catches up with the group.
Suspend participation in coordinated playback


## Page 11

After the local device catches up with group playback, the sample ends the suspension. Although
sets the player’s rate to 2.0 after beginning the suspension, it doesn’t have to explicitly set it bac
to the original rate when it ends because the coordinator sets it automatically when the player
rejoins group playback.
Destination Video
Leverage SwiftUI to build an immersive media experience in a multiplatform app.
class AVPlaybackCoordinator
An object that coordinates the playback of players in a connected group.
class AVPlayerPlaybackCoordinator
A playback coordinator subclass that coordinates the playback of player objects in a
connected group.
class AVDelegatingPlaybackCoordinator
A playback coordinator subclass that coordinates the playback of custom player objects in a
connected group.
class AVPlaybackCoordinationMedium
See Also
SharePlay


## Page 12

Defining your app’s SharePlay activities
Presenting SharePlay activities from your app’s UI
Adding spatial Persona support to an activity
Joining and managing a shared activity
Adopt the GroupActivity protocol in custom app data structures that represent your app’s
shareable experiences. The protocol provides the system with the context and metadata to start a
activity-related session. For example, the protocol defines the unique identity of the activity, and
returns information about the activity.
In addition to the protocol’s methods and properties, make sure your type includes the informatio
you need to start the activity. When a participant accepts an activity, the system provides a copy 
your activity type. You must use that type to begin the activity. For example, use it to present the
appropriate UI for the activity and to load any required content.
To initiate an activity, create an instance of your custom type and call its prepareFor
Activation() or activate() method. You might call one of these methods from a button in
your app’s UI, or in response to other user actions. If activation succeeds, the system advertises
the activity on the current FaceTime call.
Mentioned in
Overview
Group Activities / GroupActivity
Protocol
GroupActivity
A type that can advertise your app’s activities to other participants.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 13

When an activity begins, the system creates a GroupSession instance for the activity and
delivers it asynchronously to your app. Use the sessions() method to get the session and
configure your app’s UI.
Important
GroupActivity types must be Codable so that the system can serialize them and send
them to other participant’s devices.
static var activityIdentifier: String
An app-defined string that uniquely identifies the activity.
Required Default implementation provided.
var metadata: GroupActivityMetadata
A description of the activity, and optional image to display to the user.
Required
func prepareForActivation() async -> GroupActivityActivationResult
Returns the participant’s preferred option for how to start the activity.
enum GroupActivityActivationResult
The result of preparing to start a custom activity.
func activate() async throws -> Bool
Begins the activity immediately and creates a session for the app when a FaceTime call is
active.
static func sessions() -> Self.Sessions
Returns the sessions for this activity as an asynchronous sequence.
typealias Sessions
A type that provides asynchronous, sequential, iterated access to the sessions for the activit
Topics
Specifying the activity details
Starting an activity immediately
Receiving an activity-related session


## Page 14

static var transferRepresentation: some TransferRepresentation
A default type that lets the system share your activity.
Decodable, Encodable
Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can perform fro
your app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
struct GroupActivityMetadata
Text and image content that describes an activity to potential participants.
enum GroupActivityActivationResult
The result of preparing to start a custom activity.
struct GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
Transferring data types
Relationships
Inherits From
See Also
Activity definition


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

When you call prepareForActivation(), the system determines whether you share the
activity with other participants in a FaceTime call, or perform it locally. After making the
determination, it passes a GroupActivityActivationResult value to the method’s
completion handler. Use that value to start the activity in the selected setting.
case activationPreferred
A result that indicates the user wants to share the activity with the group.
case activationDisabled
A result that indicates the user disabled the automatic sharing of activities, or prefers to
perform the activity locally.
case cancelled
A result that indicates the user canceled the activation request.
Overview
Topics
Getting the activation results
Group Activities / GroupActivityActivationResult
Enumeration
GroupActivityActivationResult
The result of preparing to start a custom activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 20

Copyable
Equatable
Hashable
Sendable
SendableMetatype
Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can perform fro
your app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
protocol GroupActivity
A type that can advertise your app’s activities to other participants.
struct GroupActivityMetadata
Text and image content that describes an activity to potential participants.
struct GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
Relationships
Conforms To
See Also
Activity definition


## Page 21

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


## Page 22

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


