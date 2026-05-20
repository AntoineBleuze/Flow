# 002_BEScrollViewDelegate.pdf

## Page 1

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


## Page 2

NSObjectProtocol, UIScrollViewDelegate
class BEScrollView
A scroll view that works with its delegate to handle nesting, and customize scroll interactions
class BEScrollViewScrollUpdate
An object that represents a change in a scroll view’s scroll state.
See Also
Scroll view interaction


