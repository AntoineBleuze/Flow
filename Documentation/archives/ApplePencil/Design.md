# Design.pdf

## Page 1

Apple Pencil is a versatile, intuitive tool for iPad apps that offers pixel‑level precision when
jotting notes, sketching, painting, marking up documents, and more. Scribble lets people use
Apple Pencil to enter text in any text field through fast, private, on-device handwriting
recognition.
For details on Apple Pencil features and compatibility, see Apple Pencil.
Support behaviors people intuitively expect when using a marking instrument. Most people
have a lot of experience with real-world marking tools, and this knowledge informs their
expectations when they use Apple Pencil with your app. To provide a delightful experience, think
about the ways people interact with nondigital pencils, pens, and other marking instruments, and
proactively support actions that people may naturally attempt. For example, people often want
to write in the margins of documents or books.
Let people choose when to switch between Apple Pencil and finger input. For example, if your
app supports Apple Pencil for marking, also ensure that your app’s controls respond to Apple
Pencil so people don’t have to switch to using their finger to activate them. In this scenario, a
control that doesn’t support Apple Pencil input might seem to be unresponsive, giving the
impression of a malfunction or low battery. (Scribble only supports Apple Pencil input.)
Let people make a mark the moment Apple Pencil touches the screen. You want the
experience of putting Apple Pencil to screen to mirror the experience of putting a classic pencil
Best practices
Supported platforms
Apple Pencil and Scribble
Best practices
Hover
Double tap
Squeeze
Barrel roll
Scribble
Custom drawing
Platform considerations
Resources
Change log
Apple Pencil and Scribble
Apple Pencil helps make drawing, handwriting, and marking
effortless and natural, in addition to performing well as a
pointer and UI interaction tool.
Design
Overview
What’s New
Get Started
Guidelines
Resources


## Page 2

to paper, so it’s essential to avoid requiring people to tap a button or enter a special mode before
they can make a mark.
Help people express themselves by responding to the way they use Apple Pencil. Apple
Pencil may sense tilt (altitude), force (pressure), orientation (azimuth), and barrel roll. Use this
information to affect the strokes Apple Pencil makes, such as by varying thickness and intensity.
When responding to pressure, keep things simple and intuitive. For example, it feels natural to
affect continuous properties — such as ink opacity or brush size — by varying the pressure.
Altitude
Pressure
Azimuth
Provide visual feedback to indicate a direct connection with content. Make sure Apple Pencil
appears to directly and immediately manipulate content it touches onscreen. Avoid letting Apple
Pencil appear to initiate seemingly disconnected actions, or affect content on other parts of the
screen.
Design a great left- and right-handed experience. Avoid placing controls in locations that may
be obscured by either hand. If there’s a chance controls may become obscured, consider letting
people reposition them.
Use hover to help people predict what will happen when Apple Pencil touches the screen.
For example, as people hold Apple Pencil above the screen, a hover preview can show the
dimensions and color of the mark that the current tool can make. As much as possible, avoid
continuously modifying the preview as people move Apple Pencil closer or farther from the
screen. A preview that changes according to height is unlikely to clarify the mark Apple Pencil
will make, and frequent visual variations can be very distracting to people.
Avoid using hover to initiate an action. Unlike tapping a button or marking the screen, hovering
is a relatively imprecise motion that doesn’t require people to think about the actual distance
between Apple Pencil and the display. You don’t want people to inadvertently perform an action
— especially a destructive action that they might want to undo — just because they hold Apple
Pencil near the screen.
Prefer showing a preview value that’s near the middle in a range of dynamic values. Dynamic
properties like opacity or flow can be difficult to depict at the highest or lowest ends of the
Hover


## Page 3

spectrum. For example, previewing the appearance of a brush mark made with the maximum
pressure could occlude the area in which people are marking; in contrast, depicting a mark made
with the minimum pressure could be hard for people to detect, making the preview an inaccurate
representation of an actual mark or even invisible.
Consider using hover to support relevant interactions close to where people are marking. For
example, you might respond to hover by displaying a contextual menu of tool sizes when people
perform a gesture like squeeze or press a modifier key on an attached keyboard. Revealing a
menu near where people are marking lets them make choices without moving Apple Pencil or
their hands to another part of the screen.
Prefer showing hover previews for Apple Pencil, not for a pointing device. Although a pointing
device can also respond to hover gestures, it might be confusing to provide the same visual
feedback for both devices. If it makes sense in your app, you can restrict your hover preview to
Apple Pencil only. For developer guidance, see Adopting hover support for Apple Pencil.
Respect people’s settings for the double-tap gesture when they make sense in your app. By
default, models of Apple Pencil that support the double-tap gesture respond by toggling
between the current tool and the eraser, but people can set the gesture to toggle between the
current and previous tool, show and hide the color picker, or do nothing at all. If your app
supports these behaviors, let people use their preferred gestures to perform them. If the
systemwide double-tap settings don’t make sense in your app, you can still use the gesture to
change the interaction mode. For example, a 3D app that offers a mesh-editing tool could use
double tap to toggle between the tool’s raise and lower modes.
Give people a way to specify custom double-tap behavior if necessary. If you offer custom
double-tap behavior in addition to some or all of the default behaviors, provide a control that lets
people choose the custom behavior mode. People need to know which mode they’re in;
otherwise, they may get confused when your app responds differently to their interactions. In
this scenario, make sure it’s easy for people to discover the custom behavior your app supports,
but don’t turn it on by default.
Avoid using the double-tap gesture to perform an action that modifies content. In rare cases,
it’s possible for people to double-tap accidentally, which means that they may not even be aware
that your app has performed the action. Prefer using double tap to perform actions that are easy
for people to undo. In particular, avoid using double tap to perform a potentially destructive
action that might result in data loss.
Using Apple Pencil Pro, people can squeeze to perform an action. You can design a custom
behavior that responds to squeeze, but recognize that people may choose to configure the
squeeze gesture to run an App Shortcut instead of app-specific actions.
Double tap
Squeeze


## Page 4

Note
The squeeze gesture is available only when the paired iPad screen is on and while the Apple
Pencil Pro is not directly contacting it. Because squeeze works when there’s distance
between Apple Pencil Pro and iPad, people might not always be visually aware of the
gesture’s onscreen result.
Treat squeeze as a single, quick gesture that performs a discrete — not continuous — action.
People sometimes squeeze with a lot of force, so holding a squeeze or squeezing several times
quickly can be tiring. Help people remain comfortable by responding to a single squeeze and
promptly displaying the result.
If you use squeeze to reveal app UI, like a contextual menu, display it close to Apple Pencil
Pro. Displaying the result of a squeeze near the tip of Apple Pencil Pro strengthens the
connection between the device and the gesture, and can help people stay engaged with their
task.
Define squeeze actions that are nondestructive and easy to undo. As with the double-tap
gesture, people can make the squeeze gesture without meaning to, so it’s essential to avoid
using squeeze to perform an action that could result in data loss.
While marking with Apple Pencil Pro, people can use a barrel-roll gesture to change the type of
mark they’re making. For example, while using Apple Pencil Pro to highlight content in Notes,
people can barrel-roll to rotate the angle of the mark.
Use barrel roll only to modify marking behavior, not to enable navigation or display other
controls. In contrast to double tap and squeeze, barrel roll is naturally related to marking and
doesn’t make sense for performing an interface action.
With Scribble and Apple Pencil, people can simply write wherever text is accepted in your app —
they don’t have to tap or switch modes first. Because Scribble is fully integrated into iPadOS, it’s
available to all apps by default.
Make text entry feel fluid and effortless. By default, Scribble works in all standard text
components — such as text fields, text views, search fields, and editable fields in web content —
except password fields. If you use a custom text field in your app, avoid making people tap or
select it before they can begin writing.
Make Scribble available everywhere people might want to enter text. Unlike using the
keyboard, using Apple Pencil encourages people to treat the screen the way they treat a sheet
of paper. Help strengthen this perception in your app by making Scribble consistently available
in places where text entry seems natural. For example, in Reminders, it’s natural for people to
create a new reminder by writing it in the blank space below the last item, even though the area
doesn’t contain a text field. For developer guidance, see UIIndirectScribble
Interaction.
Avoid distracting people while they write. Some text field behaviors work well for keyboard
input, but can disrupt the natural writing experience that Apple Pencil provides. For example, it’s
best to avoid displaying autocompletion text as people write in a text field because the
suggestions can visually interfere with their writing. It’s also a good idea to hide a field’s
placeholder text the moment people begin to write so that their input doesn’t appear to overlap
it.
Barrel roll
Scribble


## Page 5

While people are writing in a text field, make sure it remains stationary. In some cases, it can
make sense to move a text field when it becomes focused: for example, a search field might
move to make more room to display results. Such a movement is fine when people are using the
keyboard, but when they’re writing it can make them feel like they’ve lost control of where their
input is going. If you can’t prevent a text field from moving or resizing, consider delaying the
change until people pause their writing.
Prevent autoscrolling text while people are writing and editing in a text field. When
transcribed text autoscrolls, people might try to avoid writing on top of it. Worse, if text scrolls
while people are using Apple Pencil to select it, they might select a different range of text than
they want.
Give people enough space to write. A small text field can feel uncomfortable to write in. When
you know that Apple Pencil input is likely, improve the writing experience in your app by
increasing the size of the text field before people begin to write in it or when they pause writing;
avoid resizing a text field while people are writing. For developer guidance, see UIScribble
Interaction.
Using PencilKit, you can let people take notes, annotate documents and images, and draw with
the same low-latency experience that iOS provides. PencilKit also makes it easy to create a
custom drawing canvas in your app and offer a state-of-the-art tool picker and ink palette.
Help people draw on top of existing content. By default, the colors on your PencilKit canvas
dynamically adjust to Dark Mode, so people can create content in either mode and the results
will look great in both. However, when people draw on top of existing content like a PDF or a
photo, you want to prevent the dynamic adjustment of colors so that the markup remains sharp
and visible.
Consider displaying custom undo and redo buttons when your app runs in a compact
environment. In a regular environment, the tool picker includes undo and redo buttons, but in a
compact environment it doesn’t. In a compact environment, you could display undo and redo
buttons in a toolbar. You might also consider supporting the standard 3-finger undo/redo
gesture, so people can use it in any environment. For guidance, see Undo and redo.
Not supported in iOS, macOS, tvOS, visionOS, or watchOS.
Entering data
PencilKit
PaperKit
Custom drawing
Platform considerations
Resources
Related
Developer documentation
Videos


## Page 6

Date
Changes
May 7, 2024
Added guidance for handling squeeze and barrel roll
on Apple Pencil Pro.
September 12, 2023
Updated artwork.
November 3, 2022
Added guidelines for using hover to enhance your app.
Meet PaperKit
Squeeze the most out of
Apple Pencil
Change log


## Page 7

Depending on the platform and the device people are using, the system can play haptics in
addition to visual and auditory feedback. For example, components like switches, sliders, and
pickers automatically play haptic feedback on supported iPhone models; on Apple Watch, the
Taptic Engine generates haptics for a number of built-in feedback patterns, which watchOS
combines with an audible tone. On a Mac that’s equipped with a Force Touch trackpad, an app
can play haptics while people drag content or when they force click to change the speed of
media controls.
In addition to built-in haptic capabilities, some external input devices can also play haptics. For
example:
In an iPadOS, macOS, tvOS, or visionOS app or game, game controllers can provide haptic
feedback (for developer guidance, see Playing Haptics on Game Controllers).
Apple Pencil Pro and some trackpads can provide haptic feedback when connected to certain
iPad models. (For details on Apple Pencil features and compatibility, see Apple Pencil.)
Use system-provided haptic patterns according to their documented meanings. People
recognize standard haptics because the system plays them consistently on interactions with
standard controls. If the documented use case for a pattern doesn’t make sense in your app or
game, avoid using the pattern to mean something else. Instead, use a generic pattern or create
your own, where supported. For guidance, see Custom haptics.
Best practices
Supported platforms
Playing haptics
Best practices
Custom haptics
Platform considerations
Resources
Change log
Playing haptics
Playing haptics can engage people’s sense of touch and bring
their familiarity with the physical world into your app or game.
Design
Overview
What’s New
Get Started
Guidelines
Resources


## Page 8

Use haptics consistently throughout your app or game. It’s important to build a clear, causal
relationship between each haptic and the action that causes it so people learn to associate
certain haptic patterns with certain experiences. If a haptic doesn’t reinforce a cause-and-effect
relationship, it can be confusing and seem gratuitous. For example, if your game plays a specific
haptic pattern when a character fails to finish a mission, people associate that pattern with a
negative outcome. If you use the same haptic pattern for a positive outcome like a level
completion, people will be confused.
Prefer using haptics to complement other feedback in your app or game. When visual,
auditory, and tactile feedback are in harmony — as they generally are in the physical world — the
user experience is more coherent and can seem more natural. For example, you generally want
to match the intensity and sharpness of a haptic with the intensity and sharpness of the
animation it accompanies. You can also synchronize sound with haptics; for developer guidance,
see Delivering Rich App Experiences with Haptics.
Avoid overusing haptics. Sometimes a haptic can feel just right when it happens occasionally,
but become tiresome when it plays frequently. Doing user testing can help you discover a
balance that most people appreciate. Often, the best haptic experience is one that people may
not be conscious of, but miss when it’s turned off.
In most apps, prefer playing short haptics that complement discrete events. Although long-
running haptics that accompany a gameplay flow can enhance the experience, long-running
haptics in an app can dilute the meaning of the feedback and distract people from their task. On
Apple Pencil Pro, for example, continuous or long-lasting haptics don’t tend to clarify the writing
or drawing experience and can even make holding the pencil less pleasant.
Make haptics optional. Let people turn off or mute haptics, and make sure people can still enjoy
your app or game without them.
Be aware that playing haptics might impact other user experiences. By design, haptics
produce enough physical force for people to feel the vibration. Ensure that haptic vibrations
don’t disrupt experiences involving device features like the camera, gyroscope, or microphone.
Games often use custom haptics to enhance gameplay. Although it’s less common, nongame
apps might also use custom haptics to provide a richer, more delightful experience.
You can design custom haptic patterns that vary dynamically, based on user input or context.
For example, the impact players feel when a game character jumps from a tree can be stronger
than when the character jumps in place, and substantial experiences — like a collision or a hit —
can feel very different from subtle experiences like the approach of footsteps or a looming
danger.
There are two basic building blocks you can use to generate custom haptic patterns.
Transient events are brief and compact, often feeling like taps or impulses. The experience of
tapping the Flashlight button on the Home Screen is an example of a transient event.
Continuous events feel like sustained vibrations, such as the experience of the lasers effect in
a message.
Regardless of the type of haptic event you use to generate a custom haptic, you can also control
its sharpness and intensity. You can think of sharpness as a way to abstract a haptic experience
into the waveform that produces the corresponding physical sensations. Specifying sharpness
lets you relay to the system your intent for the experience. For example, you might use
sharpness values to convey an experience that’s soft, rounded, or organic, or one that’s crisp,
precise, or mechanical. As the term implies, intensity means the strength of the haptic.
By combining transient and continuous events, varying sharpness and intensity, and including
optional audio content, you can create a wide range of different haptic experiences. For
Custom haptics


## Page 9

developer guidance, see Core Haptics.
On supported iPhone models, you can add haptics to your experience in the following ways:
Use standard UI components — like toggles, sliders, and pickers — that play Apple-designed
system haptics by default.
When it makes sense, use a feedback generator to play one of several predefined haptic
patterns in the categories of notification, impact, and selection (for developer guidance, see
UIFeedbackGenerator).
Notification haptics provide feedback about the outcome of a task or action, such as depositing
a check or unlocking a vehicle.
Play
Success. Indicates that a task or action has completed.
Play
Warning. Indicates that a task or action has produced a
warning of some kind.
Play
Error. Indicates that an error has occurred.
Impact haptics provide a physical metaphor you can use to complement a visual experience. For
example, people might feel a tap when a view snaps into place or a thud when two heavy objects
collide.
Platform considerations
iOS
Notification
Impact


## Page 10

Play
Light. Indicates a collision between small or lightweight
UI objects.
Play
Medium. Indicates a collision between medium-sized or
medium-weight UI objects.
Play
Heavy. Indicates a collision between large or
heavyweight UI objects.
Play
Rigid. Indicates a collision between hard or inflexible UI
objects.
Play
Soft. Indicates a collision between soft or flexible UI
objects.
Selection haptics provide feedback while the values of a UI element are changing.
Play
Selection. Indicates that a UI element’s values are
changing.
Selection
macOS


## Page 11

When a Magic Trackpad is available, your app can provide one of the three following haptic
patterns in response to a drag operation or force click.
Haptic feedback pattern
Description
Alignment
Indicates the alignment of a dragged item. For exam‐
ple, this pattern could be used in a drawing app when
the people drag a shape into alignment with another
shape. Other scenarios where this type of feedback
could be used might include scaling an object to fit
within specific dimensions, positioning an object at a
preferred location, or reaching the beginning/end or
minimum/maximum of something like a scrubber in a
video app.
Level change
Indicates movement between discrete levels of pres‐
sure. For example, as people press a fast-forward but‐
ton on a video player, playback could increase or de‐
crease and haptic feedback could be provided as dif‐
ferent levels of pressure are reached.
Generic
Intended for providing general feedback when the oth‐
er patterns don’t apply.
For developer guidance, see NSHapticFeedbackPerformer.
Apple Watch Series 4 and later provides haptic feedback for the Digital Crown, which gives
people a more tactile experience as they scroll through content. By default, the system provides
linear haptic detents that people can feel as they rotate the Digital Crown. Some system
controls, like table views, provide detents as new items scroll onto the screen. For developer
guidance, see WKHapticType.
watchOS defines the following set of haptics, each of which conveys a specific meaning to
people.
Feedback
Gestures
watchOS
Up
Down
Success
Failure
Retry
Start
Stop
Click
Play
Notification. Tells the person that something significant or out
of the ordinary has happened and requires their attention. The
system plays this same haptic when a local or remote
notification arrives.
Resources
Related
Notification


## Page 12

Core Haptics
Date
Changes
May 7, 2024
Added guidance for playing haptics on Apple Pencil
Pro.
June 21, 2023
Updated to include guidance for visionOS.
Developer documentation
Videos
Practice audio haptic design
Introducing Core Haptics
Change log


