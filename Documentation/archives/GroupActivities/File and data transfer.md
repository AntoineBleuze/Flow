# File and data transfer.pdf

## Page 1

During a typical activity, you want the content one participant sees on their device to match the
content other participants see. To make this happen, share data between devices to keep those
devices in sync. For example, a drawing app might share the tool state and coordinate points for
pen strokes. You then incorporate that shared data into your app, recreating the content that othe
participants created on their devices.
When an activity-related session is active, share data among participants using the objects of the
Group Activities framework. You can share data with all participants or a subset of participants. Fo
example, a quiz game might share different information with contestants and the people asking th
questions. For time-sensitive messages, send small amounts of data using a GroupSession
Messenger object. When the amount of data is larger and the arrival time is less important, share
that data using a GroupSessionJournal object.
Note
The AVFoundation framework supports the synchronization of movie playback without custom
messages. For more information, see Supporting coordinated media playback.
During the creation of an activity, think about what information you need to share among
participants:
A drawing app might share the state of the tools and the points for line segments.
Overview
Define the messages to send
Group Activities / Synchronizing data during a SharePlay activity
Article
Synchronizing data during a SharePlay
activity
Send custom messages and data between devices to synchronize content for you
activity, and incorporate messages your app receives from other participants.


## Page 2

A movie-playback app might share commands to start and stop playback and synchronize the
current frame.
A shopping app might share the ID of the current product page and synchronize items in the
shared shopping cart.
A workout app might share workout stats for each participant and which track to play.
After you identify the information you want to send, design data types to encapsulate the relevant
details. You can send the details using a Data object, or design your own custom types that adop
the Codable protocol. The following example shows a message structure for a drawing activity.
Each message incorporates the next point in the line segment and the color of the segment. Whe
someone draws, the app sends one message for each new point it receives. Small messages can
include up to 256 kilobytes of data, but keep the total size as small as possible to minimize the tim
it takes to send and process the data.
When you need to send photos, videos, audio, or other large data types, encode that information
into a type that adopts the Transferable protocol. The GroupSessionJournal object
requires this protocol when sending types.
When the person running your app on their device makes activity-related changes, send those
changes to other affected participants using a GroupSessionMessenger object. When you sen
data, you’re actually sending it from one instance of your app to another instance of your app on a
different device. The GroupSessionMessenger object delivers the data over the network to th
part of your app configured to receive that data.
When creating the GroupSessionMessenger object, determine whether you need reliable or
unreliable delivery for messages. Choose GroupSessionMessenger.DeliveryMode
.reliable messaging for crucial data that all participants must have. With reliable messaging,
the system performs additional checks to verify the delivery of messages, and resends them as
needed. By contrast, GroupSessionMessenger.DeliveryMode.unreliable messaging is
generally faster, and is appropriate when the delivery time is more important than the guarantee o
delivery. For example, for a movie-watching activity, you might send the name of the movie using
reliable messaging, but send the emoji reactions of participants during the movie using unreliable
messaging. All participants need to know which movie to watch, but the emoji reactions are time-
critical and less important.
Send a message to one or more participants


## Page 3

After creating your GroupSessionMessenger object, send your messages using one of the
available methods. The following example sends a custom data type to all members of the group:
To send a message to a subset of participants, include the list of participants when calling the sen
method. The GroupSession object maintains a set of Participant structures, each of which
identifies a member taking part in the activity. Use the UUID of each participant to differentiate
them within your app. For example, a quiz game app randomly chooses a subset of participants to
take the quiz and share their unique IDs with the group. The person giving the quiz then sends on
the questions to the people taking the quiz, and sends the questions and answers to everyone els
The following example subtracts the current participant from the set of all participants and sends
ready message to that subset of people:
Messages targeting the current participant can arrive at any time, so it’s best to use a separate ta
to listen for them. The GroupSessionMessenger object delivers messages using an Async
Sequence, which makes it easy to receive those messages asynchronously. Respond to incoming
messages as quickly as possible by updating your app’s data structures to include the new
information.
When configuring your session, define a task to receive incoming messages for your activity. Insid
the task, use a for..in loop to wait on the messages property of your GroupSession
Messenger object. Specify which message you want to receive as a parameter to the messages
method. For example, the code below shows how to process incoming pen stroke messages. The
function returns a tuple for each element, with each tuple containing the incoming message and
any related contextual information. The message is the data structure you defined previously. The
contextual information is a GroupSessionMessenger.MessageContext structure with
additional details, such as the participant who sent the message.
Receive messages from other participants


## Page 4

Create separate tasks to monitor each distinct message type your activity supports. If you have
multiple activities, and each one has multiple messages, this results in multiple separate tasks.
However, each task runs only when messages are available.
To share files and other large data objects with participants of an activity, use a GroupSession
Journal object instead of a GroupSessionMessenger. A GroupSessionJournal object let
you associate multiple data objects or files with the activity as attachments to the session. The siz
limit for attachments is 100 megabytes, and the system provides end-to-end encryption for your
data.
Attachments are ideal when you need to send more than just a few kilobytes of information to oth
participants, and want to do so as efficiently as possible. Use them to send images or large data
objects that the group creates or adds to the activity. The Group Activities framework efficiently
manages the transfer of attachments among devices, avoiding multiple downloads of the same
data to each device.
Note
Don’t use a GroupSessionJournal object to store files larger than 100 megabytes, or when
you need to protect or validate content before someone downloads it. Instead, store those files
on your company’s server and let participants download them from there.
The GroupSessionJournal object delivers attachments to your app using an AsyncSequenc
type. To receive attachments, configure a task and use a for..in loop and wait on the
attachments property of your journal object, as shown in the following example. When attachmen
are available for your device, the system wakes up your task and delivers an array of Group
SessionJournal.Attachment structures for you to process.
Use the GroupSessionJournal.Attachment structures your app receives to download the
attachment data and fetch any related metadata. You can then use that data to create any local
Share files among participants


## Page 5

data structures you need to update the state of your activity. The following example shows how to
iterate over the attachments you receive and fetch the data for each one. The ImageMetadata
Message type is a custom structure the activity uses to store extra information about the image
data.
For more information about storing files and data attachments, see GroupSessionJournal.
class GroupSessionMessenger
An object that transfers app-specific data between the devices joined in a group session.
class GroupSessionJournal
An object that manages file and data transfers between participants joined in a group sessio
See Also
File and data transfer


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

Synchronizing data during a SharePlay activity
A GroupSessionJournal object lets you transfer files and other data objects between
participants of a shared activity. A journal object isn’t a replacement for a GroupSession
Messenger object, which you use to transfer time-sensitive messages and commands between
participants. Instead, use it to associate files and other data objects with the activity. For example
you might share images that people drag into your app as part of the activity. The journal makes
these data objects available to all participants, regardless of when they joined the session.
After your app joins an activity and receives a session object, create a GroupSessionJournal
object and store a strong reference to it. To add a file or data object to the group’s journal, call the
add(_:) or add(_:metadata:) method with the data you want to share. The types you specif
must adopt the Transferable protocol from the Core Transferable framework. The journal obje
uses that protocol to package a version of your data suitable for sending to other devices.
To receive data that a participant added to the journal, configure a task to listen for asynchronous
updates to the attachments property of your GroupSessionJournal object. When someone
adds or removes an attachment, the journal updates the array and executes your task. Load the
contents of an attachment using the load(_:) method of that type. You can also retrieve any
attachment-specific metadata, such as a shared ID or display name, that you included with the
Mentioned in
Overview
Group Activities / GroupSessionJournal
Class
GroupSessionJournal
An object that manages file and data transfers between participants joined in a
group session.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 11

attached file. The following example creates a task that waits on a custom image type. The
journal variable contains a previously configured GroupSessionJournal object.
convenience init<Activity>(session: GroupSession<Activity>)
Creates a journal and associates it with the specified session of a group activity.
func add<ItemType>(ItemType) async throws -> GroupSessionJournal.
Attachment
Adds the specified item to the journal and begins transferring the item’s data to the other
participants’ devices so they can access it.
func add<ItemType, MetadataType>(ItemType, metadata: MetadataType) asyn
 throws -> GroupSessionJournal.Attachment
Adds the specified item and metadata to the journal and begins transferring the data to the
other participants’ devices so they can access it.
var attachments: GroupSessionJournal.Attachments
The currently available attachments for you to download and incorporate into your app.
struct Attachments
An asynchronous sequence that contains one or more incoming attachment containers for
you to process.
Topics
Creating an attachment manager
Uploading content to the session
Downloading content from the session


## Page 12

struct Attachment
A container for the data you download.
func remove(attachment: GroupSessionJournal.Attachment) async throws
Removes the specified attachment from the journal on all sessions.
Sendable, SendableMetatype
Synchronizing data during a SharePlay activity
Send custom messages and data between devices to synchronize content for your activity,
and incorporate messages your app receives from other participants.
class GroupSessionMessenger
An object that transfers app-specific data between the devices joined in a group session.
Removing content from the session
Relationships
Conforms To
See Also
File and data transfer


