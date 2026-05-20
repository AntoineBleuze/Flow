# Spotlight app extensions.pdf

## Page 1

Keeping your app’s indexes up to date requires periodic maintenance. An app that crashes while
updating its index might leave that index in an incorrect state. The system can also ask your app t
regenerate the index if it’s missing or needs updated data. If your app isn’t running when the
system needs these updates, it uses your reindexing app extension to generate them instead.
A reindexing app extension is an important tool for keeping your indexes up to date at all times.
Include this app extension in your app bundle, and make sure it has access to all of your app’s
indexable data.
Xcode provides a template to make it easy to add a reindexing app extension to your app. Add thi
template to your project using the following steps:
1. Open the Xcode project with your app.
2. Select File > New > Target.
3. Select the platform for your app.
4. In the Application Extension section, select the CoreSpotlight Delegate template.
5. Click Next.
6. Give your app extension a name and configure the other options.
7. Click Finish.
Overview
Add a reindexing app extension to your app
Core Spotlight / Regenerating your app’s indexes on demand
Article
Regenerating your app’s indexes on
demand
Create an app extension to maintain your app’s indexes and regenerate them as
needed.


## Page 2

The CoreSpotlight Delegate template contains empty implementations for the key functions of th
CSSearchableIndexDelegate protocol, including the methods you use to update the index.
Add your custom code to these methods, and make sure to call the acknowledgement handlers fo
your main indexing functions, as shown:
For information about how to add content to your app’s indexes, see Adding your app’s content to
Spotlight indexes.
Verify your app extension behaves as expected using the Xcode debugger. Start by building your
app extension and attaching the debugger to it.
1. Select your app target
2. Build and run your app.
3. Back in Xcode, select your app extension target.
4. Select Debug > Attach to Process by PID or Name.
5. Set the name of the process to the bundle ID of your app extension.
6. Click the Attach button.
Debug your app extension code


## Page 3

Because you can’t predict when the system will run your app extension, you need to force the
system to run it immediately using the mdutil command-line tool. Open Terminal and run that
command with the -cr option, followed by the bundle identifier of your app extension. Here’s an
example of this command:
The mdutil tool starts the reindexing process for the app extension you specify. If you set any
breakpoints in your app extension’s code, the attached debugger stops at them and gives you a
chance to examine the state of your extension.
class CSIndexExtensionRequestHandler
An interface that implements an index-maintenance app extension.
class CSImportExtension
An object that provides searchable attributes for file types that the app supports.
See Also
Spotlight app extensions


## Page 4

The CSIndexExtensionRequestHandler class provides the main entry point for an index-
maintenance app extension. If any issues arise with your app’s indexes and your app isn’t running
the system loads your app extension and looks for an implementation of this class. It instantiates
the class it finds and uses it to perform any index-related maintenance.
Define a custom subclass of CSIndexExtensionRequestHandler in your app extension and
implement methods of the CSSearchableIndexDelegate protocol in it. Use those methods to
perform any required updates to your app’s index files. For example, use the searchable
Index(_:reindexAllSearchableItemsWithAcknowledgementHandler:) method to
reindex all items in your app.
NSObject
CSSearchableIndexDelegate
Overview
Relationships
Inherits From
Conforms To
Core Spotlight / CSIndexExtensionRequestHandler
Class
CSIndexExtensionRequestHandler
An interface that implements an index-maintenance app extension.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 5

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSExtensionRequestHandling
NSObjectProtocol
Regenerating your app’s indexes on demand
Create an app extension to maintain your app’s indexes and regenerate them as needed.
class CSImportExtension
An object that provides searchable attributes for file types that the app supports.
See Also
Spotlight app extensions


## Page 6

To create a Spotlight File Import extension, add a target to your app using the Spotlight File Impor
extension template in Xcode. The template project contains a subclass of CSImportExtension
To index content on a user’s device, Core Spotlight loads your extension and invokes the
update(_:forFileAt:) method. Core Spotlight passes a CSSearchableItemAttribute
Set and URL of a file to the extension, and you set properties that are relevant for the file.
Important
Spotlight File Import extensions don’t provide functionality in macOS. To make custom files
available to Spotlight in macOS, create a Spotlight importer plugin. For more information, refer
to Spotlight Importer Programming Guide.
Typically, your extension loads details about the file and uses that information to set properties of
the attribute set. For example, if your app contains files that are notes the user creates, it does th
following:
Overview
Core Spotlight / CSImportExtension
Class
CSImportExtension
An object that provides searchable attributes for file types that the app supports.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+


## Page 7

Important
Core Spotlight indexes files in batches and may call update(_:forFileAt:) simultaneously
on multiple queues with different values of contentURL.
To specify the file types your app supports, set the value of CSSupportedContentTypes in yo
extension’s Info.plist file to an array of file type identifiers. For more information about file typ
identifiers, see Uniform Type Identifiers. The app in the previous example configures the
extension’s Info.plist as follows:
func update(CSSearchableItemAttributeSet, forFileAt: URL) throws
Provides searchable attributes for a file at the specified URL.
Topics
Providing searchable attributes


## Page 8

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSExtensionRequestHandling
NSObjectProtocol
Regenerating your app’s indexes on demand
Create an app extension to maintain your app’s indexes and regenerate them as needed.
class CSIndexExtensionRequestHandler
An interface that implements an index-maintenance app extension.
Relationships
Inherits From
Conforms To
See Also
Spotlight app extensions


