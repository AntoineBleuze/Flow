# 002_GroupActivity.pdf

## Page 1

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


## Page 2

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


## Page 3

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


