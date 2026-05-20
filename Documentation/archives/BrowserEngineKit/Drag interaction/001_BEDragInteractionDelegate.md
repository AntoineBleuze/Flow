# 001_BEDragInteractionDelegate.pdf

## Page 1

Use BEDragInteraction and its delegate to asynchronously prepare drag interactions and add
items to drag sessions, for example when supporting drag interaction requires Javascript
execution. If you don’t need to asynchronously interact with drag interactions, use UIDrag
Interaction instead.
func dragInteraction(BEDragInteraction, prepare: any UIDragSession,
completion: () -> Bool)
Called when the drag interaction has begun, to allow the delegate to prepare for the drag
session before the system requests drag items through -dragInteraction:itemsFor
BeginningSession:.
func dragInteraction(BEDragInteraction, itemsForAddingTo: any UIDrag
Session, forTouchAt: CGPoint, completion: ([UIDragItem]) -> Bool)
The asynchronous counterpart to -dragInteraction:itemsForAddingToSession:
withTouchAtPoint: to allow touches on this view to add items to an existing drag sessio
Overview
Topics
Participating in drag gestures
BrowserEngineKit / BEDragInteractionDelegate
Protocol
BEDragInteractionDelegate
A protocol to which the drag interaction delegates conform.
iOS 17.4+
iPadOS 17.4+


## Page 2

Please refer to the aforementioned delegate method for its full documentation.
NSObjectProtocol, UIDragInteractionDelegate
class BEDragInteraction
A UIDragInteraction subclass with features specific to browsers to enable asynchronou
preparations and behaviours.
Relationships
Inherits From
See Also
Drag interaction


