# 000_Playing a Custom Haptic Pattern from a File.pdf

## Page 1

This app, HapticSampler, describes how to load files formatted as Apple Haptic Audio Pattern
(AHAP). AHAP files are JSON-compliant dictionary representations of haptic and audio patterns
that you can compose in a text editor, or any program that exports content in the JSON format.
The user interface, defined in Main.storyboard, consists of eight buttons, each of which loads
and plays a different haptic pattern. AHAP files for eight custom patterns are bundled in the Xcod
project. For example, the Sparkle.ahap file defines a haptic pattern with the following intensity and
sharpness variations:
Overview
Core Haptics / Playing a Custom Haptic Pattern from a File
Sample Code
Playing a Custom Haptic Pattern from a
File
Sample predesigned Apple Haptic Audio Pattern files, and learn how to play your
own.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 13.3+


## Page 2

You can examine and modify the AHAP file parameters in Xcode or a text editor.
Note
HapticSampler requires Xcode 11 or later. Simulator doesn’t support a haptic interface, so build
and run this sample on an iPhone 8, 8 Plus, X, XR, XS, or XS Max running iOS 13 or later.
HapticSampler checks for device compatibility and sets up an instance of CHHapticEngine on
launch.
See Preparing your app to play haptics for more information about setting up the engine.
All AHAPs in the sample are included in the app bundle, so build a URL to the desired file by
searching in the main bundle, as you might do for other included assets like audio files.
Tap one of the buttons in the app to load the AHAP file associated with that button. Because the
engine may not be started at that time, the app starts the engine as soon as a button is tapped.
Configure the App to Play Haptics
Start the Haptic Engine


## Page 3

Assuming the engine has started, call the engine’s method, playPattern(from:), passing it th
URL to playing the file.
This method of playback follows a fire and forget model; each haptic pattern plays until it reaches
its end, then stops automatically.
Once the haptic starts playing, you can’t stop it, and pressing other buttons layers those haptics o
top of any existing haptic patterns in the middle of playback. This layering allows you to combine 
haptic pattern with a more continuous intent, like the rumble of thunder, with a more impulse-
driven haptic pattern built from transient taps, like the strike of lightning.
Core Haptics layers simultaneously playing haptics automatically. If you don’t want the layering,
your app should wait out the duration of the first haptic before starting subsequent haptic players
Note
Haptic patterns don’t blend like audio waveforms, and not all combinations produce a
discernible effect. Playing two haptic events of the same type at the same time makes them
hard to tell apart. Experiment with various combinations to ensure that the result feels right.
To have more granular control over individual haptics, such as configuring their pausing, resuming
and seeking behavior, create and maintain advanced pattern players using CHHapticAdvanced
PatternPlayer instead of using playPattern(from:).
To compose your own haptic pattern, begin by modifying one of the AHAP files included in the
project. You can copy components of it for producing a transient haptic pattern or a continuous
haptic pattern, then build your own haptic by combining and modifying those pieces.
Alternatively, you can write an AHAP file from scratch in a text editor, using the example AHAP file
as a reference for proper nesting of event, pattern, and parameter dictionaries. For more
Play the AHAP
Create Advanced Pattern Players for More Granular Control
Compose Your Own Haptic


## Page 4

information about the AHAP file format and the parameter keys that the format supports, see
Representing Haptic Patterns in AHAP Files.
Representing haptic patterns in AHAP files
Understand the Apple Haptic and Audio Pattern (AHAP) file format.
See Also
File-based haptics


