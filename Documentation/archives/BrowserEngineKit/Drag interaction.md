# Drag interaction.pdf

## Page 1

An interaction that enables your app to asynchronously provide drag items.
BEDragInteraction is a subclass of UIDragInteraction that additionally supports
asynchronous interaction.
When a person drags a UI element in your browser app, create a BEDragInteraction and atta
it to the source view. When you create the object, set its delegate to an object that conforms to
BEDragInteractionDelegate. Use the delegate to prepare the UIDragSession before the
system requests drag items, which it does by calling the delegate’s dragInteraction(_:item
ForBeginning:) method.
Overview
Overview
Topics
Creating a drag interaction
BrowserEngineKit / BEDragInteraction
Class
BEDragInteraction
A UIDragInteraction subclass with features specific to browsers to enable
asynchronous preparations and behaviours.
iOS 17.4+
iPadOS 17.4+


## Page 2

init(delegate: any BEDragInteractionDelegate)
Creates an drag interaction with the specified delegate.
var delegate: (any BEDragInteractionDelegate)?
The object that manages the drag interaction lifecycle.
protocol BEDragInteractionDelegate
A protocol to which the drag interaction delegates conform.
UIDragInteraction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
UIInteraction
protocol BEDragInteractionDelegate
A protocol to which the drag interaction delegates conform.
Handling drag gestures
Relationships
Inherits From
Conforms To
See Also
Drag interaction


## Page 3

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


## Page 4

Please refer to the aforementioned delegate method for its full documentation.
NSObjectProtocol, UIDragInteractionDelegate
class BEDragInteraction
A UIDragInteraction subclass with features specific to browsers to enable asynchronou
preparations and behaviours.
Relationships
Inherits From
See Also
Drag interaction


