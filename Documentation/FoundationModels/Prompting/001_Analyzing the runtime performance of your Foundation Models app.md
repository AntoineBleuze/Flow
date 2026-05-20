# 001_Analyzing the runtime performance of your Foundation Models app.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

To review what is happening at a more granular level, press Command-Plus Sign to zoom in, or
Command-Minus Sign to zoom out of the timeline:
When you prompt a language model, the model breaks down the input text into little fragments
called tokens. Each token is typically a word or a piece of a word. The token count includes
Understand token usage


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9



