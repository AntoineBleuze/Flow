# 000_Including extension-based UI in your interface.pdf

## Page 1

When adding support for app extensions, you can configure one of your app’s extension points to
support a custom UI. You might choose this option when the app extension needs to manage the
presented content. For example, an image-editing app might let app extensions present their own
UI to configure custom image modifications.
To support app extensions with custom UI, both the app and app extensions must adopt the
ExtensionKit framework. To display the app extension’s UI, the host app presents a view controlle
from its interface. The app extension provides the content for that view controller, delivering it the
host app with the framework’s help.
To display custom UI from app extensions, the host app’s extension point must include the App
ExtensionPoint.UserInterface attribute in its extension point definition. When this attribu
is present and has a value of true, the host app can incorporate custom UI from its app
extensions. The following example shows an extension point definition that includes this attribute
Overview
Add the user interface attribute to your extension point
ExtensionKit / Including extension-based UI in your interface
Article
Including extension-based UI in your
interface
Build app extensions that provide a custom UI, and host those views in your app’s
interface.


## Page 2

In an app extension, the binding declaration you create remains the same whether or not you’re
providing custom UI. You’re expected to know whether the extension point requires a custom UI. 
you’re creating an app extension for another app, the app’s SDK needs to specify this information
You’re responsible for deciding how best to integrate UI from app extensions into your host app.
You might incorporate this content in a separate window, as part of an inspector, in a settings
panel, or in other ways.
To display the UI for an app extension, add an EXHostViewController to your app’s interface.
App extensions can provide multiple scenes of content, but the host view controller displays only
one of those scenes at a time. When configuring the view controller, specify the identity of the ap
extension and a string with the name of the scene you want to display in the view controller’s
configuration property. The app extension uses the scene name to deliver the correct set of
views to your app. To display a different scene, change the configuration details or display a new
host view controller.
When building your interface with SwiftUI, wrap the EXHostViewController in a representabl
type for the corresponding platform. The UIViewControllerRepresentable and NSView
ControllerRepresentable protocols give you a way to create a SwiftUI view using content
from a UIKit or AppKit view controller. The following example shows a SwiftUI view for macOS tha
wraps the EXHostViewController type. The view stores the scene name and app extension
identity as local variables, which it uses to configure the view controller.
Display a host view controller from your app’s interface


## Page 3

When you display an EXHostViewController in your app’s interface, either directly or as part 
a SwiftUI view, the view controller loads the relevant views from the app extension. Treat the view
controller’s content as opaque, and focus on where in your UI you want to display it. The following
example displays the UI from one or more app extensions using the custom ExtensionView typ
from the previous example. The custom viewModel object locates the available app extensions
using an AppExtensionPoint.Monitor type.
For information about how to get the list of app extension identities using a monitor, see
Discovering app extensions from your app.
To build an app extension with custom UI, create that UI using a special set of types from the
ExtensionKit framework. The recommended way to create your custom views is with SwiftUI, and
the framework provides SwiftUI scenes to incorporate into your app extension. When creating new
app extensions, the Xcode templates provide the initial views you need to build your UI.
Create the initial scene for your app extension


## Page 4

To create a new UI-based app extension:
1. Add a new target to your Xcode project.
2. Choose the Generic extension template.
3. Click Next.
4. In the options panel, set the extension type UI Extension.
5. Provide a name and specify other options for your app extension.
6. Click Finish.
The template code contains an initial code for you to modify. When starting from this template,
make most of your changes in the custom AppExtension type:
Put your SwiftUI views in the closure for the scene in the body property.
Update the information in the extension point binding. Specify the name of the host app and th
specific extension point you’re supporting.
Add any custom initialization code to the init() method.
The template’s ExampleScene type provides a concrete implementation of a scene that you can
use without modification. This scene delivers your SwiftUI views to the host app using a
PrimitiveAppExtensionScene structure. To display the correct scene, make sure the string
you passed to the initializer of this structure matches the scene the host app requests. In the
example code, specify the scene name using the sceneID property, as shown in the following
example:


## Page 5

If your app extension offers multiple scenes, create a separate AppExtensionScene type for
each unique scene you display. If you’re starting from the Xcode template, duplicate the Example
Scene type and update the type name and scene ID information. To make each new scene type
available, update the body property of the AppExtension subclass, as shown in the example
below. When the host app requests a scene, ExtensionKit determines which scene contains a
PrimitiveAppExtensionScene with the matching scene ID and returns its content.
ExtensionKit handles interface-related updates between the app extension and host app, but the
host app might still want to exchange data directly with the app extension. For example, a host ap
might need to send data to the app extension that’s unrelated to the UI. To facilitate this type of
transfer, the host app has two options:
Configure an XPC connection that’s tied to a specific instance of the app extension’s UI.
Configure an XPC connection that’s global to the app extension.
To communicate with a specific instance of the app extension’s UI, the host app makes an XPC
connection using its EXHostViewController object. Calling the makeXPCConnection()
method creates a connection to the PrimitiveAppExtensionScene type in the app extension
Use the onConnection handler of that type to accept the XPC connection request and provide
the host app with a proxy object, as shown in the following code:
Handle incoming XPC connection requests


## Page 6

To create a global connection that’s independent of a specific UI instance, the host app initiates t
XPC connection from its AppExtensionProcess type. The app extension responds to
connection requests using the accept(connection:) method in its AppExtension
Configuration type. For information about setting up this connection, see Building an app
extension to support a host app.
Creating and presenting an EXHostViewController from your app doesn’t guarantee the
appearance of an app extension’s UI. ExtensionKit might need to launch the app extension and ge
it running first, before the host app tries to create an XPC connection to it. Similarly, the app
extension might exit unexpectedly or require the dismantling of its views for other reasons. The
host view controller reports these changes to its associated delegate object.
When the app extension is ready to accept an XPC connection, the host view controller calls its
delegate’s hostViewControllerDidActivate(_:) method. Use this method to initiate the
XPC connection and start communication with the app extension. Similarly, use the delegate’s
hostViewControllerWillDeactivate(_:error:) to close out the current connection and
stop communicating with the app extension.
Respond to activation and deactivation events


