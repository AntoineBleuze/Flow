# Essentials.pdf

## Page 1

Browse notable changes in Accessibility.
Add Accessibility Nutrition Labels to your App Store product page to indicate which accessibilit
features your app supports.
Support Assistive Access in iOS and iPadOS scenes with AssistiveAccess.
Use AXBrailleTranslator to translate print text to Braille and Braille to print text according
to a given Braille table.
Use openSettings(for:) to open the Settings app to new sections of Accessibility settings
including AccessibilitySettings.Feature.assistiveTouch, Accessibility
Settings.Feature.assistiveTouchDevices, and AccessibilitySettings
.Feature.dwellControl.
Enhance music with tactile feedback for people who are deaf or hard of hearing by playing
Apple-generated haptic tracks along with music tracks. Add the MusicHapticsSupported
Info.plist key to notify the system that your app supports the Music Haptics feature. Spec
which song is playing using the MPNowPlayingInfoPropertyInternationalStandard
RecordingCode. Music Haptics uses the International Standard Recording Code (ISRC) to
Overview
June 2025
June 2024
General
Updates / Accessibility updates
Article
Accessibility updates
Learn about important changes to Accessibility.


## Page 2

choose the correct Music Haptics track to play at the same time. Observe and respond to the
status of the haptic track playback using MAMusicHapticsManager.
Open the Settings app to a specific section of Accessibility settings using open
Settings(for:).
Support people’s preference to reduce the blinking animation of the text insertion indicator for
custom cursor implementations. Check the value of the preference with prefersNonBlinki
TextInsertionIndicator, and observe when people change that preference with prefer
NonBlinkingTextInsertionIndicatorDidChangeNotification.
Check if a device uses Assistive Access with isAssistiveAccessEnabled if you need to
remove workflows or UI elements that aren’t appropriate in the context of Assistive Access.
Specify that your accessibility element behaves as a tab bar using the isTabBar accessibility
trait with the accessibilityAddTraits(_:) modifier. In UIKit, use tabBar.
Enhance how you structure accessibility labels by appending custom content using
accessibilityLabel(content:).
Generate a localized description of a color in a string interpolation by adding accessibility
Name:, such as "\(accessibilityName: myColor)". Pass that string to any accessibility
modifier.
Provide a great experience for your app in Assistive Access, an accessibility feature that tailors
the iOS and iPadOS experience for people with cognitive disabilities. Adopt UISupportsFull
ScreenInAssistiveAccess to allow your app’s UI to expand into all the available space
above the Back button in Assistive Access.
Personalize your app with Personal Voice, a new feature that lets people record and recreate
their voice directly on their iOS and macOS devices. Personal voices appear alongside system
voices and are available for Live Speech, a type-to-speak feature that lets a person synthesize
speech on the fly. Request access to synthesize speech with personal voices using a new
request authorization API in AVSpeechSynthesizer.
Detect and mitigate sequences of flashing effects in your video content when the Dim Flashing
Lights setting is on. If your app performs custom video drawing instead of using AVFoundation
APIs, implement this behavior using MAFlashingLightsProcessor.
Pause animated images in your app when a person turns off the Animated Images setting on
their device. Check the value of this setting using accessibilityPlayAnimatedImages.
SwiftUI
June 2023


## Page 3

Send announcement, layout change, screen change, and page scroll accessibility notifications
with greater ease in multiplatform apps using the new Swift type Accessibility
Notification. Make sure people receive the most important information first by specifying a
default, low, or high priority for announcements.
Enhance custom accessibility elements by specifying the combination of traits and behaviors
that best characterizes the element. Add the new trait isToggle to controls that toggle on an
off, and the new action accessibilityZoomAction(_:) to content that can zoom in and
out.
Configure new direct touch options through accessibilityDirectTouch(_:options:) 
provide the best experience for elements that support direct touch interactions in your app.
Specify the silentOnTouch option to ensure VoiceOver is silent when a person interacts with
the direct touch area so your app can provide its own audio feedback. Specify the requires
Activation option to make the direct touch area require VoiceOver to activate the element
before touch passthrough happens.
Simplify how you maintain your UIKit accessibility code with block-based setters for accessibili
attributes.
Ensure robust testing of your app’s accessibility experience by performing accessibility audits
using XCUIApplication.
Assign automation elements to expose certain UI elements specifically for the purpose of
automation without affecting the accessibility of those elements.
Accelerate updates
Learn about important changes to Accelerate.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
See Also
Technology updates


## Page 4

AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.
Background Tasks updates
Learn about important changes in Background Tasks.


## Page 5

When you design for accessibility, you reach a larger audience and create a more inclusive
experience. An accessible interface allows people to experience your app or game regardless of
their capabilities or how they use their devices. Accessibility makes information and interactions
available to everyone. An accessible interface is:
Intuitive. Your interface uses familiar and consistent interactions that make tasks
straightforward to perform.
Perceivable. Your interface doesn’t rely on any single method to convey information. People
can access and interact with your content, whether they use sight, hearing, speech, or touch.
Adaptable. Your interface adapts to how people want to use their device, whether by
supporting system accessibility features or letting people personalize settings.
As you design your app, audit the accessibility of your interface. Use Accessibility Inspector to
highlight accessibility issues with your interface and to understand how your app represents
itself to people using system accessibility features. You can also communicate how accessible
your app is on the App Store using Accessibility Nutrition Labels. To learn more about how to
evaluate and indicate accessibility feature support, see Accessibility Nutrition Labels in App
Store Connect help.
Vision
Supported platforms
Accessibility
Vision
Hearing
Mobility
Speech
Cognitive
Platform considerations
Resources
Change log
Accessibility
Accessible user interfaces empower everyone to have a great
experience with your app or game.
Design
Overview
What’s New
Get Started
Guidelines
Resources


## Page 6

The people who use your interface may be blind, color blind, or have low vision or light
sensitivity. They may also be in situations where lighting conditions and screen brightness affect
their ability to interact with your interface.
Support larger text sizes. Make sure people can adjust the size of your text or icons to make
them more legible, visible, and comfortable to read. Ideally, give people the option to enlarge
text by at least 200 percent (or 140 percent in watchOS apps). Your interface can support font
size enlargement either through custom UI, or by adopting Dynamic Type. Dynamic Type is a
systemwide setting that lets people adjust the size of text for comfort and legibility. For more
guidance, see Supporting Dynamic Type.
Use recommended defaults for custom type sizes. Each platform has different default and
minimum sizes for system-defined type styles to promote readability. If you’re using custom
type styles, follow the recommended defaults.
Platform
Default size
Minimum size
iOS, iPadOS
17 pt
11 pt
macOS
13 pt
10 pt
tvOS
29 pt
23 pt
visionOS
17 pt
12 pt
watchOS
16 pt
12 pt
Bear in mind that font weight can also impact how easy text is to read. If you’re using a
custom font with a thin weight, aim for larger than the recommended sizes to increase legibility.
For more guidance, see Typography.
Thicker weights are easier to read for smaller font sizes.
Consider increasing the font size when using a thin
weight.
Strive to meet color contrast minimum standards. To ensure all information in your app is
legible, it’s important that there’s enough contrast between foreground text and icons and
background colors. Two popular standards of measure for color contrast are the Web Content
Accessibility Guidelines (WCAG) and the Accessible Perceptual Contrast Algorithm (APCA). Use
standard contrast calculators to ensure your UI meets acceptable levels. Accessibility Inspector
uses the following values from WCAG Level AA as guidance in determining whether your app’s
colors have an acceptable contrast.
Text size
Text weight
Minimum contrast ratio
Up to 17 pts
All
4.5:1


## Page 7

Text size
Text weight
Minimum contrast ratio
18 pts
All
3:1
All
Bold
3:1
If your app doesn’t provide this minimum contrast by default, ensure it at least provides a higher
contrast color scheme when the system setting Increase Contrast is turned on. If your app
supports Dark Mode, make sure to check the minimum contrast in both light and dark
appearances.
A button with insufficient color contrast
A button with sufficient color contrast
Prefer system-defined colors. These colors have their own accessible variants that
automatically adapt when people adjust their color preferences, such as enabling Increase
Contrast or toggling between the light and dark appearances. For guidance, see Color.
The systemRed default color in iOS
The systemRed accessible color in iOS
Convey information with more than color alone. Some people have trouble differentiating
between certain colors and shades. For example, people who are color blind may have particular
difficulty with pairings such as red-green and blue-orange. Offer visual indicators, like distinct
shapes or icons, in addition to color to help people perceive differences in function and changes
in state. Consider allowing people to customize color schemes such as chart colors or game
characters so they can personalize your interface in a way that’s comfortable for them.
For someone with red-green color blindness, these
indicators might appear the same.
Both visual indicators and color help differentiate
between indicators.
Describe your app’s interface and content for VoiceOver. VoiceOver is a screen reader that
lets people experience your app’s interface without needing to see the screen. For more
guidance, see VoiceOver.


## Page 8

The people who use your interface may be deaf or hard of hearing. They may also be in noisy or
public environments.
Support text-based ways to enjoy audio and video. It’s important that dialogue and crucial
information about your app or game isn’t communicated through audio alone. Depending on the
context, give people different text-based ways to experience their media, and allow people to
customize the visual presentation of that text:
Captions give people the textual equivalent of audible information in video or audio-only
content. Captions are great for scenarios like game cutscenes and video clips where text
synchronizes live with the media.
Subtitles allow people to read live onscreen dialogue in their preferred language. Subtitles are
great for TV shows and movies.
Audio descriptions are interspersed between natural pauses in the main audio of a video and
supply spoken narration of important information that’s presented only visually.
Transcripts provide a complete textual description of a video, covering both audible and
visual information. Transcripts are great for longer-form media like podcasts and audiobooks
where people may want to review content as a whole or highlight the transcript as media is
playing.
For developer guidance, see Selecting subtitles and alternative audio tracks.
Use haptics in addition to audio cues. If your interface conveys information through audio cues
— such as a success chime, error sound, or game feedback — consider pairing that sound with
matching haptics for people who can’t perceive the audio or have their audio turned off. In iOS
and iPadOS, you can also use Music Haptics and Audio graphs to let people experience music
and infographics through vibration and texture. For guidance, see Playing haptics.
Augment audio cues with visual cues. This is especially important for games and spatial apps
where important content might be taking place off screen. When using audio to guide people
towards a specific action, also add in visual indicators that point to where you want people to
interact.
Ensure your interface offers a comfortable experience for people with limited dexterity or
mobility.
Offer sufficiently sized controls. Controls that are too small are hard for many people to
interact with and select. Strive to meet the recommended minimum control size for each
platform to ensure controls and menus are comfortable for all when tapping and clicking.
Hearing
Mobility


## Page 9

Platform
Default control size
Minimum control size
iOS, iPadOS
44x44 pt
28x28 pt
macOS
28x28 pt
20x20 pt
tvOS
66x66 pt
56x56 pt
visionOS
60x60 pt
28x28 pt
watchOS
44x44 pt
28x28 pt
Consider spacing between controls as important as size. Include enough padding between
elements to reduce the chance that someone taps the wrong control. In general, it works well to
add about 12 points of padding around elements that include a bezel. For elements without a
bezel, about 24 points of padding works well around the element’s visible edges.
Elements with insufficient padding
Elements with sufficient padding
Support simple gestures for common interactions. For many people, with or without
disabilities, complex gestures can be challenging. For interactions people do frequently in your
app or game, use the simplest gesture possible — avoid custom multifinger and multihand
gestures — so repetitive actions are both comfortable and easy to remember.
Offer alternatives to gestures. Make sure your UI’s core functionality is accessible through
more than one type of physical interaction. Gestures can be less comfortable for people who
have limited dexterity, so offer onscreen ways to achieve the same outcome. For example, if you
use a swipe gesture to dismiss a view, also make a button available so people can tap or use an
assistive device.
Edit and tap to delete
Swipe to delete
Let people use Voice Control to give guidance and enter information verbally. With Voice
Control, people can interact with their devices entirely by speaking commands. They can
perform gestures, interact with screen elements, dictate and edit text, and more. To ensure a
smooth experience, label interface elements appropriately. For developer guidance, see Voice
Control.
Integrate with Siri and Shortcuts to let people perform tasks using voice alone. When your
app supports Siri and Shortcuts, people can automate the important and repetitive tasks they
perform regularly. They can initiate these tasks from Siri, the Action button on their iPhone or
Apple Watch, and shortcuts on their Home Screen or in Control Center. For guidance, see Siri.
Support mobility-related assistive technologies. Features like VoiceOver, AssistiveTouch, Full
Keyboard Access, Pointer Control, and Switch Control offer alternative ways for people with low
mobility to interact with their devices. Conduct testing and verify that your app or game
supports these technologies, and that your interface elements are appropriately labeled to
ensure a great experience. For more information, see Performing accessibility testing for your
app.
Speech


## Page 10

Apple’s accessibility features help people with speech disabilities and people who prefer text-
based interactions to communicate effectively using their devices.
Let people use the keyboard alone to navigate and interact with your app. People can turn on
Full Keyboard Access to navigate apps using their physical keyboard. The system also defines
accessibility keyboard shortcuts and a wide range of other keyboard shortcuts that many people
use all the time. Avoid overriding system-defined keyboard shortcuts and evaluate your app to
ensure it works well with Full Keyboard Access. For additional guidance, see Keyboards. For
developer guidance, see Support Full Keyboard Access in your iOS app.
Support Switch Control. Switch Control is an assistive technology that lets people control their
devices through separate hardware, game controllers, or sounds such as a click or a pop. People
can perform actions like selecting, tapping, typing, and drawing when your app or game
supports the ability to navigate using Switch Control. For developer guidance, see Switch
Control.
When you minimize complexity in your app or game, all people benefit.
Keep actions simple and intuitive. Ensure that people can navigate your interface using easy-
to-remember and consistent interactions. Prefer system gestures and behaviors people are
already familiar with over creating custom gestures people must learn and retain.
Minimize use of time-boxed interface elements. Views and controls that auto-dismiss on a
timer can be problematic for people who need longer to process information, and for people who
use assistive technologies that require more time to traverse the interface. Prefer dismissing
views with an explicit action.
Consider offering difficulty accommodations in games. Everyone has their own way of playing
and enjoying games. To support a variety of cognitive abilities, consider adding the ability to
customize the difficulty level of your game, such as offering options for people to reduce the
criteria for successfully completing a level, adjust reaction time, or enable control assistance.
Let people control audio and video playback. Avoid autoplaying audio and video content
without also providing controls to start and stop it. Make sure these controls are discoverable
and easy to act upon, and consider global settings that let people opt out of auto-playing all
audio and video. For developer guidance, see Animated images and isVideoAutoplay
Enabled.
Allow people to opt out of flashing lights in video playback. People might want to avoid bright,
frequent flashes of light in the media they consume. A Dim Flashing Lights setting allows the
system to calculate, mitigate, and inform people about flashing lights in a piece of media. If your
app supports video playback, ensure that it responds appropriately to the Dim Flashing Lights
setting. For developer guidance, see Flashing lights.
Be cautious with fast-moving and blinking animations. When you use these effects in excess,
it can be distracting, cause dizziness, and in some cases even result in epileptic episodes.
People who are prone to these effects can turn on the Reduce Motion accessibility setting.
When this setting is active, ensure your app or game responds by reducing automatic and
repetitive animations, including zooming, scaling, and peripheral motion. Other best practices
for reducing motion include:
Tightening animation springs to reduce bounce effects
Tracking animations directly with people’s gestures
Avoiding animating depth changes in z-axis layers
Cognitive


## Page 11

Replacing transitions in x-, y-, and z-axes with fades to avoid motion
Avoiding animating into and out of blurs
Optimize your app’s UI for Assistive Access. Assistive Access is an accessibility feature in iOS
and iPadOS that allows people with cognitive disabilities to use a streamlined version of your
app. Assistive Access sets a default layout and control presentation for apps that reduces
cognitive load, such as the following layout of the Camera app.
To optimize your app for this mode, use the following guidelines when Assistive Access is turned
on:
Identify the core functionality of your app and consider removing noncritical workflows and UI
elements.
Break up multistep workflows so people can focus on a single interaction per screen.
Always ask for confirmation twice whenever people perform an action that’s difficult to
recover from, such a deleting a file.
For developer guidance, see Assistive Access.
No additional considerations for iOS, iPadOS, macOS, tvOS, or watchOS.
visionOS offers a variety of accessibility features people can use to interact with their
surroundings in ways that are comfortable and work best for them, including head and hand
Pointer Control, and a Zoom feature.
Platform considerations
visionOS


## Page 12

Prioritize comfort. The immersive nature of visionOS means that interfaces, animations, and
interactions have a greater chance of causing motion sickness, and visual and ergonomic
discomfort for people. To ensure the most comfortable experience, consider these tips:
Keep interface elements within a person’s field of view. Prefer horizontal layouts to vertical
ones that might cause neck strain, and avoid demanding the viewer’s attention in different
locations in quick succession.
Reduce the speed and intensity of animated objects, particularly in someone’s peripheral
vision.
Be gentle with camera and video motion, and avoid situations where someone may feel like
the world around them is moving without their control.
Avoid anchoring content to the wearer’s head, which may make them feel stuck and confined,
and also prevent them from using assistive technologies like Pointer Control.
Minimize the need for large and repetitive gestures, as these can become tiresome and may
be difficult depending on a person’s surroundings.
For additional guidance, see Create accessible spatial experiences and Design considerations
for vision and motion.
Inclusion
Typography
VoiceOver
Building accessible apps
Accessibility framework
Pointer Control (head)
Zoom
Play
Resources
Related
Developer documentation
Pointer Control (hand)


## Page 13

Overview of Accessibility Nutrition Labels
Date
Changes
June 9, 2025
Added guidance and links for Assistive Access, Switch
Control, and Accessibility Nutrition Labels.
March 7, 2025
Expanded and refined all guidance. Moved Dynamic
Type guidance to the Typography page, and moved
VoiceOver guidance to a new VoiceOver page.
June 10, 2024
Added a link to Apple’s Unity plug-ins for supporting
Dynamic Type.
December 5, 2023
Updated visionOS Zoom lens artwork.
June 21, 2023
Updated to include guidance for visionOS.
Videos
Principles of inclusive app
design
Evaluate your app for
Accessibility Nutrition Labels
Catch up on accessibility in
SwiftUI
Change log


## Page 14

It’s always a good idea to experience your app from the perspective of the people using it. When
you test your app from the user’s perspective, make sure you also test with different accessibility
settings and assistive technologies like VoiceOver, Voice Control, and Switch Control so you can
experience the app in the same way as people who rely on these features. Testing your app with
accessibility settings reveals which tasks are possible to complete, which elements are accessible
and which aren’t, and whether your navigation is clear and logical for every use case.
Before you begin accessibility testing, compile a list of the main tasks that a person can perform o
each screen in your app. For example, a to-do list app might contain several screens with one or
more possible tasks as described in the following list.
First launch experience
Overview
Identify the main tasks in your app
Accessibility / Performing accessibility testing for your app
Article
Performing accessibility testing for your
app
Test your app with accessibility settings and assistive technologies to discover an
address accessibility issues.


## Page 15

The user may need to complete or opt out of an onboarding flow.
Login screen
The user may need to choose a login service, enter a username and password, interact with a
login button, request a password reset, or enter information to create a new account.
Empty to-do list
The user may need to create a new task, or open app settings.
To-do list with tasks
The user may need to mark a task as complete, undo marking a task as complete, or create a
new task.
New task screen
The user may need to enter information about the task, save the task to the list, or exit the
screen without saving the task.
Settings screen
The user may need to adjust app settings, or exit the screen without changing anything.
After you identify your app’s main tasks, choose which devices, accessibility settings, and assistiv
technologies to test those tasks with.
It’s recommended to test your app on each type of device your app supports (for example, iPhone
iPad, and Mac). Testing on each of those devices lets you experience the app in the same way as 
person who downloads and installs it. Testing on device can also highlight subtle differences in
your app’s user experience across platforms.
After you prepare your devices for testing, identify which accessibility features to test. As a startin
point, it’s recommended that you test your app for the following accessibility categories, although
you’re encouraged to test with additional settings and technologies if you can:
Visual accessibility for accessibility settings related to color, text, motion, and more
Media accessibility for accessibility settings related to captions, audio descriptions, audio
transcripts, and more
Assistive technologies such as VoiceOver, Voice Control, Switch Control, and more
The following sections describe how to test your app for visual accessibility, media accessibility,
and several key assistive technologies.
To test with accessibility settings, turn on each of the following accessibility features in Settings >
Accessibility, one at a time. Work through your testing matrix by completing the main tasks in you
app while each accessibility setting is on.
Create an accessibility testing matrix
Test with accessibility settings


## Page 16

To test with assistive technologies, set up and turn on each of the following assistive technologies
one at a time. Work through your testing matrix by completing the main tasks in your app using on
that assistive technology.
Media accessibility
Display & Text Size > Bold Text
Display & Text Size > Larger Text > Larger Accessibility Sizes
Display & Text Size > Button Shapes
Display & Text Size > On/Off Labels
Display & Text Size > Reduce Transparency
Display & Text Size > Increase Contrast
Display & Text Size > Differentiate Without Color
Display & Text Size > Color Filters > Red/Green Filter, Green/Red Filter, Blue/Yellow Filter
Motion > Reduce Motion
Motion > Dim Flashing Lights
Test with assistive technologies
Voice Control
Switch Control
Assistive Access
Install your app on a physical device, since VoiceOver isn’t available on Simulator.
Learn how to turn VoiceOver off so you can exit it after testing. For example, in iOS, you can se
up Accessibility Shortcut to turn VoiceOver on and off. In macOS, you can press Command-F5.
Adjust your device volume to an appropriate level.
Navigate to Settings > Accessibility > VoiceOver, and turn on VoiceOver.
Adjust the Speaking Rate slider to an appropriate speaking pace.
If you provide hints for any accessible elements in your app, make sure the Verbosity > Speak
Hints setting is on.
With VoiceOver on, use VoiceOver gestures to navigate your app. Although you don’t need to
become an expert VoiceOver user to test your app with it, you do need to know several key
gestures, which have slight variations across platforms. For example, the following gestures apply
to devices with touchscreen and trackpad input.
Visual accessibility
VoiceOver


## Page 17

As you test your app’s workflows, make sure your app continues to provide a good user experienc
while accessibility settings and assistive technologies are on. Check that you can access every
element and that the ordering of those elements is what you intend. Make note when you find it
difficult to perform a task. Confirm that your UI adjusts appropriately when the system font size,
color filter, or other visual settings change to something other than the default. You can use the
following list as a starting point for ensuring that your app provides a good experience in various
accessibility categories.
Gesture
Action
Tap
Select and speak an item.
Swipe right or left
Select the next or previous item.
Double tap
Select and speak an item.
Two-finger tap
Pause or continue speaking.
Two-finger swipe up
Speak the entire screen from the top.
Three-finger triple tap
Turn the screen curtain on or off.
To begin testing, turn on the screen curtain to replicate the experience of someone who is solely
relying on VoiceOver. When the screen curtain is on, the screen contents are active even though
the display is black and appears to be turned off.
Tip
A great place to practice VoiceOver gestures is in the VoiceOver Practice area in Settings >
Accessibility > VoiceOver. VoiceOver needs to be on for the VoiceOver Practice button to
appear.
To learn more about VoiceOver gestures, read the platform-specific user guides listed in
VoiceOver.
Diagnose and address accessibility issues
Media accessibility
VoiceOver
Voice Control
Switch Control
A user with low vision can perceive all UI elements, images, and text in your app.
Your app doesn’t use color alone to convey information.
Visual accessibility


## Page 18

Take notes about any issues as you discover them so you can address them in your app’s design
and implementation. If you encounter accessibility issues that you aren’t able to troubleshoot whi
testing on the device, try using Accessibility Inspector to help diagnose and resolve issues. You c
also automate accessibility testing by adding accessibility audits in your UI tests, as described in
Perform accessibility audits for your app.
Address accessibility issues that you discover during testing so that you’re able to successfully
complete all the tasks in your app when accessibility settings and assistive technologies are on.
Accessibility updates
Learn about important changes to Accessibility.
Accessibility
Accessible user interfaces empower everyone to have a great experience with your app or
game.
Your app uses sufficient contrast for important UI elements.
Your app responds to Dynamic Type accessibility text sizes by reflowing its layout, avoiding tex
truncation, and making sure UI elements don’t overlap for larger sizes.
Your app responds to the Increase Contrast accessibility setting by increasing color contrast
between background and foreground elements.
Your app responds to the Button Shapes accessibility setting to indicate where button controls
exist.
Your app responds to the Reduce Motion accessibility setting by reducing excessive motion
where appropriate.
Your app responds to the Dim Flashing Lights accessibility setting by reducing flickering in the 
or videos.
See Also
Essentials


