# 000_CPListTemplate.pdf

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


