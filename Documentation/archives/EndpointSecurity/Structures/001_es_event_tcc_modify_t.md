# 001_es_event_tcc_modify_t.pdf

## Page 1

TCC Modification Event. Occurs when a TCC permission is granted or revoked.
Note
This event type does not support caching.
init()
init(service: es_string_token_t, identity: es_string_token_t, identity
_type: es_tcc_identity_type_t, update_type: es_tcc_event_type_t,
instigator_token: audit_token_t, instigator: UnsafeMutablePointer<es
_process_t>?, responsible_token: UnsafeMutablePointer<audit_token_t>?,
responsible: UnsafeMutablePointer<es_process_t>?, right: es_tcc
_authorization_right_t, reason: es_tcc_authorization_reason_t)
Overview
Topics
Initializers
Instance Properties
Endpoint Security / es_event_tcc_modify_t
Structure
es_event_tcc_modify_t
Mac Catalyst
macOS


## Page 2

var identity: es_string_token_t
var identity_type: es_tcc_identity_type_t
es_tcc_identity_type_t
var instigator: UnsafeMutablePointer<es_process_t>?
var instigator_token: audit_token_t
var reason: es_tcc_authorization_reason_t
ess_tcc_authorization_reason_t
var responsible: UnsafeMutablePointer<es_process_t>?
var responsible_token: UnsafeMutablePointer<audit_token_t>?
var right: es_tcc_authorization_right_t
ess_tcc_authorization_right_t
var service: es_string_token_t
var update_type: es_tcc_event_type_t
BitwiseCopyable
Relationships
Conforms To


