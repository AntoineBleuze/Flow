# Library Customization.pdf

## Page 1

Xcode discovers implementations of the LibraryContentProvider protocol in your project o
workspace and examines their contents for items that it can add to the Xcode library. Add views b
implementing the content provider’s computed views property, and returning an array of
LibraryItem instances initialized with the views you want to publish:
Add view modifiers by implementing the modifiers(base:) method and similarly returning an
array of library items initialized with the modifiers you want to publish. For view modifiers, you als
specify the type to which the modifiers apply:
Overview
DeveloperToolsSupport / LibraryContentProvider
Protocol
LibraryContentProvider
A source of Xcode library and code completion content.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 2

For modifiers that you define in an extension to View, you can provide any view conformer as the
base. For modifiers that you define on a particular view type, provide that type as the base.
var views: [LibraryItem]
The SwiftUI views that you want to add to the Xcode library.
Required Default implementation provided.
func modifiers(base: Self.ModifierBase) -> [LibraryItem]
Indicates a collection of SwiftUI view modifiers to add to the Xcode library.
Required Default implementation provided.
associatedtype ModifierBase = Any
A type to use as a base for modifier completions.
Required
struct LibraryContentBuilder
A function builder for generating arrays of library items without requiring full array literal
syntax.
struct LibraryItem
A single item to add to the Xcode library.
Topics
Adding Views
Adding Modifiers
Building Arrays
See Also
Library Customization


## Page 3

Declare a library item to describe an entry in the Xcode library. Xcode discovers and validates
library items that you place in the context of a LibraryContentProvider instance.
At a minimum, you provide an expression that Xcode uses when the user chooses the library item
You can provide any expression that compiles in the context of the library item instantiation.
However, Xcode only honors items that adhere to certain restrictions, as described in views and
modifiers(base:).
You can also provide additional characteristics, like a title and a category, to help you find the item
when searching the library.
init<SnippetExpressionType>(@autoclosure () -> SnippetExpressionType,
visible: Bool, title: String?, category: LibraryItem.Category, matching
Signature: String?)
Creates a new library item.
struct Category
Overview
Topics
Creating a Library Item
DeveloperToolsSupport / LibraryItem
Structure
LibraryItem
A single item to add to the Xcode library.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 4

The kinds of library items that you can create.
protocol LibraryContentProvider
A source of Xcode library and code completion content.
See Also
Library Customization


