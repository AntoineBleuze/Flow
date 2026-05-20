# Text.pdf

## Page 1

In most cases, you can lay out your app’s text using the NSTextField or NSTextView classes (
their subclasses). Use the NSTextField class to add either a label or a simple text input. Use th
NSTextView class to provide more comprehensive layout and editing features for larger bodies o
text.
For example, NSTextView supports rich text, attachments (graphics, file, and other), input
management and key binding, and marked text attributes. NSTextView works with the font pane
and menu, rulers and paragraph styles, the Services facility (for example, the spell-checking
service), and the pasteboard.
NSTextView also allows customizing through delegation and notifications—you rarely need to
subclass NSTextView. You rarely create instances of NSTextView programmatically either,
because objects on Interface Builder’s palettes, such as NSTextField, NSForm, and NSScroll
View, already contain NSTextView objects.
For even more powerful and more creative text manipulation (such as displaying text in a circle) s
TextKit.
The NSSpellServer class lets you define a spell-checking service and provide it as a service to
other apps. To connect your app to a spell-checking service, use the NSSpellChecker class. Th
NSIgnoreMisspelledWords and NSChangeSpelling protocols support the spell-checking
mechanism.
Overview
Spell-checking
Topics
AppKit / Text Display
API Collection
Text Display
Display text and check spelling.


## Page 2

class NSTextField
Text the user can select or edit to send an action message to a target when the user presses
the Return key.
protocol NSTextFieldDelegate
A protocol that a text field delegate can use to control its field editor action menu.
class NSTextView
A view that draws text and handles user interactions with that text.
protocol NSTextViewDelegate
A set of optional methods that text view delegates can use to manage selection, set text
attributes, work with the spell checker, and more.
protocol NSTextDelegate
A set of optional methods implemented by the delegate of an NSText object to edit text and
change text formats.
class NSText
The most general programmatic interface for objects that manage text.
Adopting the system text cursor in custom text views
Incorporate the system text cursor into your custom text UI in AppKit.
class NSTextInputContext
An object that represents the Cocoa text input system.
protocol NSTextInputClient
A set of methods that text views need to implement to interact properly with the text input
management system.
class NSTextAlternatives
A list of alternative strings for a piece of text.
protocol NSTextContent
A protocol that describes specific kinds of input content types.
Text views
Text input


## Page 3

class NSTextInsertionIndicator
A view that represents the insertion indicator in text.
enum DisplayMode
Constants that determine how to display the system text cursor in a custom text UI.
struct AutomaticModeOptions
Options that affect the automatic display mode.
class NSTextCheckingController
protocol NSTextCheckingClient
protocol NSTextInputTraits
enum NSTextInputTraitType
class NSSpellChecker
An interface to the Cocoa spell-checking service.
protocol NSChangeSpelling
A protocol that responder objects can implement to correct a misspelled word.
protocol NSIgnoreMisspelledWords
A protocol that enables the Ignore button in the Spelling panel to function properly.
protocol NSTextInput
A set of methods that text views need to implement to interact properly with the text input
management system.
Text-checking
Spell-checking
Deprecated
See Also
Text


## Page 4

TextKit
Manage text storage and perform custom layout of text-based content in your app’s views.
Fonts
Manage the fonts used to display text.
Writing Tools
Add support for Writing Tools to your app’s text views.


## Page 5

TextKit provides several classes to control the layout of text, such as NSTextContentStorage,
NSTextLayoutManager, and NSTextContainer.
Additionally, TextKit uses NSAttributedString objects extensively. The NSTextStorage clas
is a subclass of NSMutableAttributedString, and many of the TextKit classes, for example,
the classes listed in Formatted content, focus on creating complex NSAttributedString
instances. Use these classes to specify your text’s format.
Most of the time, you can use TextKit to fine tune the formatting and layout of a NSTextView by
modifying various properties of your view’s layout manager, text container, or text storage objects
in your app. If you need more control, you can also use TextKit to build your text controls.
class NSTextContentStorage
A concrete object for managing your view’s text content and generating the text elements
necessary for layout.
class NSTextContentManager
An abstract class that defines the interface and a default implementation for managing the
text document contents.
Overview
Topics
Text management
AppKit / TextKit
API Collection
TextKit
Manage text storage and perform custom layout of text-based content in your
app’s views.


## Page 6

class NSAttributedString
A string of text that manages data, layout, and stylistic information for ranges of characters t
support rendering.
class NSMutableAttributedString
A mutable string with associated attributes (such as visual style, hyperlinks, or accessibility
data) for portions of its text.
class NSParagraphStyle
The paragraph or ruler attributes for an attributed string.
class NSMutableParagraphStyle
An object for changing the values of the subattributes in a paragraph style attribute.
class NSTextTab
A tab in a paragraph.
class NSTextList
A section of text that forms a single list.
class NSTextTable
An object that represents a text table as a whole.
class NSTextTableBlock
A text block that appears as a cell in a text table.
class NSTextBlock
A block of text laid out in a subregion of the text container.
Enriching your text in text views
Add exclusion paths, text attachments, and text lists to your text, and render it with text view
class NSTextParagraph
A class that represents a single paragraph backed by an attributed string as the contents.
class NSTextListElement
A class that represents a text list node.
Formatting and attributes
Content elements


## Page 7

class NSTextElement
An abstract base class that represents the smallest units of text layout such as paragraphs o
attachments.
protocol NSTextElementProvider
A protocol the text content manager and its concrete subclasses conform to, which defines
the interface for interacting with custom content types of a text document.
class NSTextRange
A class that represents a contiguous range between two locations inside document contents
class NSTextSelection
A class that represents a single logical selection context that corresponds to an insertion
point.
class NSTextSelectionNavigation
An interface you use to expose methods for obtaining results from actions performed on tex
selections.
protocol NSTextLocation
An interface you implement that represents an abstract location inside your document’s
content.
Using TextKit 2 to interact with text
Interact with text by managing text selection and inserting custom text elements.
class NSTextLayoutManager
The primary class that you use to manage text layout and presentation for custom text
displays.
class NSTextContainer
A region where text layout occurs.
class NSTextLayoutFragment
A class that represents the layout fragment typically corresponding to a rendering surface,
such as a layer or view subclass.
class NSTextLineFragment
Location and selection
Layout


## Page 8

A class that represents a line fragment as a single textual layout and rendering unit inside a
text layout fragment.
class NSTextViewportLayoutController
Manages the layout process inside the viewport interacting with its delegate.
protocol NSTextLayoutOrientationProvider
A set of methods that define the orientation of text for an object.
class NSTextAttachment
The values for the attachment characteristics of attributed strings and related objects.
class NSTextAttachmentViewProvider
A container object that associates a text attachment at a particular document location with a
view object.
class NSAdaptiveImageGlyph
A data object for an emoji-like image that can appear in attributed text.
protocol NSTextAttachmentContainer
A set of methods that defines the interface to text attachment objects from a layout manage
protocol NSTextAttachmentLayout
A set of methods that defines the interface to attachment objects from a text layout manage
class NSTextAttachmentCell
An object that implements the functionality of the text attachment cell protocol.
protocol NSTextAttachmentCellProtocol
A set of methods that declares the interface for objects that draw text attachment icons and
handle mouse events on their icons.
typealias NSGlyph
The type used to specify glyphs.
protocol NSGlyphStorage
A set of methods that a glyph storage object must implement to interact properly with
NSGlyphGenerator.
Attachments
Glyphs


## Page 9

class NSGlyphGenerator
An object that performs the initial, nominal glyph generation phase in the layout process.
class NSGlyphInfo
A glyph attribute in an attributed string.
Reserved Glyph Codes
These constants define reserved glyph codes.
enum NSFontRenderingMode
The font rendering mode.
class NSTextStorage
The fundamental storage mechanism of TextKit that contains the text managed by the syste
class NSLayoutManager
An object that coordinates the layout and display of text characters.
class NSATSTypesetter
A concrete typesetter object that places glyphs during the text layout process.
class NSTypesetter
An abstract class that performs various type layout tasks.
Text Display
Display text and check spelling.
Fonts
Manage the fonts used to display text.
Writing Tools
Add support for Writing Tools to your app’s text views.
TextKit 1
See Also
Text


## Page 10



## Page 11

The NSFont and NSFontManager classes encapsulate and manage font families, sizes, and
variations. The NSFont class defines a single object for each distinct font; for efficiency, these
objects, which can be rather large, are shared by all the objects in your app. The NSFontPanel
class defines the font specification panel that’s presented to the user.
class NSFont
The representation of a font in an app.
class NSFontDescriptor
A dictionary of attributes that describe a font.
struct NSFontTraitMask
Constants for isolating specific traits of a font.
typealias NSFontFamilyClass
Constants that classify certain stylistic qualities of the font.
struct SymbolicTraits
A symbolic description of the stylistic aspects of a font.
class NSFontAssetRequest
Overview
Topics
Font Data
AppKit / Fonts
API Collection
Fonts
Manage the fonts used to display text.


## Page 12

typealias NSFontSymbolicTraits
A symbolic description of stylistic aspects of a font.
class NSFontManager
The center of activity for the font-conversion system.
class NSFontCollection
A font collection, which is a group of font descriptors taken together as a single object.
class NSMutableFontCollection
A mutable collection of font descriptors taken together as a single object.
struct NSFontCollectionOptions
Constants that support font collection management.
Text Display
Display text and check spelling.
TextKit
Manage text storage and perform custom layout of text-based content in your app’s views.
Writing Tools
Add support for Writing Tools to your app’s text views.
Management
See Also
Text


## Page 13

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


## Page 14

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


## Page 15

Text Display
Display text and check spelling.
TextKit
Manage text storage and perform custom layout of text-based content in your app’s views.
Fonts
Manage the fonts used to display text.


