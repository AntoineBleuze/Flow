# Messages.pdf

## Page 1

The basic unit of currency in the GSS-API is the token. Applications using the GSS-API
communicate with each other by using tokens, both for exchanging data and for making security
arrangements. Tokens are declared as gss_buffer_t data types and are opaque to applications
var GSS_IOV_BUFFER_FLAG_ALLOCATE: Int32
GSS should perform the allocation.
var GSS_IOV_BUFFER_FLAG_ALLOCATED: Int32
The caller should free the buffer.
var GSS_IOV_BUFFER_TYPE_DATA: Int32
The buffer type is packet data.
var GSS_IOV_BUFFER_TYPE_EMPTY: Int32
The buffer type is empty.
var GSS_IOV_BUFFER_TYPE_FLAG_ALLOCATE: Int32
GSS should perform the allocation.
var GSS_IOV_BUFFER_TYPE_FLAG_ALLOCATED: Int32
Overview
Topics
Buffer Flags
GSS / Token Management
API Collection
Token Management
Establish secure communication with tokens.


## Page 2

The caller should free the buffer.
var GSS_IOV_BUFFER_TYPE_FLAG_MASK: UInt32
The buffer type is a flag mask.
var GSS_IOV_BUFFER_TYPE_HEADER: Int32
The buffer type is a mechanism header.
var GSS_IOV_BUFFER_TYPE_MECH_PARAMS: Int32
The buffer contains mechanism-specific parameters.
var GSS_IOV_BUFFER_TYPE_PADDING: Int32
The buffer contains padding.
var GSS_IOV_BUFFER_TYPE_SIGN_ONLY: Int32
The buffer contains sign-only packet data.
var GSS_IOV_BUFFER_TYPE_STREAM: Int32
The buffer contains a complete wrap token.
var GSS_IOV_BUFFER_TYPE_TRAILER: Int32
The buffer contains a mechanism trailer.
Transfer tokens between peers by encapsulating and decapsulating them.
func gss_encapsulate_token(gss_const_buffer_t, gss_const_OID, gss_buffe
_t) -> OM_uint32
Returns a buffer encapsulating the given token.
func gss_decapsulate_token(gss_const_buffer_t, gss_const_OID, gss_buffe
_t) -> OM_uint32
Returns a token encapsulated in a buffer.
Message Protection
Encapsulation and Decapsulation
See Also
Messages


## Page 3

Provide cryptographic protection to secure message integrity.
Kerberos Implementation
Establish secure connections using the Kerberos implementation of GSS-API.


## Page 4

Apply a Message Integrity Code (MIC) to a message to guarantee its integrity. Ensure
confidentiality using encryption and decryption.
func gss_get_mic(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, gss_qop
_t, gss_buffer_t, gss_buffer_t) -> OM_uint32
Returns a token that contains the MIC for a message.
func gss_verify_mic(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, gss
_buffer_t, gss_buffer_t, UnsafeMutablePointer<gss_qop_t>?) -> OM_uint32
Returns an indication of whether the integrity of a message is intact, given its MIC token.
func gss_wrap(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, Int32, gss
_qop_t, gss_buffer_t, UnsafeMutablePointer<Int32>?, gss_buffer_t) -> OM
_uint32
Returns a secure message created by calculating and attaching a MIC to the input message,
and then optionally encrypting it.
func gss_unwrap(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, gss
_buffer_t, gss_buffer_t, UnsafeMutablePointer<Int32>?, UnsafeMutable
Pointer<gss_qop_t>?) -> OM_uint32
Returns the original version of a secure message by optionally decrypting it and then
extracting and verifying the attached MIC.
func gss_sign(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, Int32, gss
_buffer_t, gss_buffer_t) -> OM_uint32
Topics
Message Wrapping and Verification
GSS / Message Protection
API Collection
Message Protection
Provide cryptographic protection to secure message integrity.


## Page 5

Returns a digital signature for a message.
Deprecated
func gss_verify(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, gss
_buffer_t, gss_buffer_t, UnsafeMutablePointer<Int32>) -> OM_uint32
Returns a flag that indicates the integrity of a message’s digital signature.
Deprecated
func gss_seal(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, Int32,
Int32, gss_buffer_t, UnsafeMutablePointer<Int32>, gss_buffer_t) -> OM
_uint32
Returns a secure message created by calculating and attaching a MIC to the input message,
and then optionally encrypting it.
Deprecated
func gss_unseal(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t, gss
_buffer_t, gss_buffer_t, UnsafeMutablePointer<Int32>, UnsafeMutable
Pointer<Int32>) -> OM_uint32
Returns the original version of a secure message by optionally decrypting it and then
extracting and verifying the attached MIC.
Deprecated
Token Management
Establish secure communication with tokens.
Kerberos Implementation
Establish secure connections using the Kerberos implementation of GSS-API.
See Also
Messages


## Page 6

typealias gss_krb5_cfx_keydata_t
The structure of a Kerberos context and acceptor-asserted key.
typealias gss_krb5_lucid_context_v1_t
The structure of a Kerberos context.
typealias gss_krb5_lucid_context_version_t
The structure for determining the returned Kerberos lucid context structure version.
typealias gss_krb5_lucid_key_t
The structure for a Kerberos encryption key.
typealias gss_krb5_rfc1964_keydata_t
The structure for an RFC 1964-compliant Kerberos encryption key.
func gss_krb5_export_lucid_sec_context(UnsafeMutablePointer<OM_uint32>,
UnsafeMutablePointer<gss_ctx_id_t?>, OM_uint32, UnsafeMutablePointer<
UnsafeMutableRawPointer>?) -> OM_uint32
Returns a non-opaque version of the internal context information.
func gsskrb5_extract_authz_data_from_sec_context(UnsafeMutablePointer<O
_uint32>, gss_ctx_id_t, Int32, gss_buffer_t) -> OM_uint32
Topics
Contexts and Keys
Identity and Settings
GSS / Kerberos Implementation
API Collection
Kerberos Implementation
Establish secure connections using the Kerberos implementation of GSS-API.


## Page 7

Extracts Kerberos authorization data stored within the context.
func gss_krb5_ccache_name(UnsafeMutablePointer<OM_uint32>, UnsafePointe
<CChar>?, UnsafeMutablePointer<UnsafePointer<CChar>?>?) -> OM_uint32
Sets the internal Kerberos 5 credential cache name.
func gss_krb5_free_lucid_sec_context(UnsafeMutablePointer<OM_uint32>,
UnsafeMutableRawPointer) -> OM_uint32
Frees allocated storage associated with an exported context.
func gss_krb5_set_allowable_enctypes(UnsafeMutablePointer<OM_uint32>,
gss_cred_id_t, OM_uint32, UnsafeMutablePointer<Int32>) -> OM_uint32
Limits the keys that can be exported to the specified types.
func gsskrb5_register_acceptor_identity(UnsafePointer<CChar>) -> OM
_uint32
Sets the Kerberos 5 file-based key that the acceptor will use.
func krb5_gss_register_acceptor_identity(UnsafePointer<CChar>) -> OM
_uint32
Sets the Kerberos 5 file-based key that the acceptor will use.
func gss_krb5_copy_ccache(UnsafeMutablePointer<OM_uint32>, gss_cred_id_
, OpaquePointer) -> OM_uint32
Copies Kerberos 5 credentials into the passed cache.
Deprecated
Token Management
Establish secure communication with tokens.
Message Protection
Provide cryptographic protection to secure message integrity.
See Also
Messages


