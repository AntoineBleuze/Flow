# 000_Sharing an Apple Watch face.pdf

## Page 1

In watchOS 7 and later, all users (including an app’s developers or marketing departments) can
exchange customized watch face files. These files contain all the complications placed on the
watch face, as well as any specified colors, features, or images. When the system adds a watch
face, it checks for the apps that provide the face’s complications, and prompts the user to install
any missing apps. As a result, shared watch faces provide an opportunity to introduce your app to
new users.
Users can share a watch face that includes one of your app’s complications—essentially sharing
your app at the same time. You can also create and share watch faces that explicitly highlight you
app. For example, if your app supports multiple complications, you can share a watch face that
shows the range of its complications. You can also offer to load the watch face directly from your
watchOS or companion iOS app.
To share a face from Apple Watch, press firmly on the watch face. When the face configuration
interface appears, select the share button and the contact or phone number with which to share
the watch face. The watch then shares the watch face using Messages.
Overview
Export an Apple Watch face
ClockKit / Sharing an Apple Watch face
Article
Sharing an Apple Watch face
Distribute a customized watch face to Apple Watch users.


## Page 2

On iOS, open the Apple Watch app, and select a watch face from the gallery. Then click the share
button in the upper-right corner.
You can then share the watch face file using Messages, Mail, or other apps that support
.watchface files. You can also save the watch face to Files. However, if you plan to share the
watch face on your web page or in your app, always use email to share the face. Unlike the other
share methods, email includes both the .watchface file and a preview of the face.


## Page 3

Note
You don’t need an Apple Watch to share watch faces; you can create and share watch faces in
the Watch app in iPhone or from the watchOS simulator.
The resulting .watchface file contains information about the watch face, including its
configuration, color, any images it displays, and its complications. The file may also include user
Info or userActivity data associated with the complications, although the system removes
this data if the user excludes personal data from the watch face.
When presenting a watch face from your app or on the web, always display a preview of the watc
face, and a button that uses an official Add Watch Face asset.
The preview image from the shared email shows an illustrated bezel framing the face. You can
display this image directly on websites and in watchOS and iOS apps. Alternatively, you can repla
the illustrated bezel with a high-fidelity hardware bezels that you can download from Marketing
Resources and Identity Guidelines and composite onto the preview.
Finally, use the application/vnd.apple.watchface MIME type to host a watch face file on 
web page. Safari uses the MIME type to detect watch faces, prompting the user to install the watc
face when appropriate.
For additional guidelines on sharing watch faces, see the Human Interface Guidelines. For more
information on the Add Watch Face assets, see Apple Design Resources.
To ensure that your app’s complications appear as expected in the watch face preview, you must
implement your ClockKit data source’s getLocalizableSampleTemplate(for:with
Handler:) method. You can’t just add preview images to the assets catalog.
Then, as soon as the user installs a watch face that includes your app’s complications, the system
calls your data source’s handleSharedComplicationDescriptors(_:) method. Use this
method to prepare your app so that it can provide complication data for the shared complications
For example, a weather app may provide separate complications for all of the user’s favorite cities
When the user receives a shared watch face, the app must be ready to provide data for the city
associated with the incoming complication, even if it’s not already in the user’s favorites list.
Display a Shared Watch face
Support shared complications


## Page 4

Finally, ClockKit calls your data source’s methods to populate the complication’s timeline. This
includes calling getTimelineEndDate(for:withHandler:) and getCurrentTimeline
Entry(for:withHandler:), and then calling getTimelineEntries(for:after:limit:
withHandler:) if your app supports batch downloading future timeline entries.
Note
Users can exclude personal information from watch faces that they share. When a user
excludes information, the system sets the shared CLKComplication object’s identifier
property to CLKDefaultComplicationTypeIdentifier. If your watchOS app provides
complications, your CLKComplicationDataSource must handle default identifiers.
To offer a watch face directly in your app, customize and share one of the watch faces, emailing t
.watchface file and preview to yourself. To embed the watch file in an app, drag both the
.watchface file and the preview into Xcode to add them to the app’s bundle.
Add Watch Faces from your app


## Page 5

You can share watch faces from either the watchOS app or the iOS companion app. For the iOS
companion, drag the watch file into the iOS app group. For the watchOS app, drag the file into the
WatchKit App group.
Always display both the watch face preview with an official Add Apple Watch Face button. When
the user taps the button, call the CLKWatchFaceLibrary object’s addWatchFace(at:
completionHandler:) method to import the watch face.


## Page 6

Only add watch faces in response to the user tapping an Add Apple Watch Face button. In iOS, ca
the WCSession class’s isPaired method to verify that the user has a paired Apple Watch befor
offering to add any watch faces.
Note
Some newer watch faces are available only on Apple Watch SE and Apple Watch Series 4 and
later. Nike watch faces are only available on Apple Watch Nike, and Hermès watch faces on
Apple Watch Hermès. If you share a watch face that isn’t available on all watches, check for
errors when calling addWatchFace(at:completionHandler:), and provide a face that
anyone can install. For a list of watch faces, see Apple Watch faces and their features.
When adding a watch face in your app, all of the complications on the watch face must come from
apps that have a valid App Store ID, such as an app from an App Store or TestFlight build. If you tr
to use complications from a development build, the system won’t recognize the development ID a
a valid App Store ID.
class CLKWatchFaceLibrary
An object for importing watch faces that the app provides.
See Also
Face Sharing


