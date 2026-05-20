# 003_Instructions.pdf

## Page 1

Generating content and performing tasks with Foundation Models
Improving the safety of generative model output
Prompting an on-device foundation model
Supporting languages and locales with Foundation Models
Instructions are typically provided by you to define the role and behavior of the model. In the code
below, the instructions specify that the model replies with topics rather than, for example, a recip
Mentioned in
Overview
Foundation Models / Instructions
Structure
Instructions
Details you provide that define the model’s intended behavior on prompts.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

Apple trains the model to obey instructions over any commands it receives in prompts, so don’t
include untrusted content in instructions. For more on how instructions impact generation quality
and safety, see Improving the safety of generative model output.
All input to the model contributes tokens to the context window of the LanguageModelSession
— including the Instructions, Prompt, Tool, and Generable types, and the model’s
responses. If your session exceeds the available context size, it throws LanguageModelSessio
.GenerationError.exceededContextWindowSize(_:).
Instructions can consume a lot of tokens that contribute to the context window size. To reduce yo
instruction size:
Write shorter instructions to save tokens.
Provide only the information necessary to perform the task.
Use concise and imperative language instead of indirect or jargon that the model might
misinterpret.
Aim for one to three paragraphs instead of including a significant amount of background
information, policy, or extra content.
For more information on managing the context window size, see TN3193: Managing the on-devic
foundation model’s context window.
init(_:)
struct InstructionsBuilder
A type that represents an instructions builder.
protocol InstructionsRepresentable
A type that can be represented as instructions.
Copyable
InstructionsRepresentable
Topics
Creating instructions
Relationships
Conforms To


## Page 3

Sendable
SendableMetatype
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Prompt
A prompt from a person to the model.
struct Transcript
A linear history of entries that reflect an interaction with a session.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
See Also
Prompting


