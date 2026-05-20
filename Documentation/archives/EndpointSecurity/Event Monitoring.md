# Event Monitoring.pdf

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

The types in this section contain details of each event that an Endpoint Security message can
contain. While the es_message_t type itself is generic, the members of its event union contain
specific event types.
For example, when the message’s event_type is ES_EVENT_TYPE_NOTIFY_FORK, you access
the event’s fork member, whose type is es_event_fork_t. This type has properties specific t
process-forking events, such as the child process that resulted from the fork operation.
struct es_file_t
A type that represents a file related to an Endpoint Security event.
struct es_event_access_t
A type for an event that indicates the checking of a file’s access permission.
struct es_event_clone_t
A type for an event that indicates the cloning of a file.
struct es_event_copyfile_t
A type for an event that indicates the copying of a file by use of a system call.
Overview
Topics
File-System Event Types
Endpoint Security / Event Types
API Collection
Event Types
Types used by messages to deliver details specific to different kinds of Endpoint
Security events.


## Page 11

struct es_event_create_t
A type for an event that indicates the creation of a file.
struct es_event_dup_t
A type for an event that indicates the duplication of a file descriptor.
struct es_event_fcntl_t
A type for an event that indicates the manipulation of a file descriptor.
struct es_event_open_t
A type for an event that indicates the opening of a file.
struct es_event_close_t
A type for an event that indicates the closing of a file.
struct es_event_rename_t
A type for an event that indicates the renaming of a file.
struct es_event_truncate_t
A type for an event that indicates the truncation of a file.
struct es_event_exchangedata_t
A type for an event that indicates the exchange of data between two files.
struct es_event_write_t
A type for an event that indicates the writing of data to a file.
struct es_event_lookup_t
A type for an event that indicates the lookup of a file’s path.
struct es_event_searchfs_t
A type for an event that indicates searching a volume or mounted file system.
struct es_event_deleteextattr_t
A type for an event that indicates the deletion of an extended attribute from a file.
struct es_event_fsgetpath_t
A type for an event that indicates the retrieval of a file-system path.
struct es_event_getattrlist_t
A type for an event that indicates the retrieval of attributes from a file.
File Metadata Event Types


## Page 12

struct es_event_getextattr_t
A type for an event that indicates the retrieval of an extended attribute from a file.
struct es_event_listextattr_t
A type for an event that indicates the retrieval of multiple extended attributes from a file.
struct es_event_readdir_t
A type for an event that indicates the reading of a file-system directory.
struct es_event_setacl_t
A type for an event that indicates the setting of a file’s access control list.
struct es_event_setattrlist_t
A type for an event that indicates the setting of a file attribute.
struct es_event_setextattr_t
A type for an event that indicates the setting of a file’s extended attribute.
struct es_event_setflags_t
A type for an event that indicates the setting of a file’s flags.
struct es_event_setmode_t
A type for an event that indicates the setting of a file’s mode.
struct es_event_setowner_t
A type for an event that indicates the setting of a file’s owner.
struct es_event_stat_t
A type for an event that indicates the retrieval of a file’s status.
struct es_event_utimes_t
A type for an event that indicates a change to a file’s access time or modification time.
struct es_event_file_provider_materialize_t
A type for an event that indicates the materialization of a file provider.
struct es_event_file_provider_update_t
A type for an event that indicates an update to a file provider.
File Provider Event Types
Link Event Types


## Page 13

struct es_event_link_t
A type for an event that indicates the creation of a hard link.
struct es_event_readlink_t
A type for an event that indicates the reading of a symbolic link.
struct es_event_unlink_t
A type for an event that indicates the deletion of a file.
struct es_event_mount_t
A type for an event that indicates the mounting of a file system.
struct es_event_unmount_t
A type for an event that indicates the unmounting of a file system.
struct es_event_remount_t
A type for an event that indicates the unmounting of a file system.
struct es_event_mmap_t
A type for an event that indicates the mapping of memory to a file.
struct es_event_mprotect_t
A type for an event that indicates a change to protection of memory-mapped pages.
struct es_event_chdir_t
A type for an event that indicates a change to a process’s working directory.
struct es_event_chroot_t
A type for an event that indicates a change to a process’s root directory.
struct es_event_exec_t
A type for an event that indicates the execution of a process.
struct es_event_fork_t
A type for an event that indicates the forking of a process.
File System Mounting Event Types
Memory Mapping Event Types
Process Event Types


## Page 14

struct es_event_proc_check_t
A type that indicates the call used and the data returned when a process checks on the
access of the target process.
struct es_event_signal_t
A type for an event that indicates the sending of a signal to a process.
struct es_event_exit_t
A type for an event that indicates a process exiting.
func es_exec_arg(UnsafePointer<es_event_exec_t>, UInt32) -> es_string
_token_t
Gets the argument at the specified position from a process execution event.
func es_exec_arg_count(UnsafePointer<es_event_exec_t>) -> UInt32
Gets the number of arguments from a process execution event.
func es_exec_env(UnsafePointer<es_event_exec_t>, UInt32) -> es_string
_token_t
Gets the environment variable at the specified position from a process execution event.
func es_exec_env_count(UnsafePointer<es_event_exec_t>) -> UInt32
Gets the number of environment variables from a process execution event.
func es_exec_fd(UnsafePointer<es_event_exec_t>, UInt32) -> UnsafePointe
<es_fd_t>
Gets the file descriptor at the specified position from a process execution event.
func es_exec_fd_count(UnsafePointer<es_event_exec_t>) -> UInt32
Gets the number of file descriptors from a process execution event.
struct es_fd_t
A structure that describes an open file descriptor.
struct es_event_proc_suspend_resume_t
A type for an event that indicates a call to suspend, resume, or shut down sockets for a
process.
Process Event Helper Functions
Interprocess Events


## Page 15

struct es_event_trace_t
A type for an event that indicates an attempt by one process to attach to another process.
struct es_event_remote_thread_create_t
A type for an event that indicates an attempt by one process to create a thread in another
process.
struct es_event_get_task_t
A type for an event that indicates the retrieval of a task’s control port.
struct es_event_get_task_read_t
A type for an event that indicates the retrieval of a task’s read port.
struct es_event_get_task_inspect_t
A type for an event that indicates the retrieval of a task’s inspect port.
struct es_event_get_task_name_t
A type for an event that indicates the retrieval of a task’s name port.
struct es_event_setuid_t
A type for an event that indicates the setting of a process’s user ID.
struct es_event_setgid_t
A type for an event that indicates the setting of a process’s group ID.
struct es_event_seteuid_t
A type for an event that indicates the setting of a process’s effective user ID.
struct es_event_setegid_t
A type for an event that indicates the setting of a process’s effective group ID.
struct es_event_setreuid_t
A type for an event that indicates the setting of a process’s real and effective user IDs.
struct es_event_setregid_t
A type for an event that indicates the setting of a process’s real and effective group IDs.
Task Port Event Types
User and Group ID Types


## Page 16

struct es_event_cs_invalidated_t
A type for an event that indicates the invalidation of a process’ code signing status.
struct es_event_uipc_bind_t
A type for an event that indicates the binding of a socket to a path.
struct es_event_uipc_connect_t
A type for an event that indicates the connection of a socket.
struct es_event_settime_t
A type for an event that indicates the modification of the system time.
struct es_event_iokit_open_t
A type for an event that indicates the opening of an IOKit device.
struct es_event_kextload_t
A type for an event that indicates the loading of a kernel extension.
struct es_event_kextunload_t
A type for an event that indicates the unloading of a Kernel Extension (KEXT).
struct es_event_pty_close_t
A type for an event that indicates the closing of a pseudoterminal device.
struct es_event_pty_grant_t
A type for an event that indicates the granting of a pseudoterminal device to a user.
Code Signing Event Types
Socket Event Types
Clock Event Types
Kernel Event Types
Pseudoterminal Event Types


## Page 17

Client
An opaque type that maintains Endpoint Security client state, and functions related to this
type.
Message
A type used by Endpoint Security to notify your client when a monitored action occurs.
See Also
Event Monitoring


