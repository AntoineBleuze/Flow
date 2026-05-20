# 000_Adding parameters to an app intent.pdf

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


