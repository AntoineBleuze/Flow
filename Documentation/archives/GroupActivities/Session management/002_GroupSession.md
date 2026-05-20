# 002_GroupSession.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

An active participant in a group session.


