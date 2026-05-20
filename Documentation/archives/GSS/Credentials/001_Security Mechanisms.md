# 001_Security Mechanisms.pdf

## Page 1

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


## Page 2

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


