# 003_Adding intelligent app features with generative models.pdf

## Page 1

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


## Page 2

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


## Page 3

The app starts by defining data structures with specific constraints to control what the model
generates. The Itinerary type uses the Generable macro to create structured content that
includes travel plans with activities, hotels, and restaurants.
The @Generable macro automatically converts Swift types into schemas that the model uses fo
constrained sampling, so you can specify guides to control the values you associate with it. For
example, the app uses Guide(description:) to make sure the model creates an exciting nam
for the trip. It also uses anyOf(_:) and count(_:) to choose any destination from our Model
Data and show exactly 3 DayPlan objects per destination, respectively.
Define structured data for generation


## Page 4

The @Generable macro automatically creates two versions of each type: the complete structure
and a PartiallyGenerated version which is a mirror of the outer structure except every
property is optional. The app uses this PartiallyGenerated version when streaming and
displaying the itinerary generation.
After checking that the model is available, the app configures a LanguageModelSession objec
with custom tools and detailed instructions in ItineraryPlanner. Given a location, the initializ
creates the session with structured guidance for generating personalized trip recommendations.
Configure the model session


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

You can combine these generative model features with other Apple frameworks. For example, the
LocationLookup class uses MapKit to search for addresses for our points of interest, showing
how to combine model-generated content with weather information and location data for comple
travel planning.
Integrate with other framework features


## Page 9

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


