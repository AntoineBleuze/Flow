# Essentials.pdf

## Page 1

If you have an existing app, adopting Liquid Glass doesn’t mean reinventing your app from the
ground up. Start by building your app in the latest version of Xcode to see the changes. As you
review your app, use the following sections to understand the scope of changes and learn how yo
can adopt these best practices in your interface.
If your app uses standard components from SwiftUI, UIKit, or AppKit, your interface picks up the
latest look and feel on the latest platform releases for iOS, iPadOS, macOS, tvOS, and watchOS. I
Xcode, build your app with the latest SDKs, and run it on the latest platform releases to see the
changes in your interface.
Overview
See your app with Liquid Glass
Technology Overviews
/ Liquid Glass / Adopting Liquid Glass
Adopting Liquid Glass
Find out how to bring the new material to your app.
/


## Page 2

Interfaces across Apple platforms feature a new dynamic material called Liquid Glass, which
combines the optical properties of glass with a sense of fluidity. This material forms a distinct
functional layer for controls and navigation elements. It affects how the interface looks, feels, and
moves, adapting in response to a variety of factors to help bring focus to the underlying content.
Leverage system frameworks to adopt Liquid Glass automatically. In system frameworks,
standard components like bars, sheets, popovers, and controls automatically adopt this material.
System frameworks also dynamically adapt these components in response to factors like element
overlap and focus state. Take advantage of this material with minimal code by using standard
components from SwiftUI, UIKit, and AppKit.
Reduce your use of custom backgrounds in controls and navigation elements. Any custom
backgrounds and appearances you use in these elements might overlay or interfere with Liquid
Glass or other effects that the system provides, such as the scroll edge effect. Make sure to chec
any custom backgrounds in elements like split views, tab bars, and toolbars. Prefer to remove
custom effects and let the system determine the background appearance, especially for the
following elements:
Test your interface with accessibility settings. Translucency and fluid morphing animations
contribute to the look and feel of Liquid Glass, but can adapt to people’s needs. For example,
people might turn on accessibility settings that reduce transparency or motion in the interface,
which can remove or modify certain effects. If you use standard components from system
frameworks, this experience adapts automatically. Ensure your custom elements and animations
provide a good fallback experience when these settings are on as well.
Avoid overusing Liquid Glass effects. If you apply Liquid Glass effects to a custom control, do so
sparingly. Liquid Glass seeks to bring attention to the underlying content, and overusing this
material in multiple custom controls can provide a subpar user experience by distracting from tha
content. Limit these effects to the most important functional elements in your app. To learn more,
read Applying Liquid Glass to custom views.
Visual refresh
UIKit
AppKit
NavigationStack
NavigationSplitView
titleBar
toolbar(content:)
UIKit
AppKit
glassEffect(_:in:)
SwiftUI
SwiftUI


## Page 3

App icons take on a design that’s dynamic and expressive. Updates to the icon grid result in a
standardized iconography that’s visually consistent across devices and concentric with hardware
and other elements across the system. App icons now contain layers, which dynamically respond 
lighting and other visual effects the system provides. iOS, iPadOS, and macOS all now offer defau
(light), dark, clear, and tinted appearance variants, empowering people to personalize the look an
feel of their Home Screen.
Reimagine your app icon for Liquid Glass. Apply key design principles to help your app icon shin
Provide a visually consistent, optically balanced design across the platforms your app supports
Consider a simplified design comprised of solid, filled, overlapping semi-transparent shapes.
Let the system handle applying masking, blurring, and other visual effects, rather than factorin
them into your design.
Podcasts icon in iOS 18
Reimagined layered Podcasts icon
App icons


## Page 4

Reimagined layered Podcasts ico
with system effects applied
Design using layers. The system automatically applies effects like reflection, refraction, shadow,
blur, and highlights to your icon layers. Determine which elements of your design make sense as
foreground, middle, and background elements, then define separate layers for them. You can
perform this task in the design app of your choice.
Compose and preview in Icon Composer. Drag and drop app icon layers that you export from yo
design app directly into the Icon Composer app. Icon Composer lets you add a background, creat
layer groupings, adjust layer attributes like opacity, and preview your design with system effects
and appearances. Icon Composer is available in the latest version of Xcode and for download from
Apple Design Resources. To learn more, read Creating your app icon using Icon Composer.
Preview against the updated grids. The system applies masking to produce your final icon shape
— rounded rectangle for iOS, iPadOS, and macOS, and circular for watchOS. Keep elements
centered to avoid clipping. Irregularly shaped icons receive a system-provided background. See
how your app icon looks with the updated grids to determine whether you need to make
adjustments. Download these grids from Apple Design Resources.
Controls have a refreshed look across platforms, and come to life when a person interacts with
them. For controls like sliders and toggles, the knob transforms into Liquid Glass during interactio
Controls


## Page 5

and buttons fluidly morph into menus and popovers. The shape of the hardware informs the
curvature of controls, so many controls adopt rounder forms to elegantly nestle into the corners o
windows and displays. Controls also feature an option for an extra-large size, allowing more space
for labels and accents.
Play
Slider
Play
Segmented control
Review updates to control appearance and dimensions. If you use standard controls from syste
frameworks and don’t hard-code their layout metrics, your app adopts changes to shapes and
sizes automatically when you rebuild your app with the latest version of Xcode. Review changes t
the following controls and any others and make sure they continue to look at home with the rest o
your interface:
Review your use of color in controls. Be judicious with your use of color in controls and navigatio
so they stay legible. If you do apply color to these elements, leverage system colors to
automatically adapt to light and dark contexts.
Check for crowding or overlapping of controls. Prefer to use standard spacing metrics instead o
overriding them, and avoid overcrowding or layering Liquid Glass elements on top of each other.
Optimize for legibility when content scrolls beneath controls. Scroll views offer a scroll edge
effect that helps maintain sufficient legibility and contrast for controls by obscuring content that
scrolls beneath them. System bars like toolbars adopt this behavior by default. If you use a custom
bar with elements like controls, text, or icons that have content scrolling beneath them, you can
register those views to use a scroll edge effect with these APIs:
UIKit
AppKit
Button
Toggle
Slider
Stepper
Picker
TextField
UIKit
safeAreaBar(edge:alignment:spacing:content:)
SwiftUI
SwiftUI


## Page 6

Consider aligning the shape of controls with other rounded elements throughout the interface
Across Apple platforms, the shape of the hardware informs the curvature, size, and shape of
nested interface elements, including controls, sheets, popovers, windows, and more. Help mainta
a sense of visual continuity in your interface by using rounded shapes that are concentric to their
containers using these APIs:
Leverage new button styles. Instead of creating buttons with custom Liquid Glass effects, you ca
adopt the look and feel of the material with minimal code by using one of the following button sty
APIs:
Liquid Glass applies to the topmost layer of the interface, where you define your navigation. Key
navigation elements like tab bars and sidebars float in this Liquid Glass layer to help people focus
on the underlying content.
UIKit
rect(corners:isUniform:)
ConcentricRectangle
UIKit
AppKit
glass
glassProminent
glass(_:)
Navigation
SwiftUI
SwiftUI


## Page 7

Before
After
Establish a clear navigation hierarchy. It’s more important than ever for your app to have a clear
and consistent navigation structure that’s distinct from the content you provide. Ensure that you
clearly separate your content from navigation elements, like tab bars and sidebars, to establish a
distinct functional layer above the content layer.
Consider adapting your tab bar into a sidebar automatically. If your app uses a tab-based
navigation, you can allow the tab bar to adapt into a sidebar depending on the context by using th
following APIs:
Consider using split views to build sidebar layouts with an inspector panel. Split views are
optimized to create a consistent and familiar experience for sidebar and inspector layouts across
platforms. You can use the following standard system APIs for split views to build these types of
layouts with minimal code:
Check content safe areas for sidebars and inspectors. If you have these types of components i
your app’s navigation structure, audit the safe area compatibility of content next to the sidebar an
inspector to help make sure underlying content is peeking through appropriately.
Extend content beneath sidebars and inspectors. A background extension effect creates a sens
of extending a background under a sidebar or inspector, without actually scrolling or placing
content under it. A background extension effect mirrors the adjacent content to give the impressi
of stretching it under the sidebar, and applies a blur to maintain legibility of the sidebar or
inspector. This effect is perfect for creating a full, edge-to-edge content experience in apps that
use split views, such as for hero images on product pages.
Without background extension effect
With background extension effect
UIKit
sidebarAdaptable
UIKit
AppKit
NavigationSplitView
inspector(isPresented:content:)
UIKit
AppKit
backgroundExtensionEffect()
SwiftUI
SwiftUI
SwiftUI


## Page 8

Choose whether to automatically minimize your tab bar in iOS. Tab bars can help elevate the
underlying content by receding when a person scrolls up or down. You can opt into this behavior
and configure the tab bar to minimize when a person scrolls down or up. The tab bar expands wh
a person scrolls in the opposite direction.
Menus have a refreshed look across platforms. They adopt Liquid Glass, and menu items for
common actions use icons to help people quickly scan and identify those actions. New to iPadOS
apps also have a menu bar for faster access to common commands.
Adopt standard icons in menu items. For menu items that perform standard actions like Cut,
Copy, and Paste, the system uses the menu item’s selector to determine which icon to apply. To
adopt icons in those menu items with minimal code, make sure to use standard selectors.
Match top menu actions to swipe actions. For consistency and predictability, make sure the
actions you surface at the top of your contextual menu match the swipe actions you provide for th
same item.
Toolbars take on a Liquid Glass appearance, and provide a grouping mechanism for toolbar items
letting you choose which actions to display together.
Before
After
Determine which toolbar items to group together. Group items that perform similar actions or
affect the same part of the interface, and maintain consistent groupings and placement across
platforms.
Incorrect
Correct
You can create a fixed spacer to separate items that share a background using these APIs:
UIKit
Menus and toolbars
UIKit
AppKit
SwiftUI
SwiftUI


## Page 9

Find icons to represent common actions. Consider representing common actions in toolbars wit
standard icons instead of text. This approach helps declutter the interface and increase the ease 
use for common actions. For consistency, don’t mix text and icons across items that share a
background.
Provide an accessibility label for every icon. Regardless of what you show in the interface, alway
specify an accessibility label for each icon. This way, people who prefer a text label can opt into th
information by turning on accessibility features like VoiceOver or Voice Control.
Audit toolbar customizations. Review anything custom you do to display items in your toolbars,
like your use of fixed spacers or custom items, as these can appear inconsistent with system
behavior.
Check how you hide toolbar items. If you see an empty toolbar item without any content, your ap
might be hiding the view in the toolbar item instead of the item itself. Instead, hide the entire
toolbar item, using these APIs:
Windows adopt rounder corners to fit controls and navigation elements. In iPadOS, apps show
window controls and support continuous window resizing. Instead of transitioning between specif
preset sizes, windows resize fluidly down to a minimum size.
Support arbitrary window sizes. Allow people to resize their window to the width and height that
works for them, and adjust your content accordingly.
Use split views to allow fluid resizing of columns. To support continuous window resizing, split
views automatically reflow content for every size using beautiful, fluid transitions. Make sure to us
standard system APIs for split views to get these animations with minimal code:
fixed
ToolbarSpacer
UIKit
AppKit
hidden(_:)
Windows and modals
UIKit
AppKit
NavigationSplitView
SwiftUI
SwiftUI


## Page 10

Use layout guides and safe areas. Make sure you specify safe areas for your content so the
system can automatically adjust the window controls and title bar in relation to your content.
Modal views like sheets and action sheets adopt Liquid Glass. Sheets feature an increased corner
radius, and half sheets are inset from the edge of the display to allow content to peek through fro
beneath them. When a half sheet expands to full height, it transitions to a more opaque appearan
to help maintain focus on the task.
Check the content around the edges of sheets. Inside the sheet, check for content and controls
that might appear too close to rounder sheet corners. Outside the sheet, check that any content
peeking through between the inset sheet and display edge looks as you expect.
Audit the backgrounds of sheets and popovers. Check whether you add a visual effect view to
your popover’s content view, and remove those custom background views to provide a consistent
experience with other sheets across the system.
An action sheet originates from the element that initiates the action, instead of from the bottom
edge of the display. When active, an action sheet also lets people interact with other parts of the
interface.
Specify the source of an action sheet. Position an action sheet’s anchor next to the control it
originates from. Make sure to set the source view or item to indicate where to originate the action
sheet and create the inline appearance.
Style updates to list-based layouts help you organize and showcase your content so it can shine
through the Liquid Glass layer. To give content room to breathe, organizational components like
lists, tables, and forms have a larger row height and padding. Sections have an increased corner
radius to match the curvature of controls across the system.
UIKit
AppKit
confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)
Organization and layout
SwiftUI


## Page 11

Before
After
Check capitalization in section headers. Lists, tables, and forms optimize for legibility by adopti
title-style capitalization for section headers. This means section headers no longer render entirely
in capital letters regardless of the capitalization you provide. Make sure to update your section
headers to title-style capitalization to match your app’s text to this systemwide convention.
Adopt forms to take advantage of layout metrics across platform. Use SwiftUI forms with the
grouped form style to automatically update your form layouts.
Platform conventions for location and behavior of search optimize the experience for each device
and use case. To provide an engaging search experience in your app, review these search design
conventions.
Search in a toolbar on iPad
Search in a toolbar on iPhone
Check the keyboard layout when activating your search interface. In iOS, when a person taps a
search field to give it focus, it slides upwards as the keyboard appears. Test this experience in you
app to make sure the search field moves consistently with other apps and system experiences.
Use semantic search tabs. If your app’s search appears as part of a tab bar, make sure to use th
standard system APIs for indicating which tab is the search tab. The system automatically
Search


## Page 12

separates the search tab from other tabs and places it at the trailing end to make your search
experience consistent with other apps and help people find content faster.
Liquid Glass can have a distinct appearance and behavior across different platforms, contexts, an
input methods. Test your app across devices to understand how the material looks and feels acro
platforms.
In watchOS, adopt standard button styles and toolbar APIs. Liquid Glass changes are minimal i
watchOS, so they appear automatically when you open your app on the latest release even if you
don’t build against the latest SDK. However, to make sure your app picks up this appearance, ado
standard toolbar APIs and button styles from watchOS 10.
In tvOS, adopt standard focus APIs. Across apps and system experiences in tvOS, standard
buttons and controls take on a Liquid Glass appearance when focus moves to them. For
consistency with the system experience, consider applying these effects to custom controls in yo
app when they gain focus by adopting the standard focus APIs. Apple TV 4K (2nd generation) and
newer models support Liquid Glass effects. On older devices, your app maintains its current
appearance.
Combine custom Liquid Glass effects to improve rendering performance. If you apply these
effects to custom elements, make sure to combine them using a GlassEffectContainer, whi
helps optimize performance while fluidly morphing Liquid Glass shapes into each other.
Performance test your app across platforms. It’s a good idea to regularly assess and improve
your app’s performance, and building your app with the latest SDKs provides an opportunity to
check in. Profile your app to gather information about its current performance and find any
opportunities for improving the user experience. To learn more, read Improving your app’s
performance.
UIKit
Platform considerations
UIKit
focusable(_:)
isFocused
SwiftUI
SwiftUI


## Page 13

To update and ship your app with the latest SDKs while keeping your app as it looks when built
against previous versions of the SDKs, you can add the UIDesignRequiresCompatibility
key to your project’s Info pane.


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

Learn about important changes to AVFoundation.
Background Tasks updates
Learn about important changes in Background Tasks.


## Page 20

Designing for user privacy is important. Most Apple devices contain personal data that the user
doesn’t want to expose to apps or to external entities. If your app accesses or uses data
inappropriately, the user might stop using your app and even delete it from their device.
Access user or device data only with the user’s informed consent obtained in accordance with
applicable law. In addition, take appropriate steps to protect user and device data, and be
transparent about how you use it.
Consult these documents:
Mobile Privacy Disclosures: Building Trust Through Transparency. The Federal Trade
Commission’s report on mobile privacy.
Opinion 02/2013 on Apps on Smart Devices. The EU Data Protection Commissioners’ opinion o
data protection for mobile apps.
Privacy on the Go: Recommendations for the Mobile Ecosystem. The California State Attorney
General’s recommendations for mobile privacy.
Smartphone Privacy Initiative (2012) in English or Japanese and Smartphone Privacy Initiative I
(2013) in English or Japanese. The Japanese Ministry of Internal Affairs and Communications’
Smartphone Privacy Initiatives.
Request access to sensitive user or device data—like location, contacts, and photos—at the time
your app needs the data. Supply a purpose string (sometimes called a usage description string) in
your app’s Information Property List that the system can present to a user explaining wh
your app needs access. Provide reasonable fallback behavior in situations where the user doesn’t
Overview
Review Guidelines from Government and Industry Sources
Request Access Only When Your App Needs the Data
UIKit / Protecting the User’s Privacy
Protecting the User’s Privacy
Secure personal data, and respect user preferences for how data is used.


## Page 21

grant access to the requested data. For more details, see Requesting access to protected
resources.
For example, when you submit your app to the App Store, specify a URL for your privacy policy or
statement as part of your App Store Connect metadata. You can also summarize that policy or
statement in your app description.
Respect the user’s preferences, and take reasonable steps to protect the data that you collect in
your apps:
Provide settings that allow the user to disable access to sensitive information. The operating
system does this automatically for protected system resources—like location, contacts, and
health data—through the Privacy menu of the Settings app. Extend this behavior to any data yo
cache from these sources or collect directly. For example, if your users build a social media
profile containing personal information, offer them a way to delete the data (including any serve
copies you have).
When storing files in iOS, use the strongest data protection level that works for your app, as
described in Encrypting Your App’s Files. Use App Transport Security when sending user or
device data over the network, as described in NSAppTransportSecurity.
If your app uses the ASIdentifierManager class, respect the value of its isAdvertising
TrackingEnabled property. If the user sets that property to false, then use the
ASIdentifierManager class only for limited advertising purposes, like frequency capping,
attribution, conversion events, estimating the number of unique users, advertising fraud
detection, and debugging. See the AdSupport framework for additional information.
If you must identify users persistently, use the identifierForVendor property of the
UIDevice class or the advertisingIdentifier property of the ASIdentifierManager
class.
Request and use the minimum amount of user or device data needed to accomplish a given task.
Don’t seek access to or collect data for unnecessary or non-obvious reasons, or because you thin
it might be useful later.
If your app supports audio input, configure your audio session for recording only at the point whe
you actually plan to begin recording. Don’t configure your audio session for recording at launch
Be Transparent About How Data Will Be Used
Give the User Control Over Data and Protect Data You
Collect
Use the Minimum Amount of Data Required


## Page 22

time if you don’t plan to record right away. The system alerts users when apps configure their aud
session for recording and gives the user the option to disable recording for your app.
Requesting access to protected resources
Provide a purpose string that explains to a person why you need access to protected
resources on their device.
Encrypting Your App’s Files
Protect the user’s data in iOS by encrypting it on disk.
Adopting Liquid Glass
Find out how to bring the new material to your app.
UIKit updates
Learn about important changes to UIKit.
About App Development with UIKit
Learn about the basic support that UIKit and Xcode provide for your iOS and tvOS apps.
Topics
Supporting Privacy
See Also
Essentials


## Page 23

Port your existing macOS app to Apple silicon by creating a universal binary and modifying your
code to handle architectural differences. A universal binary looks no different than a regular app,
but its executable file contains two versions of your compiled code. One version runs natively on
Apple silicon, and the other runs natively on Intel-based Mac computers. At runtime, the system
automatically chooses which version to run on the current platform.
To build a universal binary, you need Xcode 12 or a later version, which adds arm64 to the standa
list of build architectures for macOS binaries. When you open your project and do a clean build,
Xcode creates a universal binary automatically if your project uses the standard architectures. If
you use custom makefiles or build scripts, add the arm64 architecture to your build system.
After you create a universal binary, test it on both architectures and determine whether you need 
make additional changes. macOS frameworks shield apps from most architectural differences
between platforms, but some differences may still require you to change your code. In addition,
architectural differences may affect your app’s performance and require further changes.
Overview
Apple silicon / Porting your macOS apps to Apple silicon
Porting your macOS apps to Apple silicon
Create a version of your macOS app that runs on both Apple silicon and Intel-
based Mac computers.


## Page 24

Note
On Apple silicon, apps built for the x86_64 architecture run under the Rosetta translation
environment. For more information, see About the Rosetta translation environment.
To learn how to build a universal binary, see Building a universal macOS binary.
Early in the porting process, identify the workflow you’ll use to build and test your code. Xcode ru
on all Mac computers, so build your code on either an Apple silicon or Intel-based Mac computer
and do your initial testing there. However, always test, tune, and validate your code on both
computer types to uncover issues specific to that architecture.
In addition to a workflow plan, identify potential areas to investigate during the porting process. T
porting effort for arm64 depends on how much you rely on hardware-specific features. If you rely
mostly on Apple frameworks and technologies, your porting effort may be small. If you tuned you
code specifically for the x86_64 architecture and hardware capabilities, porting to arm64 may
require additional effort.
To start your investigation, make a note of any code that does the following:
Interacts with third-party libraries you don’t own.
Interacts with the kernel or hardware.
Relies on specific GPU behaviors.
Contains assembly instructions.
Manages threads or optimizes your app’s multithreaded behavior.
Contains hardware-specific assumptions or performance optimizations.
Create a Porting Plan


## Page 25

The list above is not exhaustive, but it offers a starting point for your investigation. Hardware and
architectural differences may introduce bugs or performance issues to your code on Apple silicon
Identifying potential problem areas early will save you time later.
Always have a well-defined test plan, ideally with a set of automated test suites you can run at bu
time. In addition to testing your code’s correctness, gather metrics on your app’s performance.
Examine your app’s memory usage, and measure how long it takes to execute specific tasks on
both Apple silicon and Intel-based Mac computers. Use that information to identify additional are
to investigate.
If your project depends on any third-party libraries, contact the original vendors and ask them to
provide you with universal versions of those libraries. All code running in the same process must
support the same architecture. You cannot produce a universal version of your binary without
universal versions of all linked libraries. If one or more libraries is not universal, the linker reports
errors.
To learn how to create your own universal binaries, see Building a universal macOS binary.
A universal plug-in runs natively on any Mac computer. If your app supports a plug-in model, crea
universal versions of the plug-ins that you manage. If your company allows external developers to
contribute plug-ins, encourage those developers to create universal versions of their plug-ins.
Universal plug-ins are essential if your app loads those plug-ins directly into its process space.
Code running in the same process must support the same architecture. If your app attempts to
load a plug-in with an incompatible architecture, the system reports an error at load time.
Obtain Universal Versions of Linked Libraries
Update Plug-Ins to Universal Binaries


## Page 26

Plug-ins that run out-of-process using an XPC service may run using a different architecture than
the app itself. To give your developers time to update their plug-ins, provide two non-universal XP
services—one to run arm64 plug-ins and one to run x86_64 plug-ins. A single XPC service can
manage either native or translated plug-ins, but not both at the same time. When creating the
services, give each one a unique bundle identifier so they may run simultaneously.
For information about how to communicate with out-of-process plug-ins using XPC, see XPC.
Apart from large-scale changes to the processor and graphics hardware, subtle architectural
differences exist between Apple silicon and Intel-based Mac computers. During the porting
process, audit your code to identify fixes for any potential architectural issues. For example, look
for places where your code relies on specific hardware features or configurations.
The following list identifies several known architectural differences between Apple silicon and Inte
based Mac computers. Update code that relies on any of the following:
Virtual memory-page sizes
Cache line sizes
Variadic functions
Memory that is simultaneously writable and executable
Just-in-time compilers
Realtime threads
Explicit thread priorities
Hardware-specific details
Assembly-language instructions or builtin intrinsics
Vector unit instructions
Address Architectural Differences


## Page 27

C++ ABI details
Note
Both Apple silicon and Intel-based Mac computers use the little-endian format for data, so you
don’t need to make endian conversions in your code. However, continue to minimize the need
for endian conversions in custom data formats that you create.
For additional information about architectural differences, see Addressing architectural difference
in your macOS code.
Metal on Apple silicon supports the features of both Intel-based Mac computers and iOS devices
your app adopts Metal features that are found only on Intel-based Mac computers, consider also
adopting the iOS-specific features in your arm64 code. Adopting these features can lead to
performance improvements for many apps.
If your app uses Metal, OpenGL, or OpenCL, be aware of the following differences:
The GPU and CPU on Apple silicon share memory.
OpenGL is deprecated, but is available on Apple silicon.
OpenCL is deprecated, but is available on Apple silicon when targeting the GPU. The OpenCL
CPU device is not available to arm64 apps.
For information about how to update your graphics code, see Porting your Metal code to Apple
silicon.
When porting code to macOS 11, be aware of the following requirements for code that interacts
with the kernel:
Implement hardware drivers using DriverKit. macOS 11 requires you to use a DriverKit extension
when support for one is available. Most driver types now support DriverKit, and only a few still
require the creation of a kernel extension.
Kernel extensions must support the native architecture. Kernel extensions run in the kernel, and
the kernel always runs as a native process. You cannot run kernel extensions using Rosetta
translation.
The installation and uninstallation of kernel extensions requires a reboot. When you install a
kernel extension, the system doesn’t load your extension until after a reboot.
Update GPU-Specific Code
Update Drivers, System Extensions, and Kernel Extensions


## Page 28

For more information about kernel extension and driver changes, see Implementing drivers, syste
extensions, and kexts.
macOS includes a few technologies that are currently deprecated or discouraged for active
development. If your app uses one of the following technologies, migrate to an appropriate
replacement as soon as possible:
OpenGL—Use Metal instead.
OpenCL—Use Metal instead.
AddressBook—Use the Contacts framework instead.
Carbon APIs—Migrate to AppKit, Foundation, and other modern APIs.
IOKit kernel extensions—Migrate to DriverKit where appropriate; see DriverKit framework.
Apple silicon still provides support for the preceding technologies, and you may continue to use
them in macOS 11. However, this support may be removed in a future version of macOS, so
migration to newer technologies is recommended.
Apple silicon supports all debugging and testing tools found on Intel-based Mac computers. Use
the Xcode IDE to set and monitor breakpoints and monitor other aspects of your app’s behavior.
Use lldb from the command line to perform similar tasks outside of the Xcode interface.
For more information about how to debug and test your code, see Xcode.
Apple silicon runs all performance tools found on Intel-based Mac computers. Use Instruments an
other performance tools to gather different types of metrics for your app, including information
about its memory usage, speed, energy usage, and more. You can also use command-line tools
such as leaks, heap, top, fs_usage, sc_usage, vm_stat, otool, sample, malloc
_history, and vmmap to identify potential performance issues.
Architectural differences between arm64 and x86_64 mean that techniques that work well on on
system might not work well on the other. For example:
Don’t assume a discrete GPU means better performance. The integrated GPU in Apple
processors is optimized for high performance graphics tasks. See Porting your Metal code to
Apple silicon.
Migrate Away from Specific Technologies
Debug and Test Your Code
Tune Your App’s Performance


## Page 29

Don’t assume that all processor cores are equal. The processors on Apple silicon contain a
mixture of performance cores (P-cores) and efficiency cores (E-cores), which execute tasks w
different performance characteristics. Use Quality-of-Service (QoS) classes to help the system
schedule your tasks on the right type of core.
During the porting process, measure your app’s performance on both Apple silicon and Intel-base
Mac computers and investigate any discrepancies. Tasks that take longer to run on one platform
may require additional tuning.
For specific tips on tuning universal binaries, see Tuning your code’s performance for Apple silico
Addressing architectural differences in your macOS code
Fix problems that stem from architectural differences between Apple silicon and Intel-based
Mac computers.
Porting your audio code to Apple silicon
Eliminate issues in your audio-specific code when running on Apple silicon Mac computers.
Porting just-in-time compilers to Apple silicon
Update your just-in-time (JIT) compiler to work with the Hardened Runtime capability, and
with Apple silicon.
Building a universal macOS binary
Create macOS apps and other executables that run natively on both Apple silicon and Intel-
based Mac computers.
Topics
Additional Porting Tips
See Also
Essentials


