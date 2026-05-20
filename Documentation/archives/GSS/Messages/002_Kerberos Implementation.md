# 002_Kerberos Implementation.pdf

## Page 1

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


## Page 2

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


