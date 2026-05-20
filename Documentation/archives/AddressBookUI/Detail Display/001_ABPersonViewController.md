# 001_ABPersonViewController.pdf

## Page 1

Deprecated
Use init(for:) instead.
Important
Person view controllers must be used with a navigation controller in order to function properly.
The ABPersonViewController class does not support subclassing.
Overview
Subclassing
Topics
Address Book UI / ABPersonViewController Deprecated
Class
ABPersonViewController Deprecated
The ABPersonViewController class (whose instances are known as person
view controllers) implements the view used to display a person record (ABPerso
Ref).
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated


## Page 2

var personViewDelegate: (any ABPersonViewControllerDelegate)?
The person-view controller delegate.
protocol ABPersonViewControllerDelegate
The ABPersonViewControllerDelegate protocol declares the interface that must be
implemented by ABPersonViewController delegates.
var displayedPerson: ABRecord
The person displayed by the person view.
var displayedProperties: [NSNumber]?
Identifies the set of properties (such as name or telephone number) of displayedPerson
the receiver displays.
var shouldShowLinkedPeople: Bool
Indicates whether the person view should display data from person records that are linked
with the person record being displayed.
var addressBook: ABAddressBook?
Optional. The address book from which to obtain the contact to display.
var allowsActions: Bool
Specifies whether the to display buttons for actions such as sending a text message or
initiating a FaceTime call.
var allowsEditing: Bool
Specifies whether the user can edit the person’s information.
func setHighlightedItemForProperty(ABPropertyID, withIdentifier: ABMult
ValueIdentifier)
Specifies whether to highlight a particular property of the displayed person.
Responding to View Controller Interactions
Displaying Person Properties
Configuring Person Views


## Page 3

UIViewController
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
UIViewControllerRestoration
class ABNewPersonViewController
A view controller presenting an interface to create a contact.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Detail Display


## Page 4

class ABUnknownPersonViewController
The ABUnknownPersonViewController class (whose instances are known as unknown
person view controllers) implements a view controller used to create a person record from 
set of person properties.
Deprecated
func ABCreateStringWithAddressDictionary([AnyHashable : Any], Bool) ->
String
Returns a formatted address from an address property.
Deprecated


