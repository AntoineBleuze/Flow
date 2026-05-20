# 001_Message.pdf

## Page 1

When Endpoint Security monitors an event of a given type, it sends a message to all clients
subscribed to that event type, containing data about the event. Handlers use this information to
react to the event. In the case of authorization events, handlers must actively respond to the
message and authorize or deny the monitored action. The client must respond before the
deadline specified by the message.
The following code shows a handler that reacts to events of the type ES_EVENT_TYPE_AUTH
_RENAME. Because the handler knows the event type, it can access the rename member of the
message’s event union. From this, it gets the source of the rename event, and inspects the
source file path. The handler denies authorization to the event if the filename includes the string
DONOTMOVE, and allows it otherwise.
Overview
Endpoint Security / Message
API Collection
Message
A type used by Endpoint Security to notify your client when a monitored action
occurs.


## Page 2

struct es_message_t
A message from the Endpoint Security subsystem that describes a security event.
func es_retain_message(UnsafePointer<es_message_t>)
Retains the given message, extending its lifetime until released.
func es_release_message(UnsafePointer<es_message_t>)
Releases a previously-retained message.
func es_copy_message(UnsafePointer<es_message_t>) -> UnsafeMutable
Pointer<es_message_t>?
Copies a message, by allocating new memory.
Deprecated
func es_message_size(UnsafePointer<es_message_t>) -> Int
Calculates the size of a message structure.
Topics
Inspecting Messages
Retaining and Releasing Messages
Deprecated Functions


## Page 3

Deprecated
func es_free_message(UnsafeMutablePointer<es_message_t>)
Frees the memory allocated for the given message.
Deprecated
struct es_result_t
The result of the Endpoint Security subsystem authorization process.
struct es_string_token_t
A pointer to a null-terminated string, and the length in bytes of that string.
struct es_token_t
An arbitrary buffer of data with its size.
Client
An opaque type that maintains Endpoint Security client state, and functions related to this
type.
Event Types
Types used by messages to deliver details specific to different kinds of Endpoint Security
events.
Supporting Types
See Also
Event Monitoring


