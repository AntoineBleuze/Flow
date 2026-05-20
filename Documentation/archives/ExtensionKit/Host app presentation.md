# Host app presentation.pdf

## Page 1

Host apps can retrieve the list of currently available app extensions programmatically, but the
person using the app might also need to see those extensions. The system automatically disables
any app extensions that ship separately from their host app, and reenabling them requires manua
intervention from the owner of the device. On macOS, a person can enable and disable extension
from the Settings app. However, ExtensionKit also provides a custom interface that you can show
directly from your app.
When designing your app’s interface, consider the workflow for managing any app extensions.
Include UI for enabling and disabling extensions in a readily accessible part of your app. For
example, present this information in your app’s settings so that people can get to it at any time.
When showing this type of content, always use the system-provided interface instead of trying to
gather the information yourself. The system interface provide the only comprehensive list of app
extensions on the device, along with the controls to enable or disable them correctly.
To display a list of app extensions associated with your app, include an EXAppExtension
BrowserViewController in your app’s interface. This view controller displays the extensions
for all of your app’s extension points. In addition to the name of each extension, the interface
displays controls to enable or disable each one.
In a UIKit- or AppKit-based app, you can present an EXAppExtensionBrowserView
Controller object as you would any other view controller. For example, you can add it to a
navigation stack or integrate it into your app’s settings interface. In a SwiftUI app, create a type th
adopts the UIViewControllerRepresentable or NSViewControllerRepresentable
Overview
Display the app extension browser
ExtensionKit / Displaying the app extensions available to your app
Article
Displaying the app extensions available to
your app
Show the app extensions available to your app, so that people can approve, enabl
or disable them.


## Page 2

protocol, and present that type from your interface. The following example shows a typical
implementation of this type for a SwiftUI interface in macOS:
The interface of the EXAppExtensionBrowserViewController type runs out of process, an
the type itself doesn’t notify your app of any changes. When someone enables or disables an
extension from this interface, the system notifies your app through its AppExtensionPoint
.Monitor type. For more information about receiving updates from this type, see Discovering ap
extensions from your app.
In addition to providing details about the available extensions, the AppExtensionPoint
.Monitor type also reports the number of disabled and unapproved app extensions for your app
To get this information, fetch the value of your monitor’s state property. If the number of
unapproved app extensions is greater than zero, consider alerting the person to this fact from you
interface. Someone using your app might not know that app extensions are waiting for approval. A
badge in the appropriate part of your interface, or a one-time notification can alert people to this
information without being too invasive.
class EXHostViewController
A view controller that hosts remote views provided by an app extension.
Notify people when unapproved extensions are waiting
See Also
Host app presentation


## Page 3

class EXAppExtensionBrowserViewController
A view controller that displays an interface to enable or disable the host app’s extensions.


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Displaying the app extensions available to your app
When your host app supports app extensions, use this view controller to give people a way to
enable or disable those extensions. When you present this view controller, the system displays an
out-of-process UI with a list of all app extensions that support your app’s extension points.
Someone using your app can use the presented interface to enable or disable extensions
selectively. App extensions you include inside your host app’s bundle are enabled by default, but
extensions that ship in separate apps are disabled by default.
Present this view controller modally from your app, or embed the view controller as a child in one 
your existing view controller interfaces. For example, you might choose to embed the view
controller in a tab of your app’s preferences interface.
Mentioned in
Overview
Relationships
Inherits From
ExtensionKit / EXAppExtensionBrowserViewController
Class
EXAppExtensionBrowserViewController
A view controller that displays an interface to enable or disable the host app’s
extensions.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 13.0+


## Page 8

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
Displaying the app extensions available to your app
Show the app extensions available to your app, so that people can approve, enable, or disab
them.
class EXHostViewController
Conforms To
See Also
Host app presentation


## Page 9

A view controller that hosts remote views provided by an app extension.


