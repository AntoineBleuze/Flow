# 000_Client.pdf

## Page 1

Create an Endpoint Security client with es_new_client(_:_:), then use this client to subscrib
to event types of interest to your app or system extension. When Endpoint Security monitors an
event your client subscribes to, it sends a message that describes the event to your client. When
you no longer need the client, remove it with es_delete_client(_:).
The following code creates a client and handles any errors returned by es_new_client(_:_:)
If client creation succeeds, the code subscribes the client to the ES_EVENT_TYPE_AUTH_EXEC
event. The handler passed to es_new_client(_:_:) allows any such event to proceed.
Overview
Endpoint Security / Client
API Collection
Client
An opaque type that maintains Endpoint Security client state, and functions relate
to this type.


## Page 2

func es_new_client(UnsafeMutablePointer<OpaquePointer?>, es_handler
_block_t) -> es_new_client_result_t
Topics
Creating a Client


## Page 3

Creates a new client instance and connects it to the Endpoint Security system.
typealias es_handler_block_t
A block that handles a message received from Endpoint Security.
struct es_new_client_result_t
The result of an attempt to create a new client.
func es_delete_client(OpaquePointer?) -> es_return_t
Destroys and disconnects a client instance from the Endpoint Security system.
func es_subscribe(OpaquePointer, UnsafePointer<es_event_type_t>, UInt32
-> es_return_t
Subscribes a client to a set of events.
func es_subscriptions(OpaquePointer, UnsafeMutablePointer<Int>, Unsafe
MutablePointer<UnsafeMutablePointer<es_event_type_t>>?) -> es_return_t
Returns a list of the client’s subscriptions.
func es_unsubscribe(OpaquePointer, UnsafePointer<es_event_type_t>,
UInt32) -> es_return_t
Unsubscribes the provided client from a set of events.
struct es_event_type_t
A type used to identify a message’s event type and subscribe to events of that type.
func es_unsubscribe_all(OpaquePointer) -> es_return_t
Unsubscribes a client from all events.
func es_respond_auth_result(OpaquePointer, UnsafePointer<es_message_t>,
es_auth_result_t, Bool) -> es_respond_result_t
Responds to an event that requires an authorization response.
struct es_auth_result_t
Values used when responding to an authorization event.
Destroying a Client
Subscribing to Events
Responding to Events


## Page 4

func es_respond_flags_result(OpaquePointer, UnsafePointer<es_message_t>
UInt32, Bool) -> es_respond_result_t
Responds to an event that requires authorization flags as a response.
struct es_respond_result_t
Values that indicate the result of responding to a message.
func es_clear_cache(OpaquePointer) -> es_clear_cache_result_t
Clears all cached results for all clients.
struct es_clear_cache_result_t
Values that indicate the result of clearing a cache.
func es_mute_process(OpaquePointer, UnsafePointer<audit_token_t>) -> es
_return_t
Suppresses events from a given process.
func es_mute_process_events(OpaquePointer, UnsafePointer<audit_token_t>
UnsafePointer<es_event_type_t>, Int) -> es_return_t
Suppresses a subset of events from a given process.
struct es_muted_processes_t
A structure for a set of muted processes.
func es_release_muted_processes(UnsafeMutablePointer<es_muted_processes
_t>)
Frees resources associated with a set of previously-retrieved muted processes.
func es_muted_processes_events(OpaquePointer, UnsafeMutablePointer<
UnsafeMutablePointer<es_muted_processes_t>?>) -> es_return_t
Retrieve a list of all muted processes.
func es_mute_path(OpaquePointer, UnsafePointer<CChar>, es_mute_path_typ
_t) -> es_return_t
Suppresses events from executables that match a given path.
func es_mute_path_events(OpaquePointer, UnsafePointer<CChar>, es_mute
_path_type_t, UnsafePointer<es_event_type_t>, Int) -> es_return_t
Managing Cached Results
Muting Events


## Page 5

Suppresses a subset of events from executables that match a given path.
struct es_mute_path_type_t
The type of a path argument, such as a prefix or a path literal.
func es_muted_paths_events(OpaquePointer, UnsafeMutablePointer<Unsafe
MutablePointer<es_muted_paths_t>>?) -> es_return_t
Retrieve a list of all muted paths.
struct es_muted_paths_t
A structure for a set of muted paths.
func es_release_muted_paths(UnsafeMutablePointer<es_muted_paths_t>)
Frees resources associated with a set of previously-retrieved muted paths.
func es_unmute_process(OpaquePointer, UnsafePointer<audit_token_t>) ->
es_return_t
Restores event delivery from a previously-muted process.
func es_unmute_process_events(OpaquePointer, UnsafePointer<audit_token_
>, UnsafePointer<es_event_type_t>, Int) -> es_return_t
Restores event delivery of a subset of events from a previously-muted process.
func es_unmute_path(OpaquePointer, UnsafePointer<CChar>, es_mute_path
_type_t) -> es_return_t
Restores event delivery from a previously-muted path.
func es_unmute_path_events(OpaquePointer, UnsafePointer<CChar>, es_mute
_path_type_t, UnsafePointer<es_event_type_t>, Int) -> es_return_t
Restores event delivery of a subset of events from a previously-muted path.
struct es_mute_path_type_t
The type of a path argument, such as a prefix or a path literal.
func es_unmute_all_paths(OpaquePointer) -> es_return_t
Restores event delivery from previously-muted paths.
Unmuting Events
Deprecated Functions


## Page 6

func es_muted_processes(OpaquePointer, UnsafeMutablePointer<Int>, Unsaf
MutablePointer<UnsafeMutablePointer<audit_token_t>>?) -> es_return_t
Generates a list of muted processes.
Deprecated
func es_mute_path_literal(OpaquePointer, UnsafePointer<CChar>) -> es
_return_t
Suppresses events from executables matching a path literal.
Deprecated
func es_mute_path_prefix(OpaquePointer, UnsafePointer<CChar>) -> es
_return_t
Suppresses events from executables matching a path prefix.
Deprecated
struct es_return_t
Values that indicate the result of an Endpoint Security action that can only succeed or fail.
Message
A type used by Endpoint Security to notify your client when a monitored action occurs.
Event Types
Types used by messages to deliver details specific to different kinds of Endpoint Security
events.
Supporting Types
See Also
Event Monitoring


