# Guided generation.pdf

## Page 1

When you perform a request, the model returns a raw string in its natural language format. Raw
strings require you to manually parse the details you want. Instead of working with raw strings, th
framework provides guided generation, which gives strong guarantees that the response is in a
format you expect.
To use guided generation, describe the output you want as a new Swift type. When you make a
request to the model, include your custom type and the framework performs the work necessary 
fill in and return an object with the parameters filled in for you. The framework uses constrained
sampling when generating output, which defines the rules on what the model can generate.
Constrained sampling prevents the model from producing malformed output and provides you wit
results as a type you define.
For more information about creating a session and prompting the model, see Generating content
and performing tasks with Foundation Models.
To conform your type to Generable, describe the type and the parameters to guide the respons
of the model. The framework supports generating content with basic Swift types like Bool, Int,
Float, Double, Decimal, and Array. For example, if you only want the model to return a
numeric result, call respond(to:generating:includeSchemaInPrompt:options:) usin
the type Float:
Overview
Conform your data type to Generable
Foundation Models / Generating Swift data structures with guided generation
Article
Generating Swift data structures with
guided generation
Create robust apps by describing output you want programmatically.


## Page 2

A schema provides the ability to control the values of a property, and you can specify guides to
control values you associate with it. The framework provides two macros that help you with schem
creation. Use Generable(description:) on structures, actors, and enumerations; and only
use Guide(description:) with stored properties.
When you add descriptions to Generable properties, you help the model understand the
semantics of the properties. Keep the descriptions as short as possible — long descriptions take 
additional context size and can introduce latency. The following example creates a type that
describes a cat and includes a name, an age that’s constrained to a range of values, and a short
profile:
Note
The model generates Generable properties in the order they’re declared.
You can nest custom Generable types inside other Generable types, and mark enumerations
with associated values as Generable. The Generable macro ensures that all associated and
nested values are themselves generable. This allows for advanced use cases like creating comple
data types or dynamically generating views at runtime.
After creating your type, use it along with a LanguageModelSession to prompt the model. Whe
you use a Generable type it prevents the model from producing malformed output and prevents
the need for any manual string parsing.
Make a request with your custom data type


## Page 3

If you don’t know what you want the model to produce at compile time use DynamicGeneratio
Schema to define what you need. For example, when you’re working on a restaurant app and wan
to restrict the model to pick from menu options that a restaurant provides. Because each
restaurant provides a different menu, the schema won’t be known in its entirety until runtime.
After creating a dynamic schema, use it to create a GenerationSchema that you provide with
your request. When you try to create a generation schema, it can throw an error if there are
conflicting property names, undefined references, or duplicate types.
Define a dynamic schema at runtime


## Page 4

The response you get is an instance of GeneratedContent. You can decode the outputs from
schemas you define at runtime by calling value(_:forProperty:) for the property you want.
protocol Generable
A type that the model uses when responding to prompts.
See Also
Guided generation


## Page 5

Analyzing the runtime performance of your Foundation Models app
Prompting an on-device foundation model
Categorizing and organizing data with content tags
Generating Swift data structures with guided generation
Annotate your Swift structure or enumeration with the Generable macro to allow the model to
respond to prompts by generating an instance of your type. Use the Guide macro to provide
natural language descriptions of your properties, and programmatically control the values that the
model can generate.
Mentioned in
Overview
Foundation Models / Generable
Protocol
Generable
A type that the model uses when responding to prompts.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 6

For every Generable type in a request, the framework converts its type and format information t
a JSON schema and provides it to the model. This contributes to the available context window siz
If the LanguageModelSession exceeds the available context size, it throws LanguageModel
Session.GenerationError.exceededContextWindowSize(_:). To reduce the size of
your generable type:
Reduce the complexity of your Generable type by evaluating whether properties are necessa
to complete the task.
Give your properties short and clear names.
Use Guide(description:) on properties only when it improves response quality.
Add a Guide(description:_:) with maximumCount(_:) to reduce token usage.
If the Generable type includes properties with clear names the model may have all it needs to
generate your type, eliminating the need of Guide(description:). For more information on
managing the context window size, see TN3193: Managing the on-device foundation model’s
context window.
macro Generable(description: String?)
Conforms a type to Generable protocol.
macro Guide(description: String)
Allows for influencing the allowed values of properties of a Generable type.
macro Guide(description:_:)
Allows for influencing the allowed values of properties of a Generable type.
struct GenerationGuide
Guides that control how values are generated.
Topics
Defining a generable type
Creating a guide


## Page 7

static var generationSchema: GenerationSchema
An instance of the generation schema.
Required
struct GenerationSchema
A type that describes the properties of an object and any guides on their values.
struct GenerationID
A unique identifier that is stable for the duration of a response, but not across responses.
func asPartiallyGenerated() -> Self.PartiallyGenerated
The partially generated type of this struct.
associatedtype PartiallyGenerated : ConvertibleFromGeneratedContent =
Self
A representation of partially generated content
Required Default implementation provided.
struct DynamicGenerationSchema
The dynamic counterpart to the generation schema type that you use to construct schemas 
runtime.
ConvertibleFromGeneratedContent
ConvertibleToGeneratedContent
InstructionsRepresentable
Getting the schema
Generating a unique identifier
Converting to partially generated
Generate dynamic shemas
Relationships
Inherits From


## Page 8

PromptRepresentable
SendableMetatype
GeneratedContent
Generating Swift data structures with guided generation
Create robust apps by describing output you want programmatically.
Conforming Types
See Also
Guided generation


