# 001_EXHostViewController.pdf

## Page 1

Including extension-based UI in your interface
Present this view controller from your app’s interface to display the content for an associated app
extension. Configure the view controller with the app extension identity and the specific scene yo
want to display. Use the associated delegate object to receive notifications when the app extensio
becomes active or inactive.
For more information about presenting this view controller and using it to display an app
extension’s UI, see Including extension-based UI in your interface.
var configuration: EXHostViewController.Configuration?
The information the host view controller uses to fetch the appropriate scene from an app
extension.
Mentioned in
Overview
Topics
Configuring the view controller
ExtensionKit / EXHostViewController
Class
EXHostViewController
A view controller that hosts remote views provided by an app extension.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 13.0+


## Page 2

struct Configuration
An object that holds configuration options for a host view controller.
var placeholderView: UIView
The view to display when the view controller has no app extension content to display.
func makeXPCConnection() throws -> NSXPCConnection
Initiates an XPC connection to the app extension’s scene.
var delegate: (any EXHostViewControllerDelegate)?
A custom delegate object you use to receive notifications about the activation and
deactivation of the app extension.
protocol EXHostViewControllerDelegate
An interface you use to track the activation and deactivation of an app extension.
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
Connecting to the app extension
Responding to activation and deactivation events
Relationships
Inherits From
Conforms To


## Page 3

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
Displaying the app extensions available to your app
Show the app extensions available to your app, so that people can approve, enable, or disab
them.
class EXAppExtensionBrowserViewController
A view controller that displays an interface to enable or disable the host app’s extensions.
See Also
Host app presentation


