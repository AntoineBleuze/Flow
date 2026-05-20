# Audio Units.pdf

## Page 1

This class doesn’t add any new methods or properties to its superclass, but it does conform to th
NSExtensionRequestHandling protocol.
A host app can access the view controller by calling the requestView
Controller(completionHandler:) method on the corresponding AUAudioUnit object.
If an audio unit provides a custom view controller, the UI Audio Unit extension must implement a
subclass of AUViewController and implement the AUAudioUnitFactory protocol inside the
subclass.
NSViewController, UIViewController
Overview
Subclassing Notes
Relationships
Inherits From
CoreAudioKit / AUViewController
Class
AUViewController
The base class to extend when creating a custom user interface for an audio unit.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

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
class AUAudioUnitViewConfiguration
A configuration object that describes how to present the audio unit’s user interface.
class AUGenericView
A view that provides a generic user interface for a Cocoa audio unit.
Conforms To
See Also
Audio Units


## Page 3

class AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio unit.
protocol AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data.


## Page 4

init(width: CGFloat, height: CGFloat, hostHasController: Bool)
Creates a new configuration object.
var width: CGFloat
The configured width.
var height: CGFloat
The configured height.
var hostHasController: Bool
A Boolean value that indicates whether the host shows its own control surface in this view
configuration.
Topics
Creating a Configuration
Accessing Settings
CoreAudioKit / AUAudioUnitViewConfiguration
Class
AUAudioUnitViewConfiguration
A configuration object that describes how to present the audio unit’s user
interface.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
visionOS 1.0+


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class AUViewController
The base class to extend when creating a custom user interface for an audio unit.
class AUGenericView
A view that provides a generic user interface for a Cocoa audio unit.
class AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio unit.
protocol AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data.
Relationships
Inherits From
Conforms To
See Also
Audio Units


## Page 6

init(audioUnit: AudioUnit)
Creates a generic view for an audio unit, setting all display flags.
init(audioUnit: AudioUnit, displayFlags: AUGenericViewDisplayFlags)
Initializes a generic view for an audio unit, setting specific display flags.
var showsExpertParameters: Bool
Indicates whether or not controls for expert audio unit parameters are displayed in the gener
view.
var audioUnit: AudioUnit
The audio unit associated with the generic view.
Topics
Creating a Generic View
Configuring a View
Accessing the Audio Unit
CoreAudioKit / AUGenericView
Class
AUGenericView
A view that provides a generic user interface for a Cocoa audio unit.
macOS 10.4+


## Page 7

NSView
AUCustomViewPersistentData
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
class AUViewController
The base class to extend when creating a custom user interface for an audio unit.
class AUAudioUnitViewConfiguration
A configuration object that describes how to present the audio unit’s user interface.
Relationships
Inherits From
Conforms To
See Also
Audio Units


## Page 8

class AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio unit.
protocol AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data.


## Page 9

init(audioUnit: AudioUnit)
Creates a panner view for an audio unit.
var audioUnit: AudioUnit
The panner audio unit associated with the generic panner view.
NSView
Topics
Creating a Panner View
Accessing the Audio Unit
Relationships
Inherits From
CoreAudioKit / AUPannerView
Class
AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio
unit.
macOS 10.5+


## Page 10

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
class AUViewController
The base class to extend when creating a custom user interface for an audio unit.
class AUAudioUnitViewConfiguration
A configuration object that describes how to present the audio unit’s user interface.
class AUGenericView
A view that provides a generic user interface for a Cocoa audio unit.
protocol AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data.
Conforms To
See Also
Audio Units


## Page 11

var customViewPersistentData: NSDictionary?
Called by the host application to obtain view state data from a custom Cocoa view.
Required
AUGenericView
Topics
Accessing View State
Relationships
Conforming Types
See Also
Audio Units
CoreAudioKit / AUCustomViewPersistentData
Protocol
AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data
macOS 10.6+


## Page 12

class AUViewController
The base class to extend when creating a custom user interface for an audio unit.
class AUAudioUnitViewConfiguration
A configuration object that describes how to present the audio unit’s user interface.
class AUGenericView
A view that provides a generic user interface for a Cocoa audio unit.
class AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio unit.


