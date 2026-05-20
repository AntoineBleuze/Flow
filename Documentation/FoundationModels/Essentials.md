# Essentials.pdf

## Page 1

The Foundation Models framework lets you tap into the on-device large models at the core of
Apple Intelligence. You can enhance your app by using generative models to create content or
perform tasks. The framework supports language understanding and generation based on model
capabilities.
For design guidance, see Human Interface Guidelines > Technologies > Generative AI.
When considering features for your app, it helps to know what the on-device language model can
do. The on-device model supports text generation and understanding that you can use to:
Capability
Prompt example
Summarize
“Summarize this article.”
Extract entities
“List the people and places mentioned in this text.”
Understand text
“What happens to the dog in this story?”
Refine or edit text
“Change this story to be in second person.”
Classify or judge text
“Is this text relevant to the topic ‘Swift’?”
Overview
Understand model capabilities
Foundation Models / Generating content and performing tasks with Foundation Models
Article
Generating content and performing tasks
with Foundation Models
Enhance the experience in your app by prompting an on-device large language
model.


## Page 2

Capability
Prompt example
Compose creative writing
“Generate a short bedtime story about a fox.”
Generate tags from text
“Provide two tags that describe the main topics of this text.”
Generate game dialog
“Respond in the voice of a friendly inn keeper.”
The on-device language model may not be suitable for handling all requests, like:
Capabilities to avoid
Prompt example
Do basic math
“How many b’s are there in bagel?”
Create code
“Generate a Swift navigation list.”
Perform logical reasoning
“If I’m at Apple Park facing Canada, what direction is Texas?”
The model can complete complex generative tasks when you use guided generation or tool callin
For more on handling complex tasks, or tasks that require extensive world-knowledge, see
Generating Swift data structures with guided generation and Expanding generation with tool
calling.
Before you use the on-device model in your app, check that the model is available by creating an
instance of SystemLanguageModel with the default property.
Model availability depends on device factors like:
The device must support Apple Intelligence.
The device must have Apple Intelligence turned on in Settings.
Note
It can take some time for the model to download and become available when a person turns on
Apple Intelligence.
Always verify model availability first, and plan for a fallback experience in case the model is
unavailable.
Check for availability


## Page 3

After confirming that the model is available, create a LanguageModelSession object to call the
model. For a single-turn interaction, create a new session each time you call the model:
For a multiturn interaction — where the model retains some knowledge of what it produced — reu
the same session each time you call the model.
A Prompt is an input that the model responds to. Prompt engineering is the art of designing high
quality prompts so that the model generates a best possible response for the request you make. A
prompt can be as short as “hello”, or as long as multiple paragraphs. The process of designing a
prompt involves a lot of exploration to discover the best prompt, and involves optimizing prompt
length and writing style.
When thinking about the prompt you want to use in your app, consider using conversational
language in the form of a question or command. For example, “What’s a good month to visit Paris
Create a session
Provide a prompt to the model


## Page 4

or “Generate a food truck menu.”
Write prompts that focus on a single and specific task, like “Write a profile for the dog breed
Siberian Husky”. When a prompt is long and complicated, the model takes longer to respond, and
may respond in unpredictable ways. If you have a complex generation task in mind, break the task
down into a series of specific prompts.
You can refine your prompt by telling the model exactly how much content it should generate. A
prompt like, “Write a profile for the dog breed Siberian Husky” often takes a long time to process 
the model generates a full multi-paragraph essay. If you specify “using three sentences”, it speed
up processing and generates a concise summary. Use phrases like “in a single sentence” or “in a
few words” to shorten the generation time and produce shorter text.
Instructions help steer the model in a way that fits the use case of your app. The model obey
prompts at a lower priority than the instructions you provide. When you provide instructions to the
model, consider specifying details like:
What the model’s role is; for example, “You are a mentor,” or “You are a movie critic”.
What the model should do, like “Help the person extract calendar events,” or “Help the person
by recommending search suggestions”.
What the style preferences are, like “Respond as briefly as possible”.
What the possible safety measures are, like “Respond with ‘I can’t help with that’ if you’re aske
to do something dangerous”.
Use content you trust in instructions because the model follows them more closely than the prom
itself. When you initialize a session with instructions, it affects all prompts the model responds to 
that session. Instructions can also include example responses to help steer the model. When you
add examples to your prompt, you provide the model with a template that shows the model what 
good response looks like.
Provide instructions to the model
Generate a response


## Page 5

To call the model with a prompt, call respond(to:options:) on your session. The response c
is asynchronous because it may take a few seconds for the on-device foundation model to
generate the response.
Note
A session can only handle a single request at a time, and causes a runtime error if you call it
again before the previous request finishes. Check isResponding to verify the session is
done processing the previous request before sending a new one.
Instead of working with raw string output from the model, the framework offers guided generation
to generate a custom Swift data structure you define. For more information about guided
generation, see Generating Swift data structures with guided generation.
When you make a request to the model, you can provide custom tools to help the model complete
the request. If the model determines that a Tool can assist with the request, the framework calls
your Tool to perform additional actions like retrieving content from your local database. For more
information about tool calling, see Expanding generation with tool calling
The context window size is a limit on how much data the model can process for a session instanc
A token is a chunk of text the model processes, and the system model supports up to 4,096
tokens. A single token corresponds to three or four characters in languages like English, Spanish, 
German, and one token per character in languages like Japanese, Chinese, or Korean. In a single
session, the sum of all tokens in the instructions, all prompts, and all outputs count toward the
context window size.
If your session processes a large amount of tokens that exceed the context window, the framewo
throws the error LanguageModelSession.GenerationError.exceededContextWindow
Size(_:). When you encounter the error, start a new session and try shortening your prompts. 
you need to process a large amount of data that won’t fit in a single context window limit, break
Consider context size limits per session


## Page 6

your data into smaller chunks, process each chunk in a separate session, and then combine the
results.
For more information on managing the context window size, see TN3193: Managing the on-devic
foundation model’s context window.
To get the best results for your prompt, experiment with different generation options. Generatio
Options affects the runtime parameters of the model, and you can customize them for every
request you make.
When you test apps that use the framework, use Xcode Instruments to understand more about th
requests you make, like the time it takes to perform a request. When you make a request, you can
access the Transcript entries that describe the actions the model takes during your Languag
ModelSession.
Improving the safety of generative model output
Create generative experiences that appropriately handle sensitive inputs and respect people
Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
Adding intelligent app features with generative models
Build robust apps with guided generation and tool calling by adopting the Foundation Model
framework.
Tune generation options and optimize performance
See Also
Essentials


## Page 7

class SystemLanguageModel
An on-device large language model capable of text generation tasks.
struct UseCase
A type that represents the use case for prompting.


## Page 8

Generative AI models have powerful creativity, but with this creativity comes the risk of unintende
or unexpected results. For any generative AI feature, safety needs to be an essential part of your
design.
The Foundation Models framework has two base layers of safety, where the framework uses:
An on-device language model that has training to handle sensitive topics with care.
Guardrails that aim to block harmful or sensitive content, such as self-harm, violence, and adul
materials, from both model input and output.
Because safety risks are often contextual, some harms might bypass both built-in framework safe
layers. It’s vital to design additional safety layers specific to your app. When developing your
feature, decide what’s acceptable or might be harmful in your generative AI feature, based on you
app’s use case, cultural context, and audience.
For more information on designing generative AI experiences responsibly, see Human Interface
Guidelines > Foundations > Generative AI.
When you send a prompt to the model, SystemLanguageModel.Guardrails check the input
prompt and the model’s output. If either fails the guardrail’s safety check, the model session throw
a LanguageModelSession.GenerationError.guardrailViolation(_:) error:
Overview
Handle guardrail errors
Foundation Models / Improving the safety of generative model output
Article
Improving the safety of generative model
output
Create generative experiences that appropriately handle sensitive inputs and
respect people.


## Page 9

If you encounter a guardrail violation error for any built-in prompt in your app, experiment with re-
phrasing the prompt to determine which phrases are activating the guardrails, and avoid those
phrases. If the error is thrown in response to a prompt created by someone using your app, give
people a clear message that explains the issue. For example, you might say “Sorry, this feature isn
designed to handle that kind of input” and offer people the opportunity to try a different prompt.
The on-device language model may not be suitable for handling all requests and may refuse
requests for a topic. When you generate a string response, and the model refuses a request, it
generates a message that begins with a refusal like “Sorry, I can’t help with”.
Design your app experience with refusal messages in mind and present the message to the perso
using your app. You might not be able to programmatically determine whether a string response i
a normal response or a refusal, so design the experience to anticipate both. If it’s critical to
determine whether the response is a refusal message, initialize a new LanguageModelSession
and prompt the model to classify whether the string is a refusal.
When you use guided generation to generate Swift structures or types, there’s no placeholder for
refusal message. Instead, the model throws a LanguageModelSession.GenerationError
.refusal(_:_:) error. When you catch the error, you can ask the model to generate a string
refusal message:
Handle model refusals


## Page 10

Display the explanation in your app to tell people why a request failed, and offer people the
opportunity to try a different prompt. Retrieving an explanation message is asynchronous and tak
time for the model to generate.
If you encounter a refusal message, or refusal error, for any built-in prompts in your app,
experiment with re-phrasing your prompt to avoid any sensitive topics that might cause the refus
For more information about guided generation, see Generating Swift data structures with guided
generation.
Safety risks increase when a prompt includes direct input from a person using your app, or from a
unverified external source, like a webpage. An untrusted source makes it difficult to anticipate wh
the input contains. Whether accidentally or on purpose, someone could input sensitive content th
causes the model to respond poorly.
Tip
The more you can define the intended usage and outcomes for your feature, the more you can
ensure generation works great for your app’s specific use cases. Add boundaries to limit out-
of-scope usage and minimize low generation quality from out-of-scope uses.
Whenever possible, avoid open input in prompts and place boundaries for controlling what the
input can be. This approach helps when you want generative content to stay within the bounds of
particular topic or task. For the highest level of safety on input, give people a fixed set of prompts
to choose from. This gives you the highest certainty that sensitive content won’t make its way into
your app:
Build boundaries on input and output


## Page 11

If your app allows people to freely input a prompt, placing boundaries on the output can also offer
stronger safety guarantees. Using guided generation, create an enumeration to restrict the mode
output to a set of predefined options designed to be safe no matter what:
Consider adding detailed session Instructions that tell the model how to handle sensitive
content. The language model prioritizes following its instructions over any prompt, so instructions
are an effective tool for improving safety and overall generation quality. Use uppercase words to
emphasize the importance of certain phrases for the model:
Note
A session obeys instructions over a prompt, so don’t include input from people or any
unverified input in the instructions. Using unverified input in instructions makes your app
vulnerable to prompt injection attacks, so write instructions with content you trust.
Instruct the model for added safety


## Page 12

If you want to include open-input from people, instructions for safety are recommended. For an
additional layer of safety, use a format string in normal prompts that wraps people’s input in your
own content that specifies how the model should respond:
If you allow prompt input from people or outside sources, consider adding your own deny list of
terms. A deny list is anything you don’t want people to be able to input to your app, including
unsafe terms, names of people or products, or anything that’s not relevant to the feature you
provide. Implement a deny list similarly to guardrails by creating a function that checks the input
and the model output:
A deny list can be a simple list of strings in your code that you distribute with your app.
Alternatively, you can host a deny list on a server so your app can download the latest deny list
when it’s connected to the network. Hosting your deny list allows you to update your list when you
need to and avoids requiring a full app update if a safety issue arise.
Add a deny list of blocked terms


## Page 13

The default SystemLanguageModel guardrails may throw a LanguageModelSession
.GenerationError.guardrailViolation(_:) error for sensitive source material. For
example, it may be appropriate for your app to work with certain inputs from people and unverifie
sources that might contain sensitive content:
When you want the model to tag the topic of conversations in a chat app when some messages
contain profanity.
When you want to use the model to explain notes in your study app that discuss sensitive topic
To allow the model to reason about sensitive source material, use permissiveContent
Transformations when you initialize SystemLanguageModel:
This mode only works for generating a string value. When you use guided generation, the
framework runs the default guardrails against model input and output as usual, and generates
LanguageModelSession.GenerationError.guardrailViolation(_:) and Language
ModelSession.GenerationError.refusal(_:_:)errors as usual.
Before you use permissive content mode, consider what’s appropriate for your audience. The
session skips the guardrail checks in this mode, so it never throws a LanguageModelSession
.GenerationError.guardrailViolation(_:) error when generating string responses.
However, even with the SystemLanguageModel guardrails off, the on-device system language
model still has a layer of safety. For some content, the model may still produce a refusal message
that’s similar to, “Sorry, I can’t help with.”
Conduct a risk assessment to proactively address what might go wrong. Risk assessment is an
exercise that helps you brainstorm potential safety risks in your app and map each risk to an
actionable mitigation. You can write a risk assessment in any format that includes these essential
elements:
List each AI feature in your app.
For each feature, list possible safety risks that could occur, even if they seem unlikely.
For each safety risk, score how serious the harm would be if that thing occurred, from mild to
critical.
For each safety risk, assign a strategy for how you’ll mitigate the risk in your app.
Use permissive guardrail mode for sensitive content
Create a risk assessment


## Page 14

For example, an app might include one feature with the fixed-choice input pattern for generation
and one feature with the open-input pattern for generation, which is higher safety risk:
Feature
Harm
Severity
Mitigation
Player can input any text
to chat with nonplayer
characters in the coffee
shop.
A character might
respond in an
insensitive or
harmful way.
Critical
Instructions and prompting to
steer characters responses to
be safe; safety testing.
Image generation of an
imaginary dream
customer, like a fairy or a
frog.
Generated image
could look weird or
scary.
Mild
Include in the prompt
examples of images to
generate that are cute and no
scary; safety testing.
Player can make a coffee
from a fixed menu of
options.
None identified.
Generate a review of the
coffee the player made,
based on the customer’s
order.
Review could be
insulting.
Moderate
Instructions and prompting to
encourage posting a polite
review; safety testing.
Besides obvious harms, like a poor-quality model output, think about how your generative AI
feature might affect people, including real-world scenarios where someone might act based on
information generated by your app.
Although most people will interact with your app in respectful ways, it’s important to anticipate
possible failure modes where certain input or contexts could cause the model to generate
something harmful. Especially if your app takes input from people, test your experience’s safety o
input like:
Input that is nonsensical, snippets of code, or random characters.
Input that includes sensitive content.
Input that includes controversial topics.
Vague or unclear input that could be misinterpreted.
Create a list of potentially harmful prompt inputs that you can run as part of your app’s tests.
Include every prompt in your app — even safe ones — as part of your app testing. For each promp
Write and maintain safety tests


## Page 15

test, log the timestamp, full input prompt, the model’s response, and whether it activates any buil
in safety or mitigations you’ve included in your app. When starting out, manually read the model’s
response on all tests to ensure it meets your design and safety goals. To scale your tests, conside
using a frontier LLM to auto-grade the safety of each prompt. Building a test pipeline for prompts
and safety is a worthwhile investment for tracking changes in how your app responds over time.
Someone might purposefully attempt to break your feature or produce bad output — especially
someone who won’t be harmed by their actions. But, keep in mind that it’s very important to
identify cases where someone might accidentally be harmed during normal app use.
Tip
Prioritize protecting people using your app with good intentions. Accidental safety failures
often only occur in specific contexts, which make them hard to identify during testing. Test for
a longer series of interactions, and test for inputs that could become sensitive only when
combined with other aspects of your app.
Don’t engage in any testing that could cause you or others harm. Apple’s built-in responsible AI a
safety measures, like safety guardrails, are built by experts with extensive training and support.
These built-in measures aim to block egregious harms, allowing you to focus on the borderline
harmful cases that need your judgement. Before conducting any safety testing, ensure that you’re
in a safe location and that you have the health and well-being support you need.
Somewhere in your app, it’s important to include a way that people can report potentially harmful
content. Continuously monitor the feedback you receive, and be responsive to quickly handling a
safety issues that arise. If someone reports a safety concern that you believe isn’t being properly
handled by Apple’s built-in guardrails, report it to Apple with Feedback Assistant.
The Foundation Models framework offers utilities for feedback. Use LanguageModelFeedback 
retrieve language model session transcripts from people using your app. After collecting feedbac
you can serialize it into a JSON file and include it in the report you send with Feedback Assistant.
Apple releases updates to the system model as part of regular OS updates. If you participate in th
developer beta program you can test your app with new model version ahead of people using you
app. When the model updates, it’s important to re-run your full prompt tests in addition to your
adversarial safety tests because the model’s response may change. Your risk assessment can hel
you track any change to safety risks in your app.
Report safety concerns
Monitor safety for model or guardrail updates


## Page 16

Apple may update the built-in guardrails at any time outside of the regular OS update cycle. This 
done to rapidly respond, for example, to reported safety concerns that require a fast response.
Include all of the prompts you use in your app in your test suite, and run tests regularly to identify
when prompts start activating the guardrails.
Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
Adding intelligent app features with generative models
Build robust apps with guided generation and tool calling by adopting the Foundation Model
framework.
class SystemLanguageModel
An on-device large language model capable of text generation tasks.
struct UseCase
A type that represents the use case for prompting.
See Also
Essentials


## Page 17

The on-device system language model is multilingual, which means the same model understands
and generates text in any language that Apple Intelligence supports. The model supports using
different languages for prompts, instructions, and the output that the model produces.
When you enhance your app with multilingual support, generate content in the language people
prefer to use when they interact with your app by:
Prompting the model with the language you prefer.
Including the target language for your app in the instructions you provide the model.
Determining the language or languages a person wants to use when they interact with your app
Gracefully handling languages that Apple Intelligence doesn’t support.
For more information about the languages and locales that Apple Intelligence supports, see the
“Supported languages” section in How to get Apple Intelligence.
Write your app’s built-in prompts in the language with which you normally write code, if Apple
Intelligence supports that language. Translate your prompts into a supported language if your
preferred language isn’t supported. In the code below, all inputs need to be in supported languag
for the model to understand, including all Generable types and descriptions:
Overview
Prompt the model in the language you prefer
Foundation Models / Supporting languages and locales with Foundation Models
Article
Supporting languages and locales with
Foundation Models
Generate content in the language people prefer when they interact with your app.


## Page 18

Because the framework treats Generable types as model inputs, the names of properties like ag
or profile are just as important as the @Guide descriptions for helping the model understand
your request.
People can use the Settings app on their device to configure the language they prefer to use on a
per-app basis, which might differ from their default language. If your app supports a language tha
Apple Intelligence doesn’t, you need to verify that the current language setting of your app is
supported before you call the model. Keep in mind that language support improves over time in
newer model and OS versions. Thus, someone using your app with an older OS may not have the
latest language support.
Before you call the model, run supportsLocale(_:) to verify the support for a locale. By
default, the method uses current, which takes into account a person’s current language and ap
specific settings. This method returns true if the model supports this locale, or if this locale is
considered similar enough to a supported locale, such as en-AU and en-NZ:
For advanced use cases where you need full language support details, use supported
Languages to retrieve a list of languages supported by the on-device model.
Check a person’s language settings for your app


## Page 19

When you call respond(to:options:) on a LanguageModelSession, the Foundation Mode
framework checks the language or languages of the input prompt text, and whether your prompt
asks the model to respond in any specific language or languages. If the model detects a language
doesn’t support, the session throws LanguageModelSession.GenerationError
.unsupportedLanguageOrLocale(_:). Handle the error by communicating to the person
using your app that a language in their request is unsupported.
If your app supports languages or locales that Apple Intelligence doesn’t, help people that use yo
app by:
Explaining that their language isn’t supported by Apple Intelligence in your app.
Disabling your Foundation Models framework feature.
Providing an alternative app experience, if possible.
Important
Guardrails for model input and output safety are only for supported languages and locales. If a
prompt contains sensitive content in an unsupported language, which typically is a short
phrase mixed-in with text in a supported language, it might not throw a LanguageModel
Session.GenerationError.unsupportedLanguageOrLocale(_:) error. If
unsupported-language detection fails, the guardrails may also fail to flag that short,
unsupported content. For more on guardrails, see Improving the safety of generative model
output.
For locales other than United States English, you can improve response quality by telling the mod
which locale to use by detailing a set of Instructions. Start with the exact phrase in English.
This special phrase comes from the model’s training, and reduces the possibility of hallucinations
multilingual situations:
Handle an unsupported language or locale errors
Use Instructions to set the locale and language


## Page 20

After you set the locale in Instructions, you may need to explicitly set the model output
language. By default, the model responds in the language or languages of its inputs. If your app
supports multiple languages, prompts that you write and inputs from people using your app migh
be in different languages. For example, if you write your built-in prompts in Spanish, but someone
using your app writes inputs in Dutch, the model may respond in either or both languages.
Use Instructions to explicity tell the model which language or languages with witch it needs t
respond. You can phrase this request in different ways, for example: “You MUST respond in Italian
or “You MUST respond in Italian and be mindful of Italian spelling, vocabulary, entities, and other
cultural contexts of Italy.” These instructions can be in the language you prefer.
Finally, thoroughly test your instructions to ensure the model is responding in the way you expect
the model isn’t following your instructions, try capitalized words like “MUST” or “ALWAYS” to
strengthen your instructions.
Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
Improving the safety of generative model output
Create generative experiences that appropriately handle sensitive inputs and respect people
Adding intelligent app features with generative models
Build robust apps with guided generation and tool calling by adopting the Foundation Model
framework.
class SystemLanguageModel
An on-device large language model capable of text generation tasks.
struct UseCase
See Also
Essentials


## Page 21

A type that represents the use case for prompting.


## Page 22

This sample project shows how to integrate generative AI capabilities into an app using the
Foundation Models framework. The sample app showcases intelligent trip planning features that
help people discover landmarks and generate personalized itineraries.
The app creates an interactive experience where people can:
Browse curated landmarks with rich visual content
Generate trip itineraries tailored to a chosen landmark
Discover points of interest using a custom tool
Experience real-time content generation with streaming responses
Note
This sample code project is associated with WWDC25 session 259: Code-along: Add
Intelligence to your App using the Foundation Models framework.
To run this sample, you’ll need to:
Overview
Configure the sample code project
Foundation Models / Adding intelligent app features with generative models
Sample Code
Adding intelligent app features with
generative models
Build robust apps with guided generation and tool calling by adopting the
Foundation Models framework.
Download
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
visionOS 26.0+
Xcode 26.0+


## Page 23

1. Set the developer team in Xcode for the app target so it automatically manages the provisionin
profile. For more information, see Set the bundle ID and Assign the project to a team.
2. In the Developer portal, enable the WeatherKit app service for your bundle ID so the app can
access location-based weather information.
Before using the on-device model in the app, check that the model is available by creating an
instance of SystemLanguageModel with the default property:
The app handles two unavailability scenarios: Apple Intelligence isn’t enabled or the model isn’t
ready for usage. If Apple Intelligence is off, the app tells the person they need to turn it on and if
the model isn’t ready, it tells the person the Trip Planner isn’t ready and to try the app again later.
Note
To use the on-device language model, people need to turn on Apple Intelligence on their
device. For a list of supported devices, see Apple Intelligence.
Check model availability


## Page 24

The app starts by defining data structures with specific constraints to control what the model
generates. The Itinerary type uses the Generable macro to create structured content that
includes travel plans with activities, hotels, and restaurants.
The @Generable macro automatically converts Swift types into schemas that the model uses fo
constrained sampling, so you can specify guides to control the values you associate with it. For
example, the app uses Guide(description:) to make sure the model creates an exciting nam
for the trip. It also uses anyOf(_:) and count(_:) to choose any destination from our Model
Data and show exactly 3 DayPlan objects per destination, respectively.
Define structured data for generation


## Page 25

The @Generable macro automatically creates two versions of each type: the complete structure
and a PartiallyGenerated version which is a mirror of the outer structure except every
property is optional. The app uses this PartiallyGenerated version when streaming and
displaying the itinerary generation.
After checking that the model is available, the app configures a LanguageModelSession objec
with custom tools and detailed instructions in ItineraryPlanner. Given a location, the initializ
creates the session with structured guidance for generating personalized trip recommendations.
Configure the model session


## Page 26

In a generated itinerary, the model instructions ensure that each day contains an activity, hotel, an
restaurant. To get the location-specific businesses and activities, the sample uses a custom tool,
called FindPointsOfInterestTool, with the chosen landmark. The instructions also call the
landmark description property as added context when generating the activities.
You can use custom tools to extend the functionality of a model. Tool-calling allows the model to
interact with external code you create to fetch up-to-date information, ground responses in
sources of truth that you provide, and perform side effects.
The model in this app uses the FindPointsOfInterestTool tool to enable dynamic discovery
of specific businesses and activities for the chosen landmark. The tool uses the @Generable
macro to make its categories and arguments available to the model.
Create a custom tool


## Page 27

When you prompt the model with a question or make a request, the model decides whether it can
provide an answer or if it needs the help of a tool. The app explicitly instructs the model to always
use the findPointsOfInterestTool in the ItineraryPlanner instructions. This allows th
model to automatically call the tool to find relevant hotels, restaurants, and activities for the
destinations.
The app shows real-time content generation by streaming partial responses from the model. The
ItineraryPlanner uses streamResponse(generating:includeSchemaInPrompt:
options:prompt:) to generate Itinerary.PartiallyGenerated objects so itinerary item
are shown incrementally to the person.
You can opt for specific GenerationOptions to adjust the way the model generates these
responses. For generating the itinerary, the app opts for a greedy sampling mode so the model
always results in the same output for a given input. This ensures the prompt generates consistent
recommendations for an itinerary specific to the given landmark.
Stream and display partial responses in real time


## Page 28

The app presents the responses in a SwiftUI view. The ItineraryPlanningView displays real-
time visual feedback as the model searches for points of interest, showing people what’s
happening when generating content:
The app displays messages like “Searching hotel in Yosemite…” and “Searching restaurant in
Yosemite…” to let people know which point of interest category the model provided as input to the
tool when actively searching for nearby points of interest. In the background, however, the tool
executes and provides updates to the view. The view shows a blurred overlay while generating
each day plan, then reveals the full itinerary after the search completes.
The app uses content tagging on the provided landmarks to help people quickly understand the
characteristics of each destination. A content tagging model produces a list of categorizing tags
based on the input text you provide. When you prompt the content tagging model, it produces a
tag that uses one to a few lowercase words. The LandmarkDescriptionView prompts the
content tagging model to automatically generate relevant hashtags for landmark descriptions, like
#nature, #hiking, or #scenic, based on each landmark’s description. For more information o
initializing content tagging, see Categorizing and organizing data with content tags.
Tag content dynamically


## Page 29

You can combine these generative model features with other Apple frameworks. For example, the
LocationLookup class uses MapKit to search for addresses for our points of interest, showing
how to combine model-generated content with weather information and location data for comple
travel planning.
Integrate with other framework features


## Page 30

The model generates location names as text, and the LocationLookup class converts them into
real, mappable locations using the natural language search capabilities in MapKit.
Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
Improving the safety of generative model output
Create generative experiences that appropriately handle sensitive inputs and respect people
Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
class SystemLanguageModel
An on-device large language model capable of text generation tasks.
struct UseCase
A type that represents the use case for prompting.
See Also
Essentials


## Page 31

Improving the safety of generative model output
Generating content and performing tasks with Foundation Models
Loading and using a custom adapter with Foundation Models
The SystemLanguageModel refers to the on-device text foundation model that powers Apple
Intelligence. Use default to access the base version of the model and perform general-purpose
text generation tasks. To access a specialized version of the model, initialize the model with
SystemLanguageModel.UseCase to perform tasks like contentTagging.
Verify the model availability before you use the model. Model availability depends on device facto
like:
The device must support Apple Intelligence.
Apple Intelligence must be turned on in Settings.
Use SystemLanguageModel.Availability to change what your app shows to people based
on the availability condition:
Mentioned in
Overview
Foundation Models / SystemLanguageModel
Class
SystemLanguageModel
An on-device large language model capable of text generation tasks.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 32

convenience init(useCase: SystemLanguageModel.UseCase, guardrails:
SystemLanguageModel.Guardrails)
Creates a system language model for a specific use case.
struct UseCase
A type that represents the use case for prompting.
struct Guardrails
Guardrails flag sensitive content from model input and output.
Loading and using a custom adapter with Foundation Models
Specialize the behavior of the system language model by using a custom adapter you train.
com.apple.developer.foundation-model-adapter
A Boolean value that indicates whether the app can enable custom adapters for the
Foundation Models framework.
Topics
Loading the model with a use case
Loading the model with an adapter


## Page 33

convenience init(adapter: SystemLanguageModel.Adapter, guardrails:
SystemLanguageModel.Guardrails)
Creates the base version of the model with an adapter.
struct Adapter
Specializes the system language model for custom use cases.
var isAvailable: Bool
A convenience getter to check if the system is entirely ready.
var availability: SystemLanguageModel.Availability
The availability of the language model.
enum Availability
The availability status for a specific system language model.
var supportedLanguages: Set<Locale.Language>
Languages that the model supports.
func supportsLocale(Locale) -> Bool
Returns a Boolean indicating whether the given locale is supported by the model.
static let `default`: SystemLanguageModel
The base version of the model.
Copyable
Checking model availability
Retrieving the supported languages
Determining whether the model supports a locale
Getting the default model
Relationships
Conforms To


## Page 34

Observable
Sendable
SendableMetatype
Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
Improving the safety of generative model output
Create generative experiences that appropriately handle sensitive inputs and respect people
Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
Adding intelligent app features with generative models
Build robust apps with guided generation and tool calling by adopting the Foundation Model
framework.
struct UseCase
A type that represents the use case for prompting.
See Also
Essentials


## Page 35

Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
static let general: SystemLanguageModel.UseCase
A use case for general prompting.
Categorizing and organizing data with content tags
Identify topics, actions, objects, and emotions in input text with a content tagging model.
static let contentTagging: SystemLanguageModel.UseCase
A use case for content tagging.
Topics
Getting the general use case
Getting the content tagging use case
Relationships
Foundation Models / SystemLanguageModel / SystemLanguageModel.UseCase
Structure
SystemLanguageModel.UseCase
A type that represents the use case for prompting.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 36

Equatable, Sendable, SendableMetatype
Generating content and performing tasks with Foundation Models
Enhance the experience in your app by prompting an on-device large language model.
Improving the safety of generative model output
Create generative experiences that appropriately handle sensitive inputs and respect people
Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
Adding intelligent app features with generative models
Build robust apps with guided generation and tool calling by adopting the Foundation Model
framework.
class SystemLanguageModel
An on-device large language model capable of text generation tasks.
Conforms To
See Also
Essentials


