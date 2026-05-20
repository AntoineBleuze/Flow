# 004_Prompt.pdf

## Page 1

Generating content and performing tasks with Foundation Models
Prompting an on-device foundation model
Prompts can contain content written by you, an outside source, or input directly from people usin
your app. You can initialize a Prompt from a string literal:
Use PromptBuilder to dynamically control the prompt’s content based on your app’s state. Th
code below shows that if the Boolean is true, the prompt includes a second line of text:
Mentioned in
Overview
Foundation Models / Prompt
Structure
Prompt
A prompt from a person to the model.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

If your prompt includes input from people, consider wrapping the input in a string template with
your own prompt to better steer the model’s response. For more information on handling inputs in
your prompts, see Improving the safety of generative model output.
All input to the model contributes tokens to the context window of the LanguageModelSession
— including the Instructions, Prompt, Tool, and Generable types, and the model’s
responses. If your session exceeds the available context size, it throws LanguageModelSessio
.GenerationError.exceededContextWindowSize(_:).
Prompts can consume a lot of tokens, especially when you send multiple prompts to the same
session. To reduce your prompt size when you exceed the context window size:
Write shorter prompts to save tokens.
Provide only the information necessary to perform the task.
Use concise and imperative language instead of indirect or jargon that the model might
misinterpret.
Use a clear verb that tells the model what to do, like “Generate”, “List”, or “Summarize”.
Include the target response length you want, like “In three sentences” or “List five reasons”.
Prompting the same session eventually leads to exceeding the context window size. When that
happens, create a new context window by initializing a new instance of LanguageModelSessio
For more information on managing the context window size, see TN3193: Managing the on-devic
foundation model’s context window.
init(_:)
struct PromptBuilder
A type that represents a prompt builder.
protocol PromptRepresentable
A type whose value can represent a prompt.
Topics
Creating a prompt
Relationships
Conforms To


## Page 3

Copyable
PromptRepresentable
Sendable
SendableMetatype
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Transcript
A linear history of entries that reflect an interaction with a session.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
See Also
Prompting


