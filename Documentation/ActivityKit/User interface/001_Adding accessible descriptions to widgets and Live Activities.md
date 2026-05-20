# 001_Adding accessible descriptions to widgets and Live Activities.pdf

## Page 1

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


## Page 2

If you provide a content description for an image you update while a Live Activity is active and the
image conveys status information or similar, make sure to also update the accessibility label to
match the updated status. For example, if an image indicates a delivery status, make sure the
accessibility label changes as the delivery status that the image indicates changes. Similarly,
update accessibility labels when a widget updates displayed images or SwiftUI views. For guidanc
on providing content descriptions, see Human Interface Guidelines > Accessibility > VoiceOver >
Content descriptions.
See Also


## Page 3

Creating custom views for Live Activities
Create reusable custom views and layouts that support each Live Activity presentation.
Launching your app from a Live Activity
Use deep links to enable people to open your app’s scene that matches the data of you Live
Activity.
User interface


