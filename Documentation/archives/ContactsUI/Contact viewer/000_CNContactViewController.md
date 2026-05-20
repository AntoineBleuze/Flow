# 000_CNContactViewController.pdf

## Page 1

Present a CNContactViewController object when you want to display information about one
of the user’s contacts. At creation time, you specify the type of contact you want to display: new,
unknown, or existing.
convenience init(for: CNContact)
Initializes a view controller for an existing contact.
convenience init(forContact: CNContact)
Initializes a view controller for an existing contact.
convenience init(forUnknownContact: CNContact)
Initializes a view controller for an unknown contact.
convenience init(forNewContact: CNContact?)
Initializes a view controller for a new contact.
Overview
Topics
Creating the Contact Viewer
Contacts UI / CNContactViewController
Class
CNContactViewController
A view controller that displays a new, unknown, or existing contact.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

var delegate: (any CNContactViewControllerDelegate)?
The delegate to be notified.
protocol CNContactViewControllerDelegate
Methods you use to respond to user interactions with a contact view controller.
class func descriptorForRequiredKeys() -> any CNKeyDescriptor
Returns the descriptor for all the keys that must be fetched on the contact before setting it o
the view controller.
var contact: CNContact
The contact being displayed.
var alternateName: String?
The name to use if the contact has no display name.
var message: String?
The message displayed under the name of the contact.
var displayedPropertyKeys: [Any]?
The contact property keys to display.
var parentGroup: CNGroup?
The group in which to add a new contact.
var parentContainer: CNContainer?
The container in which to add a new contact.
var contactStore: CNContactStore?
Handling Interactions with the Interface
Required Keys
Displaying Contact Properties
Configuring the Contact’s Relationships
Contact Store


## Page 3

The contact store from which the contact was fetched or to which it will be saved.
var allowsEditing: Bool
Determines whether the user can edit the contact’s information.
var allowsActions: Bool
Determines whether to display buttons for actions such as sending a text message or initiati
a FaceTime call.
var shouldShowLinkedContacts: Bool
Determines whether to display data from contacts that are linked to the contact being
displayed.
func highlightProperty(withKey: String, identifier: String?)
Highlights the property of the contact being displayed.
NSViewController, UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSEditor
NSExtensionRequestHandling
NSObjectProtocol
NSSeguePerforming
NSStandardKeyBindingResponding
Customizing Contact Card
Highlighting a Property
Relationships
Inherits From
Conforms To


## Page 4

NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
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


