# Sample code.pdf

## Page 1

Note
This sample code project is associated with WWDC24 session 10073: Catch up on
accessibility in SwiftUI.
Open the sample code project in Xcode. Before building it, do the following:
1. Set the developer team for all targets to your team so Xcode automatically manages the
provisioning profile. For more information, see Assign a project to a team.
2. Replace the App Group container identifier — group.SwiftUIAccessibilityWWDCSample
— with one specific to your team for the entire project. The identifier points to an App Group
container that the app and widget use to share data. You can search for group.Swift
UIAccessibilityWWDCSample using the Find navigator in Xcode, and then change all of th
occurrences (except those in this README file). For more information, see Configuring App
Groups.
Overview
Configure the sample code project
Accessibility / Enhancing the accessibility of your SwiftUI app
Sample Code
Enhancing the accessibility of your SwiftU
app
Support advancements in SwiftUI accessibility to make your app accessible to
everyone.
Download
iOS 18.0+
iPadOS 18.0+
macOS 15.0+
Xcode 16.0+


## Page 2

Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your SwiftUI
views.
Delivering an exceptional accessibility experience
Make improvements to your app’s interaction model to support assistive technologies such a
VoiceOver.
Integrating accessibility into your app
Make your app more accessible to users with disabilities by adding accessibility features.
Accessibility design for Mac Catalyst
Improve navigation in your app by using keyboard shortcuts and accessibility containers.
See Also
Sample code


## Page 3

Note
This sample code project is associated with WWDC21 session 10119: SwiftUI Accessibility:
Beyond the Basics.
Overview
SwiftUI / Accessibility fundamentals / Creating accessible views
Sample Code
Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your
SwiftUI views.
Download
iOS 15.0+
iPadOS 15.0+
macOS 12.0+
Xcode 13.0+


## Page 4

To provide an exceptional accessibility experience, you need to think about how users with
accessibility needs interact with your app. For example, your app should:
Be easy to navigate using assistive technologies such as VoiceOver.
Make the most frequently used features easily available to the user.
Convey different elements in the proper context.
Ensure the predictability of user interactions, which is to say, if a gesture works with VoiceOver
one way in other apps, the gesture should work the same way in your app.
This sample code project shows how to provide an exceptional accessibility experience for
VoiceOver. The sample app contains a gallery of dogs available for adoption. With VoiceOver
enabled, the system reads aloud information about each dog as you swipe through the list. You’ll
also hear details about the dog—such as the age, gender, and attitude—mark the dog as a favorit
and view a gallery with more photos of the lovable canine.
To see the sample app in action, use Xcode to build and run the app on your iOS device. Be sure t
turn on VoiceOver, which you can do from Settings under General > Accessibility > VoiceOver.
Overview
Get started
Accessibility / Delivering an exceptional accessibility experience
Sample Code
Delivering an exceptional accessibility
experience
Make improvements to your app’s interaction model to support assistive
technologies such as VoiceOver.
Download
iOS 12.0+
iPadOS 12.0+
Xcode 11.3+


## Page 5

To preview each pup available for adoption, the user swipes left and right across the collection vie
at the top of the screen. There is, however, a problem with this interaction when VoiceOver is on,
the assistive technology doesn’t recognize visible elements, such as the favorite and gallery
buttons, and it doesn’t know the details of the dog until the user reaches the end of the list. This
behavior is far from being an exceptional accessibility experience.
Navigating through the collection of dogs is central to the app. It’s the primary feature that users
use, and as such, it should be easy for the user to perform. To provide a better accessibility
experience, the sample defines the custom class CarouselAccessibilityElement with its
accessibilityTraits set to adjustable.
View in Source
The adjustable trait tells VoiceOver that the element behaves like a picker by responding to th
accessibilityIncrement() and accessibilityDecrement() callback methods.
View in Source
The sample then creates an instance of CarouselAccessibilityElement, settings its frame
to the collection view’s frame.
Improve carousel navigation


## Page 6

View in Source
With VoiceOver on, the carousel accessibility element adds two new gestures on top of the
collection view:
Swipe up to move forward through the collection.
Swipe down to move backward through the collection.
The sample’s use of CarouselAccessibilityElement also makes it possible for the user to
swipe to the favorite and gallery buttons for every dog in the list, rather than having the buttons
reachable only at the end of the list. Although the gestures to swipe through the list of dogs is
different when VoiceOver is on, this difference makes it easier for users needing assistance to
preview each dog.
When the user taps the gallery button, the app displays a full-screen modal view. However, in the
sample this modal view isn’t from a view controller that the app presents modally. Instead, it’s a
view with a transparent background displayed on top of the app’s main view. Because of the
transparent background, parts of the underlying view are still available to VoiceOver, and VoiceOv
doesn’t know that those visible parts should not be available.
To tell VoiceOver that the underlying view is not available, and to treat the top view as a modal vie
the top view returns true for the accessibilityViewIsModal property.
Display non-modal modal views


## Page 7

View in Source
When referring to separate elements belonging in the same context, it’s essential to convey a sing
set of information about the items. For example, the sample app displays a title label, such as
NAME, and a value label, such as the dog’s name. These are two separate elements—title and val
—but they are part of the same context.
To place these two elements into the same accessibility context, use UIAccessibilityElemen
to encapsulate the information from each label. For example, the sample project’s DogStatsVie
groups each title and value label combination into accessibility elements. The project also sets th
accessibilityLabel with the text from the two UILabel objects, and sets accessibility
FrameInContainerSpace to a frame containing both labels. This allows VoiceOver to recogniz
each title-value label pairing as a single accessibility element. In turn, the user hears the title and
value each time a title-value accessibility element has focus.
View in Source
The sample app also displays the name of the animal shelter housing the dog. Next to the shelter
name are two buttons: one initiates a call to the shelter and the other displays the location of the
shelter. To make the buttons available to VoiceOver users, the app uses UIAccessibility
CustomAction to specify a name for the action along with the object and selector to use when
performing the action. With the custom action, VoiceOver users can access the action using the
VoiceOver rotor.
Group labels
Add custom actions


## Page 8

View in Source
Enhancing the accessibility of your SwiftUI app
Support advancements in SwiftUI accessibility to make your app accessible to everyone.
Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your SwiftUI
views.
Integrating accessibility into your app
Make your app more accessible to users with disabilities by adding accessibility features.
Accessibility design for Mac Catalyst
Improve navigation in your app by using keyboard shortcuts and accessibility containers.
See Also
Sample code


## Page 9

By adding accessibility features to your app, you make it available to a wider range of users. This
sample code project shows how to implement accessibility for several common UI controls. The
examples make the controls accessible by using accessibility properties, accessibility protocols,
and the NSAccessibilityElement class.
In macOS 10.10, the Accessibility API moved to a protocol-based approach, in contrast to the key
based API from macOS 10.9 and earlier. With the protocol-based API, you can:
Simplify the implementation of accessibility
More closely align macOS accessibility features with those of iOS
Ensure compatibility with existing macOS apps and code
Accessibility API features in macOS versions earlier than 10.10 are deprecated, but can coexist wi
the current API. No changes are required for apps or accessibility clients that use earlier versions 
the Accessibility API. If you implement both APIs on the same class, the current API takes
precedence for that class. For cell-based controls, you need to provide Accessibility API
implementations on the cell.
Most accessibility attributes from macOS 10.9 and earlier are now properties in the following App
classes:
Overview
Add accessibility attributes
Accessibility / Integrating accessibility into your app
Sample Code
Integrating accessibility into your app
Make your app more accessible to users with disabilities by adding accessibility
features.
Download
macOS 13.1+
Xcode 14.2+


## Page 10

NSApplication
NSWindow
NSView
NSDrawer
NSPopover
NSCell
To set an accessibility attribute value on an instance of one of these classes (or a subclass), simp
assign the value to the property.
Alternatively, you can override the getter in the subclass’s implementation.
NSAccessibilityProtocol contains the full list of accessibility properties.
The Accessibility API protocols define the required accessibility functions for many common
accessibility elements. Conformance to an accessibility protocol isn’t required to use the API, but
it’s recommended when making custom controls accessible. Conforming to an accessibility
protocol results in a warning for each unimplemented required function and allows the system to
automatically infer the accessibilityRole and isAccessibilityElement properties.
Standard AppKit controls conform to the related accessibility protocol (for example, NSButton
conforms to the NSAccessibilityButton protocol, and NSSlider conforms to the
NSAccessibilitySlider protocol). Whenever possible, subclass from the appropriate AppKit
control to leverage the built-in accessibility.
To add accessibility to a custom control:
1. Conform to the appropriate protocol.
2. Implement all the required functions. A warning appears for each unimplemented required
function.
3. Test using VoiceOver and the Accessibility Inspector.
Add accessibility protocols to custom controls


## Page 11

For example, the following code sample creates a custom control that subclasses NSView and
draws and behaves like a button:
If a custom control doesn’t conform to an accessibility protocol, you need to implement the
accessibilityRole and isAccessibilityElement functions.
For objects that don’t have a backing view — for example, a single view that draws several images
each of which is individually accessible — create an instance of NSAccessibilityElement for
each object, and return an array of the instances from the containing view’s accessibility
Children function.
NSAccessibilityElement has two convenience methods that simplify its use:
accessibilityAddChildElement — This function sets the specified element as a
subelement of the receiver’s accessibilityChildren and the receiver as the container to
the specified element. This behavior is useful when you create hierarchies of accessibility
elements.
accessibilityFrameInParentSpace — This property allows the accessibility element to
specify its frame relative to its accessibility container, so that the system can automatically
recalculate the accessibilityFrame property value (given in screen coordinates) wheneve
the element or any of its containing views changes location.
The Accessibility API includes two convenience methods in AppKit/NSAccessibility.h to
simplify common accessibility tasks:
NSAccessibilityFrameInView — This convenience method converts frame from the
parentView coordinate space to the screen coordinate space. This is useful when you
calculate an object’s accessibilityFrame.
Create an accessibility element
Simplify your accessibility code


## Page 12

NSAccessibilityPointInView — This convenience method converts point from the
parentView coordinate space to the screen coordinate space. This is useful when you
calculate an object’s accessibilityActivationPoint coordinates.
The Accessibility Inspector is an Xcode tool that displays all accessibility information for the
element currently beneath the cursor, including the accessibility hierarchy, accessibility attributes
and accessibility actions. It also shows warnings for common accessibility problems, such as a
missing accessibility label. Launch the Accessibility Inspector from the Xcode > Open Developer
Tool menu.
To test VoiceOver, choose System Settings > Accessibility > VoiceOver and click the toggle to
enable it, or press Command-F5. To learn how to use VoiceOver, choose System Settings >
Accessibility > VoiceOver > Open VoiceOver Training.
Enhancing the accessibility of your SwiftUI app
Support advancements in SwiftUI accessibility to make your app accessible to everyone.
Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your SwiftUI
views.
Delivering an exceptional accessibility experience
Make improvements to your app’s interaction model to support assistive technologies such a
VoiceOver.
Accessibility design for Mac Catalyst
Improve navigation in your app by using keyboard shortcuts and accessibility containers.
Test the accessibility features on your app
See Also
Sample code


## Page 13

Note
This sample code project is associated with WWDC20 session 10117: Accessibility design for
Mac Catalyst.
Enhancing the accessibility of your SwiftUI app
Support advancements in SwiftUI accessibility to make your app accessible to everyone.
Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your SwiftUI
views.
Delivering an exceptional accessibility experience
Make improvements to your app’s interaction model to support assistive technologies such a
VoiceOver.
Overview
See Also
Sample code
Accessibility / Accessibility design for Mac Catalyst
Sample Code
Accessibility design for Mac Catalyst
Improve navigation in your app by using keyboard shortcuts and accessibility
containers.
Download
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
Xcode 12.0+


## Page 14

Integrating accessibility into your app
Make your app more accessible to users with disabilities by adding accessibility features.


