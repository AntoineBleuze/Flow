# 001_Generable.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

PromptRepresentable
SendableMetatype
GeneratedContent
Generating Swift data structures with guided generation
Create robust apps by describing output you want programmatically.
Conforming Types
See Also
Guided generation


