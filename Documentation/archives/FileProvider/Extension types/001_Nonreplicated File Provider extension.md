# 001_Nonreplicated File Provider extension.pdf

## Page 1

A nonreplicated File Provider extension must perform all of the following tasks:
Create placeholders for remote files that you download only as needed.
Intercept coordinated reads from the host app, so that your file provider can download or upda
the file with data from the remote server before the read occurs.
Trigger a notification after coordinated writes from the host app, so that the extension can
upload the changes to the remote server as needed.
Enumerate the stored documents and folders.
Execute actions—such as importing, moving, renaming, or deleting items—on the stored
documents and folders.
Your File Provider extension can add custom actions to the file browser’s context menu using the
File Provider UI framework. You can also define custom services to communicate with the host ap
using NSFileProviderService. Use these interfaces to add features that aren’t provided by
the base API.
If your application acts as a drag source for remote documents, override your NSItemProvider
subclass’s registerFileRepresentation(forTypeIdentifier:fileOptions:
visibility:loadHandler:) method, and return the URL for the dragged item. This URL is th
value returned by your extension’s urlForItem(withPersistentIdentifier:) method. Th
URL may refer to a local file or, if you don’t have a local copy, to the file’s placeholder.
If the URL points to a placeholder, the system calls your File Provider extension’s start
ProvidingItem(at:completionHandler:) method, giving you the opportunity to downloa
Overview
Support drag and drop
File Provider / Nonreplicated File Provider extension
API Collection
Nonreplicated File Provider extension
Build a File Provider extension that hosts and manages the user’s local files.


## Page 2

the file.
class NSFileProviderExtension
The principal class for the nonreplicated File Provider extension.
Content and Change Tracking
Create enumerators to specify your file provider’s content, and track changes to that conten
Replicated File Provider extension
Build a File Provider extension that syncs the local copies of your files with your remote
storage.
Topics
Nonreplicated extension
See Also
Extension types


