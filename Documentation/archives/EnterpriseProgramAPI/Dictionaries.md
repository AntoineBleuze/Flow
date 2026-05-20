# Dictionaries.pdf

## Page 1

pointer
string
(Required) A JSON pointer that indicates the location in the request entity
where the error originates.
Possible types:
In some cases, the JSON pointer may indicate an element that isn’t in the request entity, but shou
be. For more information about JSON pointers, see the RFC 6901 proposed standards document.
object Parameter
An object that contains the query parameter that produced the error.
object ErrorResponse.Errors.Meta
Properties
Attributes
Discussion
See Also
Objects
Enterprise Program API / JsonPointer
Object
JsonPointer
An object that contains the JSON pointer that indicates the location of the error.


## Page 2

An object that contains the error itself or associated errors.


## Page 3

parameter
string
(Required) The query parameter that produced the error.
Possible types:
object JsonPointer
An object that contains the JSON pointer that indicates the location of the error.
object ErrorResponse.Errors.Meta
An object that contains the error itself or associated errors.
Properties
Attributes
See Also
Objects
Enterprise Program API / Parameter
Object
Parameter
An object that contains the query parameter that produced the error.


## Page 4

related
uri-reference
self
uri-reference
Possible types:
object Profile.Relationships.Devices.Data
The type and ID of a related resource.
Properties
Attributes
See Also
Objects
Enterprise Program API / RelationshipLinks
Object
RelationshipLinks
The links to the related data and the relationship’s self-link.


