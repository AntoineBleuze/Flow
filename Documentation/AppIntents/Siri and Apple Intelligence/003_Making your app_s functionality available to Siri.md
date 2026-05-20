# 003_Making your app_s functionality available to Siri.pdf

## Page 1

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


## Page 2

People can use Spotlight to search for data the sample contains. To enable this functionality, the
sample defines an app entity that conforms to IndexedEntity:
Make data available in Spotlight
Make app entities shareable


## Page 3

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


## Page 4

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


