# General Purpose Templates.pdf

## Page 1

Use the list template to display a list of items, grouped into one or more sections. When the user
selects an item, CarPlay invokes Siri or a custom handler that you provide, depending on the type
of list item. If your list displays hierarchical data, use the handler to add templates to the navigatio
hierarchy.
To create a list template, call the init(title:sections:) method and provide an array of
CPListSection objects. At runtime, use maximumSectionCount to determine the maximum
number of sections your list can display. Use maximumItemCount to determine the maximum
number of items across all sections that your list can display.
Each section contains an array of list items — objects that conform to either the CPListTemplat
Item or the CPSelectableListItem protocol. CarPlay provides three concrete implementatio
of these protocols:
CPListItem
A generic, selectable list item.
CPListImageRowItem
A list item that displays a series of images.
CPMessageListItem
A list item that represents a conversation or contact.
Overview
CarPlay / CPListTemplate
Class
CPListTemplate
A template that displays and manages a list of items.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

Note
The depth of a hierarchical list in CarPlay depends on your app’s entitlements. Food-ordering
apps must not exceed two levels. The framework restricts all other categories of apps to five
levels. Also, some vehicles limit the number of items that the list displays. See CPSession
Configuration for more information.
To display the list, call your interface controller’s pushTemplate(_:animated:completion:
method, passing in the list template to add it to your navigation hierarchy. Alternatively, add the
template as a tab in your CPTabBarTemplate.
For audio and communication apps, CarPlay provides an assistant cell to let users interact with yo
app using Siri_._
To enable the assistant cell, your app must support specific Siri intents:
To play audio, audio apps must support
doc://com.apple.documentation/documentation/sirikit/inplaymediaintent.
To make phone calls, communication apps must support
doc://com.apple.documentation/documentation/sirikit/instartcallintent.
To enable the assistant cell in your list template, use init(title:sections:assistantCell
Configuration:) and provide the required configuration. For more information, see
Integrating Siri Into Your Template App


## Page 3

CPAssistantCellConfiguration. CarPlay automatically updates your app’s interface if you
change the template’s assistantCellConfiguration property.
init(title: String?, sections: [CPListSection])
Creates a list template with an array of list sections and optional title.
init(title: String?, sections: [CPListSection], assistantCell
Configuration: CPAssistantCellConfiguration?)
Creates a sectioned list template that optionally displays the assistant cell.
class var maximumSectionCount: Int
The maximum number of sections that the template can display.
var sectionCount: Int
The number of sections in the list.
var sections: [CPListSection]
The sections that the list displays.
func updateSections([CPListSection])
Adds, removes, reorders, or updates the list’s sections.
class CPListSection
A container that groups your list items into sections.
var assistantCellConfiguration: CPAssistantCellConfiguration?
The object that provides the configuration attributes for the assistant cell.
class CPAssistantCellConfiguration
An object that provides the configuration attributes for the assistant cell.
Topics
Creating a List Template
Managing Sections
Managing the Assistant Cell
Managing an Empty List


## Page 4

var emptyViewTitleVariants: [String]
An array of title variants for the template’s empty view.
var emptyViewSubtitleVariants: [String]
An array of subtitle variants for the template’s empty view.
class var maximumItemCount: Int
The maximum number of items, across all sections, that the template can display.
var itemCount: Int
The total number of items, across all sections, in the list.
func indexPath(for: any CPListTemplateItem) -> IndexPath?
Returns the index path for the specified item.
var title: String?
The title that the navigation bar displays when the template is visible.
var delegate: (any CPListTemplateDelegate)?
The object that serves as the delegate to the list template.
Deprecated
protocol CPListTemplateDelegate
The interface an object implements to serve as the delegate for a list template.
Deprecated
init(title: String?, sections: [CPListSection], assistantCell
Configuration: CPAssistantCellConfiguration?, headerGridButtons: [CPGri
Button]?)
Initialize a list template with one or more grid buttons to displayed in a list header.
var headerGridButtons: [CPGridButton]?
Getting Supplementary Information
Responding to List Events
Initializers
Instance Properties


## Page 5

Assigning to this property will dynamically update the List Template and show the new heade
var showsSpinnerWhileEmpty: Bool
If YES, a spinning activity indicator will be displayed while the list template contains no items
The activity indicator will be displayed in addition to any @c emptyViewTitleVariants or
class var maximumGridButtonImageSize: CGSize
The expected image size for your @c CPGridButton.
class var maximumHeaderGridButtonCount: Int
The maximum number of grid buttons that may appear in a @c CPListTemplate.
CPTemplate
CPBarButtonProviding
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Type Properties
Relationships
Inherits From
Conforms To
See Also


## Page 6

class CPGridTemplate
A template that displays and manages a grid of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
class CPTemplate
An abstract base class for interface templates.
protocol CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
General Purpose Templates


## Page 7

Use this template to display a grid of items as buttons. When creating the grid template, provide a
array of CPGridButton objects. Each button contains a title, an image, and an optional handler
that the system invokes after the user taps the button on the CarPlay screen.
When there are more than eight buttons in the array, the template displays only the first eight.
When there are more than four buttons, the template balances the display of the buttons betweem
two rows.
init(title: String?, gridButtons: [CPGridButton])
Creates a grid template with a title and a set of buttons.
class CPGridButton
A menu item button displayed on a grid template.
Overview
Topics
Creating a Grid Template
Getting the Grid Title
CarPlay / CPGridTemplate
Class
CPGridTemplate
A template that displays and manages a grid of items.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 8

var title: String
The title shown in the grid template’s navigation bar.
var gridButtons: [CPGridButton]
The array of grid buttons displayed on the template.
func updateGridButtons([CPGridButton])
func updateTitle(String)
class var maximumGridButtonImageSize: CGSize
The expected image size for your @c CPGridButton.
CPTemplate
CPBarButtonProviding
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Getting the Grid Buttons
Instance Methods
Type Properties
Relationships
Inherits From
Conforms To


## Page 9

SendableMetatype
class CPListTemplate
A template that displays and manages a list of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
class CPTemplate
An abstract base class for interface templates.
protocol CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
See Also
General Purpose Templates


## Page 10

CPTabBarTemplate is a container template that displays a collection of other templates, where
each template occupies a single tab in the tab bar. At runtime, use maximumTabCount to
determine the maximum number of tabs that your tab bar can display.
When creating an instance of CPTabBarTemplate, provide an array of templates for the tab bar
to display. CarPlay treats the array’s templates as root templates, each with its own navigation
hierarchy. When a tab bar template is the rootTemplate of your app’s interface controller and
you use the controller to add and remove templates, CarPlay applies those changes to the selecte
tab’s navigation hierarchy.
Note
You can’t add a tab bar template to an existing navigation hierarchy, or present one modally.
Instead, use setRootTemplate(_:animated:completion:) to set the tab bar as your
app’s root template.
Use a transactional approach when making changes to the tab bar. Retrieve the current set of
templates using the templates property. Add, remove, reorder, or make appearance changes to
one or more of the array’s templates. For example, use the tabTitle property to update a
template’s tab title, or set showsTabBadge to true to add an indicator to a template’s tab. Then
Overview
CarPlay / CPTabBarTemplate
Class
CPTabBarTemplate
A container template that displays and manages other templates, presenting them
as tabs.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 11

call the updateTemplates(_:) method and pass it the updated array. CarPlay commits those
changes and updates the tab bar.
When the user selects a tab, the template calls the tabBarTemplate(_:didSelect:) method
on its delegate, which is an object you provide that conforms to the CPTabBarTemplate
Delegate protocol.
init(templates: [CPTemplate])
Creates a tab bar template that displays the provided root templates as tabs.
var delegate: (any CPTabBarTemplateDelegate)?
The object that acts as the template’s delegate.
protocol CPTabBarTemplateDelegate
The methods an object implements to act as the delegate for a tab bar template.
var templates: [CPTemplate]
The tab bar’s templates.
func updateTemplates([CPTemplate])
Adds, removes, reorders, or updates the tab bar’s templates.
class var maximumTabCount: Int
The maximum number of tabs that the template can display.
var selectedTemplate: CPTemplate?
The currently selected template in the tab bar.
Topics
Creating a Tab Bar Template
Managing Tab Bar Interactions
Managing the Templates
Getting the Selected Template
Instance Methods


## Page 12

func select(CPTemplate)
func selectTemplate(at: Int)
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CPListTemplate
A template that displays and manages a list of items.
class CPGridTemplate
A template that displays and manages a grid of items.
class CPTemplate
An abstract base class for interface templates.
protocol CPBarButtonProviding
Relationships
Inherits From
Conforms To
See Also
General Purpose Templates


## Page 13

The methods that templates use to provide buttons for the navigation bar.


## Page 14

CPTemplate is an abstract base class for defining CarPlay user interface templates. It provides
the common functionality present in all templates.
You don’t use this class directly, or create your own subclasses. Instead, you must use one of the
prebuilt templates, such as CPListTemplate or CPGridTemplate.
var userInfo: Any?
Any custom data or object that you want to associate with the template.
var tabTitle: String?
A short title that describes the content of the tab.
var tabImage: UIImage?
Overview
Topics
Accessing Template Information
Accessing Tab Information
CarPlay / CPTemplate
Class
CPTemplate
An abstract base class for interface templates.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 15

An image that represents the content of the tab.
var tabSystemItem: UITabBarItem.SystemItem
A system object that provides a title and image for common tab content, such as contacts o
favorites.
var showsTabBadge: Bool
An indicator you use to call attention to the tab.
NSObject
CPActionSheetTemplate
CPAlertTemplate
CPContactTemplate
CPGridTemplate
CPInformationTemplate
CPListTemplate
CPMapTemplate
CPNowPlayingTemplate
CPPointOfInterestTemplate
CPSearchTemplate
CPTabBarTemplate
CPVoiceControlTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Relationships
Inherits From
Inherited By
Conforms To


## Page 16

Sendable
class CPListTemplate
A template that displays and manages a list of items.
class CPGridTemplate
A template that displays and manages a grid of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
protocol CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
See Also
General Purpose Templates


## Page 17

CPBarButtonProviding is a protocol that templates use to provide a Back button and leading
and trailing buttons for the navigation bar.
You don’t adopt this protocol in your own types. If you want to add buttons to the navigation bar,
you must use one of the prebuilt templates that already conforms to the protocol, such as CPMap
Template or CPContactTemplate.
Note
The root templates of a tab bar don’t show leading or trailing bar buttons, and the system
throws an exception if you attempt to assign bar buttons to the Now Playing template.
var backButton: CPBarButton?
A button to display as the Back button on the navigation bar.
Required
Overview
Topics
Providing Navigation Bar Buttons
CarPlay / CPBarButtonProviding
Protocol
CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 18

var leadingNavigationBarButtons: [CPBarButton]
An array of bar buttons to display on the leading side of the navigation bar.
Required
var trailingNavigationBarButtons: [CPBarButton]
An array of bar buttons to display on the trailing side of the navigation bar.
Required
class CPBarButton
A button for placement in a navigation bar.
class CPMessageComposeBarButton
A button that activates Siri and initiates the compose message flow.
NSObjectProtocol
CPContactTemplate
CPGridTemplate
CPInformationTemplate
CPListTemplate
CPMapTemplate
CPPointOfInterestTemplate
class CPListTemplate
A template that displays and manages a list of items.
class CPGridTemplate
Relationships
Inherits From
Conforming Types
See Also
General Purpose Templates


## Page 19

A template that displays and manages a grid of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
class CPTemplate
An abstract base class for interface templates.


