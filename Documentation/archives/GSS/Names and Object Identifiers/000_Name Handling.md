# 000_Name Handling.pdf

## Page 1

typealias gss_name_t
A pointer to an opaque type that you use to communicate name objects with GSS-API
functions.
typealias gss_const_name_t
A pointer to an immutable version of the opaque descriptor used to exchange name objects
with GSS-API functions.
func gss_canonicalize_name(UnsafeMutablePointer<OM_uint32>, gss_name_t,
gss_OID, UnsafeMutablePointer<gss_name_t?>) -> OM_uint32
Converts an internal name into a mechanism name.
func GSSNameCreateDisplayString(gss_name_t) -> Unmanaged<CFString>?
Returns a string suitable for displaying to the user from a GSS name.
func GSSCreateName(CFTypeRef, gss_const_OID, UnsafeMutablePointer<
Unmanaged<CFError>?>?) -> gss_name_t?
Returns a GSS name given a buffer and a type.
func gss_release_name(UnsafeMutablePointer<OM_uint32>, UnsafeMutable
Pointer<gss_name_t?>) -> OM_uint32
Frees the resources associated with a name object.
Topics
Creation and Destruction
GSS / Name Handling
API Collection
Name Handling
Manage names for GSS-API principals such as a person, a machine, or an
application.


## Page 2

Create, compare, and examine names, the objects used to identify entities.
func gss_display_name(UnsafeMutablePointer<OM_uint32>, gss_name_t, gss
_buffer_t, UnsafeMutablePointer<gss_OID?>?) -> OM_uint32
Converts a name in the internal format to an octet string and the associated name type.
func gss_compare_name(UnsafeMutablePointer<OM_uint32>, gss_name_t, gss
_name_t, UnsafeMutablePointer<Int32>) -> OM_uint32
Returns a flag that indicates if two names in internal name format refer to the same entity.
func gss_inquire_name(UnsafeMutablePointer<OM_uint32>, gss_name_t,
UnsafeMutablePointer<Int32>, UnsafeMutablePointer<gss_OID?>?, Unsafe
MutablePointer<gss_buffer_set_t?>?) -> OM_uint32
Returns information about a name.
func gss_inquire_mechs_for_name(UnsafeMutablePointer<OM_uint32>, gss
_name_t, UnsafeMutablePointer<gss_OID_set?>) -> OM_uint32
Returns a list of mechanisms that support a particular name type.
func gss_inquire_names_for_mech(UnsafeMutablePointer<OM_uint32>, gss
_const_OID, UnsafeMutablePointer<gss_OID_set?>) -> OM_uint32
Returns a list of name types that a given mechanism supports.
func gss_duplicate_name(UnsafeMutablePointer<OM_uint32>, gss_name_t,
UnsafeMutablePointer<gss_name_t?>) -> OM_uint32
Returns a copy of an internal name.
func gss_aapl_change_password(gss_name_t, gss_const_OID, CFDictionary,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> OM_uint32
Changes the password associated with a name.
func gss_userok(gss_name_t, UnsafePointer<CChar>) -> Int32
Returns a flag that indicates if a given user is authorized.
func gss_export_name(UnsafeMutablePointer<OM_uint32>, gss_name_t, gss
_buffer_t) -> OM_uint32
Returns a mechanism name in contiguous octet format.
Inquiries
Imports and Exports


## Page 3

func gss_import_name(UnsafeMutablePointer<OM_uint32>, gss_buffer_t, gss
_const_OID?, UnsafeMutablePointer<gss_name_t?>) -> OM_uint32
Converts a name in contiguous octet format to the internal name format.
Object Identifiers
Store security mechanisms, QOPs (Quality of Protection values), and name types.
See Also
Names and Object Identifiers


