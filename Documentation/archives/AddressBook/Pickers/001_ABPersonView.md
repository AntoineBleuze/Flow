# 001_ABPersonView.pdf

## Page 1

Note
You should not override the fieldEditor(_:for:) method of the window that contains this
view.
var editing: Bool
A Boolean value that indicates whether the person view is in editing mode.
var person: ABPerson!
The contact record being displayed.
var shouldShowLinkedPeople: Bool
Overview
Topics
Working with Person Views
Address Book / ABPersonView
Class
ABPersonView
An object that provides a view for displaying and editing contacts.
macOS 10.7+


## Page 2

Indicates whether the person view should display data from person records that are linked
with the person record being displayed.
NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
class ABPeoplePickerView
An object you use to customize the behavior of people-picker views in an app’s user interfac
Relationships
Inherits From
Conforms To
See Also
Pickers


