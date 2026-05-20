# 002_CSImportExtension.pdf

## Page 1

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


## Page 2

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


## Page 3

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


