# Structures.pdf

## Page 1

Indicates the code signature validation policy that was applied to a binary
init(UInt32)
init(rawValue: UInt32)
var rawValue: UInt32
Overview
Topics
Initializers
Instance Properties
Relationships
Conforms To
Endpoint Security / es_cs_validation_category_t
Structure
es_cs_validation_category_t
es_cs_validation_category
Mac Catalyst
macOS


## Page 2

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable


## Page 3

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


## Page 4

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


## Page 5

Represents the reason a TCC permission was updated.
init(UInt32)
init(rawValue: UInt32)
var rawValue: UInt32
Overview
Topics
Initializers
Instance Properties
Relationships
Conforms To
Endpoint Security / es_tcc_authorization_reason_t
Structure
es_tcc_authorization_reason_t
ess_tcc_authorization_reason_t
Mac Catalyst
macOS


## Page 6

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable


## Page 7

Represents the type of authorization permission an application has to a TCC Service.
init(UInt32)
init(rawValue: UInt32)
var rawValue: UInt32
Overview
Topics
Initializers
Instance Properties
Relationships
Conforms To
Endpoint Security / es_tcc_authorization_right_t
Structure
es_tcc_authorization_right_t
ess_tcc_authorization_right_t
Mac Catalyst
macOS


## Page 8

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable


## Page 9

Represent the type of TCC modification event.
ES_TCC_EVENT_TYPE_UNKNOWN: Unknown prior state.
ES_TCC_EVENT_TYPE_CREATE: A new TCC authorization record was created.
ES_TCC_EVENT_TYPE_MODIFY: An existing TCC authorization record was modified.
ES_TCC_EVENT_TYPE_DELETE: An existing TCC authorization record was deleted.
init(UInt32)
init(rawValue: UInt32)
var rawValue: UInt32
Overview
Topics
Initializers
Instance Properties
Endpoint Security / es_tcc_event_type_t
Structure
es_tcc_event_type_t
Mac Catalyst
macOS


## Page 10

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
Relationships
Conforms To


## Page 11

Represent the identity type of an application which has access to a TCC service.
init(UInt32)
init(rawValue: UInt32)
var rawValue: UInt32
Overview
Topics
Initializers
Instance Properties
Relationships
Conforms To
Endpoint Security / es_tcc_identity_type_t
Structure
es_tcc_identity_type_t
es_tcc_identity_type_t
Mac Catalyst
macOS


## Page 12

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable


