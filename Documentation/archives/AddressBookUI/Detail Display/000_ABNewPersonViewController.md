# 000_ABNewPersonViewController.pdf

## Page 1

Deprecated
Use CNContactViewController instead.
New-person view controllers are modal view controllers that manage a set of view controllers use
to create a contact (ABPersonRef) and edit its properties.
Important
New-person view controllers must be used with a navigation controller in order to function
properly. It is recommended that you present a new-person view controller modally.
The ABNewPersonViewController class does not support subclassing.
Overview
Subclassing
Topics
Address Book UI / ABNewPersonViewController Deprecated
Class
ABNewPersonViewController Deprecated
A view controller presenting an interface to create a contact.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated


## Page 2

var newPersonViewDelegate: (any ABNewPersonViewControllerDelegate)?
The delegate of a new-person view controller.
protocol ABNewPersonViewControllerDelegate
The ABNewPersonViewControllerDelegate protocol declares the interface that ABNe
PersonViewController delegates must implement.
var displayedPerson: ABRecord?
Optional. Specifies the person properties that the new-person view controller pre-fills in its
views.
var addressBook: ABAddressBook?
Optional. The address book to which the new contact is added.
var parentGroup: ABRecord?
Optional. Specifies the group to which to add the new contact on save.
UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
Responding to View Controller Interactions
Displaying Person Properties
Configuring New Person Views
Relationships
Inherits From
Conforms To


## Page 3

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
class ABPersonViewController
The ABPersonViewController class (whose instances are known as person view
controllers) implements the view used to display a person record (ABPersonRef).
Deprecated
class ABUnknownPersonViewController
The ABUnknownPersonViewController class (whose instances are known as unknown
person view controllers) implements a view controller used to create a person record from 
set of person properties.
Deprecated
func ABCreateStringWithAddressDictionary([AnyHashable : Any], Bool) ->
String
Returns a formatted address from an address property.
Deprecated
See Also
Detail Display


