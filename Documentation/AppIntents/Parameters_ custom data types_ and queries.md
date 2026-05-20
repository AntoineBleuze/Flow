# Parameters_ custom data types_ and queries.pdf

## Page 1

Many of your app’s actions likely require input data to perform their work. To help people provide
the input that an AppIntent needs to perform its functionality, add parameters to the intent to te
the system about that data and whether it’s required or optional. When you expose these
parameters, people can configure your intents with values unique to their requirements and enabl
the App Intents framework to mediate with system experiences to write those values at runtime.
For example, the Accelerating app interactions with App Intents sample code project’s GetTrail
Info intent lets people choose which hiking trail information to view when they invoke the app
intent. It declares a trail parameter by decorating the trail property with the Intent
Parameter property wrapper and provides a title and a description to identify the parameter in t
Shortcuts app.
Note that the example doesn’t provide localized text for the title and description fields to
keep the example focused and make it easy to understand. Always provide localized strings for ap
intents, App Shortcuts, and their parameters.
How you define your parameter variables determines whether the system treats that parameter a
required or optional. If you define a variable as a non-optional type, the system knows the
parameter is required and, when necessary, requests a value. Conversely, if you define a variable 
an optional type, the system assumes the parameter is optional and doesn’t request a value. In th
scenario, use the property wrapper’s requestValue(_:) method to pause execution and
request a value if the intent can’t proceed otherwise.
Overview
Make a parameter optional or required
App Intents / Adding parameters to an app intent
Article
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.


## Page 2

You can use the @Parameter property wrapper with common Swift and Foundation types:
Primitives such as Bool, Int, Double, String, Duration, Date, Decimal, Measurement
and URL.
Collections such as Array and Set. Make sure the collection’s elements are of a type that’s
compatible with IntentParameter.
Additionally:
Use framework-specific types such as IntentPerson and IntentFile. For additional types
see Common types.
Use enumerable types that conform to the AppEnum protocol for parameters that have known
static values at build time.
Use custom types that adopt the AppEntity protocol and that the system can request at
runtime.
For example, the Accelerating app interactions with App Intents sample code project makes its tra
data available in an app intent through the TrailEntity type, which is a structure conforming t
the AppEntity protocol.
When a person provides input that your app intents use, the input doesn’t always match the type
that your parameters require. For example, natural spoken language commands from Siri are
strings, but your app intent might require an integer or floating-point value. To help you with input
of various types, use Resolvers to leverage the system’s ability to translate one type to another
automatically so your app intent can use the input.
To make it easy for people to provide your app intents with the right information, restrict paramete
values. The system presents known values as a list and prompts the person to select one when it
needs to resolve a parameter. To restrict parameter values to a list of known values:
At compile time, use an enumeration type for the parameter that conforms to the AppEnum
protocol.
Review supported parameter types
Transform input into your intent parameter’s types
Restrict parameter values


## Page 3

At runtime, specify an options provider as part of the property wrapper’s declaration. An option
provider is a type you implement that conforms to the DynamicOptionsProvider protocol
and provides a set of permitted values at runtime.
For example, the Accelerating app interactions with App Intents sample code project uses a
dynamic options provider to display a sorted list of location parameters in the Shortcuts app.
You can configure a parameter with additional options such as enforcing an inclusive range for
number types, or specifying the capitalization style and keyboard mode for string types. For more
information, see IntentParameter.
A parameter summary is a visual, textual outline of your app intent that the Shortcuts app displays
in the shortcut editor. The summary can include placeholders that people interact with to choose
the values for the intent’s parameters. Even if your intent doesn’t expose any parameters, providin
a summary is an opportunity to present more information about your intent in addition to its title.
To add a parameter summary to your intent, implement the protocol’s parameterSummary
requirement and use the provided ParameterSummaryBuilder result builder to build the
summary. Write the content using localized natural language and, where applicable, substitute
words that represent parameters with the key paths to those parameters.
Provide an interactive parameter summary for your intent


## Page 4

The shortcut editor substitutes each key path with the corresponding parameter’s title and enable
a person to set the value by tapping it. The editor uses the parameter’s type to determine which
input controls to display.
Parameter summaries can include conditional statements such as AppIntent.When and App
Intent.Switch that let the summary update itself in response to already chosen values.
For example, the Accelerating app interactions with App Intents sample code project uses App
Intent.Switch in its SuggestedTrails app intent:
For more information, see Parameter resolution.
App entities provide the system with information about your app’s data, or about concepts related
to your app’s data. App entities describe your app’s custom data types you use for parameters, an
Review the role of app entities


## Page 5

help the system resolve parameters for app intents by letting it inspect relevant types. For examp
a photo app that provides app entities for its photos and albums might also provide app entities to
represent “the most recent photo” or “the default album.” These specific app entities help resolve
intents more quickly and with fewer verbal interactions.
Define app entities for core types and concepts that you want to make available to system
experiences, and make sure to include properties for any data values that help people discover th
entities using queries. For example, create an entity that describes a photo album and add a
property to the entity for the name of the photo album.
For more information about expressing your app’s data as entities, see Integrating custom data
types into your intents.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.
See Also
Parameters, custom data types, and queries


## Page 6

Your app likely defines a number of custom types that model the data the app creates or
consumes. For example, an app that enables people to view information about hiking trails might
define types that describe trail information. Because those types are unique to your app, the
framework can’t interpret them until you expose them to system experiences like the Shortcuts
app. Entities are lightweight types that provide information to the system about your app’s data o
concepts relating to that data. An entity identifies and queries the data it represents and describe
how the system displays that data onscreen. Create an entity for each of the core types or
concepts you want to use as an input parameter for your intents.
For more information on creating app intents and specifying their input parameters, see Creating
your first app intent and Adding parameters to an app intent.
To let an intent use one of your app’s custom data types as a parameter, define a new structure in
your app’s target to represent that type. Then update the structure’s definition to adopt the App
Entity protocol. Although custom types can directly conform to the protocol, prefer using distin
entity types that are lightweight and provide only the information the system requires. Distinct
types let you separate your entities from the rest of your app’s model and domain code. For
example, the Accelerating app interactions with App Intents sample code project uses a Trail
type and defines a corresponding TrailEntity type.
Overview
Define an entity that represents your data
App Intents / Integrating custom data types into your intents
Article
Integrating custom data types into your
intents
Provide the system with information about the types your app uses to model its
data so that your intents can use those types as parameters.


## Page 7

If your app’s model code is lightweight and the amount of data is small enough to fit into device
memory, you can make your models conform to AppEntity to keep your code simple. However,
models can contain larger data like images or your app could operate on large amounts of data. F
those cases, use separate types for your entities so you can load only the data the entities need,
and make the mechanism that provides the entities’ data more performant. For example, if your
app uses CloudKit to manage its data, set the desiredKeys property on your fetch operations to
return only the data the entities need instead of fetching entire records.
Every entity must have a stable, unique identifier. The framework uses that identifier as a concrete
reference to your entity while mediating between your app and other parts of the system. For
example, when someone selects the value for an entity-based parameter in the shortcut editor, th
system asks your app to resolve that parameter using the entity’s identifier. The AppEntity
protocol inherits the Identifiable protocol to enforce this prerequisite.
To add a unique identifier to your entity type, implement the protocol’s id requirement and set its
type to one of the three data types optimized for the framework: String, Int, or UUID.
Note
Wherever possible, use one of the three optimized data types for entity identifiers. If you must
use a different data type, extend that type and implement the required support. For more
information, see EntityIdentifierConvertible.
An entity represents a type and the data for that type. In your entity, describe how to display both
elements onscreen. For example, the Shortcuts app uses this information to show type details in
the Actions Library and to present entity data in the shortcut editor.
Add the typeDisplayRepresentation variable to your entity’s structure and return a human-
readable, localized string that describes the entity. For example, the hiking app from the previous
example displays the number of trails. The system displays this string whenever it needs to prese
your entity’s type onscreen.
Specify a unique identifier for your entity
Provide a visual representation for your entity


## Page 8

The required displayRepresentation variable describes how to display an entity’s
represented data at runtime. Update your structure to include this variable and return an instance
of DisplayRepresentation. Specify a localized title that lets people recognize the data.
Create a visually rich display of your entity by setting the representation’s subtitle and image
variables. For example, the Accelerating app interactions with App Intents sample code project
displays the name of the trail, a region description, and an image.
For more information, see DisplayRepresentation.
The framework requires entity types to be searchable so the system can resolve identifiers at
runtime and request a list of suggested entities to display onscreen. For example, when a person
sets a parameter to a specific entity in the shortcut editor, the system retains that entity’s identifie
Later, when the intent runs, the framework asks your type to materialize the entity from its
identifier. The framework then updates the relevant parameter with the materialized entity before
invoking the intent’s perform() function.
To make your entity searchable, define a new structure that adopts the EntityQuery protocol.
Place this structure in the app’s target alongside your entity. Add the entities(for:) function
and update the declaration so the element type of the identifiers array matches your entity’s
id variable. Use the provided identifiers to materialize and return the relevant entities.
Make your entity searchable


## Page 9

To offer a better user experience, provide a list of suggested entities that the system displays, at
appropriate times, to let people quickly make a selection. To provide those entities, add the
suggestedEntities() method to your query structure. If your data generates a small number
of entities, return them all; otherwise, return a subset of those entities relevant to the current
context. For example, the Accelerating app interactions with App Intents sample code project
suggests a person’s favorite hiking trails.
To let people use arbitrary text to find specific entities, adopt the EntityStringQuery protoco
instead. Queries that adopt this protocol cause the system to display a search field above the list 
suggested entities. Implement the required entities(matching:) function, and use the
provided string to match against your data. For example, the Accelerating app interactions with
App Intents sample code project allows people to search for a specific trail. The following code
snippet from the sample code project matches a person’s search input to the app’s trail informatio
using the name property:
After you implement your query, update the related entity’s definition to include the default
Query variable, and specify an instance of your query type as the value. The system uses this
variable at runtime to determine which type it can query on behalf of the related entity.
There are several subprotocols to EntityQuery, each of which enables different types of
functionality. The Accelerating app interactions with App Intents sample code project implements


## Page 10

all of them for demonstration purposes, but for a real app, you can choose the ones that meet you
needs.
Apps implementing either the EnumerableEntityQuery or EntityPropertyQuery protoco
automatically add a Find intent in the Shortcuts app. These intents enable people to build powerfu
new features for themselves in Shortcuts, powered by the app’s data — without requiring the app 
implement that feature itself. For example, the Accelerating app interactions with App Intents
sample code project focuses its UI on providing trail information, but people could also use its dat
to plan activities for a vacation. The app doesn’t need to build vacation-planning features becaus
it implements these entity query protocols to provide an interface to the data through an App
Shortcut.
For more information about enabling Find intents, see Enable Find intents.
If a type has known fixed values at build time, such as a Swift enumeration, expose those types to
the system by converting them to app enums, the static equivalent of entities. Because app enum
values are constant, the compiler introspects them at build time and optimizes their use. The
framework provides both an identity and a query by default, and the system can get type
information at runtime without launching the app. For example, a music app might use an app enu
to associate an album with an album type such as studio, live, or compilation.
To convert a common type to an app enum, update its declaration to adopt the AppEnum protoco
There’s no need to create a separate type because the existing type is inherently lightweight and
doesn’t store additional data. The framework requires that app enums also conform to Raw
Representable and use String as their storage type, so modify your type to satisfy those
requirements. Like with entities, specify a localized description of the type that the system can
display onscreen.
Enable Find intents
Enumerate your data type’s static values


## Page 11

Important
Don’t adopt both protocols in the same type; use AppEntity for types that provide dynamic
values and AppEnum for types that provide a limited set of static values.
To provide descriptions for each of your app enum’s values, add the protocol’s required case
DisplayRepresentations variable. Return a dictionary that maps the values to their display
representations.


## Page 12

The example above initializes each representation with a string literal. To help people quickly
understand the values, it also specifies a subtitle and an image.
For more information, see DisplayRepresentation.
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.
See Also
Parameters, custom data types, and queries


## Page 13

Parameters represent input arguments to your app intents and offer additional metadata to the
system. When you define an app intent, add the @Parameter property wrapper to any properties
you use as input. For example, an app intent that sends a message might include a parameter for
the recipient and message string. The system collects and resolves the relevant parameter
information before it performs your app intent.
The following partial example shows how to declare parameters for a custom app intent that
enables someone to order soup from your app. Configure the parameter property wrapper with an
additional details that help the system infer extra information about your parameter.
Overview
Topics
Intent parameters
App Intents / Parameter resolution
API Collection
Parameter resolution
Define the required parameters for your app intents and specify how to resolve
those parameters at runtime.


## Page 14

class IntentParameter
A property wrapper that indicates the associated property is an input argument of the app
intent.
class IntentParameterDependency
A property wrapper that represents an app intent dependency you use to provide dynamic
options.
struct IntentParameterContext
A type that provides information about an associated parameter during value resolution.
enum InputConnectionBehavior
Describes the input behaviors for connecting a parameter to the output of the previous App
Intent.
protocol DynamicOptionsProvider
An interface for providing a dynamic list of options for a parameter of your app intent.
protocol AppEnum
An interface to express that a custom type has a predefined, static set of valid values to
display.
protocol ParameterSummary
An interface for defining the visual representation of an app intent’s parameters.
struct IntentParameterSummary
A type that describes the user interface configuration of an app intent’s parameters.
struct ParameterSummaryString
A human-readable string that interpolates parameter key paths to provide user-configurable
placeholders in the Shortcuts app.
struct ParameterSummaryWhenCondition
A type that represents a conditional statement in a parameter summary.
struct ParameterSummarySwitchCondition
A type that represents a switch statement in a parameter summary.
Parameter choices
Shortcuts support


## Page 15

struct ParameterSummaryCaseCondition
A type that represents an individual case of a switch statement in a parameter summary.
struct ParameterSummaryDefaultCaseCondition
A type that represents the default case of a switch statement in a parameter summary.
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.
See Also
Parameters, custom data types, and queries


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.


## Page 21

When the system needs to retrieve one or more specific instances of an app entity, it asks you to
provide a relevant query type. The system uses queries during parameter resolution when the
parameter of an intent contains an entity. The system also uses them to resolve information in a
different format into one of your app’s entities. For example, it uses them to resolve natural spoke
language into one of your app’s entities.
The system can sometimes determine which entities it needs and provide you with a list of
corresponding identifiers. Provide an EntityQuery type to supply the entities for those
identifiers. Provide additional query types to perform more advanced searches, such as a search
that matches specific properties of the entity.
protocol EntityQuery
An interface for locating entities using their identifiers.
protocol EnumerableEntityQuery
An interface you use to provide a short list of entities that are relatively small in size.
Overview
Topics
Identifier-based queries
String-based queries
App Intents / Entity queries
API Collection
Entity queries
Help the system find the entities your app defines and use them to resolve
parameters.


## Page 22

protocol EntityStringQuery
An interface that locates entities using arbitrary string input.
protocol EntityPropertyQuery
An interface for locating entities by matching values against one or more of their properties.
struct EntityQueryProperties
A type that provides the properties to include in a property-matched query.
class EntityQueryProperty
An object that provides the supported comparators you use to describe the different ways
users can query against a property of an app entity.
Property comparators
Specify the type of comparison to perform during a property-matched query.
struct EntityQuerySortingOptions
The potential properties you can use to sort the results of a query.
struct EntityQuerySortableByProperty
Details about a specific property you use to sort the query results.
struct EntityQuerySort
The properties to use to sort the results when the query runs.
protocol UniqueAppEntityQuery
A query designed for only returning a single possible value, provided by uniqueEntity.
Protocol extensions will provide the other required query methods based on that.
struct UniqueAppEntityProvider
A simplified query type conforming to UniqueAppEntityQuery. Use this as the value of th
defaultQuery of an entity conforming to UniqueAppEntity.
Property-matched queries
Unique entity queries
See Also


## Page 23

Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution types to
include your app’s custom types.
Parameters, custom data types, and queries


## Page 24

System experiences like Siri and the Shortcuts app produce input that doesn’t always match what
your code requires. For example, natural spoken language commands from Siri are strings, but yo
app intent might require an integer or floating-point value instead. Resolvers let the system
translate one type to another automatically.
The system provides resolvers to convert between integer, floating-point, Boolean, string, and UR
types. As needed, the system can chain multiple resolvers together to translate between types fo
which no single resolver exists. For example, it can translate an integer into a string and then
translate the string into a Boolean value. If your app defines custom types, create your own
resolvers to translate those types to more recognizable values.
struct IntFromDoubleResolver
A resolver that converts a double into an integer using the specified rounding rule and
validates the result is within the parameter’s inclusive range.
struct IntFromStringResolver
A resolver that converts a string into an integer in the specified base and validates the result
within the parameter’s inclusive range.
struct IntResolver
Overview
Topics
Integer resolution
App Intents / Resolvers
API Collection
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution
types to include your app’s custom types.


## Page 25

A resolver that validates an integer is within the parameter’s inclusive range.
struct DoubleFromIntResolver
struct DoubleFromStringResolver
A resolver that converts a string into a double and validates the result is within the
parameter’s inclusive range.
struct DoubleResolver
A resolver that validates a double is within the parameter’s inclusive range.
struct AttributedStringFromStringResolver
A resolver that converts a string into an attributed string.
struct StringFromDoubleResolver
A resolver that converts a double into a string.
struct StringFromIntResolver
A resolver that converts one or more integers into one or more strings.
struct BoolFromStringResolver
A resolver that converts a string into a Boolean, optionally using a localized display name.
struct URLFromStringResolver
A resolver that converts a string into a URL.
protocol Resolver
An interface to convert a value from one type to a different type.
Floating-point resolution
String resolution
Boolean resolution
URL resolution
Custom resolution
Range validation


## Page 26

protocol RangeCheckingResolver
An interface for validating that a value is within a parameter’s defined inclusive range.
protocol RangeComparableProperty
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
See Also
Parameters, custom data types, and queries


