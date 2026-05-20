# 000_Adding support for app extensions to your app.pdf

## Page 1

App extensions are a way to extend your app’s features safely, using code that runs in a separate
process. An app extension is a bundle that’s separate from your app but contains code that works
in tandem with that app. A productivity app might use app extensions to run potentially risky code
in an isolated process, rather than in the app itself. An app might also use app extensions to
incorporate new capabilities from external developers. For example, a video editing app might allo
developers to create their own filters or tools and integrate them into the video editing workflow.
The host app determines when to run an app extension, and defines the API that both it and the
app extension use to communicate. Apps use the ExtensionFoundation framework to launch app
extensions and start them running in a separate process. Apps also use the framework to establis
an XPC connection to an app extension, which allows the two processes to communicate with eac
other. App extensions similarly use the framework to start up and respond to XPC connection
requests.
Communication between an app and its app extensions occurs through well-defined interfaces th
the app’s creator defines. When adding support for app extensions to your app, consider what
features you want those extensions to support. Build APIs around specific features and launch ap
extensions that implement those APIs. For example, an image-editing app might define an API to
manipulate the contents of an image. Typically, you define your API using protocols, but you can
define other types too.
The APIs you define must be interoperable with the XPC technology that the app and app extensi
use to communicate. The ExtensionFoundation framework lets you create an XPC connection usin
Overview
Define an API for shared communication
ExtensionFoundation / Adding support for app extensions to your app
Article
Adding support for app extensions to your
app
Create an app extension model by defining your code’s extension points and
communicating with app extensions at runtime.


## Page 2

types in the Foundation framework or types from the lighter-weight XPC framework. Both
technologies offer similar features, but the XPC framework is a better option for exchanging data
with an app extension running in a hardened sandbox. For additional information about how to bu
your custom APIs to support XPC, see the documentation for those technologies.
Apps define extension points to ensure that the app extensions they launch are capable of
performing the correct tasks. An extension point corresponds to one of the app’s features, and yo
define it by assigning a name and other relevant attributes. For example, you might define an
extension point for modifying the contents of an image. Host apps define their extension points in
code using ExtensionFoundation types, which the compiler turns into an .appext file that ships
inside the app’s bundle. The system uses the contents of that file to locate matching app
extensions.
An app may define multiple extension points, but each app extension supports only one extension
point. An app might use different extension points to support different features. For example, a
video editing app might use one extension point for video filters and a different extension point fo
file exporters. When defining each extension point, consider the interaction model between your
app and the app extensions and add any attributes that apply:
User interface support. App extensions can do work with or without providing a custom UI. If a
extension point requires a UI, the app and app extensions must also adopt the ExtensionKit
framework, and use that framework to present the UI.
Enhanced security. If an app extension processes unknown data or handles external input, you
can choose to run it in a restrictive sandbox to minimize any potential damage from malicious
code. The system requires app extensions to have specific sandbox-related entitlements.
Scope. You might choose to run app extensions that reside anywhere in the system, or that
reside only inside your app’s bundle. Extension points adopt the bundle-only approach by
default, but you can use this attribute to allow external developers to contribute app extensions
Define your app’s extension points programmatically using the AppExtensionPoint
.Definition property wrapper. In your app’s code, extend the AppExtensionPoint type and
add a static variable with your extension point definition. Add the AppExtensionPoint.Name
attribute and any other attributes relevant for your extension point. The following example creates
minimal extension point without any UI or enhanced security:
Define your app’s extension points in code


## Page 3

To add additional attributes, add them to your extension point definition. The following example
creates an extension point for an app that displays custom greetings. The scope attribute opens u
the extension point to app extensions anywhere on the system.
At runtime, the system uses your app’s .appext file to obtain its extension point information and
match your app to app extensions. Starting in iOS 26, iPadOS 26, macOS 26, tvOS 26, and
watchOS 26, Xcode supports the programmatic creation this file from the extension point
definitions in your app’s source code. To generate this file programmatically, add a user-defined
build setting to your app target in Xcode. Set the build setting name to EX_ENABLE_EXTENSION
_POINT_GENERATION and configure it with a value of YES.
Note
In you already created an .appext file for your app, you may continue to use the file you
created.
In your app’s code, you decide when is the best time to launch an app extension and take
advantage of its features. When a particular task requires an app extension, use the
ExtensionFoundation framework to find the extension you want and launch it. As part of the launc
process, establish an XPC connection to the app extension and use that connection to send and
receive data.
After locating the app extension you want to run, create and configure an AppExtension
Process structure in your app. The configuration object you pass to the initializer contains the a
extension’s identity along with code to handle potential issues. The system returns a new instance
of the type to your code only after the successfully connecting to the new process. When you hav
that instance, create an XPC connection and retrieve the remote object to use for communication
as shown in the following code:
Launch an app extension and connect to it using XPC


## Page 4

Note
The system connects to an existing process when one is available or launches a new process
as needed. After launch, the app extension runs long enough for you to create an XPC
connection to it. If you don’t make a connection right away, the system may suspend the app
extension, waking it again only when you subsequently try to make an XPC connection to it.
Use the proxy object from your XPC connection to send data to the app extension and receive
responses. The proxy object is local to your app, but doesn’t do the actual work associated with it
interface. Instead, proxy objects forward requests to the app extension’s process for fulfillment.
For information about how to find the app extensions available for you to run, see Discovering app
extensions from your app. For information about how to accept an XPC connection in your app
extension code, see Building an app extension to support a host app. For information about how t
connect to an app extension with custom UI, see Including extension-based UI in your interface.
When your app no longer needs an app extension, call the invalidate() method of the
associated AppExtensionProcess structure. Invalidating an app extension process severs the
current connection to that process, but doesn’t automatically terminate it. If an app extension has
multiple active connections, the system keeps the process alive until the last connection closes.
Important
Keep a strong reference to any AppExtensionProcess structures you create.
If you don’t maintain a reference to the structures, the system invalidates connections to those
app extensions automatically.
If the app extension’s process terminates unexpectedly, the AppExtensionProcess structure
runs the onInterruption handler you supplied at configuration time. Use that handler to clean
up references to proxy objects and the associated XPC connection types.
Unload app extensions when you finish with them


