# 003_Writing Tools.pdf

## Page 1

Writing Tools provides a simple way for people to improve what they write using your app. Text
views that support Writing Tools gain the ability to proofread, rewrite, summarize, or compose
content with the help of system-provided large language models (LLMs) and Apple Intelligence.
Writing Tools supports both the standard system views and custom text views you create. The
NSTextView and NSTextField classes automatically support Writing Tools, but you can
customize that support to suit your app’s requirements. You can also add Writing Tools support to
any NSView in your app that contains text.
Customizing Writing Tools behavior for AppKit views
Modify the behavior of Writing Tools in standard macOS text views, and adjust your app’s
behavior while the feature is active.
enum NSWritingToolsBehavior
Constants that specify the Writing Tools experience for the underlying view.
struct NSWritingToolsResultOptions
Constants to specify what type of content to allow in Writing Tools suggestions or rewrites.
Overview
Topics
Configuration
Writing Tools for custom views
AppKit / Writing Tools
API Collection
Writing Tools
Add support for Writing Tools to your app’s text views.


## Page 2

Supporting Writing Tools via the pasteboard
Adopt a simplified version of the Writing Tools experience in a custom view using the
pasteboard and macOS services.
Adding Writing Tools support to a custom AppKit view
Integrate Writing Tools support, including support for inline replacement animations, to your
custom text views on macOS.
class NSWritingToolsCoordinator
An object that manages interactions between Writing Tools and your custom text view.
protocol Delegate
An interface that you use to manage interactions between Writing Tools and your custom tex
view.
class Context
A data object that you use to share your custom view’s text with Writing Tools.
class AnimationParameters
An object you use to configure additional tasks or animations to run alongside the Writing
Tools animations.
Enhancing your custom text engine with Writing Tools
Add Writing Tools support to your custom text engine to enhance the text editing experience
class NSTextPreview
A snapshot of the text in your view, which the system uses to create user-visible effects.
static let writingToolsItemIdentifier: NSToolbarItem.Identifier
A standard item that is configured to send -showWritingTools: to the firstResponder when
invoked.
Text previews
Toolbar configuration
See Also
Text


## Page 3

Text Display
Display text and check spelling.
TextKit
Manage text storage and perform custom layout of text-based content in your app’s views.
Fonts
Manage the fonts used to display text.


