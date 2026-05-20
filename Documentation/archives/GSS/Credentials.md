# Credentials.pdf

## Page 1

func GSSCreateCredentialFromUUID(CFUUID) -> gss_cred_id_t?
Creates a credential from a universally unique identifier.
func gss_add_cred(UnsafeMutablePointer<OM_uint32>, gss_cred_id_t?, gss
_name_t?, gss_OID?, gss_cred_usage_t, OM_uint32, OM_uint32, Unsafe
MutablePointer<gss_cred_id_t?>, UnsafeMutablePointer<gss_OID_set?>?,
UnsafeMutablePointer<OM_uint32>?, UnsafeMutablePointer<OM_uint32>?) ->
OM_uint32
Adds a new credential element to an existing credential.
func gss_set_cred_option(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_cred_id_t?>?, gss_OID, gss_buffer_t?) -> OM_uint32
Changes a credential option.
func gss_release_cred(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_cred_id_t?>) -> OM_uint32
Releases the memory of a credential.
func gss_destroy_cred(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_cred_id_t?>) -> OM_uint32
Purges a credential from memory.
Topics
Allocation and Deallocation
Initial Credential Keys
GSS / Credential Management
API Collection
Credential Management
Securely establish connections between endpoints.


## Page 2

The keys used in the attributes dictionary when acquiring new credentials.
var kGSSICPassword: String
The value is a string that indicates a password.
var kGSSICCertificate: String
The value that indicates a certificate to use with PKINIT/PKU2U.
var kGSSCredentialUsage: String
The value indicates how to use the credential.
var kGSSICVerifyCredential: String
The value indicates whether to validate the credential with a trusted source to ensure there
was no machine-in-the-middle attack.
var kGSSICLKDCHostname: String
The value is a string indicating the LKDC hostname.
var kGSSICKerberosCacheName: String
The value is a string indicating the name of the cache created for use with the Kerberos
mechanism.
var kGSSICSiteName: String
The value is a string that is the name of site you are authenticating with, used for load
balancing in DNS in Kerberos.
var kGSSICAppIdentifierACL: String
The value is an array of strings containing the list of bundle ID prefixes allowed to access this
credential.
var kGSSICCreateNewCredential: String
The value is a Boolean that indicates whether the caller wants to create a new credential and
not overwrite a credential with the same name.
var kGSSICAppleSourceApp: String
The value is a dictionary indicating attributes of the app that the credential is for (only applie
to AppVPN).
var kGSSICVerifyCredentialAcceptorName: String
The value is a string indicating the name of the acceptor.
var kGSSICAuthenticationContext: String
The value indicates whether to allow the authentication UI or a context to pass a pre-
evaluated authentication context.


## Page 3

var GSS_C_PRF_KEY_FULL: Int32
This value indicates using the sub-session key by acceptor, initiator, or the ticket’s session
key.
var GSS_C_PRF_KEY_PARTIAL: Int32
This value indicates using the sub-session key the initiator or the ticket’s session key.
The values for use with the credential usage key.
var kGSS_C_INITIATE: String
The value that indicates a credential may be used to initiate a context.
var kGSS_C_ACCEPT: String
The value that indicates that a credential may be used to accept a context.
var kGSS_C_BOTH: String
The value that indicates that a credential may be used to either initiate or accept a context.
The keys used in the attributes dictionary for the changing passwords.
var kGSSChangePasswordOldPassword: String
The value is a string that indicates the old password.
var kGSSChangePasswordNewPassword: String
The value is a string that indicates the new password.
var GSS_C_INDEFINITE: UInt
The value that indicates the maximum permitted lifetime when used in a time request.
var GSS_C_INITIATE: Int32
The value that indicates a credential that can initiate a security context.
var GSS_C_ACCEPT: Int32
Pseudo Random Constants
Credential Usage Values
Password Keys
Credential Masks and Macros


## Page 4

The value that indicates a credential that can accept a security context.
var GSS_C_BOTH: Int32
The value that indicates a credential that can both initiate and accept security contexts.
var GSS_C_OPTION_MASK: Int32
The masking constant for options.
var GSS_C_CRED_NO_UI: Int32
The value that indicates no UI.
typealias gss_auth_identity_t
A pointer to an opaque object used to manage authentication identities.
typealias gss_const_cred_id_t
A pointer to an immutable opaque type that you use to exchange a credential object with
GSS-API functions.
typealias gss_cred_id_t
A pointer to an opaque type that you use to exchange a credential object with GSS-API
functions.
typealias gss_cred_usage_t
A credential usage value.
func gss_aapl_initial_cred(gss_name_t, gss_const_OID, CFDictionary?,
UnsafeMutablePointer<gss_cred_id_t?>, UnsafeMutablePointer<Unmanaged<
CFError>?>?) -> OM_uint32
Acquires a new credential using a password or certificate.
func gss_acquire_cred(UnsafeMutablePointer<OM_uint32>, gss_name_t?, OM
_uint32, gss_OID_set?, gss_cred_usage_t, UnsafeMutablePointer<gss_cred
_id_t?>, UnsafeMutablePointer<gss_OID_set?>?, UnsafeMutablePointer<OM
_uint32>?) -> OM_uint32
Acquires a credential for use in establishing a security context.
func gss_acquire_cred_with_password(UnsafeMutablePointer<OM_uint32>, gs
_name_t, gss_buffer_t, OM_uint32, gss_OID_set?, gss_cred_usage_t, Unsaf
MutablePointer<gss_cred_id_t?>, UnsafeMutablePointer<gss_OID_set?>?,
UnsafeMutablePointer<OM_uint32>?) -> OM_uint32
Acquires a credential for use in establishing a security context using a password.
Acquisition


## Page 5

func GSSCredentialCopyUUID(gss_cred_id_t) -> Unmanaged<CFUUID>?
Returns a copy of the universally unique identifier corresponding to a GSS credential.
func GSSCredentialCopyName(gss_cred_id_t) -> gss_name_t?
Returns the name describing the credential.
func gss_pseudo_random(UnsafeMutablePointer<OM_uint32>, gss_ctx_id_t,
Int32, gss_buffer_t, Int, gss_buffer_t) -> OM_uint32
Returns a pseudo-random byte stream for keying.
func gss_inquire_cred(UnsafeMutablePointer<OM_uint32>, gss_cred_id_t?,
UnsafeMutablePointer<gss_name_t?>?, UnsafeMutablePointer<OM_uint32>?,
UnsafeMutablePointer<gss_cred_usage_t>?, UnsafeMutablePointer<gss_OID
_set?>?) -> OM_uint32
Obtains information about a credential.
func gss_inquire_cred_by_mech(UnsafeMutablePointer<OM_uint32>, gss_cred
_id_t?, gss_OID, UnsafeMutablePointer<gss_name_t?>?, UnsafeMutable
Pointer<OM_uint32>?, UnsafeMutablePointer<OM_uint32>?, UnsafeMutable
Pointer<gss_cred_usage_t>?) -> OM_uint32
Obtains per-mechanism information about a credential.
func gss_inquire_cred_by_oid(UnsafeMutablePointer<OM_uint32>, gss_cred
_id_t, gss_OID, UnsafeMutablePointer<gss_buffer_set_t?>) -> OM_uint32
Inquires about a particular characteristic of a credential.
func GSSCredentialGetLifetime(gss_cred_id_t) -> OM_uint32
Returns the remaining time in seconds before the credential expires.
func gss_iter_creds(UnsafeMutablePointer<OM_uint32>, OM_uint32, gss
_const_OID?, (gss_OID?, gss_cred_id_t?) -> Void) -> OM_uint32
Iterates over all credentials.
func gss_iter_creds_f(UnsafeMutablePointer<OM_uint32>, OM_uint32, gss
_const_OID?, UnsafeMutableRawPointer?, (UnsafeMutableRawPointer?, gss
_OID?, gss_cred_id_t?) -> Void) -> OM_uint32
Iterates over all credentials with a user context.
Inquiries
Iteration


## Page 6

func gss_import_cred(UnsafeMutablePointer<OM_uint32>, gss_buffer_t,
UnsafeMutablePointer<gss_cred_id_t?>) -> OM_uint32
Imports a credential from a token.
func gss_export_cred(UnsafeMutablePointer<OM_uint32>, gss_cred_id_t, gs
_buffer_t) -> OM_uint32
Exports a credential to a token.
Security Mechanisms
Provide a security mechanism for your implementation.
Import and Export
See Also
Credentials


## Page 7

For more information on the attributes of a mechanism, see RFC 5587.
func gss_indicate_mechs(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_OID_set?>) -> OM_uint32
Returns the list of supported underlying security mechanisms.
func gss_indicate_mechs_by_attrs(UnsafeMutablePointer<OM_uint32>, gss
_const_OID_set?, gss_const_OID_set?, gss_const_OID_set?, UnsafeMutable
Pointer<gss_OID_set?>) -> OM_uint32
Returns the set of mechanisms that fulfill the given criteria.
func gss_display_mech_attr(UnsafeMutablePointer<OM_uint32>, gss_const
_OID, gss_buffer_t?, gss_buffer_t?, gss_buffer_t?) -> OM_uint32
Returns a human-readable name and description of a mechanism attribute.
func gss_inquire_attrs_for_mech(UnsafeMutablePointer<OM_uint32>, gss
_const_OID, UnsafeMutablePointer<gss_OID_set?>?, UnsafeMutablePointer<
gss_OID_set?>?) -> OM_uint32
Returns the supported attributes for one or all mechanisms.
Overview
Topics
Queries
GSS / Security Mechanisms
API Collection
Security Mechanisms
Provide a security mechanism for your implementation.


## Page 8

func gss_inquire_mech_for_saslname(UnsafeMutablePointer<OM_uint32>, gss
_buffer_t?, UnsafeMutablePointer<gss_OID?>) -> OM_uint32
Returns the GSS-API mechanism identifier for a given Simple Authentication and Security
Layer (SASL) protocol name.
func gss_inquire_saslname_for_mech(UnsafeMutablePointer<OM_uint32>, gss
_OID, gss_buffer_t?, gss_buffer_t?, gss_buffer_t?) -> OM_uint32
Returns the Simple Authentication and Security Layer (SASL) protocol name for a given GSS
API mechanism.
Credential Management
Securely establish connections between endpoints.
See Also
Credentials


