# Pickers.pdf

## Page 1

func addProperty(String!)
Adds a property to the group of properties whose values are shown in the record list.
func columnTitle(forProperty: String!) -> String!
Returns the title of a custom property.
var displayedProperty: String!
The property currently displayed in the record list.
func properties() -> [Any]!
Returns an array of the properties whose values are shown in the record list.
func removeProperty(String!)
Removes a property from the group of properties whose values are shown in the record list.
func setColumnTitle(String!, forProperty: String!)
Sets the title displayed in the people picker for a property.
Topics
Working with Properties in the Record List
Address Book / ABPeoplePickerView
Class
ABPeoplePickerView
An object you use to customize the behavior of people-picker views in an app’s
user interface.
macOS 10.3+


## Page 2

var valueSelectionBehavior: ABPeoplePickerSelectionBehavior
The current selection behavior.
struct ABPeoplePickerSelectionBehavior
Constants indicating the possible value selection behaviors.
var allowsGroupSelection: Bool
A Boolean value that specifies whether the user can select entire groups in the group colum
var allowsMultipleSelection: Bool
A Boolean value that specifies whether multiple groups, records, or values of multivalue
properties can be selected at a time.
func deselectAll(Any!)
Deselects all selected groups, records, and values in multivalue properties.
func deselect(ABGroup!)
Deselects a group selected in the group list.
func deselectIdentifier(String!, for: ABPerson!)
Deselects a value selected in a multivalue property.
func deselect(ABRecord!)
Deselects a record selected in the record list.
var selectedGroups: [Any]!
The groups selected in the group list. (read-only)
func selectedIdentifiers(for: ABPerson!) -> [Any]!
Returns the identifiers of the selected values in a multivalue property.
var selectedRecords: [Any]!
The selection in the records list. (read-only)
func selectedValues() -> [Any]!
Returns an array of all the values selected in the displayed multivalue property.
Specifying Selection Behavior
Selecting Groups and Records


## Page 3

func select(ABGroup!, byExtendingSelection: Bool)
Selects a group or a set of groups in the group list.
func selectIdentifier(String!, for: ABPerson!, byExtendingSelection:
Bool)
Selects a value or a set of values in a multivalue property.
func select(ABRecord!, byExtendingSelection: Bool)
Selects a record or a set of records in the record list.
var accessoryView: NSView!
The view that is placed to the left of the search field.
func clearSearchField(Any!)
Clears the search field and resets the list of displayed records.
func editInAddressBook(Any!)
Launches Address Book to edit the item selected in the people picker.
var groupDoubleAction: Selector!
The action to be invoked when a group is double-clicked.
var nameDoubleAction: Selector!
The action to be invoked when a name is double-clicked.
func selectInAddressBook(Any!)
Launches Address Book and selects the item selected in the people picker.
var target: AnyObject!
The target for double-click actions.
var autosaveName: String!
The name under which the column positions and the filter selection are saved.
Specifying the Accessory View
Managing Actions
Managing Persistent User Settings


## Page 4

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
Sendable
SendableMetatype
class ABPersonView
An object that provides a view for displaying and editing contacts.
Relationships
Inherits From
Conforms To
See Also
Pickers


## Page 5

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


## Page 6

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


