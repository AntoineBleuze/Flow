# Extension-point management.pdf

## Page 1

Adding support for app extensions to your app
Building an app extension to support a host app
Use this type both to declare your app’s supported extension points and to bind to those extensio
points. To declare an extension point your app supports, extend this type by adding a static
variable with the details of your extension point. Annotate your variable with the AppExtension
Point.Definition property wrapper and specify the name and other attributes of your
extension point. The following example adds two extension point with different configurations:
Mentioned in
Overview
ExtensionFoundation / AppExtensionPoint
Structure
AppExtensionPoint
A type you use to declare your host app’s extension points and bind to them from
app extensions.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 1.1+
watchOS 26.0+


## Page 2

In addition to defining your app’s extension points, use this type in an app extension to bind to an
extension point. In your app extension’s source code, add a variable that contains the App
ExtensionPoint type. Set the value of that variable to the extension point identifier you suppo
Annotate your variable declaration with the AppExtensionPoint.Bind property wrapper, as
shown in the following example:
To make extension point and binding information available at runtime, use the compiler to add the
relevant information to your built products. In your Xcode project, add the EX_ENABLE
_EXTENSION_POINT_GENERATION flag to the build settings of your host app and app extension
When the value of the flag is true, the compiler collects the target’s extension point definitions o
bindings and writes them to the target’s bundle. For example, it creates a special file in the host
app’s bundle and adds the extension point definitions to that file. The system collects definition a
binding information at installation time and uses it to match the host app to relevant app
extensions.
init(identifier: StaticString) throws
Initializes the type with a string you can use to find the extension point.
struct Definition
A property wrapper that a host app uses to declare the extension points it supports.
Topics
Creating an app-extension point
Declaring an extension point


## Page 3

struct Name
A type that defines the name of an extension point.
struct UserInterface
A type with that indicates whether the extension point displays UI from an app extension.
struct EnhancedSecurity
A type that indicates whether an extension point requires extra security.
struct Scope
A type that regulates which app extensions may access an extension point.
protocol Attribute
An interface that marks a type as an extension point attribute.
struct Bind
A property wrapper that binds an app extension to an extension point of a host app.
struct Identifier
The details of an extension point that your app extension supports.
class Monitor
A type you use to discover the app extensions available for your host app to use.
enum Error
Error codes for monitor-related requests.
protocol Capability
An interface that marks a type as an extension capability.
Binding to an extension point
Detecting app extensions
Getting error codes
Protocols
Structures


## Page 4

struct Capabilities
The capabilities that an your extension implements
Copyable
Equatable
ExtensionPointDefining
Hashable
Identifiable
Sendable
SendableMetatype
protocol ExtensionPointDefining
An interface that extension point types adopt.
Relationships
Conforms To
See Also
Extension-point management


## Page 5

The ExtensionFoundation framework uses this protocol to identify types that represent extension
points.
AppExtensionPoint
struct AppExtensionPoint
Overview
Relationships
Conforming Types
See Also
Extension-point management
ExtensionFoundation / ExtensionPointDefining
Protocol
ExtensionPointDefining
An interface that extension point types adopt.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 1.1+
watchOS 26.0+


## Page 6

A type you use to declare your host app’s extension points and bind to them from app
extensions.


