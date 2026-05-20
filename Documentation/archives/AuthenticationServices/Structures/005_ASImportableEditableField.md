# 005_ASImportableEditableField.pdf

## Page 1

Examples of editable fields include ASImportableCredential/Basic
Authentication/username and password in ASImportableCredential.Basic
Authentication.
This type is a representation of EditableField as defined in the Credential Exchange Format
(CXF) specification. You can supply a JSON representation of a CXF EditableField to initialize
an instance of this struct by using a JSONDecoder and calling decode(_:from:).
init(id: Data?, fieldType: ASImportableEditableField.FieldType, value:
String, label: String?)
Creates an editable field instance.
var id: Data?
A unique identifier for this editable field.
Overview
Topics
Creating an editable field
Accessing field properties
Authentication Services / ASImportableEditableField
Structure
ASImportableEditableField
A field that someone can edit within a credential.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

var fieldType: ASImportableEditableField.FieldType
The type of this editable field.
enum FieldType
An enumeration of editable field types.
var value: String
The value stored in this editable field.
var label: String?
A value describing the field, if any.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
var password: ASImportableEditableField?
The password associated with the credential.
Relationships
Conforms To
See Also
Accessing authentication properties


