# 003_App entities.pdf

## Page 1

App entities provide the system with information about your app’s data, or about concepts related
to your app’s data. App entities help the system resolve parameters for app intents by letting it
introspect relevant types. For example, a photo app that provides app entities for its photos and
albums might also provide app entities to represent “the current photo” or “this album.” These
specific app entities help resolve intents more quickly and with fewer verbal interactions.
Define app entities for core types and concepts that you want to make available to system
experiences. Add properties for any data values that help people discover entities using queries.
For example, add the name of a photo album or the currency amount for a financial transaction.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
protocol AppEntity
An interface for exposing a custom type or app-specific concept to system experiences like
Siri and the Shortcuts app.
protocol FileEntity
An entity that refers to a document or other file.
Overview
Topics
Entities
App Intents / App entities
API Collection
App entities
Make core types or concepts discoverable to the system by declaring them as ap
entities.


## Page 2

protocol IndexedEntity
IndexedEntity represents an App Entity decorated with an attribute set. A set of attribute
that enable the system to perform structured indexing and queries of entities.
protocol TransientAppEntity
A type that represents a transient model object which exposes its interface to App Intents vi
properties. Note that TransientAppEntity types are not meant to be queried.
protocol UniqueAppEntity
An entity that will only ever have one value, such as global settings.
protocol URLRepresentableEntity
An app entity with a URL representation.
protocol PersistentlyIdentifiable
Defines a string that uniquely identifies a type. This is useful for maintaining the identity of a
type, even when its type name is changed.
struct EntityIdentifier
A type that uniquely identifies a specific instance of an app entity.
protocol EntityIdentifierConvertible
An interface for converting between an entity’s identifier and its string representation.
class EntityProperty
A property wrapper that exposes the associated property to the system.
protocol AppValue
An interface that describes conceptual types you use in app intents.
protocol AnyIntentValue
A type the system uses to access a parameter or property value.
protocol AppEnum
An interface to express that a custom type has a predefined, static set of valid values to
display.
protocol URLRepresentableEnum
Entity identity
Entity content


## Page 3

An app enum with a URL representation.
macro ComputedProperty()
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro ComputedProperty(title: LocalizedStringResource)
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro ComputedProperty(indexingKey: PartialKeyPath<CSSearchableItem
AttributeSet>)
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro ComputedProperty(customIndexingKey: CSCustomAttributeKey)
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro ComputedProperty(title: LocalizedStringResource, customIndexingKe
: CSCustomAttributeKey)
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro ComputedProperty(title: LocalizedStringResource, indexingKey:
PartialKeyPath<CSSearchableItemAttributeSet>)
A macro that creates a computed property for an AppEntity that allows for providing a get
and/or set accessor
macro DeferredProperty()
A macro that creates an async property for an AppEntity that allows for providing an async g
accessor
macro DeferredProperty(title: LocalizedStringResource)
A macro that creates an async property for an AppEntity that allows for providing an async g
accessor.
struct DisplayRepresentation
Entity property macros
Entity presentation


## Page 4

A type that describes the user interface presentation of a custom type.
protocol DisplayRepresentable
An interface for providing a dynamic visual representation of a specific type and instances o
that type.
protocol InstanceDisplayRepresentable
An interface for providing the visual representation for an instance of a specific type.
protocol TypeDisplayRepresentable
An interface for providing the visual representation of a specific type.
struct TypeDisplayRepresentation
A type that describes the user interface presentation of a custom type.
protocol StaticDisplayRepresentable
An interface for providing a static visual representation of a specific type.
protocol CaseDisplayRepresentable
An interface for providing the visual representation for an iterable collection of values.
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
Resolvers
See Also
Parameters, custom data types, and queries


## Page 5

Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.


