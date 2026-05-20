# 001_AppKit updates.pdf

## Page 1

Browse notable changes in AppKit.
To use control metrics consistent with macOS 15 and earlier, use prefersCompactControl
SizeMetrics.
NSControl.ControlSize includes a new extra large size, NSControl.ControlSize
.extraLarge.
Provide seamless immersive visuals by using NSBackgroundExtensionView to extend a
view’s content under sidebars and inspectors.
Apply Liquid Glass effects to your custom views using NSGlassEffectView. Use NSGlass
EffectContainerView to efficiently merge these views when they’re in proximity to one
other.
Configure buttons for Liquid Glass by setting NSButton.BezelStyle to NSButton.Bezel
Style.glass.
Add top and bottom accessory views in split views by adding one or more NSSplitViewItem
AccessoryViewController objects to the topAlignedAccessoryViewControllers
and bottomAlignedAccessoryViewControllers properties.
Overview
June 2025
General
Split views
Updates / AppKit updates
Article
AppKit updates
Learn about important changes to AppKit.


## Page 2

Tint toolbar items to make them stand out and stand apart from other toolbar items by setting
NSToolbarItem.Style to NSToolbarItem.Style.prominent, and setting backgroun
TintColor.
Prepare your app for an upcoming feature in macOS that alerts a person using a device when
your app programmatically reads the general pasteboard. The system shows the alert only if th
pasteboard access wasn’t a result of someone’s input on a UI element that the system conside
paste-related. This behavior is similar to how UIPasteboard behaves in iOS. New detect
methods in NSPasteboard and NSPasteboardItem make it possible for an app to examine
the kinds of data on the pasteboard without actually reading them and showing the alert.
NSPasteboard also adds an accessBehavior property to determine if programmatic
pasteboard access is always allowed, never allowed, or if it prompts an alert requesting
permission. You can adopt these APIs ahead of the change, and set a user default to test the
new behavior on your Mac. To do so, launch Terminal and enter the command defaults
write <your_app_bundle_id> EnablePasteboardPrivacyDeveloperPreview -
bool yes to enable the behavior for your app.
Organize your windows’ display and layout with window tiling.
Use SwiftUI menus in AppKit with the NSHostingMenu.
Animate AppKit views using SwiftUI animations using animate(_:changes:completion:)
Use the keyboard to open context menus for UI elements on which you are focused currently.
Add repeat, wiggle, bounce, and rotate effects to SF Symbols.
Leverage predefined content types when saving files using the new format picker on NSPanel
Toolbars
April 2025
macOS pasteboard privacy
June 2024
General
Swift and SwiftUI
API refinements


## Page 3

Resize frames and zoom in and out with new NSCursor APIs such as NSCursor.Frame
ResizeDirection and NSCursor.FrameResizePosition.
Control whether your toolbars display text as well as icons using the allowsDisplayMode
Customization property.
Offer customized type-ahead suggestions in NSTextField using the suggestionsDelegate.
Use the new userCanChangeVisibilityOf delegate method on NSTableView to toggle
the visibility of table columns.
Use a new NSProgressIndicator property to observe progress of an ongoing task.
Simplify how you display and style buttons with the new .automatic bezel style. This bezel
style adapts to the most appropriate style based on the contents of the button, as well as its
location in the view hierarchy.
Display additional contextual information about currently selected documents with NSSplit
View inspectors.
New improvements to NSPopover enable you to anchor popovers from toolbar items, as well a
support full-size popovers.
Explore new UI elements in NSMenu. Group information more easily in section headers, lay out
menu items in horizontal palettes, as well as display badge counts on menu items.
App activation is now driven by the user, preventing unexpected switches between apps.
Take advantage of Cooperative Activation, where your apps can yield and accept activation fro
other apps on the system without interrupting the user’s workflows. For more information, see
the activate() function on NSApp and NSRunningApplication.
CGPath and NSBezierPath are now interoperable. You can create a CGPath from a
NSBezierPath and vice versa.
Leverage CADisplayLink to synchronize your app’s ability to draw to the refresh of the
display.
June 2023
Views and controls
Cooperative app activation
Graphics


## Page 4

Create consistent, great visuals for your controls by taking advantage of standard system fill
NSColor (.systemFill, .secondarySystemFill, .tertiarySystemFill,
.quaternarySystemFill, and .quinarySystemFill).
Views no longer clip their contents by default. This includes any drawing done by the view and
its subviews. For more information, see the clipsToBounds property on NSView.
Animate symbol images with the new addSymbolEffect function on NSImageView. Symbo
effects include: bounce, pulse, variable color, scale, appear, disappear, and replace.
Display and manipulate high dynamic range (HDR) images.
AppKit more fully integrates with Swift and SwiftUI with Sendable (NSColor, NSColorSpace,
NSGradient, NSShadow, NSTouch) and Transferable (NSImage, NSColor, NSSound) types
Preview your views and view controllers alongside your code using the new #Preview Swift
macro. Incrementally adopt SwiftUI into your AppKit life cycle by leveraging modifiers like toolb
and navigation title on NSWindows.
Simplify your code with new attributes, @ViewLoading and @WindowLoading, to help with
view and window loading.
Help people enter text more effectively with the NSTextInsertionIndicator that adapts t
the current accent color of the app. Cursor accessories also help users visualize where and how
to enter text.
Simplify NSTextField entry by leveraging the new .contentType AutoFill feature, making i
more convenient to enter types such as contact information, birthdays, names, credit cards, an
street addresses.
Adopt text styles like .body, largeTitle, and headline on NSFont.preferredFont to
take advantage of enhancements to the font system, like improved hyphenation for non-Englis
languages and dynamic line-height adjustments for languages that require more vertical space
Access localized variants of symbol images by specifying a locale.
Related sessions from WWDC23
Session 10054: What’s new in AppKit
Swift and SwiftUI
Text improvements
See Also


## Page 5

Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
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
Technology updates


## Page 6

Learn about important changes to AVFoundation.
Background Tasks updates
Learn about important changes in Background Tasks.


