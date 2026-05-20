# 000_ABPeoplePickerNavigationController.pdf

## Page 1

Deprecated
Use CNContactPickerViewController instead.
In iOS 8 and later bringing up a people-picker navigtion controller does not require the app to hav
access to a user’s contacts, and the user will not be prompted to grant access. If the app does no
itself have access to the user’s contacts, a temporary copy of the contact selected by the user w
be returned to the app.
See PeoplePicker: Picking a Person or Property for a sample project illustrating the use of a peopl
picker navigation controller.
The ABPeoplePickerNavigationController class does not support subclassing.
Overview
Subclassing
Address Book UI / ABPeoplePickerNavigationController Deprecated
Class
ABPeoplePickerNavigation
Controller Deprecated
The ABPeoplePickerNavigationController class (whose instances are
known as people-picker navigation controllers) implements a view controller tha
manages a set of views that allow the user to select a contact or one of its contac
information items from an address book.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated


## Page 2

var peoplePickerDelegate: (any ABPeoplePickerNavigationController
Delegate)?
The people-picker navigation controller delegate.
protocol ABPeoplePickerNavigationControllerDelegate
The ABPeoplePickerNavigationControllerDelegate protocol describes the
interface ABPeoplePickerNavigationController delegates must adopt to respond to
people-picker user events.
var displayedProperties: [NSNumber]?
The properties (such as name or telephone number) the picker displays when it shows a
person.
var addressBook: ABAddressBook?
Optional; the address book from which to obtain the list of contacts.
var predicateForEnablingPerson: NSPredicate?
Optionally determines if a person can be selected.
var predicateForSelectionOfPerson: NSPredicate?
Optionally determines if a selected person should be returned to the app or displayed.
var predicateForSelectionOfProperty: NSPredicate?
Optionally determines if a selected property should be returned to the app or if the default
action for the property should be performed
Topics
Responding to View Controller Interactions
Displaying Person Properties
Configuring People Pickers
Customizing Display and Selection
Constants


## Page 3

Address Book Properties
These constants can be used in predicates for selecting people or properties. A labeled valu
is an object with a “label” property and a “value” property.
UINavigationController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Relationships
Inherits From
Conforms To


