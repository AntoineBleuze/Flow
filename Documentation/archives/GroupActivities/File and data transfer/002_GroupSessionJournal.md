# 002_GroupSessionJournal.pdf

## Page 1

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


## Page 2

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


## Page 3

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


