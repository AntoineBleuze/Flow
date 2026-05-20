# Memory and Context.pdf

## Page 1

The GSS-API defines certain objects as C data structures containing elements using dynamically
allocated memory. These include names, buffers, contexts, and credentials, as well as the
collection objects that hold buffer sets and Object Identifier (OID) sets. The API provides function
for both allocating and freeing the memory associated with these objects.
Many GSS-API functions create structures on your behalf and return them to you with pointer
parameters. You then become responsible for managing the associated memory. When you’re do
with such objects, you use one of the release or destroy functions to return its memory to the
system.
Prepare an empty buffer set with a call to the gss_create_empty_buffer_set(_:_:)
function, and release it with gss_release_buffer_set(_:_:) when done.
Overview
Allocate and Release an Empty Buffer
Acquire and Release Credential Memory
GSS / Allocating and Releasing Objects
Article
Allocating and Releasing Objects
Manage memory and object lifetimes.


## Page 2

When releasing the memory associated with a credential returned to you by the gss_acquire
_cred(_:_:_:_:_:_:_:_:) function, use the gss_release_cred(_:_:) function. This on
releases the memory back to the heap, however, potentially leaving traces of the data behind. To
actively purge the credential and only then release the memory, use the gss_destroy_cred(_
_:) function instead. This function is more secure for objects that might contain sensitive
information.
An exception to the memory management rule is the OID object gss_OID (not the same as a set 
OID objects, gss_OID_set). While an implementation of GSS-API could theoretically allocate
memory for OID objects dynamically, Apple’s implementation always returns statically allocated O
objects to you. You use these as-is, and never need to explicitly create or release them. As a resu
in practice you never need to call the functions gss_duplicate_oid(_:_:_:) or gss
_release_oid(_:_:).
Function Status
Evaluate return values that most GSS-API functions use to indicate the outcome of an
operation.
Buffer Management
Allocate and deallocate buffers with structures that hold a variety of data.
Context Services
Use context services to manage secure operations between endpoints.
Handle OID Objects as Static Memory
See Also
Memory and Context


## Page 3

The functions of the GSS-API return two status codes. The major status code, delivered as the
function’s return value, provides a mechanism-independent status output. A value of GSS_S
_COMPLETE typically indicates success, but the code is actually composed of several fields that
enable communicating a more nuanced result. Always check the major status code to determine i
an operation succeeds.
The minor status code provides additional information, often mechanism-specific, when an
operation fails. This result returns using the OM_uint32 pointer given as the function’s first
argument. Examine this value to further debug a problem. For example, many functions allocate
memory as a side effect of their main task. If memory allocation fails, the entire operation fails. Bu
while the major status indicates a generic problem, a minor status of ENOMEM indicates that failed
memory allocation is the exact culprit.
Three bitfields bundled together make up major status codes in a single OM_uint32 value. These
fields are:
The calling error
A generic GSS-API error in the most significant 8 bits.
The routine error
An error specific to the routine in the next 8 bits.
Supplementary Information
Additional information about the error in the lower 16 bits.
When a function successfully runs to completion, it returns zero for all of these fields. As a
convenience, you can compare the result directly with the status code GSS_S_COMPLETE to test
for this condition.
Overview
GSS / Function Status
API Collection
Function Status
Evaluate return values that most GSS-API functions use to indicate the outcome o
an operation.


## Page 4

For any other result, use one of the available extraction macros (such as GSS_CALLING_ERROR) 
obtain a value that you compare against one of the known error codes. For example, you can test
for a failure to read one of the function inputs as follows:
Use the gss_display_status(_:_:_:_:_:_:) function to retrieve a human readable string
corresponding to a given status result.
typealias OM_uint32
A 32-bit unsigned integer.
typealias OM_uint64
A 64-bit unsigned integer.
typealias gss_uint32
A 32-bit unsigned integer.
typealias gss_status_id_t
A pointer to a status result.
var GSS_C_MECH_CODE: Int32
A flag that indicates the status code comes from a call to an underlying mechanism, such as
Kerberos.
var GSS_C_GSS_CODE: Int32
A flag that indicates the named status code comes from a GSS-API call.
var GSS_S_COMPLETE: Int32
Topics
Status and Error Creation


## Page 5

The operation completed without error.
func gss_display_status(UnsafeMutablePointer<OM_uint32>, OM_uint32,
Int32, gss_OID?, UnsafeMutablePointer<OM_uint32>, gss_buffer_t) -> OM
_uint32
Returns a human readable string for a status code.
func GSSCreateError(gss_const_OID, OM_uint32, OM_uint32) -> Unmanaged<
CFError>?
Returns an error object based on GSS-API major and minor status codes.
var GSS_S_CALL_BAD_STRUCTURE: UInt
Improperly formatted parameter.
var GSS_S_CALL_INACCESSIBLE_READ: UInt
A required input parameter could not be read.
var GSS_S_CALL_INACCESSIBLE_WRITE: UInt
A required output parameter failed to write.
var GSS_S_BAD_MECH: UInt
Unsupported mechanism.
var GSS_S_BAD_NAME: UInt
Invalid name.
var GSS_S_BAD_NAMETYPE: UInt
Unsupported name type.
var GSS_S_BAD_MIC: UInt
Failed token integrity check.
var GSS_S_BAD_SIG: UInt
Failed token integrity check.
var GSS_S_BAD_STATUS: UInt
Invalid status selector.
Calling Errors
Routine Errors


## Page 6

var GSS_S_BAD_BINDINGS: UInt
Channel bindings mismatch.
var GSS_S_NO_CRED: UInt
No valid credentials.
var GSS_S_NO_CONTEXT: UInt
No valid security context.
var GSS_S_DEFECTIVE_TOKEN: UInt
Defective token.
var GSS_S_DEFECTIVE_CREDENTIAL: UInt
Defective credential.
var GSS_S_CREDENTIALS_EXPIRED: UInt
Expired credential.
var GSS_S_CONTEXT_EXPIRED: UInt
Expired context.
var GSS_S_FAILURE: UInt
An unspecified error.
var GSS_S_BAD_QOP: UInt
Unsupported QOP value.
var GSS_S_UNAUTHORIZED: UInt
Unauthorized operation.
var GSS_S_UNAVAILABLE: UInt
Unavailable operation.
var GSS_S_DUPLICATE_ELEMENT: UInt
A duplicate credential element requested.
var GSS_S_NAME_NOT_MN: UInt
The name contains multimechanism elements.
var GSS_S_BAD_MECH_ATTR: UInt
Unknown mechanism attribute.
var GSS_S_CRED_UNAVAIL: UInt


## Page 7

Unavailable credential.
var GSS_C_CALLING_ERROR_MASK: UInt
A mask with a width that matches the calling error field.
var GSS_C_CALLING_ERROR_OFFSET: Int32
The offset of the calling error field within the major status code.
var GSS_C_ROUTINE_ERROR_MASK: UInt
A mask with a width that matches the routine error field.
var GSS_C_ROUTINE_ERROR_OFFSET: Int32
The offset of the routine error field within the major status code.
var GSS_C_SUPPLEMENTARY_MASK: UInt
A mask with a width that matches the supplementary information field.
var GSS_C_SUPPLEMENTARY_OFFSET: Int32
The offset of the supplementary information field within the major status code.
Allocating and Releasing Objects
Manage memory and object lifetimes.
Buffer Management
Allocate and deallocate buffers with structures that hold a variety of data.
Context Services
Use context services to manage secure operations between endpoints.
Masks and Offsets
See Also
Memory and Context


## Page 8

typealias gss_qop_t
A quality of protection setting.
typealias gss_iov_buffer_t
The structure for a vectored I/O buffer and its defined type.
typealias gss_iov_buffer_desc
The structure for a vectored I/O buffer and its defined type.
struct gss_iov_buffer_desc_struct
The structure for a vectored I/O buffer and its defined type.
typealias gss_buffer_t
A pointer to a buffer descriptor that you use to exchange octet streams with many GSS-API
functions.
typealias gss_const_buffer_t
A pointer to an immutable buffer descriptor that you use to exchange octet streams with ma
GSS-API functions.
typealias gss_buffer_set_t
A pointer to the descriptor that you use to manage an array of buffer descriptors.
typealias gss_buffer_desc
The buffer descriptor that you use to exchange octet streams with many GSS-API functions.
Topics
Buffer Data Structures
GSS / Buffer Management
API Collection
Buffer Management
Allocate and deallocate buffers with structures that hold a variety of data.


## Page 9

struct gss_buffer_desc_struct
The structure for a buffer descriptor that you use to exchange octet streams with many GSS
API functions.
typealias gss_buffer_set_desc
The descriptor that you use to manage an array of buffer descriptors.
struct gss_buffer_set_desc_struct
The structure for a buffer set descriptor that you use to manage an array of buffer
descriptors.
func gss_create_empty_buffer_set(UnsafeMutablePointer<OM_uint32>, Unsaf
MutablePointer<gss_buffer_set_t?>) -> OM_uint32
Allocates an empty buffer set descriptor that you use to manage an array of buffers.
func gss_add_buffer_set_member(UnsafeMutablePointer<OM_uint32>, gss
_buffer_t, UnsafeMutablePointer<gss_buffer_set_t>) -> OM_uint32
Copies the contents of a buffer into a buffer set.
func gss_release_buffer(UnsafeMutablePointer<OM_uint32>, gss_buffer_t) 
> OM_uint32
Frees the memory associated with a single buffer descriptor.
func gss_release_buffer_set(UnsafeMutablePointer<OM_uint32>, Unsafe
MutablePointer<gss_buffer_set_t?>) -> OM_uint32
Frees the memory associated with a buffer set descriptor and all the buffers it contains.
Allocating and Releasing Objects
Manage memory and object lifetimes.
Function Status
Evaluate return values that most GSS-API functions use to indicate the outcome of an
operation.
Allocation and Deallocation
See Also
Memory and Context


## Page 10

Context Services
Use context services to manage secure operations between endpoints.


## Page 11

You use these flags as input to gss_init_sec_context(_:_:_:_:_:_:_:_:_:_:_:_:_:)
to request certain context services. You also receive them as output from both that function and
gss_accept_sec_context(_:_:_:_:_:_:_:_:_:_:_:), indicating which services are
actually engaged. Requesting a service does not guarantee its availability.
Because these flags represent the bits of an integer, you combine them with a bitwise OR and pul
them apart using bitwise AND, as shown below.
var GSS_C_DELEG_FLAG: Int32
A flag that permits delegation of the initiator’s credentials by the acceptor.
var GSS_C_MUTUAL_FLAG: Int32
Overview
Topics
Flags
GSS / Context Services
API Collection
Context Services
Use context services to manage secure operations between endpoints.


## Page 12

A flag that authenticates the credentials of both initiator and acceptor.
var GSS_C_REPLAY_FLAG: Int32
A flag that detects repeated messages.
var GSS_C_SEQUENCE_FLAG: Int32
A flag that detects out of sequence messages.
var GSS_C_CONF_FLAG: Int32
A flag that makes confidentiality services (that is, encryption) available for transferred
messages.
var GSS_C_INTEG_FLAG: Int32
A flag that makes integrity services (that is, cryptographic signatures) available for transferre
messages.
var GSS_C_ANON_FLAG: Int32
A flag that ensures the initiator remains anonymous to the acceptor.
var GSS_C_PROT_READY_FLAG: Int32
A flag that provides an early indication of the availability of confidentiality and integrity
services.
var GSS_C_TRANS_FLAG: Int32
A flag that indicates that a context can is exportable, for example to transfer it to another
process on the same machine.
var GSS_C_DCE_STYLE: Int32
A flag that causes an extra AP reply to be sent from the client back to the server after
receiving the server’s AP reply.
var GSS_C_IDENTIFY_FLAG: Int32
A flag that indicates identification of the client by name and ID only.
var GSS_C_EXTENDED_ERROR_FLAG: Int32
A flag that indicates that the client wants to be informed of extended error information.
var GSS_C_DELEG_POLICY_FLAG: Int32
A flag that indicates delegation is permissible if the mechanism policy allows it.
The constant definitions for channel-binding address families.
Address Families


## Page 13

var GSS_C_AF_NS: Int32
The Xerox NS address type.
var GSS_C_AF_BSC: Int32
The BISYNC 2780/3780 address type.
var GSS_C_AF_DLI: Int32
The direct data link interface address type.
var GSS_C_AF_DSS: Int32
The distributed system services address type.
var GSS_C_AF_LAT: Int32
The LAT address type.
var GSS_C_AF_NBS: Int32
The nbs address type.
var GSS_C_AF_OSI: Int32
The OSI TP4 address type.
var GSS_C_AF_PUP: Int32
The PUP protocols (for example, BSP) address type.
var GSS_C_AF_SNA: Int32
The IBM SNA address type.
var GSS_C_AF_X25: Int32
The X.25 address type.
var GSS_C_AF_ECMA: Int32
The ECMA address type.
var GSS_C_AF_INET: Int32
The Internet (for example, IP) address type.
var GSS_C_AF_CCITT: Int32
The CCITT protocols address type.
var GSS_C_AF_CHAOS: Int32
The MIT CHAOS protocol address type.
var GSS_C_AF_INET6: Int32


## Page 14

The IPv6 address type.
var GSS_C_AF_LOCAL: Int32
The host-local address type.
var GSS_C_AF_DECnet: Int32
The DECnet address type.
var GSS_C_AF_HYLINK: Int32
The NSC Hyperchannel address type.
var GSS_C_AF_UNSPEC: Int32
The unspecified address type.
var GSS_C_AF_DATAKIT: Int32
The datakit protocols address type.
var GSS_C_AF_IMPLINK: Int32
ARPAnet IMP address type.
var GSS_C_AF_NULLADDR: Int32
No address specified.
var GSS_C_AF_APPLETALK: Int32
The AppleTalk address type.
The keys used in the dictionary specified by the kGSSICAppleSourceApp key.
var kGSSICAppleSourceAppPID: String
A number that indicates the process ID of the app.
var kGSSICAppleSourceAppAuditToken: String
The audit token of the app’s process.
var kGSSICAppleSourceAppSigningIdentity: String
The bundle signing identity of the app.
typealias gss_ctx_id_t
Apple Source App Keys
Channel Bindings


## Page 15

A pointer to an opaque type that you use to communicate context pointers with GSS-API
functions.
struct gss_channel_bindings_struct
The structure defining a channel bindings descriptor that specifies the communications
channel used to carry a context.
typealias gss_channel_bindings_t
A pointer to a channel bindings descriptor that specifies the communications channel used t
carry a context.
typealias gss_const_channel_bindings_t
A pointer to an immutable channel bindings descriptor that you use to specify the
communications channel used to carry a context.
func gss_init_sec_context(UnsafeMutablePointer<OM_uint32>, gss_cred_id_
?, UnsafeMutablePointer<gss_ctx_id_t?>, gss_name_t, gss_OID?, OM_uint32
OM_uint32, gss_channel_bindings_t?, gss_buffer_t?, UnsafeMutablePointer
gss_OID?>?, gss_buffer_t, UnsafeMutablePointer<OM_uint32>?, Unsafe
MutablePointer<OM_uint32>?) -> OM_uint32
Initiates a security context with a peer.
func gss_accept_sec_context(UnsafeMutablePointer<OM_uint32>, Unsafe
MutablePointer<gss_ctx_id_t?>, gss_cred_id_t?, gss_buffer_t?, gss
_channel_bindings_t?, UnsafeMutablePointer<gss_name_t?>?, UnsafeMutable
Pointer<gss_OID?>?, gss_buffer_t, UnsafeMutablePointer<OM_uint32>?,
UnsafeMutablePointer<OM_uint32>?, UnsafeMutablePointer<gss_cred_id_t?>?
-> OM_uint32
Accepts a security context initiated by a peer.
func gss_delete_sec_context(UnsafeMutablePointer<OM_uint32>, Unsafe
MutablePointer<gss_ctx_id_t?>, gss_buffer_t?) -> OM_uint32
Deletes a security context.
func gss_release_cred(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_cred_id_t?>) -> OM_uint32
Releases the memory of a credential.
func gss_process_context_token(UnsafeMutablePointer<OM_uint32>, gss_ctx
_id_t, gss_buffer_t) -> OM_uint32
Processes a token from a peer asynchronously.
Creation and Deletion


## Page 16

func gss_set_sec_context_option(UnsafeMutablePointer<OM_uint32>, Unsafe
MutablePointer<gss_ctx_id_t>?, gss_OID, gss_buffer_t?) -> OM_uint32
Sets an option on a context.
func gss_context_time(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t,
UnsafeMutablePointer<OM_uint32>) -> OM_uint32
Returns the amount of time remaining before a context expires.
func gss_inquire_context(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t,
UnsafeMutablePointer<gss_name_t?>?, UnsafeMutablePointer<gss_name_t?>?,
UnsafeMutablePointer<OM_uint32>?, UnsafeMutablePointer<gss_OID?>?,
UnsafeMutablePointer<OM_uint32>?, UnsafeMutablePointer<Int32>?, Unsafe
MutablePointer<Int32>?) -> OM_uint32
Returns information about a security context.
func gss_inquire_sec_context_by_oid(UnsafeMutablePointer<OM_uint32>, gs
_ctx_id_t, gss_OID, UnsafeMutablePointer<gss_buffer_set_t>?) -> OM
_uint32
Returns information about a particular part of a context.
func gss_wrap_size_limit(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t,
Int32, gss_qop_t, OM_uint32, UnsafeMutablePointer<OM_uint32>) -> OM
_uint32
Returns the largest allowable wrap size for a given set of constraints.
func gss_export_sec_context(UnsafeMutablePointer<OM_uint32>, Unsafe
MutablePointer<gss_ctx_id_t?>, gss_buffer_t?) -> OM_uint32
Transfers a security context to another process.
func gss_import_sec_context(UnsafeMutablePointer<OM_uint32>, gss_buffer
_t, UnsafeMutablePointer<gss_ctx_id_t?>) -> OM_uint32
Imports a security context from another process.
Inquiry and Limits
Import and Export
See Also


## Page 17

Allocating and Releasing Objects
Manage memory and object lifetimes.
Function Status
Evaluate return values that most GSS-API functions use to indicate the outcome of an
operation.
Buffer Management
Allocate and deallocate buffers with structures that hold a variety of data.
Memory and Context


