# Siri and Apple Intelligence.pdf

## Page 1

Apple Intelligence is a new personal intelligence system that deeply integrates powerful generativ
models into the core of iPhone, iPad and Mac. Siri will draw on the capabilities of Apple Intelligenc
to deliver assistance that’s more natural, contextually relevant and personal to users.
Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in
development and will be available with a future software update.
A big part of people’s personal context are the apps they use every day. The App Intents framewo
gives you a means to express your app’s capabilities and content to the system and integrate them
with Siri and Apple Intelligence. This will unlock new ways for your users to interact with your app
from anywhere on their device.
Note
If you’re new to the App Intents framework, make sure to read Making actions and content
discoverable and widely available and Creating your first app intent.
Overview
Understand assistant schemas
App Intents / Integrating actions with Siri and Apple Intelligence
Article
Integrating actions with Siri and Apple
Intelligence
Create app intents, entities, and enumerations that conform to assistant schemas
to tap into the enhanced action capabilities of Siri and Apple Intelligence.
iOS 18.0+
iPadOS 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Xcode 16.0+


## Page 2

To integrate your app with Siri and Apple Intelligence, provide AppIntent, AppEntity, and App
Enum implementations that work well with the pre-trained models Apple Intelligence uses. To
provide the implementation that Apple Intelligence needs, create the necessary code using Swift
macros to generate additional properties, and add the relevant protocol conformance for your app
intent, app entity, and app enum implementation. Xcode offers templates for the macros and
verifies the conformance of your code at compile time.
To create implementations that work well with Siri and Apple Intelligence:
For your App Intents implementation, use the AppIntent(schema:) macro.
For your AppEntity implementation, use the AppEntity(schema:) macro.
For your AppEnum implementation, use the AppEnum(schema:) macro.
Each macro requires you to provide a schema value to generate app intent, app entity, or app enu
code that Apple Intelligence can understand. The value you provide to the macros, the assistant
schema, has two parts:
The App intent domain that describes a collection of APIs for specific functionality; for example
the .photos domain if an app has photos or video functionality.
The schema, an action or a content type within the domain, the specific API for the app intent,
app entity, or app enum you create.
For example, an app intent that opens a photo from a photo library uses @AppIntent(schema:
.photos.openAsset) to make sure the intent provides necessary metadata that allows Apple
Intelligence to understand it well.
Important
Only use the provided app intents domains and schemas for app actions and content that
match the specific domain and schema.
For a list of available assistant schemas, see App intent domains.
Conforming to an assistant schema comes with requirements that vary depending on the domain
and schema. However, all assistant schemas share the following constraints:
App intents can’t require parameters in addition to the parameters a schema expects. If your ap
intent uses additional parameters, make them optional.
Optional parameters that extend the schema are only available to the app intent when it appea
in the Shortcuts app.
Review schema requirements


## Page 3

App entities can’t use required properties in addition to the properties the schema expects.
However, you can use optional properties.
App enums don’t come with requirements for their enumeration cases and offer full flexibility,
but you can’t use more than a total of 10 app enums that conform to assistant schemas.
To create an app intent that integrates your app functionality with Apple Intelligence:
1. Identify an action or existing app intent implementation in your app that matches a domain liste
in App intent domains.
2. Create a new Swift file for your app intent code.
3. Use Xcode code completion to generate code that conforms to an assistant schema: Type the
name of the domain, followed by an underscore (<domain>_) and choose the schema that fits
your action. For example, type photos_ to see a list of available schemas for the .photos
domain and choose the action to open an asset (photos_openAsset ). To ensure assistant
schema conformance for an existing app intent, add the macro — for example, @App
Intent(schema: .photos.openAsset) — to your existing app intent implementation.
4. Build your app to check for errors that indicate that your app intent implementation doesn’t
match the chosen assistant schema.
5. Make changes to meet the schema requirements and rebuild your app.
Tip
Xcode code completion can create AppIntent, AppEntity, and AppEnum code that
conforms to assistant schemas.
The following code snippet shows how the Making your app’s functionality available to Siri sample
declares an app intent that opens a video from a device’s media library:
Create an app intent that implements a schema


## Page 4

Note
When an app intent conforms to an assistant schema that is known at compile time, the
system no longer needs metadata you previously provided, like a title or description.
Remove them to simplify your code. However, you can always supply additional metadata as
needed.
Many actions you describe as an AppIntent require parameters or return results, often with
custom types you describe as an AppEntity or AppEnum. If you use an app entity or app enum 
an intent that conforms to an assistant schema, the entity or enum also needs to conform to the
assistant schema. Ensuring conformance works similar to conformance for your app intent:
1. Annotate your app entity or app enum with the AppEntity(schema:) or App
Enum(schema:) macro or create a new entity or enum using Xcode code completion to
automatically generate code that conforms to a schema. For more information, see the previou
section.
2. Pass the corresponding domain and entity or enum parts to the macro.
3. Update your code to meet the requirements of the schema.
For example, the AssetEntity implementation from the Making your app’s functionality availab
to Siri sample looks like this:
Ensure app entities and app enums conform to the schema


## Page 5

Your existing app intents might overlap with functionality that assistant schemas provide. If you ca
make an existing app intent conform to a schema without making changes to parameters that the
intent uses, proceed with adding schema conformance. However, changing existing app intent
implementations or removing app intents can directly impact people because their custom
shortcuts may no longer work.
To not break people’s existing workflows, create a new app intent in addition to an existing app
intent. As a result, both intents appear in the Shortcuts app as actions. To avoid them appearing a
duplicates, mark your new app intent as available to Apple Intelligence only by setting is
AssistantOnly to true. For example, an app intent implementation could look like this:
Consider the impact of updating existing app intents


## Page 6

Similarly, you can set isAssistantOnly to true for any applicable app entities and app enums
that conform to an assistant schema.
After some time, you can remove the isAssistantOnly code and remove your old app intent.
For more information about giving people time to update their custom shortcuts with new app
intents, see Understand the impact of removing app intents and shortcuts.
Making onscreen content available to Siri and Apple Intelligence
Enable Siri and Apple Intelligence to respond to a person’s questions and action requests for
your app’s onscreen content.
App intent domains
Make your app’s actions and content available to Siri and Apple Intelligence with assistant
schemas.
Making your app’s functionality available to Siri
Add app intent schemas to your app so Siri can complete requests, and integrate your app
with Apple Intelligence, Spotlight, and other system experiences.
See Also
Siri and Apple Intelligence


## Page 7

When a person asks a question about onscreen content or wants to perform an action on it, Siri a
Apple Intelligence will be able to retrieve the content to respond to the question and perform the
action. If the user explicitly requests it, Siri and Apple Intelligence will be able to send content to
supported third-party services. For example, someone could view a website and use Siri to provid
a summary by saying or typing a phrase like “Hey Siri, what’s this document about?”
Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in
development and will be available with a future software update.
To integrate your app’s onscreen content with current and upcoming personal intelligence feature
of Siri and Apple Intelligence, explicitly provide the onscreen content using the App Intents
framework. Describe the content with an AppEntity — you might be able to reuse existing app
entity code. Then, tell the system about the content when it becomes visible:
1. Create an app entity identifier using EntityIdentifier .
Overview
Create an app entity and associate it with the user activity
object
App Intents / Making onscreen content available to Siri and Apple Intelligence
API Collection
Making onscreen content available to Siri
and Apple Intelligence
Enable Siri and Apple Intelligence to respond to a person’s questions and action
requests for your app’s onscreen content.
iOS 18.2+
iPadOS 18.2+
Mac Catalyst 18.2+
macOS 15.2+
tvOS 18.2+
visionOS 2.2+
watchOS 11.2+
Xcode 16.2+


## Page 8

2. Associate the identifier with the current NSUserActivity by setting the activity’s appEntit
Identifier property.
To remove the association between the user activity and your app entity, set the user activity’s ap
EntityIdentifier property to nil.
The following code snippet from the Making your app’s functionality available to Siri sample code
project shows how a photo-viewing app might provide a photo to Siri and Apple Intelligence by
creating an app entity identifier for the asset app entity that represents a photo, and associating
with the user activity:
Associating an AppEntity with the NSUserActivity provides Siri and Apple Intelligence with
your app’s onscreen content to offer personalized intelligence assistance. To go one step further
and enable Siri and Apple Intelligence to further process the provided onscreen content and
respond to a person’s explicit request to send the content as an attachment to other services,
including third parties:
1. Update your app entity to conform to the Transferable protocol.
2. In your Transferable implementation, provide image, PDF, rich text, or plain text
representations. To increase compatibility with third-party services, provide several
representations that best fit your content. For example, an email client might represent an ema
as rich text, plain text, and a PDF. For more on adopting Transferable, refer to
CoreTransferable.
Make the app entity transferable
Provide additional context to the system with an assistant
schema


## Page 9

To enable Siri and Apple Intelligence to further process the provided onscreen content and provid
a better response in iOS 18, make sure that the app entity that you associate with an NSUser
Activity conforms to one of the assistant schemas in the list below.
Note
The listed requests below are examples and not exhaustive. Actual functionality depends on
factors such as the features provided by Siri and Apple Intelligence, the functionality offered
by third-party services, or the phrase a person uses.
Domain
Schema
Swift macro
Example request
Browser
tab
@AppEntity(schema:
.browser.tab)
A person might ask Siri
questions about the web page
Document
reader
document
@AppEntity(schema:
.reader.document)
A person might ask Siri to
explain the conclusion of a
document.
File
management
file
@AppEntity(schema:
.files.file)
A person might ask Siri to
summarize file content.
Mail
message
@AppEntity(schema:
.mail.message)
A person might ask Siri to
provide a summary.
Photos
asset
@AppEntity(schema:
.photos.asset)
A person might ask Siri about
things to do with an object in a
photo.
Presentations
document
@AppEntity(schema:
.presentation
.document)
A person might ask Siri to
suggest a creative title for a
presentation.
Spreadsheets
document
@AppEntity(schema:
.spreadsheet.document)
A person might ask Siri to give
an overview of the
spreadsheet’s data.
Word
processor
document
@AppEntity(schema:
.wordProcessor
.document)
A person might ask Siri to
suggest additional content for
a text document.
Topics


## Page 10

protocol AppEntityAnnotatable
A protocol that framework types adopt to enable you to provide content to system
experiences.
Integrating actions with Siri and Apple Intelligence
Create app intents, entities, and enumerations that conform to assistant schemas to tap into
the enhanced action capabilities of Siri and Apple Intelligence.
App intent domains
Make your app’s actions and content available to Siri and Apple Intelligence with assistant
schemas.
Making your app’s functionality available to Siri
Add app intent schemas to your app so Siri can complete requests, and integrate your app
with Apple Intelligence, Spotlight, and other system experiences.
System protocols
See Also
Siri and Apple Intelligence


## Page 11

To enable enhanced understanding and more conversational interactions with Siri for your app,
choose a domain and a schema that match your app’s functionality. By conforming your app inten
app entity, or your app enumeration to a schema, you ensure that Apple Intelligence understands
your app’s actions and content. When you’ve identified the schema to use, leverage the App
Intent(schema:), AppEntity(schema:), and AppEnum(schema:) macros to write
schema-conforming code.
Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in
development and will be available with a future software update.
To learn more, refer to Integrating actions with Siri and Apple Intelligence and Making onscreen
content available to Siri and Apple Intelligence.
macro AppIntent<T>(schema: T)
A Swift macro you use to make sure your app intent conforms to an schema.
macro AppEntity<T>(schema: T)
Overview
Topics
Macros
App Intents / App intent domains
API Collection
App intent domains
Make your app’s actions and content available to Siri and Apple Intelligence with
assistant schemas.


## Page 12

macro AppEnum<T>(schema: T)
A Swift macro you use to make sure your app enum conforms to a schema.
Making ebook actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s ebook and audiobook functionality wi
Siri and Apple Intelligence.
protocol BooksIntent
Assistant schema conformance for app intents that offer ebook and audiobook functionality.
protocol BooksEntity
Assistant schema conformance for app entities that describe ebooks or audiobooks.
protocol BooksEnum
Assistant schema conformance for types you use to describe ebooks or audiobooks.
Making browser actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s web browsing functionality with Siri an
Apple Intelligence.
protocol BrowserIntent
Assistant schema conformance for app intents that offer web browsing functionality.
protocol BrowserEntity
Assistant schema conformance for app entities that describe data for web browsing
functionality.
protocol BrowserEnum
Assistant schema conformance for types you use for web browsing functionality.
Making camera actions available to Siri and Apple Intelligence
Create app intents and enumerations to integrate your app’s camera functionality with Siri an
Apple Intelligence.
protocol CameraIntent
Books
Browser
Camera


## Page 13

Assistant schema conformance for app intents that offer camera functionality.
protocol CameraEnum
Assistant schema conformance for types you use for camera functionality.
Making document reader actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s document viewing and editing
functionality with Siri and Apple Intelligence.
protocol ReaderIntent
Assistant schema conformance for app intents that offer document viewing and editing
functionality.
protocol ReaderEntity
Assistant schema conformance for app entities that describe documents.
protocol ReaderEnum
Assistant schema conformance for types you use to describe documents.
Making file management actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s file management functionality with Sir
and Apple Intelligence.
protocol FilesIntent
Assistant schema conformance for app intents that offer file management functionality.
protocol FilesEntity
Assistant schema conformance for app entities that describe files.
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
protocol AssistantIntent
Assistant schema conformance for app intents that offer support for the side button on
iPhone in Japan.
Document reader
File management
iPhone side button access (only in Japan)


## Page 14

Making journaling actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s journaling functionality with Siri and
Apple Intelligence.
protocol JournalIntent
Assistant schema conformance for app intents that offer journaling functionality.
protocol JournalEntity
Assistant schema conformance for app entities that describe journaling data.
Making email actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s email functionality with Siri and Apple
Intelligence.
protocol MailIntent
Assistant schema conformance for app intents that offer email functionality.
protocol MailEntity
Assistant schema conformance for app entities that describe email.
Making photo and video actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s photo and video functionality with Siri
and Apple Intelligence.
protocol PhotosIntent
Assistant schema conformance for app intents that offer photo and video functionality.
protocol PhotosEntity
Assistant schema conformance for app entities that describe media assets.
protocol PhotosEnum
Assistant schema conformance for types you use to describe photos and videos.
Journaling
Email
Photos and videos
Presentations


## Page 15

Making presentation actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s presentation functionality with Siri and
Apple Intelligence.
protocol PresentationIntent
Assistant schema conformance for app intents that offer presentation functionality.
protocol PresentationEntity
Assistant schema conformance for app entities that describe presentation data.
Making spreadsheet actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s spreadsheet functionality with Siri and
Apple Intelligence.
protocol SpreadsheetIntent
Assistant schema conformance for app intents that offer spreadsheet functionality.
protocol SpreadsheetEntity
Assistant schema conformance for app entities that describe spreadsheet data.
Making in-app search actions available to Siri and Apple Intelligence
Create app intents and entities to integrate your app’s search functionality with Siri and Appl
Intelligence.
protocol SystemIntent
Assistant schema conformance for app intents that match system-provided intents.
Making whiteboard actions available to Siri and Apple Intelligence
Create app intents and entities that make your app’s whiteboard functionality available to Sir
and Apple Intelligence.
protocol WhiteboardIntent
Assistant schema conformance for app intents that offer whiteboard functionality.
protocol WhiteboardEntity
Spreadsheets
System and in-app search
Whiteboard


## Page 16

Assistant schema conformance for app entities that describe data for whiteboard
functionality.
protocol WhiteboardEnum
Assistant schema conformance for whiteboard types.
Making word processor actions available to Siri and Apple Intelligence
Create app intents and entities that make your app’s word processor functionality available t
Siri and Apple Intelligence.
protocol WordProcessorIntent
Assistant schema conformance for app intents that offer word processing functionality.
protocol WordProcessorEntity
Assistant schema conformance for app entities that describe text documents.
Assistant schema base protocols
Protocols that provide the underlying functionality for assistant schemas.
macro AssistantIntent<T>(schema: T)
A Swift macro you use to make sure your app intent conforms to an assistant schema.
Deprecated
macro AssistantEntity<T>(schema: T)
A Swift macro you use to make sure your app entity conforms to an assistant schema.
Deprecated
macro AssistantEnum<T>(schema: T)
A Swift macro you use to make sure your app enum conforms to an assistant schema.
Deprecated
Word processor and text editing
Base protocols
Deprecated symbols
See Also


## Page 17

Integrating actions with Siri and Apple Intelligence
Create app intents, entities, and enumerations that conform to assistant schemas to tap into
the enhanced action capabilities of Siri and Apple Intelligence.
Making onscreen content available to Siri and Apple Intelligence
Enable Siri and Apple Intelligence to respond to a person’s questions and action requests for
your app’s onscreen content.
Making your app’s functionality available to Siri
Add app intent schemas to your app so Siri can complete requests, and integrate your app
with Apple Intelligence, Spotlight, and other system experiences.
Siri and Apple Intelligence


## Page 18

Using this sample app, people can keep track of photos and videos they capture with their device
and can use Siri to access app functionality. To make its main functionality available to Siri, the ap
uses the App Intents framework.
Related sessions from WWDC24
Session 10133: Bring your app to Siri
This sample uses App intent domains to make the AppEnum, AppEntity, and AppIntent
implementations available to Siri as shown in the following example:
Overview
Make app functionality available to Siri
App Intents / Making your app’s functionality available to Siri
Sample Code
Making your app’s functionality available
to Siri
Add app intent schemas to your app so Siri can complete requests, and integrate
your app with Apple Intelligence, Spotlight, and other system experiences.
Download
iOS 26.0+
iPadOS 26.0+
macOS 26.0+
Xcode 26.0+


## Page 19

People can use Spotlight to search for data the sample contains. To enable this functionality, the
sample defines an app entity that conforms to IndexedEntity:
Make data available in Spotlight
Make app entities shareable


## Page 20

By adopting the Transferable protocol, this sample makes the data it describes as app entities
more shareable and allows other apps to understand its data formats. For example, the sample’s
AssetEntity implements Transferable to make it easy to share a photo as a PNG image wit
Siri or the share sheet:
When the user asks a question about onscreen content or wants to perform an action on it, Siri an
Apple Intelligence can retrieve the content to respond to the question and perform the action. If t
user explicitly requests it, Siri and Apple Intelligence can send content to supported third-party
services. For example, someone could view a photo and use Siri to describe things a person can d
with an identified object in the photo by saying or typing a phrase like “Hey Siri, what can I do with
the object in this photo?” To integrate onscreen content with current and upcoming personal
intelligence features of Siri and Apple Intelligence, the sample’s AssetEntity conforms to the
Transferable protocol and the .photos.asset schema. When a person views a photo, the
Make onscreen content available to Siri and Apple
Intelligence


## Page 21

app associates the asset entity with an NSUserActivity to make the photo available to Siri and
Apple Intelligence:
For more information about making onscreen content available to Siri and Apple Intelligence, refe
to Making onscreen content available to Siri and Apple Intelligence.
Integrating actions with Siri and Apple Intelligence
Create app intents, entities, and enumerations that conform to assistant schemas to tap into
the enhanced action capabilities of Siri and Apple Intelligence.
Making onscreen content available to Siri and Apple Intelligence
Enable Siri and Apple Intelligence to respond to a person’s questions and action requests for
your app’s onscreen content.
App intent domains
Make your app’s actions and content available to Siri and Apple Intelligence with assistant
schemas.
See Also
Siri and Apple Intelligence


