# View controller.pdf

## Page 1

Adding touch controls to games that support game controllers in iOS
On systems, such as tvOS, where the player uses the game controller to both navigate the system
interface and play your game, use a GCEventViewController object as the root view controlle
to selectively receive input directly from the game controller. You can’t simultaneously process
input through the responder chain and Game Controller input elements.
By default the system delivers input events to your app using the responder chain. To get the inpu
values through the game controller objects, set a GCEventViewController object as the root
view controller. The view controller delivers the input for its views and their subviews to the game
controller’s profile. To switch back to the responder chain, set the view controller’s controller
UserInteractionEnabled property to true.
Mentioned in
Overview
Topics
Delivering game controller inputs
Game Controller / GCEventViewController
Class
GCEventViewController
A view controller that delivers input either from the responder chain to views, or
from game controllers to profiles.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 2

var controllerUserInteractionEnabled: Bool
A Boolean value that indicates whether the system delivers game controller input to profile
objects or to views using the responder chain.
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
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
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
Relationships
Inherits From
Conforms To


