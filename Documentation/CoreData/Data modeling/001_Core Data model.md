# 001_Core Data model.pdf

## Page 1

In most cases, you describe your app’s data model using Xcode’s data model editor. NSManaged
ObjectModel represents the .xcdatamodeld file in your project’s source list. This is where yo
define entities that you use to generate NSManagedObject subclasses for Core Data to manage
The entities you create are NSEntityDescription instances. Entities’ properties are subclasse
of NSPropertyDescription, namely NSAttributeDescription for attributes,
NSRelationshipDescription for relationships, and NSFetchedPropertyDescription fo
fetched properties.
The various attribute types are enumerated in NSAttributeType.
class NSManagedObject
The base class that all Core Data model objects inherit from.
class NSEntityDescription
A description of a Core Data entity.
class NSPropertyDescription
A description of a single property belonging to an entity.
Overview
Topics
Objects and entities
Standard attributes
Core Data / Core Data model
API Collection
Core Data model
Describe your app’s object structure.


## Page 2

class NSAttributeDescription
A description of a single attribute belonging to an entity.
enum NSAttributeType
The types of attribute that Core Data supports.
class NSRelationshipDescription
A description of a relationship between two entities.
class NSCompositeAttributeDescription
A description of an attribute that derives its value by composing other attributes.
class NSDerivedAttributeDescription
A description of an attribute that derives its value by performing a calculation on a related
attribute.
class NSFetchedPropertyDescription
A description object used to define which properties are fetched from Core Data.
Modeling data
Configure the data model file to contain your app’s object graph.
Computed attributes
Fetched properties
See Also
Data modeling


