# Creating a contact provider extension.pdf

## Page 1

For the system to recognize your app extension, use the following identifier in the extension’s Inf
.plist file:
Installing the host app installs your extension, but the system won’t run the extension until the
extension domain is enabled. When the extension runs, the system first calls the extension’s
configure(for:) method. Then you set up the enumerator that provides contact items from
your data store.
The following shows a basic implementation of a ContactProviderExtension. Because
ContactProviderExtension inherits from ContactItemEnumerating the implementation
also implements enumerator(for:) which returns a ContactItemEnumerator on demand. 
this example, the extension sets up a RootContainerEnumerator to provide its contact items
see the ContactItemEnumerator discussion for details of how RootContainerEnumerato
works.
Overview
ContactProvider / ContactProviderExtension
Protocol
ContactProviderExtension
The protocol your app extension implements, which provides contact items to the
system-wide Contacts ecosystem.
iOS 18.0+
iPadOS 18.0+


## Page 2

func configure(for: any ContactProviderDomain)
Configures the extension instance for a domain.
Required
func invalidate() async throws
Invalidates the extension.
Required
Topics
Configuring an extension
Managing the extension life cycle
Relationships


## Page 3

AppExtension, ContactItemEnumerating
Inherits From


