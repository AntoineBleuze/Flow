# 001_GroupSessionMessenger.pdf

## Page 1

Synchronizing data during a SharePlay activity
Configure your visionOS app for sharing with people nearby
Use a GroupSessionMessenger object to coordinate your app’s behavior across the devices
attached to a group session. This object leverages the existing FaceTime communication channel
to send app-specific data related to a SharePlay experience. For example, a movie-watching app
might share user comments or tags while the movie plays.
You create a GroupSessionMessenger object directly and use it to send and receive app data
Create the messenger using an active GroupSession object, which manages the underlying
communication channel. Store a strong reference to your GroupSessionMessenger object for
the lifetime of the session. The following example shows a custom object for managing a movie-
watching experience. The object stores the GroupSession object associated with the experience
and creates a GroupSessionMessenger for sending messages between participants.
Mentioned in
Overview
Group Activities / GroupSessionMessenger
Class
GroupSessionMessenger
An object that transfers app-specific data between the devices joined in a group
session.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

For more information about establishing a group session, see GroupSession.
The system delivers messages to your app asynchronously when they arrive and adds them to a
message sequence. Use the messages(of:) or messages(of:) method to retrieve the
sequence you want and iterate over its results. Use a for-in loop with the await keyword to
iterate asynchronously over the results. The following example shows how a Tic Tac Toe game
might retrieve moves sent by the current opponent. After receiving each move, the code adds tha
move to the current participant’s board.
init<Activity>(session: GroupSession<Activity>)
Creates a new group session messenger with GroupSessionMessenger.DeliveryMode
.reliable delivery mode and associates it with the specified session object.
func send(Data, to: Participants) async throws
Sends a standard data object asynchronously to other participants in the group session.
Receive Messages from Other Devices
Topics
Creating a group session messenger
Sending data to the group


## Page 3

func send<Message>(Message, to: Participants) async throws
Sends a custom type asynchronously to other participants in the group session.
func send(Data, to: Participants, completion: ((any Error)?) -> Void)
Sends a standard data object to other participants in the group session.
func send<Message>(Message, to: Participants, completion: ((any Error)?
-> Void)
Sends a custom type to other participants in the group session.
enum Participants
The set of participants to include in messages.
func messages(of: Data.Type) -> GroupSessionMessenger.Messages<Data>
Returns the asynchronous sequence of messages that contain a generic data object.
func messages<Message>(of: Message.Type) -> GroupSessionMessenger.
Messages<Message>
Returns the asynchronous sequence of messages that match the app-specific type.
struct Messages
An asynchronous sequence of messages sent to the session.
struct MessageContext
A structure that contains additional information about an incoming message, such as which
device sent it.
init<Activity>(session: GroupSession<Activity>, deliveryMode: Group
SessionMessenger.DeliveryMode)
Creates a new group session messenger with the specified delivery mode, GroupSession
Messenger.DeliveryMode, and associates it with the specified session object.
let deliveryMode: GroupSessionMessenger.DeliveryMode
The GroupSessionMessenger.DeliveryMode specified at initialization time (defaults to
reliable).
Receiving data from other participants
Initializers
Instance Properties


## Page 4

enum DeliveryMode
The transmission characteristics to apply to the delivery of messages.
Sendable, SendableMetatype
Synchronizing data during a SharePlay activity
Send custom messages and data between devices to synchronize content for your activity,
and incorporate messages your app receives from other participants.
class GroupSessionJournal
An object that manages file and data transfers between participants joined in a group sessio
Enumerations
Relationships
Conforms To
See Also
File and data transfer


