# 000_Token Management.pdf

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


