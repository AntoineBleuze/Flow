# 000_Displaying the app extensions available to your app.pdf

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


