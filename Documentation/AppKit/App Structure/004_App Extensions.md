# 004_App Extensions.pdf

## Page 1

class NSExtensionContext
The host app context from which an app extension is invoked.
protocol NSExtensionRequestHandling
The interface an app extension uses to respond to a request from a host app.
Quick Actions allow your app extension to appear in the Finder Preview pane, Quick Actions menu
and Touch Bar.
Add Functionality to Finder with Action Extensions
Implement Action Extensions to provide quick access to commonly used features of your ap
NSExtensionServiceAllowsFinderPreviewItem
A Boolean value indicating whether the extension appears in the Finder Preview pane and
Quick Actions menu.
NSExtensionServiceFinderPreviewLabel
A name for display when the extension appears in the Finder Preview pane and Quick Action
menu.
NSExtensionServiceFinderPreviewIconName
Topics
Extension Support
Quick Actions
AppKit / App Extensions
API Collection
App Extensions
Extend your app’s basic functionality to other parts of the system.


## Page 2

The name of an icon for display when the extension appears in the Finder Preview pane and
Quick Actions menu.
NSExtensionServiceAllowsTouchBarItem
A Boolean value indicating whether the extension appears as a Quick Action in the Touch Ba
NSExtensionServiceTouchBarLabel
A name for display when the extension appears as a Quick Action in the Touch Bar.
NSExtensionServiceTouchBarIconName
The name of an icon for display when the extension appears as a Quick Action in the Touch
Bar
NSExtensionServiceTouchBarBezelColorName
The color to use for the bezel around the extension when it appears as a Quick Action in the
Touch Bar.
Build Mail App Extensions
Create app extensions that block content, perform message and composing actions, and he
message security.
let NSTypeIdentifierAddressText: String
let NSTypeIdentifierDateText: String
let NSTypeIdentifierPhoneNumberText: String
let NSTypeIdentifierTransitInformationText: String
App and Environment
Learn about the objects that you use to interact with the system.
Documents, Data, and Pasteboard
Mail Extensions
UTI Subtypes for Data Detector Types
See Also
App Structure


## Page 3

Organize your app’s data and preferences, and share that data on the pasteboard or in iClou
Cocoa Bindings
Automatically synchronize your data model with your app’s interface using Cocoa Bindings.
Resource Management
Manage the storyboards and nib files containing your app’s user interface, and learn how to
load data that is stored in resource files.


