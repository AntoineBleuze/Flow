# Scroll view interaction.pdf

## Page 1

Use BEScrollView instead of UIScrollView in situations where you need to:
Handle scroll updates programmatically, potentially overriding the default scroll view behavior.
Have scroll views that are siblings in the view hierarchy but nested in the browser Document
Object Model (DOM).
If either of these is true, replace your use of UIScrollView with BEScrollView and set the
scroll view’s delegate to an object that implements the BEScrollViewDelegate methods.
var delegate: (any BEScrollViewDelegate)?
The delegate of the scroll view.
Overview
Topics
Responding to scroll updates
BrowserEngineKit / BEScrollView
Class
BEScrollView
A scroll view that works with its delegate to handle nesting, and customize scroll
interactions.
iOS 17.4+
iPadOS 17.4+
tvOS 17.4+
visionOS 1.1+


## Page 2

UIScrollView
CALayerDelegate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
Sendable
SendableMetatype
UIAccessibilityIdentification
UIActivityItemsConfigurationProviding
UIAppearance
UIAppearanceContainer
UICoordinateSpace
UIDynamicItem
UIFocusEnvironment
UIFocusItem
UIFocusItemContainer
UIFocusItemScrollableContainer
UILargeContentViewerItem
UIPasteConfigurationSupporting
UIPopoverPresentationControllerSourceItem
UIResponderStandardEditActions
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Relationships
Inherits From
Conforms To
See Also


## Page 3

class BEScrollViewScrollUpdate
An object that represents a change in a scroll view’s scroll state.
protocol BEScrollViewDelegate
The protocol that browser scroll view delegates conform to.
Scroll view interaction


## Page 4

When a person scrolls a BEScrollView, the view’s delegate receives the scrollView(_:
handle:completion:) method. The handle parameter is an instance of BEScrollView
ScrollUpdate that describes the scroll activity.
Your app can continue to receive BEScrollViewScrollUpdate objects after the person
completes their scroll gesture, as the scrolling decelerates.
Important
BEScrollViewScrollUpdate isn’t thread-safe, and the system uses the same object for
multiple scroll updates. When you receive a scroll update, immediately get the information you
need on the main queue before any other processing.
var timestamp: TimeInterval
Overview
Topics
Retrieving scroll state information
BrowserEngineKit / BEScrollViewScrollUpdate
Class
BEScrollViewScrollUpdate
An object that represents a change in a scroll view’s scroll state.
iOS 17.4+
iPadOS 17.4+
tvOS 17.4+
visionOS 1.1+


## Page 5

The time at which the scroll update occurred.
var phase: BEScrollViewScrollUpdate.Phase
The point in the scrolling lifecycle represented by the scroll update.
enum Phase
The phase of a scroll update in a scroll gesture’s lifecycle.
func location(in: UIView?) -> CGPoint
Returns the coordinates of the scroll update in the given view’s bounds.
func translation(in: UIView?) -> CGPoint
Returns the amount of scrolling in the scroll update in the given view’s coordinates.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
Transforming coordinates
Relationships
Inherits From
Conforms To
See Also
Scroll view interaction


## Page 6

class BEScrollView
A scroll view that works with its delegate to handle nesting, and customize scroll interactions
protocol BEScrollViewDelegate
The protocol that browser scroll view delegates conform to.


## Page 7

func parentScrollView(for: BEScrollView) -> BEScrollView?
Indicates that a sibling scroll view in the view hierarchy acts as the scroll view’s container in
the Document Object Model (DOM).
func scrollView(BEScrollView, handle: BEScrollViewScrollUpdate,
completion: (Bool) -> Void)
Handles a scroll update, optionally stopping the scroll view from reacting.
Topics
Nesting sibling scroll views
Handling scroll events
Relationships
Inherits From
BrowserEngineKit / BEScrollViewDelegate
Protocol
BEScrollViewDelegate
The protocol that browser scroll view delegates conform to.
iOS 17.4+
iPadOS 17.4+
tvOS 17.4+
visionOS 1.1+


## Page 8

NSObjectProtocol, UIScrollViewDelegate
class BEScrollView
A scroll view that works with its delegate to handle nesting, and customize scroll interactions
class BEScrollViewScrollUpdate
An object that represents a change in a scroll view’s scroll state.
See Also
Scroll view interaction


