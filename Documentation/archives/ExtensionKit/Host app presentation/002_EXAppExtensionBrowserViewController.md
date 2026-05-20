# 002_EXAppExtensionBrowserViewController.pdf

## Page 1

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


## Page 2

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


## Page 3

A view controller that hosts remote views provided by an app extension.


