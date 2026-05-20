# Prompting.pdf

## Page 1

Many prompting techniques are designed for server-based “frontier” foundation models, because
they have a larger context window and thinking capabilities. However, when prompting an on-
device model, your prompt engineering technique is even more critical because the model you
access is much smaller.
To generate accurate, hallucination-free responses, your prompt needs to be concise and specific
To get a better output from the model, some techniques you can use include:
Use simple, clear instructions
Iterate and improve your prompt based on the output you receive in testing
Provide the model with a reasoning field before answering a prompt
Reduce the thinking the model needs to do
Split complex prompts into a series of simpler requests
Add “logic” to conditional prompts with “if-else” statements
Leverage shot-based prompting — such as one-shot, few-shot, or zero-shot prompts — to
provide the model with specific examples of what you need
You’ll need to test your prompts throughout development and evaluate the output to provide a
great user experience.
With prompt engineering, you structure your requests by refining how you phrase questions,
provide context, and format instructions. It also requires testing and iteration of your input to get
the results your app needs.
Overview
Concepts for creating great prompts
Foundation Models / Prompting an on-device foundation model
Article
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.


## Page 2

You can also structure prompts to make the model’s response depend on specific conditions or
criteria in the input. For example, instead of giving one fixed instruction you can include different
conditions, like:
If it’s a question, answer it directly. If it’s a statement, ask a follow-up question.
Effective prompts use simple language that tells the model what output you want it to provide. Th
model processes text in units, called tokens, and each model has a maximum number of tokens it
can process — the context window size. An on-device model has fewer parameters and a small
context window, so it doesn’t have the resources to handle long or confusing prompts. Input to a
frontier model might be the length of a full document, but your input to the on-device model need
to be short and succinct. Ask yourself whether your prompt is understandable to a human if they
read it quickly, and consider additional strategies to adjust your tone and writing style:
✅ Prompting strategies to use
🚫 Prompting strategies to avoid
Focus on a single, well-defined goal
Combining multiple unrelated requests
Be direct with imperative verbs like “List” or
“Create”
Unnecessary politeness or hedging
Tell the model what role to play, for example,
an interior designer
Passive voice, for example, “code needs to be
optimized”
Write in direct, conversational tone with
simple, clear sentences
Jargon the model might not understand or
interpret incorrectly
State your request clearly
Too short of a prompt that doesn’t outline the
task
Limit your prompt to one to three paragraphs
Too long of a prompt that makes it hard to
identify what the task is
An on-device model may get confused with a long and indirect instruction because it contains
unnecessary language that doesn’t add value. Instead of indirectly implying what the model need
to do, write a direct command to improve the clarity of the prompt for better results. This clarity
also reduces the complexity and context window size for the on-device model.
✅ Concise and direct
Given a person’s home-decor transactions and
search history, generate three categories they
🚫 Long and indirect
The person’s input contains their recent home
decor transaction history along with their rece
Keep prompts simple and clear


## Page 3

might be interested in, starting with the most
relevant category. Generate two more
categories related to home-decor but that are
not in their transaction or search history.
search history. The response should be a list o
existing categories of content the person migh
be interested relevant to their search and
transactions, ordered so that the first categori
in the list are most relevant. For inspiration, th
response should also include new categories
that spark creative ideas that aren’t covered in
any of the categories you generate.
For more information on managing the context window size, see TN3193: Managing the on-devic
foundation model’s context window.
By default, the on-device model typically responds to questions in a neutral and respectful tone,
with a business-casual persona. Similar to frontier models, you can provide a role or persona to
dramatically change how the on-device model responds to your prompt.
A role is the functional position or job that you instruct the model to assume, while a persona
reflects the personality of the model. You often use both in prompts; for example:
You are a senior software engineer who values mentoring junior developers.
Here the role is “a senior software engineer,” and the persona is “mentoring junior developers.”
The model phrases its response differently to match a persona, for example, “mentoring junior
developers” or “evaluating developer coding” even when you give it the same input for the same
task.
To give the model a role, use the phrase “you are”:
English Teacher
You are an expert English teacher. Provide
feedback on the person’s sentence to help them
improve clarity.
Cowboy
You are a lively cowboy who loves to chat abo
horses and make jokes. Provide feedback on t
person’s sentence to help them improve clarity
Use the phrase “expert” to get the model to speak with more authority and detail on a topic.
Similarly, change the model’s behavior by providing a role or persona for the person using your ap
By default, the on-device model thinks it’s talking to a person, so tell the model more about who
that person is:
Student
Ghost
Give the model a role, persona, and tone


## Page 4

The person is a first-grade English student. Give
the person feedback on their writing.
Greet a customer who enters your alchemy
shop. The customer is a friendly ghost.
The student persona causes the model to respond as if speaking to a child in the first grade, while
the ghost persona causes the model to respond as if speaking to a ghost in an alchemy shop.
Change the model’s tone by writing your prompt in a voice you want the model to match. For
example, if you write your prompt in a peppy and cheerful way, or talk like a cowboy, the model
responds with a matching tone.
Professional
Communicate as an experienced interior
designer consulting with a client. Occasionally
reference design elements like harmony,
proportion, or focal points.
Medieval Scholar
Communicate as a learned scribe from a
medieval library. Use slightly archaic language
(“thou shalt,” “wherein,” “henceforth”) but ke
it readable.”
Instruction following refers to a foundation model’s ability to carry out a request exactly as written
in your Prompt and Instructions. Prompt engineering involves iteration to test and refine inpu
— based on the results you get — to improve accuracy and consistency. If you notice the model
isn’t following instructions as well as you need, consider the following strategies:
Strategy
Approach
Improve
clarity
Improve the wording of your input to make it more direct, concise, and easier to
read.
Use emphasis
Emphasize the importance of a command by adding words like “must, “should”
“do not” or avoid”.
Repeat
yourself
Try repeating key instructions at the end of your input to emphasize the
importance.
Instead of trying to enforce accuracy, use a succinct prompt like “Answer this question” and
evaluate the results you get.
After you try any strategy, take the time to evaluate it to see if the result gets closer to what you
need. If the model can’t follow your prompt, it might be unreliable in some use cases. Try cutting
back the number of times you repeat a phrase, or the number of words you emphasize, to make
your prompt more effective. Unreliable prompts break easily when conditions change slightly.
Iterate and improve instruction following


## Page 5

Another prompting strategy is to split your request into a series of simpler requests. This is
particularly useful after trying different strategies that don’t improve the quality of the results.
A model’s reasoning ability is how well it thinks through a problem like a human, handles logical
puzzles, or creates a logical plan to handle a request. Because of their smaller size, on-device
models have limited reasoning abilities. You may be able to help an on-device model think through
a challenging task by providing additional support for its reasoning.
For complex tasks, simple language prompts might not have enough detail about how the model
can accomplish a task. Instead, reduce the reasoning burden on the model by giving it a step-by-
step plan. This approach tells the model more precisely how to do the task:
Step-by-step
Given a person’s home-decor transactions and search history related to couches:
1. Choose four home furniture categories that are most relevant to this person.
2. Recommend two more categories related to home-decor.
3. Return a list of relevant and recommended categories, ordered by most relevant to least.
If you find the model isn’t accomplishing the task reliably, break up the steps across multiple
LanguageModelSession instances to focus on one part at a time with a new context window.
Typically, it’s a best practice to start with a single request because multiple requests can result in
longer inference time. But, if the result doesn’t meet your expectations, try splitting steps into
multiple requests.
Conditional prompting is where you embed if-else logic into your prompt. A server-based frontier
model has the context window and reasoning abilities to handle a lengthy list of instructions for
how to handle different requests. An on-device model can handle some conditionals or light
reasoning, like:
Use the weather tool if the person asks about the weather and the calendar tool if the person ask
about events.
But, too much conditional complexity can affect the on-device model’s ability to follow instruction
When the on-device model output doesn’t meet your expectations, try customizing your
conditional prompt to the current context. For example, the following conditional prompt contains
several sentences that break up what the model needs to do:
Reduce how much thinking the model needs to do
Turn conditional prompting into programming logic


## Page 6

Instead, use programming logic to customize the prompt based on known information:
When you customize instructions programmatically, the model doesn’t get distracted or confused
by conditionals that don’t apply in the situation. This approach also reduces the context window
size.
Provide simple input-output examples


## Page 7

Few-shot prompting is when you provide the on-device model with a few examples of the output
you want. For example, the following shows the model different kinds of coffee shop customers it
needs to generate:
Few-shot prompting also works with guided generation, which formats the model’s output by usin
a custom type you define. In the previous prompt, each example might correspond to a
Generable structure you create named NPC:
On-device models need simpler examples for few-shot prompts than what you can use with
server-based frontier models. Try giving the model between 2-15 examples, and keep each
example as simple as possible. If you provide a long or complex example, the on-device model ma
start to repeat your example or hallucinate details of your example in its response.
For more information on guided generation, see Generating Swift data structures with guided
generation.
Reasoning prompt techniques, like “think through this problem step by step”, can result in
unexpected text being inserted into your Generable structure if the model doesn’t have a place
Handle on-device reasoning


## Page 8

for its reasoning. To keep reasoning explanations out of your structure, try giving the model a
specific field where it can put its reasoning. Make sure the reasoning field is the first property so
the model can provide reasoning details before answering the prompt:
Using your custom Generable type, prompt the model:
You may see the model fail to reason its way to a correct answer, or it may answer unreliably —
occasionally answering correctly, and sometimes not. If this happens, the tasks in your prompt ma
be too difficult for the on-device model to process, regardless of how you structure the prompt.
When you encounter something with the on-device model that you expect to work but it doesn’t,
file a report that includes your prompt with Feedback Assistant to help improve the system mode
To submit feedback about model behavior through Feedback Assistant, see logFeedback
Attachment(sentiment:issues:desiredOutput:).
Provide actionable feedback


## Page 9

Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Prompt
A prompt from a person to the model.
struct Transcript
A linear history of entries that reflect an interaction with a session.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
See Also
Prompting


## Page 10

Use Instruments to analyze the runtime performance, resource usage, and behavior of your app.
Instruments provides several tools to help you understand how responsive your app is and what
kind of power impact it has on the system, as well as diagnose hitches and more.
The Foundation Models instrument provides details about the interactions your app has with the
on-device model, so you can get insight into:
When the system loads model assets
How long it takes to start receiving a response from the model
What the token usage is across individual sessions
Where the model invokes any custom tools your app provides
The Foundation Models instrument helps you identify exactly where your app spends time and us
tokens. By analyzing your app’s model usage patterns, you can identify bottlenecks and apply
targeted optimizations to improve responsiveness and runtime performance.
Use additional instruments — alongside the Foundation Models instrument — to understand the
impact your model interactions have on thermal state, power, and other system resources.
Start by opening Instruments from your Xcode project:
1. From the Xcode Product menu, choose Profile.
Overview
Launch and configure Instruments for recording
Foundation Models / Analyzing the runtime performance of your Foundation Models app
Article
Analyzing the runtime performance of you
Foundation Models app
Optimize token consumption and improve response times by profiling your app’s
model usage with Instruments.


## Page 11

2. In the Template Selection window, select the Blank template and click Choose.
3. Click the “+ Instrument” button in the toolbar to add an instrument.
4. Search for “Foundation Models” and drag the instrument into your document.
Before you begin recording a session, consider adding additional instruments that can help you
understand the impact your app has on system resources, like Time Profiler, CPU Profiler, and
Power Profiler:
Time Profiler
Performs time-based sampling to identify where an app is consuming the most processing
time.
CPU Profiler
Performs fast, low-overhead measurement of CPU time.
Power Profiler
Performs analysis on the energy consumption across different subsystems.
Note
Some instruments, like Power Profiler, aren’t available to use with Simulator.
After you configure your template for analyzing your Foundation Models usage, choose File > Sav
As Template, to make it easier to reuse the same configuration when launching Instruments.


## Page 12

Before reviewing the performance of your app, first check that your development device isn’t und
thermal pressure or busy with other work. This helps you ensure that the device is in a good
performance state, which can influence your analysis. When you record a run, use your app as
normal and focus on interactions that perform requests to the model. Begin gathering data by
clicking the Record Trace button on the top left or by choosing File > Record Trace:
After you perform actions that generate model responses, wait for the responses to complete, the
click Stop to end recording.
The primary timeline consists of events that the instrument measures. The width of each
component on the timeline indicates latency. The Foundation Models track appears in your
timeline, with several graphs that provide insight into your session and assets:
Asset Loading
The time the system needs to load model data from storage before fulfilling a request.
Response
The start and end points that reflect the time it takes to perform on overall request.
Inference
The time the system takes to prepare the generation schema (shown as Prepare Vocabulary)
process the input prompt, and compute the output.
Tool Calling
The time a tool call occurs and the length of time it takes to perform work.
The following image shows the Foundation Models instrument after recording a trace:
Record app interactions to gather data
Get to know the instrument


## Page 13

To review what is happening at a more granular level, press Command-Plus Sign to zoom in, or
Command-Minus Sign to zoom out of the timeline:
When you prompt a language model, the model breaks down the input text into little fragments
called tokens. Each token is typically a word or a piece of a word. The token count includes
Understand token usage


## Page 14

instructions, prompts, and outputs for a session instance. If your session processes a large numb
of tokens that exceed the context window, the framework throws the error LanguageModel
Session.GenerationError.exceededContextWindowSize(_:). For more information o
managing the context window size, see TN3193: Managing the on-device foundation model’s
context window.
More output tokens generally require more processing time. Additionally, processing time depend
on the task you perform. For example, summarizing a document requires much less processing
time than writing a new article, because it’s mostly a reading task for the model.
The cost of text varies between characters of symbols versus discrete words. For example, the
word “Sourdough” might be one token, but a phone number like +1-(408)-555-0123 might use
over ten tokens because of the characters and symbols.
High token counts affect both initial processing time and memory usage. The Inference detail area
shows token metrics for each session. Token counts above 1000 may slow down response
generation, especially on older devices. When you are testing runtime performance, compare tok
counts across different app interactions to identify which prompts consume the most tokens.
To compare token counts:
1. Click the Foundation Models instrument.
2. Select View > Detail Area > Inference.
The following image shows the details about a single session, including a breakdown of where the
session spent time:
The Inference detail area reveals a breakdown of the session calls during the recorded trace. It als
includes:
Count
The number of events that occur.
Duration
The length of processing time for the session.
Max Input Token Count


## Page 15

An estimate of the required tokens for the prompt, instructions, tools, and so on.
Max Output Token Count
An estimate of the tokens the model uses for a response.
For each request, Instruments provides additional details:
Prompt Processing
Measures how long it takes to prepare the request.
First Token Inference
Measures how quickly the model begins generating output. A lower first token latency
improves perceived responsiveness.
Extended Inference
Measures reasoning and verification processing time. A higher latency indicates where the
model is spending time “thinking.”
By default, the entire timeline is in a selected state. If you want to focus on a specific time frame t
understand more about the performance at a specific point in time, click and drag inside the
timeline to select the range you want to analyze, or press Command-Plus Sign to zoom in and
Command-Minus Sign to zoom out.
Asset-loading delays appear as gaps between the start of a request and the first token generation
A delay of several hundred milliseconds before tokens start appearing means that your app loads
the model after a person makes a request. If you know that your app needs to make a call to the
model soon, use the prewarm(promptPrefix:) method to load the model before you need to
call it. Preload the model when you have at least one second before calling a respond method. Th
technique moves loading time away from the critical response path to improve the responsivenes
of your app.
A prompt prefix helps the model prepare for similar requests, reducing the time to first token. Wh
you know the type of requests a person is about to make, improve performance by providing a
prefix that matches your app’s common prompt patterns. For example, if your app generates
itineraries, prewarm the model with the prefix you expect to use for each request:
Optimize model loading with prewarming


## Page 16

After implementing prewarming, profile your app again to verify that asset loading happens before
the request is made — eliminating delays in the critical path.
A lower token count improves performance and helps you stay within context limits.
The includeSchemaInPrompt parameter in streamResponse(generating:include
SchemaInPrompt:options:prompt:) tells the framework to include information about
Generable types in your prompts before processing the request. Doing so improves the output
quality, but requires that the model consumes more input tokens. If you already made a similar
request or provided examples in your system instructions, you can exclude the schema in
subsequent requests. Excluding the schema removes redundant schema information and can sav
hundreds of tokens per request. To further optimize token usage, consider whether you need
nested Generable types in a parent type. More context is necessary to handle nested
Generable schema details.
When you no longer need the schema data for your session, set includeSchemaInPrompt to
false:
After you make this change, the Inference section of the Foundation Models instrument displays
lower maximum token counts, which translates to faster initial processing. The following screensh
shows the input token count — with includeSchemaInPrompt set to true — after running thre
generation requests:
The following image shows similar requests, with includeSchemaInPrompt set to false:
Reduce token consumption
Verify your optimizations


## Page 17

When you perform runtime optimization updates in your code, profile your app each time to
confirm that the changes improve performance. Compare the new timeline with your previous
recordings, and rename each recording from the sidebar based on what changed between runs, t
help indicate what the run involved.
Successful prewarming moves asset loading earlier in the timeline and before an app makes a
request to the model. This reduces the amount of time a session takes to start generating a
response to the request and shortens the time an app waits to perform additional requests or UI
updates. The following image shows a request being made to the model after an app calls
prewarm(promptPrefix:):
When you evaluate your app, look for these improvements in each recording:
Asset loading happens before the app makes the request.
The first tokens appear immediately after the session starts processing the request.
The Inference detail area shows lower token counts.
The overall session and tool-calling response times meet the intended user experience.
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Prompt
A prompt from a person to the model.
struct Transcript
A linear history of entries that reflect an interaction with a session.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
See Also
Prompting


## Page 18



## Page 19

Generating content and performing tasks with Foundation Models
Categorizing and organizing data with content tags
Generating Swift data structures with guided generation
Improving the safety of generative model output
Prompting an on-device foundation model
A session is a single context that you use to generate content with, and maintains state between
requests. You can reuse the existing instance or create a new one each time you call the model.
When creating a session, provide instructions that tells the model what its role is and provide
guidance on how to respond.
Mentioned in
Overview
Foundation Models / LanguageModelSession
Class
LanguageModelSession
An object that represents a session that interacts with a language model.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 20

The framework records each call to the model in a Transcript that includes all prompts and
responses. If your session exceeds the available context size, it throws LanguageModelSessio
.GenerationError.exceededContextWindowSize(_:).
When you perform a task that needs a larger context size, split the task into smaller steps and run
each of them in a new LanguageModelSession. For example, to generate a summary for a long
article on device:
1. Separate the article into smaller sections.
2. Summarize each section with a new session instance.
3. Combine the sections.
4. Repeat the steps until you get a summary with the size you want, and consider adding the
summary to the prompt so it conveys the contextual information.
Use Instruments to analyze token consumption while your app is running and to look for
opportunities to improve performance, like with prewarm(promptPrefix:). To profile your ap
with Instruments:
1. Open your Xcode project and choose Product > Profile to launch Instruments.
2. Select the Blank template, then click Choose.
3. In Instruments, click “+ Instrument” to open the instruments library.
4. Choose the Foundation Models instrument from the list.
5. Choose File > Record Trace. This launches your app and starts a recording session to observe
token usage from your app’s model interactions.
Because some generation tasks can be resource intensive, consider profiling your app with other
instruments — like Activity Monitor and Power Profiler — to identify where your app might be usin
more system resources than expected.
For more information on managing the context window size, see TN3193: Managing the on-devic
foundation model’s context window.
convenience(model:tools:instructions:)
Start a new session in blank slate state with instructions builder.
class SystemLanguageModel
An on-device large language model capable of text generation tasks.
Topics
Creating a session


## Page 21

protocol Tool
A tool that a model can call to gather information at runtime or perform side effects.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
convenience init(model: SystemLanguageModel, tools: [any Tool],
transcript: Transcript)
Start a session by rehydrating from a transcript.
struct Transcript
A linear history of entries that reflect an interaction with a session.
func prewarm(promptPrefix: Prompt?)
Loads the resources required for this session into memory, and optionally caches a prefix of
your prompt to reduce request latency.
var isResponding: Bool
A Boolean value that indicates a response is being generated.
var transcript: Transcript
A full history of interactions, including user inputs and model responses.
func respond(options: GenerationOptions, prompt: () throws -> Prompt)
async throws -> LanguageModelSession.Response<String>
Produces a response to a prompt.
func respond<Content>(generating: Content.Type, includeSchemaInPrompt:
Bool, options: GenerationOptions, prompt: () throws -> Prompt) async 
throws -> LanguageModelSession.Response<Content>
Produces a generable object as a response to a prompt.
Creating a session from a transcript
Preloading the model
Inspecting session properties
Generating a request


## Page 22

func respond(schema: GenerationSchema, includeSchemaInPrompt: Bool,
options: GenerationOptions, prompt: () throws -> Prompt) async throws -
LanguageModelSession.Response<GeneratedContent>
Produces a generated content type as a response to a prompt and schema.
func respond(to:options:)
Produces a response to a prompt.
func respond(to:generating:includeSchemaInPrompt:options:)
Produces a generable object as a response to a prompt.
func respond(to:schema:includeSchemaInPrompt:options:)
Produces a generated content type as a response to a prompt and schema.
struct Prompt
A prompt from a person to the model.
struct Response
A structure that stores the output of a response call.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
func streamResponse(to:options:)
Produces a response stream to a prompt.
func streamResponse(to:generating:includeSchemaInPrompt:options:)
Produces a response stream to a prompt and schema.
func streamResponse(to:schema:includeSchemaInPrompt:options:)
Produces a response stream to a prompt and schema.
func streamResponse(options: GenerationOptions, prompt: () throws ->
Prompt) rethrows -> sending LanguageModelSession.ResponseStream<String>
Produces a response stream to a prompt.
func streamResponse<Content>(generating: Content.Type, includeSchemaIn
Prompt: Bool, options: GenerationOptions, prompt: () throws -> Prompt)
rethrows -> sending LanguageModelSession.ResponseStream<Content>
Produces a response stream for a type.
Streaming a response


## Page 23

func streamResponse(schema: GenerationSchema, includeSchemaInPrompt:
Bool, options: GenerationOptions, prompt: () throws -> Prompt) rethrows
-> sending LanguageModelSession.ResponseStream<GeneratedContent>
Produces a response stream to a prompt and schema.
struct ResponseStream
An async sequence of snapshots of partially generated content.
struct GeneratedContent
A type that represents structured, generated content.
protocol ConvertibleFromGeneratedContent
A type that can be initialized from generated content.
protocol ConvertibleToGeneratedContent
A type that can be converted to generated content.
func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?,
issues: [LanguageModelFeedback.Issue], desiredOutput: Transcript.Entry?
-> Data
Logs and serializes data that includes session information that you attach when reporting
feedback to Apple.
func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?,
issues: [LanguageModelFeedback.Issue], desiredResponseContent: (any
ConvertibleToGeneratedContent)?) -> Data
func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?,
issues: [LanguageModelFeedback.Issue], desiredResponseText: String?) ->
Data
enum GenerationError
An error that may occur while generating a response.
struct ToolCallError
An error that occurs while a system language model is calling a tool.
Generating feedback
Getting the error types


## Page 24

Copyable
Observable
Sendable
SendableMetatype
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Prompt
A prompt from a person to the model.
struct Transcript
A linear history of entries that reflect an interaction with a session.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
Relationships
Conforms To
See Also
Prompting


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

Generating content and performing tasks with Foundation Models
Use a Transcript to visualize previous instructions, prompts and model responses. If you use
tool calling, a Transcript includes a history of tool calls and their results.
Mentioned in
Overview
Foundation Models / Transcript
Structure
Transcript
A linear history of entries that reflect an interaction with a session.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 32

When you create a new LanguageModelSession it doesn’t contain the state of a previous
session. You can initialize a new session with a list of entries you get from a session transcript
init(entries: some Sequence<Transcript.Entry>)
Creates a transcript.
enum Entry
An entry in a transcript.
enum Segment
The types of segments that may be included in a transcript entry.
struct Instructions
Topics
Creating a transcript
Getting the transcript types


## Page 33

Instructions you provide to the model that define its behavior.
struct Prompt
A prompt from the user to the model.
struct Response
A response from the model.
struct ResponseFormat
Specifies a response format that the model must conform its output to.
struct StructuredSegment
A segment containing structured content.
struct TextSegment
A segment containing text.
struct ToolCall
A tool call generated by the model containing the name of a tool and arguments to pass to it
struct ToolCalls
A collection tool calls generated by the model.
struct ToolDefinition
A definition of a tool.
struct ToolOutput
A tool output provided back to the model.
BidirectionalCollection
Collection
Copyable
Decodable
Encodable
Equatable
RandomAccessCollection
Sendable
Relationships
Conforms To


## Page 34

SendableMetatype
Sequence
Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Prompt
A prompt from a person to the model.
struct GenerationOptions
Options that control how the model generates its response to a prompt.
See Also
Prompting


## Page 35

Generating content and performing tasks with Foundation Models
Generation options determine the decoding strategy the framework uses to adjust the way the
model chooses output tokens. When you interact with the model, it converts your input to a token
sequence, and uses it to generate the response.
Only use maximumResponseTokens when you need to protect against unexpectedly verbose
responses. Enforcing a strict token response limit can lead to the model producing malformed
results or gramatically incorrect responses.
All input to the model contributes tokens to the context window of the LanguageModelSession
— including the Instructions, Prompt, Tool, and Generable types, and the model’s
responses. If your session exceeds the available context size, it throws LanguageModelSessio
.GenerationError.exceededContextWindowSize(_:). For more information on managin
the context window size, see TN3193: Managing the on-device foundation model’s context windo
Mentioned in
Overview
Topics
Foundation Models / GenerationOptions
Structure
GenerationOptions
Options that control how the model generates its response to a prompt.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 36

init(sampling: GenerationOptions.SamplingMode?, temperature: Double?,
maximumResponseTokens: Int?)
Creates generation options that control token sampling behavior.
var maximumResponseTokens: Int?
The maximum number of tokens the model is allowed to produce in its response.
var sampling: GenerationOptions.SamplingMode?
A sampling strategy for how the model picks tokens when generating a response.
struct SamplingMode
A type that defines how values are sampled from a probability distribution.
var temperature: Double?
Temperature influences the confidence of the models response.
Equatable, Sendable, SendableMetatype
Creating options
Configuring the response tokens
Configuring the sampling mode
Configuring the temperature
Relationships
Conforms To
See Also
Prompting


## Page 37

Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
Analyzing the runtime performance of your Foundation Models app
Optimize token consumption and improve response times by profiling your app’s model usag
with Instruments.
class LanguageModelSession
An object that represents a session that interacts with a language model.
struct Instructions
Details you provide that define the model’s intended behavior on prompts.
struct Prompt
A prompt from a person to the model.
struct Transcript
A linear history of entries that reflect an interaction with a session.


