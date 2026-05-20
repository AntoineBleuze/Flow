# Data model migration.pdf

## Page 1

Core Data can typically perform an automatic data migration, referred to as lightweight migration
Lightweight migration infers the migration from the differences between the source and the
destination managed object models.
To perform automatic lightweight migration, Core Data needs to be able to find the source and
destination managed object models at runtime. It looks for models in the bundles returned by the
allBundles and allFrameworks methods of the Bundle class. Core Data then analyzes the
schema changes to persistent entities and properties, and generates an inferred mapping model.
Generating an inferred mapping model requires changes to fit an obvious migration pattern, for
example:
Addition of an attribute
Removal of an attribute
A nonoptional attribute becoming optional
An optional attribute becoming non-optional, and defining a default value
Renaming an entity or property
If you rename an entity or property, you can set the renaming identifier in the destination model to
the name of the corresponding property or entity in the source model. Use the Xcode Data
Overview
Generating an inferred mapping model
Managing changes to entities and properties
Core Data / Migrating your data model automatically
Article
Migrating your data model automatically
Enable lightweight migrations to keep your data model and the underlying data in
consistent state.


## Page 2

Modeling tool’s property inspector (for either an entity or a property) to set the renaming identifie
in the managed object model. For example, you can:
Rename a Car entity to Automobile
Rename a Car’s color attribute to paintColor
The renaming identifier creates a canonical name, so set the renaming identifier to the name of th
property in the source model (unless that property already has a renaming identifier). This means
you can rename a property in version 2 of a model, then rename it again in version 3. The renamin
will work correctly going from version 2 to version 3, or from version 1 to version 3.
Lightweight migration can also manage changes to relationships and to the type of relationship.
You can add a new relationship or delete an existing relationship. You can also rename a
relationship by using a renaming identifier, just like an attribute.
In addition, you can change a relationship from a to-one to a to-many, or a nonordered to-many to
an ordered (and vice versa).
You can add, remove, and rename entities in the hierarchy. You can also create a new parent or
child entity and move properties up and down the entity hierarchy. You can move entities out of a
hierarchy, but you can’t merge entity hierarchies. If two existing entities don’t share a common
parent in the source, they can’t share a common parent in the destination.
If you want to determine in advance whether Core Data can infer the mapping model between the
source and destination models without actually doing the work of migration, you can use
inferredMappingModel(forSourceModel:destinationModel:) method. The method
returns the inferred model if Core Data is able to create it; otherwise, it returns nil.
If your data change exceeds the capabilities of automatic migration, you can perform a
heavyweight migration (often referred to as manual migration).
You request automatic lightweight migration using the options dictionary that you pass into add
PersistentStore(ofType:configurationName:at:options:). Set values
corresponding to both the NSMigratePersistentStoresAutomaticallyOption and the
NSInferMappingModelAutomaticallyOption keys to true:
Managing changes to relationships
Managing changes to hierarchies
Confirming whether Core Data can infer the model
Requesting lightweight migration


## Page 3

With these settings in place, Core Data attempts a lightweight migration when it detects the
persistent store no longer matches the current model.
Staged migrations
Migrate complex data models containing changes that are incompatible with lightweight
migrations.
Manual migrations
Migrate elaborate data models with changes that go beyond the capabilities of both
lightweight and staged migrations.
See Also
Data model migration


## Page 4

Core Data uses lightweight migrations to keep the data in your app’s persistent store consistent
with the app’s managed object model. A lightweight migration automatically determines the
differences between two model versions and generates a mapping model that Core Data then use
to make the necessary changes to the persistent store. Lightweight migrations support a number
of common operations, such as adding an entity, removing a relationship, changing a nonoptional
attribute to an optional attribute, renaming an entity, and so on.
As your object model evolves, you may find that the aggregate changes between two model
versions exceed the capabilities of lightweight migrations. For example, if you change an optional
attribute to be nonoptional, there’s no way for a lightweight migration to infer the default value it
needs to assign to any instances of that attribute with a nil value.
Staged lightweight migrations solve this problem by reducing an incompatible migration into a
series of compatible stages. A migration manager runs these stages in a specific order, providing
opportunities for you to prepare the persistent store before each stage runs, and perform any
cleanup afterward. This enables you to handle scenarios like changing an optional attribute to be
nonoptional because you have an opportunity to set any nil values to a concrete value before th
stage runs.
Important
Successful Core Data migrations depend on properly versioned object models, and staged
lightweight migrations require a distinct migration stage for each model version.
Overview
Core Data / Staged migrations
API Collection
Staged migrations
Migrate complex data models containing changes that are incompatible with
lightweight migrations.


## Page 5

let NSPersistentStoreStagedMigrationManagerOptionKey: String
The key for specifying your staged migration manager.
class NSStagedMigrationManager
An object that handles the migration event loop and provides access to the migrating
persistent store.
class NSLightweightMigrationStage
An object that describes a series of models suitable for lightweight migration.
class NSCustomMigrationStage
An object that enables you to participate in the migration between two versions of the same
model.
class NSMigrationStage
An abstract base class for describing an individual stage of a migration.
Migrating your data model automatically
Enable lightweight migrations to keep your data model and the underlying data in a consiste
state.
Manual migrations
Migrate elaborate data models with changes that go beyond the capabilities of both
lightweight and staged migrations.
Topics
Migration staging
Migration stages
See Also
Data model migration


## Page 6

class NSMigrationManager
A migration manager instance that performs a migration of data from one persistent store to
another using a given mapping model.
class NSMappingModel
A model instance that specifies how to map a model from a source to a destination managed
object model.
class NSEntityMapping
A mapping instance that specifies how to map an entity from a source to a destination
managed object model.
class NSEntityMigrationPolicy
A policy instance that customizes the migration process for an entity mapping.
enum NSEntityMappingType
The types for mapping an entity between a source model and a destination model.
class NSPropertyMapping
A mapping instance that specifies in a model how to map from a property in a source entity t
a property in a destination entity.
Topics
Entity Mapping
Core Data / Manual migrations
API Collection
Manual migrations
Migrate elaborate data models with changes that go beyond the capabilities of
both lightweight and staged migrations.


## Page 7

Migrating your data model automatically
Enable lightweight migrations to keep your data model and the underlying data in a consiste
state.
Staged migrations
Migrate complex data models containing changes that are incompatible with lightweight
migrations.
See Also
Data model migration


