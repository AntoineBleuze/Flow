# Accessibility.pdf

## Page 1

In your alternative browser engine, implement BEAccessibilityTextMarkerSupport on
views that represent elements in the Document Object Model (DOM) to supply accessibility
information about the element’s text to the system.
func accessibilityNextTextMarker(BEAccessibilityTextMarker) ->
BEAccessibilityTextMarker?
Returns the text marker that follows the given text marker.
Required
func accessibilityPreviousTextMarker(BEAccessibilityTextMarker) ->
BEAccessibilityTextMarker?
Returns the text marker that precedes the given text marker.
Required
Overview
Topics
Text positions
BrowserEngineKit / BEAccessibilityTextMarkerSupport
Protocol
BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive
features.
iOS 18.2+
iPadOS 18.2+
macOS
tvOS 18.2+
visionOS 2.2+


## Page 2

func accessibilityLineStartMarker(for: BEAccessibilityTextMarker) ->
BEAccessibilityTextMarker?
Returns the text marker that represents the start of the line that contains the given text
marker.
Required
func accessibilityLineEndMarker(for: BEAccessibilityTextMarker) ->
BEAccessibilityTextMarker?
Returns the text marker that represents the end of the line that contains the given text marke
Required
func accessibilityMarker(for: CGPoint) -> BEAccessibilityTextMarker?
Returns the text marker at a point in the view’s coordinate system.
Required
func accessibilityTextMarker(forPosition: Int) -> BEAccessibilityText
Marker?
Returns the text marker for the text at a given index in the element’s text.
Required
class BEAccessibilityTextMarker
An abstract class that represents a location in an element’s accessibility text.
func accessibilityBounds(for: BEAccessibilityTextMarker.Range) -> CGRec
Calculates the bounding rectangle for a text range.
Required
func accessibilityTextMarkerRange() -> BEAccessibilityTextMarker.Range
The text marker range of the current element.
Required
func accessibilityTextMarkerRangeForCurrentSelection() ->
BEAccessibilityTextMarker.Range?
The text marker range of the current selection.
Required
func accessibilityTextMarkerRange(for: NSRange) -> BEAccessibilityText
Marker.Range?
Returns the text marker range for the text in a given range.
Required
Text ranges


## Page 3

func accessibilityRange(for: BEAccessibilityTextMarker.Range) -> NSRang
Returns the range for the text in a given accessibility marker range.
Required
class Range
A class that represents a range in an element’s accessibility text.
func accessibilityContent(for: BEAccessibilityTextMarker.Range) ->
String?
Returns the accessibility content for a text range.
Required
NSObjectProtocol
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
Instance Methods
Relationships
Inherits From
See Also
Accessibility


## Page 4

static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 5

Post this notification when the value of an input element changes, when someone or a script adds
text to a text control or removes text from a text control, or when the aria-valuenow or aria-
valuetext attributes of an element change.
If an element contains a text selection and the content changes, or the editing cursor position
changes, post this notification followed by selectionChangedNotification for the element
protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
Overview
See Also
Accessibility
BrowserEngineKit / BEAccessibility / valueChangedNotification
Type Property
valueChangedNotification
The notification you post when the value of an element changes.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 6

enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 7

If an element contains a text selection and the content changes, or the editing cursor position
changes, post this notification after posting valueChangedNotification for the element.
protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
Discussion
See Also
Accessibility
BrowserEngineKit / BEAccessibility / selectionChangedNotification
Type Property
selectionChangedNotification
The notification you post when the selection inside an element changes.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 8

The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 9

Set a value from this enumeration for an element’s browserAccessibilityContainerType
property to indicate the type of container in which the element is located. For example, set table
as the browserAccessibilityContainerType for an element within a table cell.
static var landmark: BEAccessibilityContainerType
A website accessibility landmark contains the element.
static var table: BEAccessibilityContainerType
A table contains the element.
static var list: BEAccessibilityContainerType
A list contains the element.
static var fieldset: BEAccessibilityContainerType
An HTML fieldset element contains the element.
Overview
Topics
Container types
BrowserEngineKit / BEAccessibilityContainerType
Structure
BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is locate
iOS 18.0+
iPadOS 18.0+
macOS
tvOS 18.0+
visionOS 2.0+


## Page 10

static var dialog: BEAccessibilityContainerType
A dialog contains the element.
static var tree: BEAccessibilityContainerType
A tree contains the element.
static var frame: BEAccessibilityContainerType
A frame contains the element.
static var article: BEAccessibilityContainerType
An HTML article element contains the alert.
static var semanticGroup: BEAccessibilityContainerType
A semantic group contains the element.
static var scrollArea: BEAccessibilityContainerType
A scroll area contains the element.
static var alert: BEAccessibilityContainerType
An alert contains the element.
static var descriptionList: BEAccessibilityContainerType
A description list contains the element.
init(rawValue: UInt)
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
Initializers
Relationships
Conforms To


## Page 11

SetAlgebra
protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.
See Also
Accessibility


## Page 12

case `false`
The element isn’t pressed.
case `true`
The element is pressed.
case mixed
The element is in a mixed state.
case undefined
The element is in an undefined state.
init?(rawValue: Int)
Topics
Element states
Initializers
Relationships
BrowserEngineKit / BEAccessibilityPressedState
Enumeration
BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
iOS 18.0+
iPadOS 18.0+
macOS
tvOS 18.0+
visionOS 2.0+


## Page 13

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
Conforms To
See Also
Accessibility


## Page 14

The accessibility element behaves like a link that someone previously visited.


## Page 15

protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
See Also
Accessibility
BrowserEngineKit / BEAccessibility / menuItem
Type Property
menuItem
The accessibility element behaves like a menu item.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 16

static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 17

protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
See Also
Accessibility
BrowserEngineKit / BEAccessibility / popUpButton
Type Property
popUpButton
The accessibility element behaves like a pop-up button.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 18

static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 19

protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
See Also
Accessibility
BrowserEngineKit / BEAccessibility / radioButton
Type Property
radioButton
The accessibility element behaves like a radio button.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 20

static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 21

protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
See Also
Accessibility
BrowserEngineKit / BEAccessibility / readOnly
Type Property
readOnly
The accessibility element is read-only.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 22

static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var visited: UIAccessibilityTraits
The accessibility element behaves like a link that someone previously visited.


## Page 23

protocol BEAccessibilityTextMarkerSupport
A set of methods that provide information about text offsets to support assistive features.
static var valueChangedNotification: UIAccessibility.Notification
The notification you post when the value of an element changes.
static var selectionChangedNotification: UIAccessibility.Notification
The notification you post when the selection inside an element changes.
struct BEAccessibilityContainerType
An enumeration that indicates the type of container in which an element is located.
enum BEAccessibilityPressedState
An enumeration that indicates whether an element is pressed.
static var menuItem: UIAccessibilityTraits
The accessibility element behaves like a menu item.
static var popUpButton: UIAccessibilityTraits
The accessibility element behaves like a pop-up button.
See Also
Accessibility
BrowserEngineKit / BEAccessibility / visited
Type Property
visited
The accessibility element behaves like a link that someone previously visited.
iOS 18.0+
iPadOS 18.0+
tvOS 18.0+
visionOS 2.0+


## Page 24

static var radioButton: UIAccessibilityTraits
The accessibility element behaves like a radio button.
static var readOnly: UIAccessibilityTraits
The accessibility element is read-only.


