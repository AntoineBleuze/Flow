# 000_BEDragInteraction.pdf

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


