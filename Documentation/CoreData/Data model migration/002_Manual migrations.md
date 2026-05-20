# 002_Manual migrations.pdf

## Page 1

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


## Page 2

Migrating your data model automatically
Enable lightweight migrations to keep your data model and the underlying data in a consiste
state.
Staged migrations
Migrate complex data models containing changes that are incompatible with lightweight
migrations.
See Also
Data model migration


