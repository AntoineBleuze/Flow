# Tool calling.pdf

## Page 1

Tools provide a way to extend the functionality of the model for your own use cases. Tool-calling
allows the model to interact with external code you create to fetch up-to-date information, ground
responses in sources of truth that you provide, and perform side effects, like turning on dark mod
You can create tools that enable the model to:
Query entries from your app’s database and reference them in its answer.
Perform actions within your app, like adjusting the difficulty in a game or making a web request
to get additional information.
Integrate with other frameworks, like Contacts or HealthKit, that use existing privacy and
security mechanisms.
When you prompt the model with a question or make a request, the model decides whether it can
provide an answer or if it needs the help of a tool. When the model determines that a tool can help
it calls the tool with additional arguments that the tool can use. After the tool completes the task, 
returns control back to the model with information about what the tool did. The model can then us
the output of the tool when it provides the final response.
Before creating a tool, it’s helpful to understand the pattern the framework follows when using the
tool you provide. The framework processes a request in six phases:
1. You present a list of available tools and their parameters to the model.
2. You submit your prompt to the model.
Overview
Create a custom tool for your task
Foundation Models / Expanding generation with tool calling
Article
Expanding generation with tool calling
Build tools that enable the model to perform tasks that are specific to your use
case.


## Page 2

3. The model generates arguments to the tool(s) it wants to invoke.
4. Your tool runs code on behalf of the model, using the model’s generated arguments.
5. Your tool passes its output back to the model.
6. The model produces a final response to the prompt, based on the tool output.
A tool conforms to Tool and contains the arguments that the tool accepts, and a method that the
model calls when it wants to use the tool. You can call call(arguments:) concurrently with
itself or with other tools. The following example shows a tool that accepts a search term and a
number of recipes to retrieve:
When you provide descriptions to generable properties, you help the model understand the
semantics of the arguments. Keep descriptions as short as possible because long descriptions ta


## Page 3

up context size and can introduce latency. For more information on managing the context window
size, see TN3193: Managing the on-device foundation model’s context window.
Tools use guided generation for the Arguments property. For more information about guided
generation, see Generating Swift data structures with guided generation.
When you create a session, you can provide a list of tools that are relevant to the task you want to
complete. The tools you provide are available for all future interactions with the session. The
following example initializes a session with a tool that the model can call when it determines that i
would help satisfy the prompt:
Tool output can be a string, or a GeneratedContent object. The model can call a tool multiple
times in parallel to satisfy the request, like when retrieving weather details for several cities:
Provide a session with the tool you create


## Page 4

When an error happens during tool calling, the session throws a LanguageModelSession.Too
CallError with the underlying error and includes the tool that throws the error. This helps you
understand the error that happened during the tool call, and any custom error types that your too
produces. You can throw errors from your tools to escape calls when you detect something is
wrong, like when the person using your app doesn’t allow access to the required data or a networ
call is taking longer than expected. Alternatively, your tool can return a string that briefly tells the
model what didn’t work, like “Cannot access the database.”
Handle errors thrown by a tool


## Page 5

A session contains an observable transcript property that allows you to track when, and how
many times, the model calls your tools. A transcript also provides the ability to construct a
representation of the call graph for debugging purposes and pairs well with SwiftUI to visualize
session history.
Inspect the call graph


## Page 6

Generate dynamic game content with guided generation and tools
Make gameplay more lively with AI generated dialog and encounters personalized to the
player.
protocol Tool
A tool that a model can call to gather information at runtime or perform side effects.
See Also
Tool calling


## Page 7

This sample code project demonstrates the Foundation Models framework and its ability to
generate dynamic content for a game. Instead of using the same dialog script for customer
encounters, the app dynamically generates dialog so that each time a player talks to a character,
they can have a different conversation.
Overview
Foundation Models / Generate dynamic game content with guided generation and tools
Sample Code
Generate dynamic game content with
guided generation and tools
Make gameplay more lively with AI generated dialog and encounters personalized
to the player.
Download
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
Xcode 26.0+


## Page 8

The game combines several framework capabilities — like guided generation and tool calling — to
create dynamic, personalized gameplay experiences. You interact with both scripted characters,
like the head barista, and procedurally generated customers, each with unique personalities,
appearances, and coffee orders. As you serve customers, you can engage in conversations, take
custom coffee orders, and receive feedback on your brewing skills — all powered by an on-device
foundation model.
Note
This sample code project is associated with WWDC25 sessions 301: Deep Dive into the
Foundation Models Framework.
The sample app generates dialog for characters by using Character to describe the character,
like the barista:
Generate character dialog


## Page 9

A persona is a detailed description of the character that the model should pretend to be. The ap
uses a fixed error response when it encounters a generation error or content that the system
blocks for safety.
The DialogEngine class manages conoversations for all characters in the game using Languag
ModelSession. Each character maintains their own conversation session, allowing for persisten
contextual dialog that remembers previous interactions. When a conversation begins with a
character, the dialog engine creates a new session with specific instructions that define the
character’s personality and role:
When the player provides input text to talk to the character, the sample app uses the input as a
prompt to the session. When generating a response, the dialog engine includes safety mechanism
to keep conversations on topic. It maintains block lists for words and phrases that characters
shouldn’t discuss, ensuring nonplayer characters (NPCs) focus on coffee-related topics. If the ap
generates content containing blocked terms, it automatically resets the conversation and provide
the default error response for the character.


## Page 10

If the output dialog fails the blocked phrases check, the model may break character or discuss
something that’s outside of the game world. To keep the dialog immersive, set nextUtterance 
the character’s fixed error response and reset the session.
The EncounterEngine creates unique customer encounters using the Generable protocol to
generate structured content. Each encounter produces an NPC with a name, coffee order, and
visual description.
The process of generating an NPC uses a LanguageModelSession with a prompt that provide
examples of the output format:
Generate random encounters


## Page 11

Each generated NPC includes a GenerableImage that creates a visual representation of the
character by using Image Playground. The image generation avoids human-like appearances,
focusing instead on fantastical creatures, animals, and objects that fit the dream realm aesthetic.
The GenerableImage class shows how to use GenerationSchema to describe the properties
and guides of the object. This allows for creating dynamic schemas when all of the details of the
generable type isn’t known until runtime.
The game uses the on-device model to evaluate player performance through the judge
Drink(drink:) method in the encounter engine. When the player creates a coffee drink for a
customer, the model assumes the customer’s persona and provides feedback on whether the drin
matches their original order.
The judging system creates a new LanguageModelSession that uses the specific customer’s
personality and preferences, and a prompt that provides the drink details for the model to evaluat
Use a language model to judge in-game creations


## Page 12

The model then compares the player’s creation against the customer’s original order, providing
contextual feedback that’s authentic to the character’s personality. This creates a dynamic
evaluation system where the same drink might receive different reactions from different custome
based on their unique preferences and personas.
For customers that the sample generates, provide the dialog engine with custom tools, like
CalendarTool to create more personalized interactions. This allows characters to reference the
player’s on-device information, making conversations feel more natural and connected to the
player’s actual life.
The CalendarTool integrates with EventKit to access the player’s calendar events, and allows
characters to reference real upcoming events that involve the customer’s name if they are an
attendee:
The tool description tells the model what it uses the tool for:
The sample app also provides a ContactTool that accesses the player’s contacts to find names
of people born in specific months. This allows the game to generate a coffee shop customer with
names the player is familiar with.
Use tools to personalize game content


## Page 13

Expanding generation with tool calling
Build tools that enable the model to perform tasks that are specific to your use case.
protocol Tool
A tool that a model can call to gather information at runtime or perform side effects.
See Also
Tool calling


## Page 14

Generating content and performing tasks with Foundation Models
Categorizing and organizing data with content tags
Expanding generation with tool calling
Tool calling gives the model the ability to call your code to incorporate up-to-date information like
recent events and data from your app. A tool includes a name and a description that the framewo
puts in the prompt to let the model decide when and how often to call your tool.
A Tool defines a call(arguments:) method that takes arguments that conforms to
ConvertibleFromGeneratedContent, and returns an output of any type that conforms to
PromptRepresentable, allowing the model to understand and reason about in subsequent
interactions. Typically, Output is a String or any Generable types.
Mentioned in
Overview
Foundation Models / Tool
Protocol
Tool
A tool that a model can call to gather information at runtime or perform side
effects.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 15

Tools must conform to Sendable so the framework can run them concurrently. If the model need
to pass the output of one tool as the input to another, it executes back-to-back tool calls.
You control the life cycle of your tool, so you can track the state of it between calls to the model.
For example, you might store a list of database records that you don’t want to reuse between tool
calls.
Prompting the model with tools contributes to the available context window size. When you provid
a tool in your generation request, the framework puts the tool definitions — name, description,
parameter information — in the prompt so the model can decide when and how often to call the
tool. After calling your tool, the framework returns the tool’s output back to the model for further
processing.
To efficiently use tool calling:
Reduce Guide(description:) descriptions to a short phrase each.
Limit the number of tools you use to three to five.
Include a tool only when its necessary for the task you want to perform.
Run an essential tool before calling the model and integrate the tool’s output in the prompt
directly.
If your session exceeds the available context size, it throws LanguageModelSession
.GenerationError.exceededContextWindowSize(_:). When you encounter the context
window limit, consider breaking up tool calls across new LanguageModelSession instances. Fo
more information on managing the context window size, see TN3193: Managing the on-device
foundation model’s context window.
Topics


## Page 16

func call(arguments: Self.Arguments) async throws -> Self.Output
A language model will call this method when it wants to leverage this tool.
Required
associatedtype Arguments : ConvertibleFromGeneratedContent
The arguments that this tool should accept.
Required
associatedtype Output : PromptRepresentable
The output that this tool produces for the language model to reason about in subsequent
interactions.
Required
var description: String
A natural language description of when and how to use the tool.
Required
var includesSchemaInInstructions: Bool
If true, the model’s name, description, and parameters schema will be injected into the
instructions of sessions that leverage this tool.
Required Default implementation provided.
var name: String
A unique name for the tool, such as “get_weather”, “toggleDarkMode”, or “search contacts”.
Required Default implementation provided.
var parameters: GenerationSchema
A schema for the parameters this tool accepts.
Required Default implementation provided.
Invoking a tool
Getting the tool properties
Relationships
Inherits From


## Page 17

Sendable, SendableMetatype
Expanding generation with tool calling
Build tools that enable the model to perform tasks that are specific to your use case.
Generate dynamic game content with guided generation and tools
Make gameplay more lively with AI generated dialog and encounters personalized to the
player.
See Also
Tool calling


