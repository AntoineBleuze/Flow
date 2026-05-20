# Session management.pdf

## Page 1

When one person in a group starts an activity, other people’s devices display system UI to prompt
them to join that activity. When each person joins, the system prepares a GroupSession object
for the activity and delivers it to their app. Your app uses that session object to:
Prepare any required UI.
Start the activity, monitor its state, and respond to changes.
Synchronize activity-related information.
For information about how to define activities, see Defining your app’s SharePlay activities. For
information about how to start activities, see Presenting SharePlay activities from your app’s UI.
Overview
Join an activity from a background task
Group Activities / Joining and managing a shared activity
Article
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that
occur during the lifetime of the activity.


## Page 2

Activities can start at any time, so you need to set up an asynchronous handler in your app to liste
for when they start. After a participant joins an activity, the system creates a GroupSession
object and delivers it to the sessions property of the GroupActivity type you defined. Monitor
the sessions property from an asynchronous handler, and process new session objects when they
become available.
Configure separate asynchronous handlers for each of your app’s activity types, and use each on
to receive new sessions for their activity. In SwiftUI, create your handler by adding the
task(priority:_:) modifier to the view containing the UI for the activity, as shown in the
example below. Inside the block for the task modifier, wait on the activity’s sessions property usin
a for..in loop. The sessions property contains an AsyncSequence type, which wakes up the
task and executes your code when a new session arrives. Use your code to begin the activity in
your app.
If you’re not using SwiftUI, handle the arrival of sessions using a Task block, as shown in the
following example. This block offers the same behavior as the SwiftUI task modifier, and you use i
in similar ways. When a new session arrives, update your app’s UI to reflect the current activity, or
perform any other tasks you need to prepare for the activity.


## Page 3

Save a reference to any sessions you receive asynchronously and remove those references when
the session state changes to GroupSession.State.invalidated(reason:). The system
delivers one new session for each joined activity. When the state of the session changes, or when
other properties change, the system updates the already delivered session. To detect updates
while the session is active, add subscribers to the properties of the GroupSession object.
When your app receives a GroupSession object, start preparing your app’s UI immediately. The
activity doesn’t start until you call the join method of the session object you received. However,
don’t call that method until you’re ready to display the UI for the activity itself. If your app needs t
collect login credentials or download content before starting the activity, present the UI for those
tasks and wait for them to complete before you call the join method.
After you join an activity, update your UI as needed to reflect relevant information. In particular:
Provide a way for people to see who joined the activity, and who hasn’t joined. Some people
might not join an activity right away, because they don’t have the app or are doing something
else. Keeping everyone informed lets them know who’s aware of the activity details.
Provide visual cues when someone makes a change, and optionally display information about
who made the change. For example, annotate the change temporarily with the person’s identity
or add app-specific messages to the conversation.
Support people navigating away from an activity but staying on the group FaceTime call or
Messages conversation. For activities that involve video playback, support Picture in Picture to
continue playback even when someone changes apps.
Make sure app-specific controls are easy to access.
When your app has everything it needs and is ready to start the activity, call the join() method 
the GroupSession object. The join() method asks the system to start the activity in your app
Even after you call this method, the session remains in the GroupSession.State.waiting
state until the system establishes a connection to the activity.
If your call to join() is successful, the system changes the state of the session to Group
Session.State.joined and begins sending information to and from the current device. If you
tried to synchronize data after calling join(), but before the system completed the request, tho
Prepare your app’s interface
Join the session to start the activity


## Page 4

requests remain queued until your session enters the GroupSession.State.joined state.
After successfully joining the session, the system expects you to handle session-related changes
and messages. For information about how to send messages between participants, see
Synchronizing data during a SharePlay activity.
Participants join activities separately, and people can join immediately or after a delay. If
participants need to download your app, or don’t see the invitation to join the activity, they might
arrive several minutes after others. If your activity manages state information that all participants
require, devise a way to deliver that information to someone who arrives late. For example, a
whiteboard app needs to deliver the current whiteboard content to any late joiners.
Consider the experience for people who arrive late to an activity, and plan for it when implementin
your activity support. You might create a lobby interface where participants wait until everyone is
present, or you might define custom messages to let people catch up with the rest of the group.
Choose an experience that makes sense for your app, and remember that every participant is equ
in a SharePlay activity. There’s no single activity owner who controls the experience.
To determine when new participants join the session, monitor the activeParticipants
property of the session using a separate task. When the list of participants changes, compare the
new list with a saved copy your app maintains. When you detect new participants, update them
with the current state of the activity.
The GroupSession object contains methods to end the session for the current participant or th
entire group. When designing your UI, make it clear which option someone is choosing, and call th
correct method in response.
Accommodate people who arrive late to the session
End the activity for one or more participants


## Page 5

When a participant quits your app, switches to a different app, or navigates away from your app’s
activity-related UI, call leave() to end the activity for that participant. Other participants remain
engaged in the activity until they leave or until someone ends the activity for everyone.
When a participant leaves an activity, the system moves their session to the GroupSession
.State.invalidated(reason:) state and stops the flow of information between their device
and the rest of the group. When the session moves to this state, it’s safe to discard the session
object itself and perform any activity-related cleanup. If the person is still active on the FaceTime
call or Messages conversation and rejoins the activity later, the system delivers a new session
object to your app.
When you want to end the activity for everyone, call the end() method. This method invalidates
the sessions for all participants. Make sure any buttons or UI that calls this method makes it clear
that the activity ends for everyone. The session also ends when everyone leaves the activity.
See Also
Session management


## Page 6

Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
class GroupSession
A session for an in-progress activity that synchronizes content among participant devices.
protocol CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
struct Participant
An active participant in a group session.


## Page 7

Note
This sample code project is associated with WWDC23 session 10241: Share files with
SharePlay, and WWDC21 session 10187: Build custom experiences with Group Activities.
Group Activities allows you to build shared experiences across devices with SharePlay. Although i
focus is on creating media experiences, you can design your own custom app experiences to sha
with multiple devices. The real-time interactions you unlock, and the instant reaction people who
use your app get, can lead to some truly special moments.
The sample app, DrawTogether, builds on some of the concepts introduced in WWDC21 session
10225: Coordinate media experiences with Group Activities. It allows you to draw together while o
a FaceTime call. The entire screen is the canvas, and everyone draws with a random color.
There are two steps to adopt a GroupActivity: activity creation and session management.
These are covered in detail in WWDC21 session 10225: Coordinate media experiences with Group
Activities and in Supporting Coordinated Media Playback.
These steps change slightly when building a custom experience, starting with activity creation.
Activity creation consists of configuring the activity, and then activating the activity. Only the
configuration part is different for a custom activity compared to a media activity.
Overview
Configure the sample code project
Group Activities / Drawing content in a group session
Sample Code
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
Download
iOS 17.0+
iPadOS 17.0+
Xcode 15.0+


## Page 8

Build the sample with Xcode 13 or later, and Swift 5.5 or later.
This sample runs on physical devices with iOS 15 or later.
To see the custom drawing experience together, install the app on two or more devices with uniqu
Apple IDs, and start a FaceTime call between the devices. Tap the bottom-left icon, and respond t
the system prompt to start a shared DrawTogether experience. On the other device, join the grou
session. The app gives each user a random color to draw with. When the user draws on the scree
the app propagates the drawing to all the other devices in the group session.
To make drawing a group experience, the sample defines a DrawTogether structure that adopts
the GroupActivity protocol. This protocol defines a shareable experience in the app. The
GroupActivity protocol has two properties that the app implements: activityIdentifier
and metadata. The app relies on the default implementation for activityIdentifier, and th
metadata property is required. To make this activity a custom activity, the sample code sets the
type on the metadata to generic. This is crucial for a custom activity, and is the only differenc
between configuring a custom activity and a media activity.
After configuring the activity, the app needs to activate it at the appropriate moment. The sample
provides a button for activation. First, the sample checks to make sure a GroupSession doesn’t
exist already. Next, it calls the GroupStateObserver isEligibleForGroupSession metho
to make sure a FaceTime call is active and the system can create group sessions. Then, in the
action closure, the sample calls its canvas.startSharing() method to activate the activity.
Configure a custom activity
Activate an activity


## Page 9

In its canvas.startSharing() method, the sample creates a new instance of the custom
activity, and calls the activate() method on it. That’s all that’s necessary to activate the activit
The sample uses GroupSessionMessenger to configure the session for sending and receiving
its custom drawing data. The app creates a GroupSessionMessenger from the GroupSessio
It also adds the messenger property to its Canvas to hold the messenger object.
When using GroupSessionMessenger, the sample code defines the type of data to exchange
between participants. The app shares the strokes themselves. The sample defines the Upsert
StrokeMessage structure to represent a stroke with three properties: an identifier, a color, and a
coordinate point. The sample also specifies that the UpsertStrokeMessage structure conform
to the Codable protocol. GroupSessionMessenger automatically handles the serialization and
deserialization of the message data if the messages are Codable.
Configure the session for sending and receiving custom
data


## Page 10

The second step in configuring the session is to call the GroupSessionMessenger
messages(of:) method to receive the UpsertStrokeMessages data. The sample specifies
the UpsertStrokeMessage type when calling the messages method. This method returns an
async sequence that provides a tuple containing messages of that type and the context
surrounding the message, such as which participant sends the message.
The third step for configuring the session is to send data using the GroupSessionMessenger
send(_:to:) method. The app sends an UpsertStrokeMessage to all participants within the
group.
The sample creates a detached task to receive the UpsertStrokeMessages from the async
sequence, then calls its handle method to process the message.
The handle method checks the stroke identifier to see if one exists already — and if so, adds t
point to it. Otherwise, it creates a new stroke, adds the point to it, and appends the stroke to a
array of strokes.
Receive custom data


## Page 11

The sample calls its addPointToActiveStroke method to send the messages using the Grou
SessionMessenger send(_:to:) method.
Late joiners are devices that join an activity session after the session starts. To ensure a proper
experience, the app gives late joiners the most recent information so all the devices use the same
data.
When a new device calls join() on the GroupSession, every other device in the Group
Session receives an update of the GroupSession activeParticipants property. Devices
that observe the update then send their own catch-up data (in this case, the existing drawing
canvas) to the newly joined device.
The app defines its catch-up data in the CanvasMessage structure. This structure contains all o
the existing strokes and a variable pointCount, a heuristic that calculates which message is the
most up-to-date.
Send custom data
Handle late joiners


## Page 12

The sample defines a message handler in its configureGroupSession method to receive this
message using the GroupSessionMessenger messages(of:) method. The handler calls the
samples handle() method to process the message.
The sample’s handle() method guards against the pointCount heuristic to only accept catch
up messages that are newer than any currently saved messages. Then the sample overrides the
canvas strokes with the catch-up message’s strokes.
Next, the sample listens for activeParticipants changes to determine whether there are any
new participants to communicate with. The sample’s configureGroupSession method handle
obtains the delta between the new activeParticipants and the previous active
Participants. This ensures that the sample only sends catch-up messages to the newly joined
participants. Finally, the sample forms and sends the message. The message contains the curren
canvas state and sends it only to the newParticipants.


## Page 13

The Group Activities framework provides two ways to change activities: create a GroupSession
or update the activity for everyone in the existing GroupSession.
The sample app resets for each new drawing canvas. The sample triggers a new session when th
user taps the Reset button. In this case, the sample calls its Canvas reset method to reset the
local state and create a GroupSession.
The sample’s reset method removes the existing GroupSession, which allows for a clean
transition to a new canvas in the new session. The reset method cancels any tasks for the
GroupSession. It also checks for an existing GroupSession, and if one exists, it calls the
leave() method to leave the current activity. It then calls the activate() method to start the
activity immediately and create a session for the app. Thereafter, the sample waits for the system
to deliver a GroupSession object asynchronously through the GroupActivity.Sessions
method of the GroupActivity.
Change activities


## Page 14

The sample’s ControlBar view contains a button to allow users to share the canvas with their
friends. The sample dynamically displays the button only when it’s helpful to the user. The sample
uses the GroupStateObserver isEligibleForGroupSession property to determine
whether a FaceTime call is active and the system can create group sessions. The ControlBar
only shows the button if the system is eligible for a group session, and not in a group session
already.
Start SharePlay experiences


## Page 15

Joining and managing a shared activity
Adding spatial Persona support to an activity
Synchronizing data during a SharePlay activity
A GroupSession object contains details about the user’s currently selected activity, its status,
and its participants. When a participant engages in an activity, the system binds a session to that
activity for you. You use the session object to synchronize your app’s activity-related content,
including your app’s UI.
You don’t create GroupSession objects directly. Instead, the system creates sessions and make
them available to your app asynchronously. Use the AsyncSequence type returned by the
sessions() method of your activity to retrieve new sessions when they become available.
Before the system can create a session object, your app must create a GroupActivity object
and activate it. For information about how to configure group activities, see GroupActivity.
Mentioned in
Overview
Start and Stop the Session
Group Activities / GroupSession
Class
GroupSession
A session for an in-progress activity that synchronizes content among participant
devices.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 16

When you receive a new session object, it’s initially in the GroupSession.State.waiting
state. As soon as your app is ready to begin the associated activity, call the session’s join()
method. Joining a session validates the connection and starts the synchronization process
between the current device and other participants’ devices. If your app successfully joins the
session, the session transitions to the GroupSession.State.joined state.
When the user quits your app, or navigates away from the shared activity, call the session’s
leave() method. Leaving a session gracefully transitions it to the GroupSession.State
.invalidated(reason:) state, and informs the system that the user isn’t currently engaged i
the activity.
struct Sessions
An asynchronous sequence of sessions you use to manage a specific activity.
func join()
Starts the shared activity on the current device.
func leave()
Leaves the current activity and stops receiving synchronized data.
func end()
Ends the activity for the entire group and stops the transfer of synchronized data.
var activity: ActivityType
The current activity associated with the session.
var state: GroupSession<ActivityType>.State
The current state of the session.
enum State
Topics
Getting the current session
Joining and leaving the session
Accessing the shared activity
Getting the session details


## Page 17

The possible states of a session.
let id: UUID
The unique identifier of the current session.
var localParticipant: Participant
The participant on the current device.
var activeParticipants: Set<Participant>
The set of participants currently engaged in the activity.
var sceneSessionIdentifier: String?
The persistent identifier of the session’s associated scene.
func requestForegroundPresentation()
Tells the system that your app needs to be in the foreground to continue an activity.
func showNotice(GroupSessionEvent)
Posts an event to the system, which displays the information in the system UI.
struct GroupSessionEvent
A session-related event that appears in the system UI.
struct Event
A session-related event to display in the system UI.
Deprecated
var $activeParticipants: Published<Set<Participant>>.Publisher
Getting the participants
Getting the scene-association identifier
Getting the participant’s attention
Notifying participants of playback changes
Structures
Instance Properties


## Page 18

var $activity: Published<ActivityType>.Publisher
var $state: Published<GroupSession<ActivityType>.State>.Publisher
let isLocallyInitiated: Bool
A Boolean value that is true if the current session was created by the local participant.
var systemCoordinator: SystemCoordinator?
The system coordinator associated with an active session.
func postEvent(GroupSession<ActivityType>.Event)
Posts an event to the system, which displays the information in the system UI.
Deprecated
Copyable, CustomStringConvertible, ObservableObject
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that occur during
the lifetime of the activity.
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
protocol CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
struct Participant
Instance Methods
Relationships
Conforms To
See Also
Session management


## Page 19

An active participant in a group session.


## Page 20

Adopt this protocol in the custom types you use to send and receive messages during a group
activity. You use a GroupSessionMessenger object to send custom messages between the
same app on different devices. In addition to the message data, GroupSessionMessenger
encodes your custom type name so that it can construct the correct type on those other devices.
Use this protocol to identify your custom message types using an app-specific string instead of t
type name.
Providing an app-specific string makes it possible to use different types to support messages.
When the message data contains a custom message ID, GroupSessionMessenger looks for a
type that conforms to the protocol with a messageIdentifier property that contains the
matching string. It then creates that type and decodes the message data into it.
Note
Custom types that adopt this protocol must also adopt the Codable protocol.
Overview
Topics
Type Properties
Group Activities / CustomMessageIdentifiable
Protocol
CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 21

static var messageIdentifier: String
A custom identification string for the current type.
Required
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that occur during
the lifetime of the activity.
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
class GroupSession
A session for an in-progress activity that synchronizes content among participant devices.
struct Participant
An active participant in a group session.
See Also
Session management


## Page 22

Configure your visionOS app for sharing with people nearby
Synchronizing data during a SharePlay activity
Use a Participant object to differentiate among users in a session. A participant object doesn
contain any sensitive data about the user, but provides a unique identifier to distinguish the user
while the session is active.
You don’t create participant objects directly. The system creates a participant object for each use
that joins an activity. Access the current set of participants from the activeParticipants
property of the GroupSession object associated with the activity.
let id: UUID
A globally unique identifier for the session participant.
Mentioned in
Overview
Topics
Getting the unique identifier
Group Activities / Participant
Structure
Participant
An active participant in a group session.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 23

var isNearbyWithLocalParticipant: Bool
A Boolean value that indicates whether the participant is physically nearby with the local
participant.
Copyable
CustomStringConvertible
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that occur during
the lifetime of the activity.
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
class GroupSession
A session for an in-progress activity that synchronizes content among participant devices.
protocol CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
Instance Properties
Relationships
Conforms To
See Also
Session management


## Page 24



