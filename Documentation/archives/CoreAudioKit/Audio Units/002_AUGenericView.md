# 002_AUGenericView.pdf

## Page 1

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


## Page 2

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


## Page 3

class AUPannerView
A view that provides a specialized user interface for a Cocoa-based panner audio unit.
protocol AUCustomViewPersistentData
A protocol that defines the methods an Audio Unit host calls to manage view data.


