# User interface.pdf

## Page 1

To support Live Activities in your app, you must provide layouts for each Live Activity presentation
Because Live Activities appear automatically across a person’s devices, views you use for your Liv
Activities automatically adapt to provide a default layout. To offer the best user experience and
make the most of the available space, create reusable, custom views that automatically adapt for
each Live Activity presentation.
The different presentations are key to creating layouts for your Live Activities. By requiring you to
support each presentation, the system can render your Live Activity across devices without you
having to add code for each device:
In StandBy, the system expands the Lock Screen presentation to fill the whole screen.
On Apple Watch, Live Activities automatically appear in the Smart Stack and as alerts using the
compact presentation.
In CarPlay, Live Activities automatically appear on the Home Screen using the compact
presentation.
To offer a great experience in StandBy, on Apple Watch, and in CarPlay, provide flexible custom
views to keep people informed about the state of a Live Activity and offer interactivity:
To tell the system that you provide a custom layout on Apple Watch and in CarPlay, pass
ActivityFamily.small to the supplementalActivityFamilies(_:) view modifier.
To tell the system that your Live Activity adapts its layout on the Lock Screen of iPhone and iPa
for example in StandBy, pass ActivityFamily.medium to the supplementalActivity
Families(_:) view modifier.
Overview
Use supplemental activity families
ActivityKit / Creating custom views for Live Activities
Article
Creating custom views for Live Activities
Create reusable custom views and layouts that support each Live Activity
presentation.


## Page 2

The following example shows how an app might configure a Live Activity that provides different
view layouts for small and medium activity families:
In your view code, use the activityFamily environment value to detect the activity family and
change the Live Activity layout accordingly.
The following example shows how a view might respond to different activity families:


## Page 3

Note
Live Activities automatically appear in the Menu bar of a paired Mac, offering interactivity and
allowing people to launch your app with iPhone Mirroring. Live Activities that appear in the
Menu bar use unchanged compact, minimal, and expanded presentations.
For more information about reusing custom views across widgets and Live Activities, refer to
Creating views for widgets, Live Activities, and watch complications.
Limiting the content you display is key to offering glanceable, easy-to-read Live Activities. Aim to
use the system’s default content margins for your Live Activities and only show content that’s
relevant to the person viewing it. However, you may want to change the system’s default content
margin to display more content or provide a custom user interface that matches your app. To set
custom content margins, use contentMargins(_:_:for:). The following example results in a
margin of eight points for the trailing edge of an expanded Live Activity.
Set custom content margins


## Page 4

If you repeatedly use the contentMargins(_:_:for:) modifier, the system uses the innermo
specified values for a mode.
Note
Avoid placing content too close to the edges of the Dynamic Island.
Live Activities in the Dynamic Island use a black background color with white text. Use the
keylineTint(_:) modifier to apply a subtle tint color to the border of the Dynamic Island whe
the device is in Dark Mode and change text color as needed.
Note
You can’t change the background color of Live Activities in the Dynamic Island.
By default, the Lock Screen presentation — including the banner that appears on devices that don
support the Dynamic island — uses a solid white background color in Light Mode and a solid blac
background color in Dark Mode. To set a custom background color for the Lock Screen
presentation, use the activityBackgroundTint(_:) modifier. Be sure to choose a color that
works well in both Dark or Light Mode or use different background colors that best fit each
appearance. To set the translucency of the custom background color, use the opacity(_:) view
modifier or specify an opaque background color.
If you choose a custom background color for the Lock Screen presentation, use the activity
SystemActionForegroundColor(_:) view modifier to customize the text color of the auxilia
button that allows people to end the Live Activity on the Lock Screen.
Use custom colors


## Page 5

Note
On devices that include an Always-On display, the system dims the screen to preserve battery
life and renders Live Activities on the Lock Screen as if in Dark Mode. Use SwiftUI’s is
LuminanceReduced environment value to detect reduced luminance on devices with an
Always-On display and use colors and images that look great with reduced luminance.
Adding accessible descriptions to widgets and Live Activities
Describe the interface elements of your widgets and Live Activities to help people understan
what they represent.
Launching your app from a Live Activity
Use deep links to enable people to open your app’s scene that matches the data of you Live
Activity.
See Also
User interface


## Page 6

Designing with accessibility in mind is a foundational principle when creating an app. It also applie
to widgets and Live Activities. To allow people to customize how they interact with your widget or
Live Activity, to verify VoiceOver works correctly for them, and to help people understand what
each interface element represents, add accessibility labels to the SwiftUI views you create for eac
widget and Live Activity presentation.
Add accessibility labels for each SwiftUI view you use as needed and make sure your accessibility
labels fit the widget or Live Activity content. To review API that allows you to add accessible
descriptions to SwiftUI views, see Accessible descriptions.
The example below shows how the Emoji Rangers: Supporting Live Activities, interactivity, and
animations app uses the accessibilityLabel(_:) modifier to add accessibility labels for
minimal, compact leading, and compact trailing presentations.
Overview
Provide accessibility labels
ActivityKit / Adding accessible descriptions to widgets and Live Activities
Article
Adding accessible descriptions to widgets
and Live Activities
Describe the interface elements of your widgets and Live Activities to help people
understand what they represent.


## Page 7

If you provide a content description for an image you update while a Live Activity is active and the
image conveys status information or similar, make sure to also update the accessibility label to
match the updated status. For example, if an image indicates a delivery status, make sure the
accessibility label changes as the delivery status that the image indicates changes. Similarly,
update accessibility labels when a widget updates displayed images or SwiftUI views. For guidanc
on providing content descriptions, see Human Interface Guidelines > Accessibility > VoiceOver >
Content descriptions.
See Also


## Page 8

Creating custom views for Live Activities
Create reusable custom views and layouts that support each Live Activity presentation.
Launching your app from a Live Activity
Use deep links to enable people to open your app’s scene that matches the data of you Live
Activity.
User interface


## Page 9

People can tap a Live Activity to launch your app. To let them view more content or make changes
to an ongoing task, open your app to the scene that matches the content of the Live Activity.
If you don’t explicitly provide a deep link into your app, the system opens your app and passes an
NSUserActivity to onContinueUserActivity(_:perform:), application(_:
continue:restorationHandler:), or application(_:continue:restoration
Handler:). Implement the appropriate callback and check whether the NSUserActivity
object’s activityType is NSUserActivityTypeLiveActivity. Then, add code to open a
screen in your app that fits the context of the active Live Activity.
Important
In CarPlay, tapping your Live Activity only launches your app if it supports CarPlay. For more
information about adding CarPlay support to your app, refer to CarPlay.
With deep links, you specify an URL that directly launches a specific scene in your app, and choo
different scenes for each Live Activity presentation:
To create a deep link into your app from the Lock Screen, compact leading, compact trailing, a
minimal presentations, use widgetURL(_:). When the compact leading and trailing
presentations are visible, make sure both link to the same screen in your app.
Overview
Respond to the system’s default launch behavior
Add deep links to your app
ActivityKit / Launching your app from a Live Activity
Article
Launching your app from a Live Activity
Use deep links to enable people to open your app’s scene that matches the data o
you Live Activity.


## Page 10

To create a deep link into your app from the extended presentation, use widgetURL(_:) or
SwiftUI’s Link.
Live Activities automatically appear in the Smart Stack on Apple Watch, and the system shows the
Live Activity more prominently on Apple Watch when it receives updates with an alert. When a Liv
Activity receives an update:
If a person doesn’t actively use an app on Apple Watch, the system displays an alert that uses
the compact presentation’s leading and trailing views, and then launches the Smart Stack,
displaying the Live Activity at the top of the stack.
If a person actively uses any app on Apple Watch, the system shows an alert to let them know
about the updated Live Activity.
Tapping the alert displays the Live Activity on Apple Watch and the option to launch the app on
iPhone. You can opt-in to give people the ability to open your Watch app from your Live Activity. I
the Build Settings for your watchOS app target, add the Supports Launch for Live
Activity Attribute Types key in the Info.plist section. To launch your Watch app for a
your Live Activities, leave its value empty. To launch for specific Live Activities, add an item for ea
ActivityAttributes conforming type that launches your watchOS app.
Creating custom views for Live Activities
Create reusable custom views and layouts that support each Live Activity presentation.
Adding accessible descriptions to widgets and Live Activities
Describe the interface elements of your widgets and Live Activities to help people understan
what they represent.
Configure how your Live Activity launches your app in
watchOS
See Also
User interface


