# 002_App intent domains.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


