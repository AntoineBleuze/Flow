# 001_Setting up a Core Data stack.pdf

## Page 1

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


## Page 2

Typically, you initialize a Core Data stack as a singleton:
Once created, the persistent container holds references to the model, context, and store
coordinator instances in its managedObjectModel, viewContext, and persistentStore
Coordinator properties, respectively.
You can now use the Core Data stack througout your app.
Create an instance of the Core Data stack and inject its managed object context into your app
environment:
Initialize a Persistent Container
Inject the managed object context


## Page 3

Use an environment property wrapper to access the managed object context in your views:
Your Core Data stack is a convenient place to put related code, such as methods to save changes
and delete managed objects in the persistent store:
Add functionality to the stack


## Page 4

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


