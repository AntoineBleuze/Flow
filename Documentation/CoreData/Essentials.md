# Essentials.pdf

## Page 1

The first step in working with Core Data is to create a data model file to define the structure of yo
app’s objects, including their object types, properties, and relationships.
You can add a Core Data model file to your Xcode project when you create the project, or you can
add it to an existing project.
In the dialog for creating a new project, select the Use Core Data checkbox, and click Next.
Overview
Add Core Data to a New Xcode Project
Core Data / Creating a Core Data model
Article
Creating a Core Data model
Define your app’s object structure with a data model file.


## Page 2

The resulting project includes an .xcdatamodeld file.
Choose File > New > File and select the iOS platform tab. Scroll down to the Core Data section,
select Data Model, and click Next.
Add a Core Data Model to an Existing Project


## Page 3

Name your model file, select its group and targets, and click Create.
Xcode adds an .xcdatamodeld file with the specified name to your project.


## Page 4

Configuring Attributes
Describe the properties that compose an entity.
Configuring Relationships
Specify how entities relate and how change propagates between them.
Generating code
Automatically or manually generate managed object subclasses from entities.
Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.
Core Data stack
Manage and persist your app’s model layer.
Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
Linking Data Between Two Core Data Stores
Organize data in two different stores and implement a link between them.
See Also
Related Documentation
Essentials


## Page 5

After you create a data model file as described in Creating a Core Data model, set up the classes
that collaboratively support your app’s model layer. These classes are collectively referred to as t
Core Data stack.
An instance of NSManagedObjectModel represents your app’s model file describing your
app’s types, properties, and relationships.
An instance of NSManagedObjectContext tracks changes to instances of your app’s types.
An instance of NSPersistentStoreCoordinator saves and fetches instances of your app
types from stores.
An instance of NSPersistentContainer sets up the model, context, and store coordinator 
at once.
Overview
Core Data / Setting up a Core Data stack
Article
Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.


## Page 6

Typically, you initialize a Core Data stack as a singleton:
Once created, the persistent container holds references to the model, context, and store
coordinator instances in its managedObjectModel, viewContext, and persistentStore
Coordinator properties, respectively.
You can now use the Core Data stack througout your app.
Create an instance of the Core Data stack and inject its managed object context into your app
environment:
Initialize a Persistent Container
Inject the managed object context


## Page 7

Use an environment property wrapper to access the managed object context in your views:
Your Core Data stack is a convenient place to put related code, such as methods to save changes
and delete managed objects in the persistent store:
Add functionality to the stack


## Page 8

The save method improves performance by saving the context only when there are changes.
Setting up a Core Data stack manually
Create the individual components that Core Data requires manually, to support earlier versio
of Apple operating systems.
Creating a Core Data model
Define your app’s object structure with a data model file.
Core Data stack
Manage and persist your app’s model layer.
Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
Linking Data Between Two Core Data Stores
Organize data in two different stores and implement a link between them.
Topics
Legacy Stack Setup
See Also
Essentials


## Page 9

Core Data provides a set of classes that collaboratively support your app’s model layer:
An instance of NSManagedObjectModel describes your app’s types, including their propertie
and relationships.
An instance of NSManagedObjectContext tracks changes to instances of your app’s types.
An instance of NSPersistentStoreCoordinator saves and fetches instances of your app
types from stores.
You use an NSPersistentContainer instance to set up the model, context, and store
coordinator simultaneously.
Overview
Core Data / Core Data stack
API Collection
Core Data stack
Manage and persist your app’s model layer.


## Page 10

class NSPersistentContainer
A container that encapsulates the Core Data stack in your app.
class NSManagedObjectModel
A programmatic representation of the .xcdatamodeld file describing your objects.
class NSEntityDescription
A description of a Core Data entity.
class NSPropertyDescription
A description of a single property belonging to an entity.
class NSAttributeDescription
A description of a single attribute belonging to an entity.
class NSDerivedAttributeDescription
A description of an attribute that derives its value by performing a calculation on a related
attribute.
class NSRelationshipDescription
A description of a relationship between two entities.
class NSManagedObjectContext
An object space to manipulate and track changes to managed objects.
class NSManagedObject
The base class that all Core Data model objects inherit from.
class NSManagedObjectID
A compact, universal identifier for a managed object.
Topics
Stack Setup
Object Modeling
Object Management


## Page 11

class NSPersistentStoreCoordinator
An object that enables an app’s contexts and the underlying persistent stores to work
together.
class NSPersistentStore
The abstract base class for all Core Data persistent stores.
class NSPersistentStoreDescription
A description object used to create and load a persistent store.
class NSPersistentStoreRequest
Criteria used to retrieve data from or save data to a persistent store.
class NSPersistentStoreResult
The abstract base class for results returned from a persistent store coordinator.
class NSPersistentStoreAsynchronousResult
A concrete class used to represent the results of an asynchronous request.
class NSSaveChangesRequest
An encapsulation of a collection of changes to be made by an object store in response to a
save operation on a managed object context.
class NSAtomicStore
An abstract superclass that you subclass to create a Core Data atomic store.
class NSAtomicStoreCacheNode
A concrete class that you use to represent basic nodes in a Core Data atomic store.
class NSIncrementalStore
An abstract superclass defining the API through which Core Data communicates with a store
class NSIncrementalStoreNode
A concrete class used to represent basic nodes in a Core Data incremental store.
Store Coordination
See Also


## Page 12

Creating a Core Data model
Define your app’s object structure with a data model file.
Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.
Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
Linking Data Between Two Core Data Stores
Organize data in two different stores and implement a link between them.
Essentials


## Page 13

Many apps need to persist and present different kinds of information. Core Data provides differen
attributes, including those common for all databases, such as Date or Decimal type, and non-
standard attributes handled with Transformable type. It also provides Transient and
Derived attributes so apps can derive one piece of data from the other.
This sample shows how to handle all these data types, by creating and presenting a set of book
records. After you launch it, this sample automatically generates the records if they don’t already
exist, and shows them in a list. The records are grouped by their published month and can be
searched with their canonical form of title.
A Transient attribute is derived from one or multiple stored attributes in the same entity. As its
name implies, a Transient attribute isn’t persisted to the store, so an app can use it to provide 
new attribute based on the stored ones, without consuming extra storage space.
To make an attribute Transient, select the Core Data model in Xcode Project Navigator, navigat
to the Core Data entity, select the attribute in the attributes list, and check the Transient box in
the Data Model Inspector.
In this sample, publishMonthID is a Transient attribute derived from publishDate. To
implement the derivation, this sample provides a custom accessor for publishDate and
publishMonthID. The setter method of publishDate nullifies primitivePublishMonth
ID, which allows the getter method of publishMonthID to recalculate the value based on the
current publishDate.
Overview
Derive a Non-Persistent Value Using a Transient Attribute
Core Data / Handling Different Data Types in Core Data
Sample Code
Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
Download
iOS 13.2+
iPadOS 13.2+
Mac Catalyst 13.0+
Xcode 11.4+


## Page 14

The getter method of publishMonthID recalculates the value if primitivePublishMonth
ID is nil.
With these two methods, publishMonthID is associated with publishDate and always stays
current.
In the case where publishMonthID is key-value observed, the following code ensures tha
the observations are triggered when publishDate changes.


## Page 15

This sample uses a Derived attribute, canonicalTitle, to support searching the canonical
form of book titles. canonicalTitle is configured as the canonical form of title by setting th
following expression as the value of the Derivation field shown Xcode’s Data Model Inspector.
Derived attributes are used in cases where performance is more critical than storage space. In
this sample, the app gets the same result by setting up a predicate with CONTAINS[cd] ( where
cd means case- and diacritic-insensitive ) to search title directly. By searching canonical
Title which is persisted, the app performs more quickly because it doesn’t need to do diacritic-
insensitive comparison for every book title.
Derived attributes are only updated when the user saves the managed context. Concretely,
canonicalTitle won’t change if the sample app changes the title attribute without saving i
Transformable attributes store objects with a non-standard type, or a type that isn’t in the
attribute type list in Xcode’s Data Model Inspector. To implement a Transformable attribute,
configure it by setting its type to Transformable and specifying the transformer and custom
class name in Data Model Inspector, then register a transformer with code before an app loads its
Core Data stack.
Core Data requires the transformer be NSSecureUnarchiveFromData or its subclass, and that
its transformedValue(_:) method converts a Data object to an instance of the custom class
specified in Data Model Inspector and that reverseTransformedValue(_:) does the opposi
– converts an instance of the custom class to a Data object.
In a Core Data store, a Date attribute is a double value that represents a number of seconds sin
1970. Using a variety of calendars, time zones, and locales, an app can convert a Date value to
different date strings, or convert a date string to different Date values. When parsing a date strin
configure the DateFormatter with the right calendar, time zone, and locale. Typically, if the stri
is generated by the current user, the user-perceived calendar, time zone, and locale will be the
Derive One Value From Another Using a Derived Attribute
Configure and Implement a Non-Standard Data Type
Store and Present a Date Type


## Page 16

current system ones, so an app can use a default DateFormatter instance. In other cases,
configure DateFormatter in the same way the app generated the string.
This sample uses a Decimal attribute to represent the book price, which is then mapped to a
variable of NSDecimalNumber type. NSDecimalNumber has a convenient method to process a
currency value.
NSDecimalNumber also provides a convenient way to present a value with locale in mind.
Creating a Core Data model
Define your app’s object structure with a data model file.
Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.
Core Data stack
Manage and persist your app’s model layer.
Linking Data Between Two Core Data Stores
Organize data in two different stores and implement a link between them.
Store and Present a Decimal Type
See Also
Essentials


## Page 17

Sometimes your app needs to work with multiple Core Data stores. For example, if you need to
label data in a read-only store, you must write the labeling result to a different store. If you need t
synchronize part of a large data set to iCloud, your app can organize the data in two stores to
mirror one to CloudKit and keep the other on the local device.
This sample app shows how to manage and link data from two different stores with one Core Data
stack. The app organizes the records of books and user feedback on the books into two separate
stores. It connects two entities from the stores with a fetched property, which enables the app to
access a book’s feedback directly. When users add or remove a feedback record and save the
change, the app updates the fetched property by refreshing the book object.
The sample app creates a Book entity and a Feedback entity in the Core Data model, and then
creates one Configuration for each store, named Book and Feedback as well, to contain the
store’s entity.
To link the entities, the sample app adds a fetched property, feedbackList, in the Book entity,
which is displayed in the entity’s Fetched Properties section in Xcode. The fetched property’s
target is set to the Feedback entity and its predicate is bookUUID == $FETCH_SOURCE.uuid
where bookUUID is a key path of the target and $FETCH_SOURCE will be replaced with the sourc
of the fetched property, which is the Book object in this sample. With this setup, when the app
refreshes a Book object and accesses its feedbackList property, Core Data executes an
Overview
Configure the Data Model
Core Data / Linking Data Between Two Core Data Stores
Sample Code
Linking Data Between Two Core Data
Stores
Organize data in two different stores and implement a link between them.
Download
iOS 13.2+
iPadOS 13.2+
Mac Catalyst 13.2+
Xcode 11.4+


## Page 18

NSFetchRequest with the predicate on the Feedback entity, and returns the result to the
property.
The sample app creates one NSPersistentStoreDescription object for each store with the
store’s URL and model configuration, then uses NSPersistentContainer to load the stores.
With this setup, when the app fetches or changes data, Core Data automatically routes the reque
to the right store based on where the entities are.
Xcode currently doesn’t generate code for fetched properties, so the sample app adds the
following extension to provide the accessor for feedbackList.
With the feedbackList accessor, the app can access the fetched property directly.
Set Up the Core Data Stack
Implement the Fetched Property


## Page 19

Unlike a relationship, a fetched property can’t be used in a predicate for NSFetchRequest. It isn
automatically updated when the managed context is saved either. When the sample app saves
changes on the Feedback entity, the app must refresh the book object to update the book
.feedbackList property.
Creating a Core Data model
Define your app’s object structure with a data model file.
Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.
Core Data stack
Manage and persist your app’s model layer.
Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
See Also
Essentials


