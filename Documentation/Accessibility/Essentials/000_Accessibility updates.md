# 000_Accessibility updates.pdf

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


