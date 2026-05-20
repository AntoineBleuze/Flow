# Instrument cluster.pdf

## Page 1

var attributedInactiveDescriptionVariants: [NSAttributedString]
var compassSetting: CPInstrumentClusterSetting
var delegate: (any CPInstrumentClusterControllerDelegate)?
var inactiveDescriptionVariants: [String]
var instrumentClusterWindow: UIWindow?
var speedLimitSetting: CPInstrumentClusterSetting
NSObject
CVarArg
Topics
Instance Properties
Relationships
Inherits From
Conforms To
CarPlay / CPInstrumentClusterController
Class
CPInstrumentClusterController
iOS 15.4+
iPadOS 15.4+
Mac Catalyst 15.4+


## Page 2

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CPInstrumentClusterControllerDelegate
class CPTemplateApplicationInstrumentClusterScene
protocol CPTemplateApplicationInstrumentClusterSceneDelegate
See Also
Instrument cluster


## Page 3

func instrumentClusterController(CPInstrumentClusterController, did
ChangeCompassSetting: CPInstrumentClusterSetting)
func instrumentClusterController(CPInstrumentClusterController, did
ChangeSpeedLimitSetting: CPInstrumentClusterSetting)
func instrumentClusterControllerDidConnect(UIWindow)
Required
func instrumentClusterControllerDidDisconnectWindow(UIWindow)
Required
func instrumentClusterControllerDidZoom(in: CPInstrumentCluster
Controller)
func instrumentClusterControllerDidZoomOut(CPInstrumentClusterControlle
)
Topics
Instance Methods
Relationships
CarPlay / CPInstrumentClusterControllerDelegate
Protocol
CPInstrumentClusterControllerDelegate
iOS 15.4+
iPadOS 15.4+
Mac Catalyst 15.4+


## Page 4

NSObjectProtocol
class CPInstrumentClusterController
class CPTemplateApplicationInstrumentClusterScene
protocol CPTemplateApplicationInstrumentClusterSceneDelegate
Inherits From
See Also
Instrument cluster


## Page 5

var contentStyle: UIUserInterfaceStyle
var delegate: (any CPTemplateApplicationInstrumentClusterSceneDelegate)
var instrumentClusterController: CPInstrumentClusterController
UIScene
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Instance Properties
Relationships
Inherits From
Conforms To
CarPlay / CPTemplateApplicationInstrumentClusterScene
Class
CPTemplateApplicationInstrumentCluster
Scene
iOS 15.4+
iPadOS 15.4+
Mac Catalyst 15.4+


## Page 6

Equatable
Hashable
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIUserActivityRestoring
class CPInstrumentClusterController
protocol CPInstrumentClusterControllerDelegate
protocol CPTemplateApplicationInstrumentClusterSceneDelegate
See Also
Instrument cluster


## Page 7

func contentStyleDidChange(UIUserInterfaceStyle)
func templateApplicationInstrumentClusterScene(CPTemplateApplication
InstrumentClusterScene, didConnect: CPInstrumentClusterController)
func templateApplicationInstrumentClusterScene(CPTemplateApplication
InstrumentClusterScene, didDisconnectInstrumentClusterController:
CPInstrumentClusterController)
NSObjectProtocol, UISceneDelegate
Topics
Instance Methods
Relationships
Inherits From
CarPlay / CPTemplateApplicationInstrumentClusterSceneDelegate
Protocol
CPTemplateApplicationInstrumentCluster
SceneDelegate
iOS 15.4+
iPadOS 15.4+
Mac Catalyst 15.4+


## Page 8

class CPInstrumentClusterController
protocol CPInstrumentClusterControllerDelegate
class CPTemplateApplicationInstrumentClusterScene
See Also
Instrument cluster


