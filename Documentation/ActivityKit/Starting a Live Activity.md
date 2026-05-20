# Starting a Live Activity.pdf

## Page 1

Live Activities display your app’s current data on the Lock Screen, in the Dynamic Island, in CarPla
and on a paired Mac or Apple Watch, giving people access to information at a glance and allowing
them to perform quick actions that are related to the displayed information.
To offer Live Activities, add code to your existing widget extension or create a new widget
extension if your app doesn’t already include one. Live Activities use WidgetKit functionality and
SwiftUI for their user interface. ActivityKit’s role is to handle the life cycle of each Live Activity: Yo
use its API to request, schedule, update, and end a Live Activity and to receive ActivityKit push
notifications.
For design guidance, refer to Human Interface Guidelines > Live Activities.
Live Activities come in different presentations that appear in various highly visible places. To add
support for Live Activities to your iOS or iPadOS app, you must support all presentations. The
system automatically chooses the best presentation for each location across a person’s devices.
The Lock Screen presentation appears on the Lock Screen of iPhone and iPad. On an unlocked
device that doesn’t support the Dynamic Island, the Lock Screen presentation appears as a banne
for Live Activity updates that include an alert configuration. For example, if a person uses Mail on 
device that doesn’t support the Dynamic Island while your app’s Live Activity receives an update
with an alert configuration, the system displays the Lock Screen presentation as a banner at the t
of the screen to let them know about the updated Live Activity.
Overview
Review Live Activity presentations on iPhone and iPad
ActivityKit / Displaying live data with Live Activities
Article
Displaying live data with Live Activities
Display up-to-date data and offer quick interactions in the Dynamic Island, on the
Lock Screen, in CarPlay, and on a paired Mac or Apple Watch.


## Page 2

Devices that support the Dynamic Island display Live Activities in the Dynamic Island using severa
presentations. When there’s only one ongoing Live Activity, the system uses the compact
presentation. It’s composed of two elements: one that displays on the leading side of the
TrueDepth camera, and one that displays on the trailing side. Although the leading and trailing
elements are separate views, they form a cohesive view in the Dynamic Island, representing a
single piece of information from your app. People can tap a compact Live Activity to open the app
and get more details about the event or task.
When multiple Live Activities from several apps are active, the system uses the minimal
presentation to display two of them in the Dynamic Island. The system chooses a Live Activity fro
one app to appear attached to the Dynamic Island while it presents a Live Activity from another ap
detached from the Dynamic Island. As with a compact Live Activity, people can tap a minimal Live
Activity to open the app and get more details about the event or task.


## Page 3

Additionally, the minimal presentation also appears at the top of the iPhone Lock Screen when the
device is in StandBy — in landscape orientation, charging, and with the display positioned at an
angle to face the room. If a person taps the minimal presentation in StandBy, the Live Activity
expands to fill the whole display using the Lock Screen presentation.
When people touch and hold a Live Activity in a compact or minimal presentation, the system
displays the content in an expanded presentation.
For additional information on making sure your Live Activities look great on paired devices, refer t
Creating custom views for Live Activities.
A Live Activity can be active for up to eight hours unless its app or a person ends it before this lim
After the eight-hour limit, the system automatically ends the Live Activity, and immediately remov
it from the Dynamic Island. However, the Live Activity remains on the Lock Screen until a person
removes it or for up to four additional hours before the system removes it — whichever comes firs
As a result, a Live Activity remains on the Lock Screen for a maximum of 12 hours.
For more information about ending a Live Activity, refer to the “End the Live Activity” section belo
Understand constraints


## Page 4

The system requires image assets for a Live Activity to use a resolution that’s smaller or equal to
the size of the presentation for a device. If you use an image asset that’s larger than the size of th
Live Activity presentation, the system might fail to start the Live Activity. For example, an image yo
use for the minimal presentation of your Live Activity shouldn’t exceed 45x36.67 points. For size
guidance of Live Activity presentations, refer to Human Interface Guidelines > Live Activities.
Each Live Activity runs in its own sandbox, and — unlike a widget — it can’t access the network or
receive location updates. To update the dynamic data of an active Live Activity, use ActivityKit in
your app or allow your Live Activities to receive ActivityKit push notifications as described in
Starting and updating Live Activities with ActivityKit push notifications.
Important
Static and dynamic data for a Live Activity, including data for ActivityKit updates and ActivityKit
push notifications, can’t exceed a combined size of 4 KB.
The code that describes the user interface of your Live Activity is part of your app’s widget
extension. If you already offer widgets in your app, add code for the Live Activity to your existing
widget extension and reuse code between your widgets and Live Activities. However, although Liv
Activities leverage WidgetKit’s functionality, they aren’t widgets. In contrast to the timeline
mechanism you use to update your widgets’ user interface, you start and update a Live Activity
from your app with ActivityKit or with ActivityKit push notifications.
Note
You can create a widget extension to adopt Live Activities without offering widgets. However,
consider offering both widgets and Live Activities to allow people to add glanceable
information and a personal touch to their devices.
To support Live Activities:
1. Create a widget extension if you haven’t already added one to your project and make sure to
select “Include Live Activity” when you add a widget extension target to your Xcode project. Fo
more information on creating a widget extension, refer to WidgetKit and Creating a widget
extension.
2. If your project includes an Info.plist file, add the Supports Live Activities entry to it, and se
its Boolean value to YES. Alternatively, open the Info.plist file as source code, add the
NSSupportsLiveActivities key, then set the type to Boolean and its value to YES. If you
project doesn’t have an Info.plist file, add the Supports Live Activities entry to the list of
custom iOS target properties for your iOS app target and set its value to YES.
Add support for Live Activities to your app


## Page 5

3. Add code that defines an ActivityAttributes structure to describe the static and dynamic
data of your Live Activity.
4. Use the ActivityAttributes you defined to create the ActivityConfiguration.
5. Add code to configure, start, update, and end your Live Activities.
6. Make your Live Activity interactive with Button or Toggle as described in Adding interactivity
to widgets and Live Activities.
7. Add animations to bring attention to content updates as described in Animating data updates i
widgets and Live Activities.
After you add a widget extension target that includes Live Activities to your Xcode project, descri
the data that your Live Activity displays by implementing ActivityAttributes. The Activit
Attributes inform the system about static data that appears in the Live Activity. You also use
ActivityAttributes to declare the required custom Activity.ContentState type that
describes the dynamic data of your Live Activity. In the example below from the Emoji Rangers:
Supporting Live Activities, interactivity, and animations sample code project, Adventure
Attributes describes the hero information as static data using let hero: EmojiRanger.
Note how the code defines the Activity.ContentState to encapsulate dynamic data: the
current health level of the hero and a string that describes what happens to the hero.
Tip
To make your code more descriptive and easy to read, you can define a type alias for the
ContentState; for example: public typealias HeroStatus = ContentState.
Define a set of static and dynamic data
Add Live Activities to the widget extension


## Page 6

Live Activities leverage WidgetKit. After you add code to describe the data that appears in the Liv
Activity with the ActivityAttributes structure, add code to return an Activity
Configuration in your widget implementation.
The following example uses the AdventureAttributes structure from the previous example:
Tip
If you select “Include Live Activities” when you add a new widget extension target to your
project, Xcode automatically creates a widget bundle for you that includes a widget and a Live
Activity.
If your app already offers widgets, add the Live Activity to your WidgetBundle. If you don’t have
WidgetBundle — for example, if you only offer one widget — create a widget bundle as describe
in Creating a widget extension and then add the Live Activity to it.
To create the user interface of the Live Activity, you use SwiftUI in the widget extension you creat
earlier. Similar to widgets, you don’t provide the size of the user interface for your Live Activity bu
let the system determine the appropriate dimensions.
Start with the presentation that appears on the Lock Screen. The following code displays the
information that the AdventureAttributes struct describes using the custom Adventure
LiveActivityView:
Create the Lock Screen presentation


## Page 7

Note
The system may truncate a Live Activity if its height exceeds 160 points.
On a device that doesn’t support the Dynamic Island, the system displays the Lock Screen
presentation as a banner for a Live Activity update if:
The device is unlocked and its app isn’t in use
You pass an AlertConfiguration to the update(_:alertConfiguration:) function
On iPhone in StandBy, the Lock Screen presentation appears scaled to fill the screen of the devic
Make sure your assets offer a high-enough resolution for StandBy. Additionally, consider updating
the Lock Screen presentation to make use of the additional space. To detect Standby, use the is
ActivityFullscreen environment variable.
Live Activities appear in the Dynamic Island of devices that support it. When you start one or mor
Live Activities and no other app starts a Live Activity, the compact leading and trailing
presentations appear together to form a cohesive presentation in the Dynamic Island for one Live
Activity.
Create the compact and minimal presentations


## Page 8

When more than one app starts a Live Activity, the system chooses which Live Activities are visib
and displays two Live Activities using the minimal presentation for each: One minimal presentation
appears attached to the Dynamic Island, while the other appears detached. Additionally, the
detached minimal presentation appears on the Lock Screen on iPhone in StandBy. If your app sta
more than one Live Activity at the same time, you can tell the system which one it should display b
setting a relevance score. For more information, refer to the Configure the Live Activity section
below.
The following example shows how the Emoji Rangers: Supporting Live Activities, interactivity, and
animations app provides the required compact and minimal presentations. For the leading
presentation, it reuses the custom SwiftUI view Avatar. For the trailing presentation, it uses a
ProgressView.


## Page 9

In addition to the compact and minimal presentations, you must support the expanded
presentation. It appears when a person touches and holds a compact or minimal presentation, an
it also appears briefly for Live Activity updates.
Use the DynamicIslandExpandedRegionPosition to specify detailed instructions where yo
want SwiftUI to position your content. The following example shows how the Emoji Rangers:
Supporting Live Activities, interactivity, and animations app creates its expanded presentation
using a DynamicIslandExpandedContentBuilder:
Create the expanded presentation


## Page 10

To render views that appear in the expanded Live Activity, the system divides the expanded
presentation into different areas. Note how the example returns a DynamicIsland that specifies
several DynamicIslandExpandedRegion objects. Pass the following DynamicIsland
ExpandedRegionPosition values to lay out your content at a specified position in the expand
presentation:
center places content below the TrueDepth camera.
leading places content along the leading edge of the expanded Live Activity next to the
TrueDepth camera and wraps additional content below it.
trailing places content along the trailing edge of the expanded Live Activity next to the
TrueDepth camera and wraps additional content below it.
bottom places content below the leading, trailing, and center content.


## Page 11

To render content that appears in the expanded Live Activity, the system first determines the widt
of the center content while taking into account the minimal width of the leading and trailing
content. The system then places and sizes the leading and trailing content based on its vertical
position. By default, leading and trailing positions receive an equal amount of horizontal space.
You can tell the system to prioritize one of the DynamicIslandExpandedRegion views by
passing a priority to the init(_:priority:content:) initializer. The system renders the
view with the highest priority with the full width of the Dynamic Island. The following illustration
shows leading and trailing positions in an expanded presentation with higher priority to render the
below the TrueDepth camera.
Note
If content is too wide to appear in a leading position next to the TrueDepth camera, use the
belowIfTooWide modifier to render leading content below the TrueDepth camera.
People tap your Live Activity to launch your app. Use deep links to take them to the scene in your
app that matches the activity’s information. On Apple Watch, choose if people can open your app
on iPhone or its watchOS companion by tapping your Live Activity on Apple Watch. For more
information, refer to Launching your app from a Live Activity.
Like widgets, Live Activities can contain SwiftUI buttons and toggles to provide quick actions. For
example, a food-ordering app might show a button in its Live Activity that people tap to check in a
a restaurant when they pick up a takeout order.
To add a toggle or button to a Live Activity, adopt the App Intents framework and use the initialize
for Button and Toggle that take an app intent. For more information about using toggles and
buttons in widget extensions, including for Live Activities, refer to WidgetKit.
Note
Buttons and toggles on Live Activities don’t perform actions in CarPlay.
Configure how your Live Activity launches your app
Add Buttons or Toggles
Provide accessibility labels


## Page 12

Designing with accessibility in mind is a foundational principle when creating an app. It also applie
to Live Activities. To allow people to customize how they interact with your Live Activity and to
make sure VoiceOver for your Live Activity works correctly, add accessibility labels for the SwiftU
views you create for each Live Activity presentation. For more information, refer to Adding
accessible descriptions to widgets and Live Activities.
Live Activities are available on iPhone and iPad. If your app is available on additional platforms and
offers a widget extension, make sure Live Activities are available at runtime. Additionally, people
can choose to deactivate Live Activities for an app in the Settings app.
To refer to if Live Activities are available and if a person allowed your app to use Live Activities:
Use areActivitiesEnabled to synchronously determine whether to show a user interface 
your app for starting a Live Activity.
Receive asynchronous user authorization updates by observing any user authorization change
with the activityEnablementUpdates stream and respond to them accordingly.
Note
An app can start or schedule several Live Activities, and a device can run Live Activities from
several apps — the exact number may depend on a variety of factors. Scheduled Live Activities
count towards the limit of simultanious activities. In addition to making sure Live Activities are
available, always handle any errors gracefully when starting, updating, or ending a Live Activity.
For example, starting a Live Activity may fail because a person’s device may have reached its
limit of active and scheduled Live Activities.
Before you can start a Live Activity in your app, configure it with an ActivityContent structure
The activity content encapsulates the ActivityAttributes and additional configuration
information:
The staleDate tells the system when the Live Activity content becomes outdated.
The relevanceScore determines which of your Live Activities appears in the Dynamic Island
and the order of your Live Activities on the Lock Screen.
While setting the staleDate is optional, it’s helpful when you want to ensure your Live Activity
doesn’t display outdated content. At the specified date, the activityState changes to
ActivityState.stale and isStale changes to true. Access isStale to monitor the
activity state and respond to outdated Live Activities that haven’t received updates. For example,
while a person has network connectivity, a sports app could update the Live Activity with the lates
Make sure Live Activities are available
Configure the Live Activity


## Page 13

game information and advance the stale date. If a person enters an area without network
connectivity, the app can’t update the Live Activity with new information and an advanced stale
date. Eventually, the Live Activity becomes stale and displays text to indicate that the displayed
information is outdated. On the next app launch or when it performs background tasks, the app c
also respond to the ActivityState.stale state.
If your app starts more than one Live Activity, provide a relevance score to determine the order of
your Live Activities on the Lock Screen and which of your Live Activities appears in the Dynamic
Island:
If you don’t provide a relevance score or if Live Activities have the same relevance score, the
system shows the first Live Activity you started in the Dynamic Island.
If you use different relevance scores, the system shows the Live Activity with the highest
relevance score in the Dynamic Island.
The system expects relative values for the relevance score. Assign a higher value for an important
Live Activity content update — for example, a score of 100 — and use lower values for less
important Live Activity content updates — for example, 50.
Note
Keep track of the relevance scores you assign for each ongoing Live Activity so you can
change the order of them as needed with each Live Activity update.
You start a Live Activity in your app’s code while the app is in the foreground with the
request(attributes:content:pushType:) function. Pass the ActivityAttributes an
ActivityContent objects you created to it and, if you implement ActivityKit push notifications,
the pushType parameter.
The following example from the Emoji Rangers: Supporting Live Activities, interactivity, and
animations app creates the initial attributes and content state for the Emoji Rangers Live Activity.
Start the Live Activity


## Page 14

In general, your app needs to be in the foreground to start a Live Activity. You can update or end a
Live Activity from your app while it runs in the background — for example, by using Background
Tasks. However, you can start a Live Activity while your app is in the background by using an app
intent that conforms to LiveActivityIntent. For example, you might create a control that
people place in Control Center. The control could use a LiveActivityIntent and starts the Li
Activity in the intent’s perform() method. For more information about app intents, refer to App
Intents and Making actions and content discoverable and widely available.
You can schedule a Live Activity for a specific date using the request(attributes:content
pushType:style:alertConfiguration:startDate:) function. For example, an app that
allows people to watch or follow sports matches might want to schedule a Live Activity for an
upcoming game. If you allow people to schedule a Live Activity, you must pass an Alert
Configuration to make sure they know when your app starts a Live Activity.
Live Activities can appear temporarily in the extended presentation in the Dynamic Island to allow
interactions and status updates while a person is actively performing a task. Locking the device,
collapsing the extended presentation in the Dynamic Island, or tapping outside the Dynamic Islan
ends the Live Activity. For example, the Music app displays an extended presentation in the
Dynamic Island when a person starts playing audio in the app, allowing people to choose to move
the audio to a HomePod that’s on the same Wi-Fi network with AirPlay. The Live Activity ends
automatically when the person leaves the app.
Schedule a Live Activity at a specific date
Start a transient Live Activity


## Page 15

To start a transient Live Activity, use request(attributes:content:pushType:style:)
and pass ActivityStyle.transient as the style parameter.
In addition to updating and ending a Live Activity from your app with ActivityKit, start, update, or
end a Live Activity with an ActivityKit push notification that you send from your server to the Appl
Push Notification service (APNs).
To learn more about using ActivityKit push notifications, refer to Starting and updating Live
Activities with ActivityKit push notifications.
When you start a Live Activity from your app, update the data that appears in the Live Activity usi
the update(_:) function of the Activity object you received when you started the Live Activi
To retrieve your app’s active Live Activities, use activities.
For important updates, use the update(_:alertConfiguration:) function to display an ale
on iPhone, iPad, and a paired Apple Watch that tells a person about new Live Activity content. For
example, the Emoji Rangers: Supporting Live Activities, interactivity, and animations app updates
its Live Activity using an alert configuration to display an alert that lets people know that the hero
has been knocked down:
Start, update, and end your Live Activity with a push
notification
Update the Live Activity


## Page 16

Note
The size of the updated data can’t exceed 4KB in size.
On Apple Watch, the system uses the title and body attributes for the alert. On iPhone and iPa
the system doesn’t show a regular alert but instead shows the expanded Live Activity in the
Dynamic Island or the Lock Screen presentation as a banner on devices without the Dynamic
Island.
When you define the user interface of your Live Activity, the system ignores any animation
modifiers — for example, withAnimation(_:_:) and animation(_:value:) — and uses th
system’s animation timing instead. However, the system performs some animation when the
dynamic content of the Live Activity changes. Text views animate content changes with blurred
content transitions, and the system animates content transitions for images and SF Symbols. If yo
add or remove views from the user interface based on content or state changes, views fade in an
out. Use the following view transitions to configure these built-in transitions: opacity,
move(edge:), slide, push(from:), or combinations of them. Additionally, request animation
for timer text with numericText(countsDown:).
You can animate data changes in your Live Activity with functions that give you more control over
animation timing. For example, you can use timingCurve(_:duration:) to create an
animation with a custom timing curve. For more information on SwiftUI animations, refer to
Animation.
Animate content updates


## Page 17

Note
On devices that include an Always-On display, the system doesn’t perform animations to
preserve battery life in Always On. Make sure to use SwiftUI’s isLuminanceReduced
environment value to detect reduced luminance before animating content changes.
Always end a Live Activity after the associated task or live event ends. A Live Activity that ended
remains on the Lock Screen until the person removes it or the system removes it automatically. Th
automatic removal depends on the dismissal policy you provide to the end(_:dismissal
Policy:) function. Always include an updated Activity.ContentState to ensure the Live
Activity shows the latest and final content update after it ends. This is important because the Live
Activity can remain visible on the Lock Screen for some time after it ends.
The following example shows how the Emoji Rangers: Supporting Live Activities, interactivity, and
animations app ends its Live Activity and sets a custom dismissal policy based on a setting in the
app:
End the Live Activity


## Page 18

With the default dismissal policy, the Live Activity appears on the Lock Screen for some time
after it ends to allow a person to glance at their phone to refer to the latest information. A person
can choose to remove the Live Activity at any time, or the system removes it automatically four
hours after it ended.
To immediately remove the Live Activity that ended from the Lock Screen, use immediate.
Alternatively, use after(_:) to specify a date within a four-hour window. While you can provide
any date, the system removes the ended Live Activity after the given date or after four hours from
the moment the Live Activity ended — whichever comes first.
A person can remove your Live Activity from their Lock Screen at any time. This ends the Live
Activity, but it doesn’t end or cancel the person’s action that started it. For example, a person may
remove the Live Activity for their pizza delivery from the Lock Screen, but this doesn’t cancel the
pizza order.
Note
When a person or the system removes a Live Activity, its ActivityState changes to
ActivityState.dismissed.
When you start a Live Activity, ActivityKit returns an Activity object. In addition to the id that
uniquely identifies each activity, the Activity offers sequences to observe content, activity stat
and push token updates. Use the corresponding sequence to receive updates in your app, keep
your app and Live Activities in sync, and respond to changed data:
To observe changes to ongoing Live Activities and to asynchronously access a Live Activity
when you start it, use activityUpdates.
To observe the state of an ongoing Live Activity — for example, to determine whether it’s active
or has ended — use activityStateUpdates.
To observe changes to the dynamic content of a Live Activity, use contentUpdates.
To observe changes to the push token of a Live Activity, use pushTokenUpdates.
The following example shows how the Emoji Rangers: Supporting Live Activities, interactivity, and
animations app tracks updates its content for ongoing Live Activities and updates its adventure
view accordingly:
Keep track of updates


## Page 19

Your app can start more than one Live Activity. For example, a sports app may allow a person to
start a Live Activity for each live sports game they’re interested in. If your app starts multiple Live
Activities, keep track of ongoing Live Activities for your app using the activities property to
make sure your app is aware of all ongoing Live Activities that ActivityKit tracks. Another use case
for fetching all activities is to maintain Live Activities that are in progress and make sure you don’t
keep any activities running for longer than needed. For example, the system may stop your app, o
your app may crash while a Live Activity is active. When the app launches the next time, check if
any activities are still active, update your app’s stored Live Activity data, and end any Live Activity
that’s no longer relevant.
The App Intents framework enables you to extend your app’s custom functionality to support
system-level services like Siri and the Shortcuts app, as well as the functionality to start a Live
Activity. For example, a sports app could expose functionality to start a Live Activity for a person’s
favorite sports team with the Shortcuts app or Siri.
Starting a Live Activity from an app intent is almost the same as adopting App Intents to expose
other functionality in your app:
1. Adopt the App Intents framework as described in Making actions and content discoverable and
widely available.
2. When you implement your app intent that starts the Live Activity, make sure it inherits from Liv
ActivityIntent.
3. In your LiveActivityIntent implementation, add code to start the Live Activity.
Starting and updating Live Activities with ActivityKit push notifications
Use ActivityKit to receive push tokens and to remotely start, update, and end your Live
Activity with ActivityKit notifications.
Observe active Live Activities
Start and stop Live Activities from App Intents
See Also
Starting a Live Activity


## Page 20

class Activity
The object you use to start, update, and end a Live Activity.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
NSSupportsLiveActivities
A Boolean value that indicates whether an app supports Live Activities.
NSSupportsLiveActivitiesFrequentUpdates
A Boolean value that indicates whether an app can update its Live Activities frequently.


## Page 21

ActivityKit offers functionality to start, update, and end Live Activities from your app. Additionally,
offers functionality to receive push tokens. Use push tokens to send ActivityKit notifications from
your server to Apple Push Notification service (APNs). With notifications, you can:
Update and end Live Activities
Start Live Activities
Update or end Live Activities for a large audience with channels and broadcast push notificatio
Related session from WWDC23
Session 10185: Update Live Activities with push notifications
To start and update your Live Activities by sending ActivityKit push notifications to a device:
1. Use ActivityKit functionality to obtain push tokens.
2. Set up a remote notification server or make changes to your existing server to support ActivityK
push notifications. If you’re new to using push notifications, plan to spend time implementing
your remote notification server. For more information, refer to Registering your app with APNs.
3. Send the push tokens you receive from ActivityKit to your server and use them establish a toke
based connection to APNs, as described in Establishing a token-based connection to APNs.
Overview
Start and update Live Activities
ActivityKit / Starting and updating Live Activities with ActivityKit push notifications
Article
Starting and updating Live Activities with
ActivityKit push notifications
Use ActivityKit to receive push tokens and to remotely start, update, and end your
Live Activity with ActivityKit notifications.


## Page 22

4. Handle updates to the push tokens and update or invalidate them on your server as needed.
5. Send ActivityKit push notifications from your server with APNs using the push tokens, HTTP
header fields, and JSON payloads described in this article to start, update, and end Live
Activities.
6. Test ActivityKit push notifications locally and verify that your Live Activity behaves as expected
7. Decide the frequency for your ActivityKit push notifications. For more information, refer to the
“Determine the update frequency” section below.
To start and update your Live Activities with ActivityKit push notifications on a channel:
1. Enable broadcast capabilities for your app as described in Setting up broadcast push
notifications.
2. Set up a remote notification server or make changes to your existing server to support ActivityK
push notifications. If you’re new to using push notifications, plan to spend time implementing
your remote notification server.
3. Use channel creation request to create a channel for each Live Activity event. For more
information, refer to Sending channel management requests to APNs.
4. Send the channel ID for the Live Activity event to your app.
5. When you request a new activity with ActivityKit to subscribe for updates on the channel, use
the channel push type with the channel ID.
6. Send ActivityKit push notifications from your server to APNs using the channel ID, HTTP heade
fields, and JSON payloads described in this article to update and end Live Activities.
7. Test ActivityKit push notifications locally and verify that your Live Activity behaves as expected
In your Xcode project, start by adding the Push Notifications capability to your app in Xcode as
described in Registering your app with APNs. Note that you can’t use the User Notifications
framework to register your Live Activity for push notifications. Instead, you use ActivityKit to obta
a push token as described below. If you choose to use broadcast push notifications for your app,
refer to Setting up broadcast push notifications for more details on enabling broadcast capability
for your app.
Note
You can’t enable broadcast capability through Xcode. You can only enable broadcast
capabilities using developer.apple.com.
Add the Push Notifications capability


## Page 23

Additionally, set up a remote notification server or make changes to your existing server and send
JSON payloads to APNs as described below. If you’re new to using push notifications, plan to
spend time implementing the remote notification server. For more information, refer to Registering
your app with APNs. To use device push notifications, you use the push tokens that you receive
from ActivityKit to send push notifications in your remote notification server. For more information
about sending push notifcations using push tokens, refer to Sending notification requests to APN
For broadcast push notifications, use the channel you created for the Live Activity and shared wit
the app to send push notifications in your remote notifications server. For more information on
creating channels, refer to Sending channel management requests to APNs. For information on ho
to send a push notification on a channel, refer to Sending broadcast push notification requests to
APNs.
On devices that run iOS or iPadOS 17.1 and earlier, you can’t start Live Activities with ActivityKit
push notifications. However, you can update and end them with ActivityKit push notifications. In
your app, start a Live Activity with the request(attributes:content:pushType:) function
and pass token to its pushType parameter. As a result, you receive a push token that’s unique t
your Live Activity when you successfully start the Live Activity.
The following code snippet from the Emoji Rangers: Supporting Live Activities, interactivity, and
animations sample code project starts a Live Activity and requests a push token:
Create a push notification server
Start a Live Activity that supports push updates to push
tokens


## Page 24

Every time you start a new Live Activity, you need to send the push token to your server. However
the pushToken isn’t available immediately after calling request(attributes:content:pus
Type:), because push token creation happens asynchronously and may take some time. Take th
into account before accessing the pushToken synchronously. Instead, observe push token
updates using the pushTokenUpdates asynchronous sequence. This makes sure you receive th
first push token, and any updates to it.
For example, the following code snippet from the Emoji Rangers: Supporting Live Activities,
interactivity, and animations sample code project uses an asynchronous Task to receive push
token updates. In the asynchronous for loop, it logs the updated token to the console for
debugging and local testing, and sends it to the server:
The push token for a Live Activity may change throughout its duration. When your app receives a
new token, it receives background runtime to process the updated token. Keep track of the push
token for each Live Activity. Additionally, invalidate the previous, now-outdated token on your
server when you receive an updated token to successfully send subsequent updates.
You can update or end Live Activities by an ActivityKit push notification sent on a channel. To
create a channel for your Live Activity event, refer to Sending channel management requests to
APNs. The channel you create has a unique identifier, called a channel ID, that devices use to
subscribe to Live Activity updates. Your remote server provides the Channel ID to your app before
the Live Activity starts. In your app, start a Live Activity with the request(attributes:
content:pushType:) function and pass channel to its pushType parameter with the channel
ID. If the channel ID isn’t a valid channel, the Live Activity fails to start.
The following code snippet starts a Live Activity and subscribes to receive push notifications on
channel ID:
Start a Live Activity that supports push updates on a
channel


## Page 25

You can start new Live Activities with ActivityKit push notifications. This option is especially usefu
for tracking events with Live Activities that occur more than once. For example, if someone starts
Live Activity to track their favorite sports team, the sports app might offer to automatically start a
Live Activity for each of the team’s games. In the future, the person doesn’t have to remember to
start the Live Activity from the app. Instead, a Live Activity for tracking the game might
automatically start from an ActivityKit push notification you sent with your remote notification
server and APNs.
To start Live Activities from ActivityKit push notifications, configure your app to support push
notifications. Then obtain the token to for starting a Live Activity:
Use the pushToStartTokenUpdates asynchronous sequence to retrieve a push-to-start
token that allows you to start new Live Activities. You don’t have to start a Live Activity from yo
app to receive the push-to-start token.
Send the push-to-start token to your server and use the pushToStartTokenUpdates
sequence to receive token updates. Similar to the update token, update it on your server when
needed and invalidate the old token.
On your push notification server, use the push-to-start token to send JSON payloads to APNs
that start a new Live Activity.
When the system receives the ActivityKit push notification on a device, it starts a new Live
Activity, wakes up your app, and grants it background runtime to allow you to download assets
that the Live Activity needs.
While the system starts the new Live Activity and wakes up your app, you receive the push toke
you use for updates. To update and end the Live Activity on devices that aren’t running iOS 18 
iPadOS 18, use this update push token as if you obtained it by starting a Live Activity from with
your app.
For devices running iOS 18 and iPadOS 18, you can send different APNs payloads to start a Liv
Activity to listen to updates on a push token or a channel ID. For more information, refer to
“Construct the payload that starts a Live Activity” below for more details. If you are using push
tokens to send updates, then the system wakes your app and you’ll receive new push tokens to
use for updates.
Start new Live Activities with ActivityKit push notifications


## Page 26

Note
You can’t use broadcast push notifications to start a Live Activity.
To successfully start, update, or end a Live Activity with an ActivityKit push notification, send an
HTTP request to APNs that conforms to the following requirements:
Set the value for the apns-push-type header field to liveactivity.
Set the apns-topic header field using the following format: <your bundleID>.push-typ
.liveactivity.
Set the value for the apns-priority header field to 5 or 10. For more information, refer to
“Determine the update frequency” below.
For more information about request headers, refer to Sending notification requests to APNs.
To successfully update or end a Live Activity with an ActivityKit push notification to a channel, sen
an HTTP request to APNs that conforms to the following requirements:
Set the value for the apns-push-type header field to liveactivity.
Set the apns-channel-id header field to the channel you’re using.
Set the value for the apns-priority header field to 5 or 10. For more information, refer to th
“Determine the update frequency” section of this article, below.
For more information about request headers, refer to Sending broadcast push notification reques
to APNs.
In your request’s aps dictionary:
Set the timestamp to the current time in seconds since 1970 to allow the system to always
display the most recent ActivityKit push update.
To start a Live Activity, refer to “Construct the payload that starts a Live Activity” below.
To update a Live Activity, set the value for the event key to update.
To end a Live Activity, set the value for the event key to end. If you end a Live Activity, include
the final content state to make sure the Live Activity displays the latest data after it ends.
Set the fields for the content-state key to match your custom Activity.ContentState
type to ensure the system can decode the JSON payload and update or end the Live Activity.
Additionally, don’t use any custom JSON encoding strategies to encode your data, because the
system always decodes JSON payloads for Live Activity updates using its default encoding
strategies. Custom encoding strategies will result in update failures.
Construct the ActivityKit remote push notification payload


## Page 27

To mark a Live Activity as outdated with an update, optionally set the stale-date. For more
information, refer to the “Mark a Live Activity as outdated by setting a stale date” section below
To set a custom dismissal date that tells the system to remove an ended Live Activity from the
Lock Screen, refer to the “End the Live Activity with a custom dismissal date” section below.
To alert a person about a critical Live Activity update, optionally provide an alert to light up
their device and display the expanded presentation on devices that support the Dynamic Island
or a banner on devices that don’t support it.
The following payload updates the Live Activity of the Emoji Rangers: Supporting Live Activities,
interactivity, and animations example with the latest information. The content of content-state
must match the properties of the custom Activity.ContentState type you declare in your
ActivityAttributes implementation. In the example, content-state matches the
properties of the custom AdventureAttributes.ContentState type of the sample code
project. Additionally, the example payload includes an alert with a custom sound to let the player
know that the hero has been knocked down and requires a healing potion.
In your alert implementation, consider localizing both strings. For more information on displaying
alerts for a remote notification, including localized alert messages and a reference of available key
refer to Generating a remote notification.


## Page 28

Remember that a person’s device may not receive a push notification — for example, if they’re in a
area without a network connection. Similarly, the system ignores an ActivityKit push notification if
arrives after the Live Activity ended. Both cases can cause a Live Activity to display outdated
information. To help reduce the chance of showing outdated information, update your Live Activit
from your app in addition to push notifications.
Note
When you send ActivityKit push notifications to a device, the system wakes the widget
extension to render the UI of your Live Activity.
The JSON payload for starting a Live Activity with an ActivityKit push notification is similar to the
payload you use for updates. However, it comes with the following requirements:
Set the value of the event field to start.
Include an alert in the JSON payload.
Include the attributes-type and attributes keys.
By including an alert in your JSON payload, you make sure a person gets alerted about the started
Live Activity and avoid unexpectedly surprising them. The following sample payload starts a Live
Activity for devices that aren’t running iOS 18 and iPadOS 18 or later:
Construct the payload that starts a Live Activity


## Page 29

For devices running iOS 18 and iPadOS or later, you can add input-push-channel with the
appropriate channel ID to start a Live Activity and listen for updates on a channel. After you send
this payload, you can send updates on the channel to update a Live Activity.
Create a channel ID before you send this payload to a device and ensure that the channel ID is
valid. If you send this payload to a device that doesn’t run iOS 18 and later, then the Live Activity
will not start.
For devices running iOS 18 and iPadOS 18 or later, you can add input-push-token: 1 to your
payload to start a Live Activity and receive a new push token. After you receive a new push token,
you can use it to send updates to a Live Activity.


## Page 30

During development, verify your JSON payloads and Live Activity updates locally. Using command
line tools and Simulator or a test device, you can send a JSON payload from the command line to
APNs and receive Live Activity updates to verify that your payload updates the Live Activity and th
Live Activity behaves as expected.
To locally test Live Activity updates during development:
1. Set up your command line as described in the “Send a Push Notification Using a Token” sectio
of Sending push notifications using command-line tools.
2. Add code that logs the push token to the console when you start a new Live Activity in your ap
3. Run your app in Simulator or on a test device and start a Live Activity.
4. Copy the logged push token from the console and set it as the $ACTIVITY_PUSH_TOKEN
environment variable in Terminal.
5. Use a curl command to send a Live Activity update using APNs. Set the value of the apns-
priority header field to 10 to deliver the update quickly with high priority.
The following example shows a curl command that the Emoji Rangers: Supporting Live Activities,
interactivity, and animations sample code project could use to test a Live Activity update.
Test Live Activity updates locally


## Page 31

Note
To test ActivityKit push notifications in Simulator, use a Mac with the Apple T2 Security Chip or
a Mac with Apple silicon that runs macOS 13 or later.
To locally test Live Activity updates to a channel during development:
1. Set up your command line as described in the “Send a Push Notification Using a Token” sectio
of Sending push notifications using command-line tools.
2. Create a new channel, and set it as $CHANNEL_ID variable in your terminal.
3. Use the newly created channel with ActivityKit when you request a Live Activity.
4. Run your app in Simulator or on a test device and start a Live Activity.
5. Use a curl command to send a Live Activity update using APNs. Set the value of the apns-
priority header field to 10 to deliver the update quickly with high priority.
Note
You can also use Push Notifications Console to send ActivityKit push notifications instead of
using terminal. For more information, refer to Testing notifications using the Push Notification
Console.
If you encounter failures while sending an ActivityKit push notification:
Ensure the curl command succeeded. An error might indicate an incorrect field for the reques
or errors setting up the command-line environment.
Use the Console app to view device logs and look for errors that could help you understand the
issue. Processes in Console that may contain relevant information are liveactivitiesd,
apsd, and chronod.
The system allows for a certain budget of ActivityKit push notifications per hour. As with other pu
notifications you send with APNs, you can set the HTTP header field apns-priority for your
requests to specify the priority of an ActivityKit push notification:
If you don’t specify the apns-priority value, APNs delivers the ActivityKit push notification
immediately with the default priority of 10 and counts it toward the notification budget that the
Determine the update frequency


## Page 32

system imposes.
If you exceed the budget, the system may throttle your ActivityKit push notifications.
To avoid throttling, you can send a low-priority ActivityKit push notification that doesn’t count
toward the budget by setting the HTTP header field apns-priority to 5. Consider this lower
priority first before using the priority of 10. In many cases, choosing a mix of priority 5 and 10 for
updates prevents your Live Activity updates from being throttled. For example, the Live Activity o
the Emoji Rangers: Supporting Live Activities, interactivity, and animations sample code project
could use priority 5 for updates that don’t require a person’s immediate attention, like when the
hero heals by a few points. When the hero requires a healing potion, the example would use a
priority of 10 to immediately update the Live Activity and let the user know about the important
change.
However, your app may need to update its Live Activity more frequently, causing you to hit the
budget limit for ActivityKit push notifications. For example, if your app allows people to track a
sports event like a basketball match that requires many updates per minute, you may not be able 
update your Live Activity often enough.
To allow for use cases like this, you can enable your Live Activities to receive frequent ActivityKit
push notifications:
If your project includes an Info.plist file, add the NSSupportsLiveActivities
FrequentUpdates entry to it, and set its Boolean value to YES.
Alternatively, open the Info.plist file as source code, add the key NSSupportsLive
ActivitiesFrequentUpdates, then set the type to Boolean and its value to YES. If your
project doesn’t have an Info.plist file, add NSSupportsLiveActivitiesFrequent
Updates to the list of custom iOS target properties for your iOS app target and set its value to
YES.
People can deactivate frequent ActivityKit push notifications for your app in the Settings app. In
your code, use frequentPushesEnabled to detect whether a person deactivated frequent pus
notifications and display information in your app that asks them to activate frequent ActivityKit
push notifications again. Additionally, send the value of this setting to your server and adjust the
update frequency accordingly.
Similar to other asynchronous sequences ActivityKit provides to receive configuration updates, yo
can subscribe to changes to the frequent Live Activity push notification setting setting with the
frequentPushEnablementUpdates stream.
For more information on available HTTPs headers and sending requests to APNs, refer to Sending
notification requests to APNs.
End the Live Activity with a custom dismissal date


## Page 33

When you end a Live Activity, by default the Live Activity appears on the Lock Screen for up to fou
hours after it ends to allow people to glance at their phone to refer to the latest information. To
change the time until the system removes a Live Activity from the Lock Screen after it ends, includ
the "dismissal-date" entry in the "aps" dictionary of your JSON payload. If you don’t includ
the "dismissal-date", your Live Activity uses the system’s default dismissal behavior. To
dismiss the Live Activity from the Lock Screen immediately after it ends, provide a date for
"dismissal-date" that’s in the past — for example, "dismissal-date": 1663177260.
Alternatively, provide a date within a four-hour window to set a custom dismissal date.
In some scenarios — for example, if a person enters an area without network connectivity — you
might not be able update the Live Activity with new information, causing it to display outdated dat
To provide the best possible user experience and let the person know that the Live Activity displa
outdated information, add a timestamp in the optional stale-date field to provide the time whe
the system will consider the Live Activity to be stale. With each update, you can advance this
stale-date. When you can’t update the Live Activity for some time until it becomes stale, the
activityState changes to ActivityState.stale at the specified date. Use the activity
StateUpdates stream in your app to monitor the activity state and respond to outdated Live
Activities that haven’t received updates. For example, while a person has network connectivity, a
sports app could update the Live Activity with the latest game information and advance the stale
date. When it becomes stale, it displays text to indicate that the displayed information is outdated
If your app starts more than one Live Activity, provide a relevance-score in your JSON payloa
to determine the order of your Live Activities on the Lock Screen and which of your Live Activities
appears in the Dynamic Island:
If you don’t provide a relevance score or if Live Activities have the same relevance score, the
system shows the first Live Activity you started in the Dynamic Island.
If you use different relevance scores, the system shows the Live Activity with the highest
relevance score in the Dynamic Island.
The system expects relative values for the relevance score. Assign a higher value for an important
Live Activity content update — for example, a score of 100 — and use lower values for less
important Live Activity content updates — for example, 50.
Mark a Live Activity as outdated by setting a stale date
Display the most important Live Activity in the Dynamic
Island


## Page 34

Note
Keep track of the relevance scores you assign for each ongoing Live Activity so you can
change the order of them as needed with each Live Activity update.
The following example payload provides a relevance score of 100 to make sure the Live Activity
that receives the update appears in the Dynamic Island and at top of the list on the Lock Screen:
Displaying live data with Live Activities
Display up-to-date data and offer quick interactions in the Dynamic Island, on the Lock
Screen, in CarPlay, and on a paired Mac or Apple Watch.
class Activity
The object you use to start, update, and end a Live Activity.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
NSSupportsLiveActivities
A Boolean value that indicates whether an app supports Live Activities.
NSSupportsLiveActivitiesFrequentUpdates
A Boolean value that indicates whether an app can update its Live Activities frequently.
See Also
Starting a Live Activity


## Page 35



## Page 36

Displaying live data with Live Activities
The Activity object offers functionality to start, update, and end a Live Activity from within you
app. You can update or end a Live Activity while your app is in the background, but you can only
start a Live Activity while the app is in the foreground, unless you adopt App Intents and start the
Live Activity using a LiveActivityIntent.
Additionally, Activity offers functionality to observe changes to:
The Live Activity
The Live Activity’s state in its life cycle
A person’s permission to start Live Activities
The Live Activity’s push token if you configure it to receive updates through ActivityKit push
notifications.
To observe these changes, use the asynchronous sequences the activity object offers; for examp
use the activityStateUpdates sequence to observe changes to the state of a Live Activity.
Mentioned in
Overview
ActivityKit / Activity
Class
Activity
The object you use to start, update, and end a Live Activity.
iOS 16.1+
iPadOS 16.1+


## Page 37

static func request(attributes: Attributes, content: ActivityContent<
Activity<Attributes>.ContentState>, pushType: PushType?) throws ->
Activity<Attributes>
Requests and starts a standard Live Activity.
static func request(attributes: Attributes, content: ActivityContent<
Activity<Attributes>.ContentState>, pushType: PushType?, style: Activit
Style) throws -> Activity<Attributes>
Requests and starts a Live Activity.
static func request(attributes: Attributes, content: ActivityContent<
Activity<Attributes>.ContentState>, pushType: PushType?, style: Activit
Style, alertConfiguration: AlertConfiguration, start: Date) throws ->
Activity<Attributes>
Requests and schedules a Live Activity for a specific date.
static func request(attributes: Attributes, content: ActivityContent<
Activity<Attributes>.ContentState>, pushType: PushType?, style: Activit
Style, alertConfiguration: AlertConfiguration, startDate: Date) throws 
> Activity<Attributes>
Deprecated
let attributes: Attributes
A set of attributes that describe a Live Activity and its content.
protocol ActivityAttributes
The protocol you implement to describe the content of a Live Activity.
enum ActivityStyle
var content: ActivityContent<Activity<Attributes>.ContentState>
The dynamic content of a Live Activity.
struct ActivityContent
A structure that describes the state and configuration of a Live Activity.
typealias ContentState
The type alias for the structure that describes the dynamic content of a Live Activity.
Topics
Starting a Live Activity


## Page 38

struct PushType
The structure that offers constants you use to configure a Live Activity to receive updates
through ActivityKit push notifications.
enum ActivityAuthorizationError
An error that indicates why the request to start a Live Activity failed.
func update(ActivityContent<Activity<Attributes>.ContentState>) async
Updates the dynamic content of the Live Activity.
func update(ActivityContent<Activity<Attributes>.ContentState>, alert
Configuration: AlertConfiguration?) async
Updates the dynamic content of a Live Activity and alerts a person about the Live Activity
update.
struct AlertConfiguration
A structure you use to configure an alert that appears when you update your Live Activity.
func update(ActivityContent<Activity<Attributes>.ContentState>, alert
Configuration: AlertConfiguration?, timestamp: Date) async
Updates the dynamic content of a Live Activity and alerts a person about the Live Activity
update.
func end(ActivityContent<Activity<Attributes>.ContentState>?, dismissal
Policy: ActivityUIDismissalPolicy) async
Ends an active Live Activity.
struct ActivityUIDismissalPolicy
The structure that describes when the system should remove a Live Activity that ended.
func end(ActivityContent<Activity<Attributes>.ContentState>?, dismissal
Policy: ActivityUIDismissalPolicy, timestamp: Date) async
Ends an active Live Activity.
var contentUpdates: Activity<Attributes>.ContentUpdates
Updating a Live Activity
Ending a Live Activity
Observing Live Activity content changes


## Page 39

An asynchronous sequence you use to observe changes to the dynamic content of a Live
Activity.
struct ContentUpdates
A structure that offers functionality to observe changes to the dynamic content of a Live
Activity.
var activityState: ActivityState
The current state of a Live Activity in its life cycle.
enum ActivityState
The enum that describes the state of a Live Activity in its life cycle.
var activityStateUpdates: Activity<Attributes>.ActivityStateUpdates
An asynchronous sequence you use to observe activity state changes.
struct ActivityStateUpdates
A structure that offers functionality to observe state changes of a Live Activity.
var pushToken: Data?
The token you use to send ActivityKit push notifications to a Live Activity.
var pushTokenUpdates: Activity<Attributes>.PushTokenUpdates
An asynchronous sequence you use to observe changes to the push token of a Live Activity.
struct PushTokenUpdates
A structure that offers functionality to observe changes to the push token of a Live Activity.
static var pushToStartToken: Data?
The token you use to start a Live Activity with an ActivityKit push notification.
static var pushToStartTokenUpdates: Activity<Attributes>.PushToken
Updates
An asynchronous sequence you use to observe changes to the token for starting a Live
Activity with an ActivityKit push notification.
Observing the Live Activity life cycle
Using ActivityKit push notifications
Checking user authorization


## Page 40

class ActivityAuthorizationInfo
An object with information about whether a person allowed your app to start Live Activities
and permitted content updates with frequent ActivityKit push notifications.
static var activities: [Activity<Attributes>]
An array of your app’s current Live Activities.
static var activityUpdates: Activity<Attributes>.ActivityUpdates
An asynchronous sequence you use to observe changes to ongoing Live Activities and to
asynchronously access a Live Activity when you start it.
struct ActivityUpdates
A structure that offers functionality to observe changes to a Live Activity.
let id: String
A unique identifier for a Live Activity.
let id: String
A unique identifier for a Live Activity.
Deprecated symbols
Review unsupported symbols and their replacements.
Identifiable
Accessing Live Activities
Identifying a Live Activity
Deprecated
Relationships
Conforms To
See Also


## Page 41

Displaying live data with Live Activities
Display up-to-date data and offer quick interactions in the Dynamic Island, on the Lock
Screen, in CarPlay, and on a paired Mac or Apple Watch.
Starting and updating Live Activities with ActivityKit push notifications
Use ActivityKit to receive push tokens and to remotely start, update, and end your Live
Activity with ActivityKit notifications.
Emoji Rangers: Supporting Live Activities, interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
NSSupportsLiveActivities
A Boolean value that indicates whether an app supports Live Activities.
NSSupportsLiveActivitiesFrequentUpdates
A Boolean value that indicates whether an app can update its Live Activities frequently.
Starting a Live Activity


## Page 42

Note
This sample code project is associated with WWDC23 sessions 10184: Meet ActivityKit, 10185:
Update live activities with push notifications, 10027: Bring widgets to new places, and 10028:
Bring widgets to life.
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
WidgetKit updates
Learn about important changes in WidgetKit.
Overview
See Also
Essentials
WidgetKit / Emoji Rangers: Supporting Live Activities, interactivity, and animations
Sample Code
Emoji Rangers: Supporting Live Activities,
interactivity, and animations
Offer Live Activities, controls, animate data updates, and add interactivity to
widgets.
Download
iOS 18.0+
iPadOS 18.0+
watchOS 11.0+
Xcode 16.2+


## Page 43

Creating a widget extension
Display your app’s content in a convenient, informative widget on various devices.
protocol WidgetBundle
A container used to expose multiple widgets from a single widget extension.


## Page 44

Name
Supports Live Activities
Type
Boolean
Set the corresponding value to true to enable your app to display live data on the Lock Screen a
in the Dynamic Island. For more information, see Displaying live data with Live Activities.
NSSupportsLiveActivitiesFrequentUpdates
A Boolean value that indicates whether an app can update its Live Activities frequently.
Details
Discussion
See Also
Live Activities
Bundle Resources / Information Property List / NSSupportsLiveActivities
Property List Key
NSSupportsLiveActivities
A Boolean value that indicates whether an app supports Live Activities.
iOS 16.1+
iPadOS 16.1+


## Page 45

Type
Boolean
Set the corresponding value to true to enable your Live Activities to receive frequent updates wi
remote push notifications. For more information, see Updating and ending your Live
Activity with ActivityKit push notifications.
NSSupportsLiveActivities
A Boolean value that indicates whether an app supports Live Activities.
Name: Supports Live Activities
Details
Discussion
See Also
Live Activities
Bundle Resources / Information Property List / NSSupportsLiveActivitiesFrequentUpdates
Property List Key
NSSupportsLiveActivitiesFrequent
Updates
A Boolean value that indicates whether an app can update its Live Activities
frequently.
iOS 16.2+
iPadOS 16.2+


